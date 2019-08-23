//
//  RootListController.swift
//  Swift3
//
//  Created by zhcpeng on 16/5/27.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class RootListController: UITableViewController {

	var itemList: [String] = []

	override func viewDidLoad() {
		super.viewDidLoad()
        
        itemList.append(NSStringFromClass(CanMoveTableViewController.self))
        itemList.append(NSStringFromClass(ScrollViewController.self))
        itemList.append(NSStringFromClass(GradientColorViewController.self))
        itemList.append(NSStringFromClass(UIImageViewCategory.self))
        itemList.append(NSStringFromClass(YYLabelViewController.self))
        itemList.append(NSStringFromClass(AssetsLibraryViewController.self))
        itemList.append(NSStringFromClass(OrientationViewController.self))
        itemList.append(NSStringFromClass(CallPhoneViewController.self))
        itemList.append(NSStringFromClass(PhotoBrowerViewController.self))
        itemList.append(NSStringFromClass(ScrollTextViewController.self))
        itemList.append(NSStringFromClass(SectionTableViewController.self))
        itemList.append(NSStringFromClass(StretchViewController.self))
        itemList.append(NSStringFromClass(RTLabelViewController.self))
        itemList.append(NSStringFromClass(ImageBrowerViewController.self))
        itemList.append(NSStringFromClass(UIFirstViewController.self))
        itemList.append(NSStringFromClass(SelectedCollectionViewController.self))
        itemList.append(NSStringFromClass(UIPopWindowViewController.self))
        itemList.append(NSStringFromClass(GIFViewController.self))
        itemList.append(NSStringFromClass(MBProgressHUDViewController.self))
        itemList.append(NSStringFromClass(RegularViewController.self))
        itemList.append(NSStringFromClass(ImageTransitionViewController.self))
        itemList.append(NSStringFromClass(CycleViewController.self))
        itemList.append(NSStringFromClass(CALayerViewController.self))
        itemList.append(NSStringFromClass(XButtonViewController.self))
        itemList.append(NSStringFromClass(PhotosAlbumViewController.self))
        itemList.append(NSStringFromClass(PhotosAlbumViewController1.self))
        itemList.append(NSStringFromClass(PhotosAlbumViewController2.self))
        itemList.append(NSStringFromClass(AVCaptureViewController.self))
        itemList.append(NSStringFromClass(ViewAnimateViewController.self))
        itemList.append(NSStringFromClass(TreeViewController.self))
        itemList.append(NSStringFromClass(MemoryGraphViewController.self))
        itemList.append(NSStringFromClass(TimeAlertViewController.self))
        itemList.append(NSStringFromClass(InsertTableViewController.self))
        itemList.append(NSStringFromClass(RadarChartViewController.self))
        itemList.append(NSStringFromClass(CutImageViewController.self))
        itemList.append(NSStringFromClass(PerformanceMonitorViewController.self))
        itemList.append(NSStringFromClass(NameSpaceViewController.self))
        itemList.append(NSStringFromClass(SingletonViewController.self))
        itemList.append(NSStringFromClass(TouchMoveViewController.self))
        itemList.append(NSStringFromClass(TaxViewController.self))
        itemList.append(NSStringFromClass(DownloadListViewController.self))

        itemList = itemList.reversed()

		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemList.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		cell.textLabel?.text = itemList[indexPath.row]
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let any = NSClassFromString(itemList[indexPath.row]) as? UIViewController.Type {
            let vc = any.init()
            
//            let tration = CATransition()
//            tration.duration = 1
//            tration.type = kCATransitionFade
//            navigationController?.view.layer.add(tration, forKey: "animation")
            
            navigationController?.pushViewController(vc, animated: true);
        }
	}

}
