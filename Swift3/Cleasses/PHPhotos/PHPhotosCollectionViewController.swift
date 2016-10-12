//
//  PHPhotosCollectionViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/25.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

import Photos

class PHPhotosCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

	var fetchResult: PHFetchResult?

	// private lazy var imageCachingManager: PHCachingImageManager = PHCachingImageManager()
	// private lazy var assetList : [PHAsset] = []
	private lazy var imageManager: PHImageManager = PHImageManager.defaultManager()
	private let kPodding: CGFloat = 5
	private lazy var width: CGFloat = (kScreenWidth - self.kPodding * 3) / 4
	private let scale = UIScreen.mainScreen().scale
	private lazy var AssetGridThumbnailSize: CGSize = CGSize.init(width: self.width * self.scale, height: self.width * self.scale)
	private lazy var imageRequestOptions: PHImageRequestOptions = {
		let imageRequestOptions = PHImageRequestOptions()
		imageRequestOptions.synchronous = true
		imageRequestOptions.resizeMode = .Fast
		imageRequestOptions.deliveryMode = .Opportunistic

		return imageRequestOptions
	}()

	private lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize(width: self.width, height: self.width)
		layout.minimumInteritemSpacing = self.kPodding
		layout.minimumLineSpacing = self.kPodding

		let collectionView = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.registerClass(PHPhotosCollectionViewCell.self, forCellWithReuseIdentifier: PHPhotosCollectionViewCell.identifier)
		return collectionView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		self.view.addSubview(collectionView)
		collectionView.snp_makeConstraints { (make) in
			make.edges.equalTo(self.view)
		}

		/// 缓存图片，发现效率也不是那么高
		// if let result = fetchResult {
		// result.enumerateObjectsUsingBlock({ (asset, index, stop) in
		// if let asset = asset as? PHAsset {
		// self.assetList.append(asset)
		// }
		// })
		// }
		// self.imageCachingManager.startCachingImagesForAssets(self.assetList, targetSize: AssetGridThumbnailSize, contentMode: .AspectFill, options: self.imageRequestOptions)
        
        
        NSNotificationCenter.defaultCenter().rac_addObserverForName(UIDeviceOrientationDidChangeNotification, object: nil).subscribeNext { [weak self](_) in
            self?.rotate()
        }

	}

	deinit {
		// self.imageCachingManager.stopCachingImagesForAllAssets()
	}
    
    private func rotate() {
        UIView.animateWithDuration(0.2, delay: 0, options: .CurveLinear, animations: {
            //			self.imageView.transform = rotationTransform()
            //            self.imageView.bounds = rotationAdjustedBounds()
            self.view.transform = rotationTransform()
            self.view.bounds = rotationAdjustedBounds()
            self.view.setNeedsLayout()
        }) { (_) in
            //            print(self.imageView.frame)
        }
    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return fetchResult?.count ?? 0
	}

	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		let assset = fetchResult?[indexPath.row] as! PHAsset

		let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PHPhotosCollectionViewCell.identifier, forIndexPath: indexPath) as! PHPhotosCollectionViewCell
		cell.representedAssetIdentifier = assset.localIdentifier

		self.imageManager.requestImageForAsset(assset, targetSize: AssetGridThumbnailSize, contentMode: .AspectFill, options: self.imageRequestOptions) { (result, info) in
			if cell.representedAssetIdentifier == assset.localIdentifier {
				cell.thumbnailImage = result
				// print(assset.localIdentifier)
			}
		}

		return cell
	}

	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		print("点击了 \(indexPath.item / 4 + 1) 行 \(indexPath.item % 4 + 1) 列")
		let vc = PHPhotosScanViewController()
		vc.selectedIndex = indexPath.item
		vc.fetchResult = fetchResult
		self.navigationController?.pushViewController(vc, animated: true)
	}
}
