//
//  AssetsLibraryViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/23.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

import AssetsLibrary
import Photos

class AssetsLibraryViewController: UIViewController {

	private lazy var photoLibrary: PHPhotoLibrary = PHPhotoLibrary.sharedPhotoLibrary()

	private lazy var imageManager: PHImageManager = PHImageManager.defaultManager()

	override func viewDidLoad() {
		super.viewDidLoad()

		let state = PHPhotoLibrary.authorizationStatus()
		switch state {
		case .Authorized:
			/*
			 Optional("美颜相机")
			 Optional("QQ")
			 Optional("My Photo Stream")
			 */
			let resultAlbum = PHAssetCollection.fetchAssetCollectionsWithType(.Album, subtype: .Any, options: nil)

			/*
			 Optional("Recently Added")
			 Optional("Videos")
			 Optional("Bursts")
			 Optional("Time-lapse")
			 Optional("Panoramas")
			 Optional("Camera Roll")
			 Optional("Favorites")
			 Optional("Screenshots")
			 Optional("Hidden")
			 Optional("Selfies")
			 Optional("Slo-mo")
			 */
			let resultSmartAlbum = PHAssetCollection.fetchAssetCollectionsWithType(.SmartAlbum, subtype: .Any, options: nil)

			/*
			 Optional("北京市 - 西城区 & 东城区")
			 Optional("北京市 - 西城区, 东城区 & 朝阳区")
			 Optional("北京市 - 海淀区")
			 Optional("北京市 - 海淀区")
			 Optional("北京市 - 海淀区")
			 */
			// let resultMoment = PHAssetCollection.fetchAssetCollectionsWithType(.Moment, subtype: .Any, options: nil)

			resultAlbum.enumerateObjectsUsingBlock({ (item, index, stop) in
				let collection = item as? PHAssetCollection
				print(collection?.localizedTitle)
			})
			print("1")
			resultSmartAlbum.enumerateObjectsUsingBlock({ (item, index, stop) in
				let collection = item as? PHAssetCollection
				print(collection?.localizedTitle)

			})
			print("2")
			// resultMoment.enumerateObjectsUsingBlock({ (item, index, stop) in
			// let collection = item as? PHCollection
			// print(collection?.localizedTitle)
			// })

			print("11")
		default:
			print("拒绝访问")
		}

	}

	// - (void) getAlbumsFromDevice {
	// PHFetchResult * fetchResult = [PHAsset fetchAssetsWithOptions: self.assetsFetchOptions];
	// if (fetchResult.count <= 0) {
	// [self showNoAssets];
	// return;
	// }
	// NSMutableArray * fetchResults = [NSMutableArray new];
	// for (NSNumber * subtypeNumber in self.assetCollectionSubtypes) { PHAssetCollectionSubtype subtype = subtypeNumber.integerValue;
	// PHAssetCollectionType type = [self __assetCollectionTypeOfSubtype: subtype];
	// PHFetchResult * fetchResult = [PHAssetCollection fetchAssetCollectionsWithType: type subtype: subtype options: self.assetCollectionFetchOptions];
	// [fetchResults addObject: fetchResult];
	// }
	// self.fetchResults = fetchResults;
	// if (fetchResults.count > 0) {
	// [self getAlbumsCompletion: YES];
	// } else {
	// [self getAlbumsCompletion: NO];
	// }
	// }

	var assetResults: PHFetchResult!
	var arrImages: NSMutableArray!
	var arrImageStateWithImage: NSMutableArray!

	func retrieveImage()
	{
		/* Retrieve the items in order of modification date, ascending */
		let options = PHFetchOptions()
		options.sortDescriptors = [NSSortDescriptor(key: "modificationDate",
			ascending: true)]

		/* Then get an object of type PHFetchResult that will contain
		 all our image assets */
		assetResults = PHAsset.fetchAssetsWithMediaType(.Image, options: options)

		print("Found \(assetResults.count) results")

		let imageManager = PHCachingImageManager()

		assetResults.enumerateObjectsUsingBlock { (object: AnyObject, count: Int, stop: UnsafeMutablePointer<ObjCBool>) in

			if object is PHAsset {

				let asset = object as! PHAsset

				let imageSize = CGSize(width: asset.pixelWidth,
					height: asset.pixelHeight)

				/* For faster performance, and maybe degraded image */
				let options = PHImageRequestOptions()
				options.deliveryMode = .FastFormat
				imageManager.requestImageForAsset(asset, targetSize: imageSize,
					contentMode: PHImageContentMode.AspectFill, options: options, resultHandler: { (image: UIImage?, info: [NSObject: AnyObject]?) in

						self.arrImages.addObject(image!)
						self.arrImageStateWithImage.addObject(0)

				})
			}
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
