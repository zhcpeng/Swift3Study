//
//  PHPhotosAlbumViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/24.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

import Photos

class PHPhotosAlbumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PHPhotoLibraryChangeObserver {

	private var albumsList: [PHFetchResult] = []
	private lazy var albumsListTitle: [String] = ["All Photos", "Smart Albums", "Albums"]

	private lazy var tableView: UITableView = {
		let tableView = UITableView.init(frame: CGRect.zero, style: .Grouped)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")

		return tableView
	}()

	private lazy var options: PHFetchOptions = {
		let options = PHFetchOptions()
		options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
		return options
	}()

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		PHPhotoLibrary.sharedPhotoLibrary().registerChangeObserver(self)

		PHPhotoLibrary.requestAuthorization({ (status) in
			print(status)
		})

		self.view.addSubview(tableView)
		tableView.snp_makeConstraints { (make) in
			make.edges.equalTo(self.view)
		}

		let state = PHPhotoLibrary.authorizationStatus()
		switch state {
		case .Authorized, .NotDetermined:

			let allPhotos = PHAsset.fetchAssetsWithOptions(options)

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

			albumsList.append(allPhotos)

			albumsList.append(resultSmartAlbum)

			albumsList.append(resultAlbum)

			// resultAlbum.enumerateObjectsUsingBlock({ (item, index, stop) in
			// let collection = item as? PHAssetCollection
			// print(collection?.localizedTitle)
			// })
			// print("1")
			// resultSmartAlbum.enumerateObjectsUsingBlock({ (item, index, stop) in
			// let collection = item as? PHAssetCollection
			// print(collection?.localizedTitle)
			//
			// })

		default:
			print("拒绝访问")
			// PHPhotoLibrary.requestAuthorization({ (statue) in
			//
			// })
		}

	}

	deinit {
		PHPhotoLibrary.sharedPhotoLibrary().unregisterChangeObserver(self)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - UITableViewDataSource
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return albumsList.count
	}

	func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return albumsListTitle[section]
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section == 0 {
			return 1
		} else {
			return albumsList[section].count
		}
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
		if indexPath.section == 0 {
			cell.textLabel?.text = "All Photos"
		} else {
			let fetchResult: PHFetchResult = albumsList[indexPath.section]
			let phCollection: PHCollection? = fetchResult[indexPath.row] as? PHCollection
			cell.textLabel?.text = phCollection?.localizedTitle
		}

		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let vc = PHPhotosCollectionViewController()
		if indexPath.section == 0 {
			vc.fetchResult = albumsList[0]
		} else {
			let fetchResult = albumsList[indexPath.section]
			let collection = fetchResult[indexPath.row] as? PHAssetCollection
			let assetsFetchResult = PHAsset.fetchAssetsInAssetCollection(collection!, options: options)
			vc.fetchResult = assetsFetchResult
		}
		self.navigationController?.pushViewController(vc, animated: true)
	}

	func photoLibraryDidChange(changeInstance: PHChange) {
		dispatch_async(dispatch_get_main_queue()) {

		}
	}

}
