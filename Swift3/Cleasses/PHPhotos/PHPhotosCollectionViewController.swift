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

	private lazy var imageManager: PHCachingImageManager = PHCachingImageManager()

	private let kPodding: CGFloat = 5
	private lazy var width: CGFloat = (kScreenWidth - self.kPodding * 3) / 4
	private let scale = UIScreen.mainScreen().scale
	private lazy var AssetGridThumbnailSize: CGSize = CGSize.init(width: self.width * self.scale, height: self.width * self.scale)

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

		// let assset = fetchResult?[0] as! PHAsset
		// self.imageManager.requestImageForAsset(assset, targetSize: CGSize(width: 10000,height: 10000), contentMode: .AspectFill, options: nil) { (result, info) in
		// print(result)
		// }
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

		self.imageManager.requestImageForAsset(assset, targetSize: AssetGridThumbnailSize, contentMode: .AspectFill, options: nil) { (result, info) in
			if cell.representedAssetIdentifier == assset.localIdentifier {
				cell.thumbnailImage = result
				// print(assset.localIdentifier)
			}
		}

		return cell
	}

	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		print("点击了 \(indexPath.item / 4 + 1) 行 \(indexPath.item % 4 + 1) 列")
	}
}
