//
//  PHPhotosScanViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/26.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

import Photos
import iCarousel

class PHPhotosScanViewController: UIViewController, iCarouselDelegate, iCarouselDataSource {

	var fetchResult: PHFetchResult?

	var selectedIndex: Int = 0

	private lazy var imageManager: PHCachingImageManager = PHCachingImageManager()
	private let scale = UIScreen.mainScreen().scale
	private lazy var AssetGridThumbnailSize: CGSize = CGSize(width: 1000, height: 1000)

	private lazy var icarousel: iCarousel = {
		let view = iCarousel()
		view.type = .Linear
		view.pagingEnabled = true
		view.delegate = self
		view.dataSource = self
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		self.view.addSubview(icarousel)
		icarousel.snp_makeConstraints { (make) in
			make.edges.equalTo(self.view)
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
		return fetchResult?.count ?? 0
	}

	func carousel(carousel: iCarousel, viewForItemAtIndex index: Int, reusingView view: UIView?) -> UIView {
//		let resultView = view as? PHPhotosScanViewCell ?? PHPhotosScanViewCell()
        var resultView : PHPhotosScanViewCell
        if let view = view {
            resultView = view as! PHPhotosScanViewCell
        } else {
            resultView = PHPhotosScanViewCell.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight))
//            resultView.snp_makeConstraints(closure: { (make) in
//                make.edges.equalTo(icarousel)
//            })
        }
		let assset = fetchResult?[index] as! PHAsset
        resultView.representedAssetIdentifier = assset.localIdentifier
		self.imageManager.requestImageForAsset(assset, targetSize: AssetGridThumbnailSize, contentMode: .AspectFill, options: nil) { (result, info) in
			if resultView.representedAssetIdentifier == assset.localIdentifier {
				resultView.thumbnailImage = result
				// print(assset.localIdentifier)
			}
		}
		return resultView
	}
    
    func carouselItemWidth(carousel: iCarousel) -> CGFloat {
        return kScreenWidth
    }

}
