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

		itemList.append("TableViewController")
		itemList.append("CanMoveTableViewController")
		itemList.append("ScrollViewController")
		itemList.append("GradientColorViewController")
		itemList.append("UIImageViewCategory")
		itemList.append("SingleLineViewController")
		itemList.append("YYLabelViewController")
        itemList.append("AssetsLibraryViewController")
        itemList.append("PHPhotosAlbumViewController")
        itemList.append("OrientationViewController")
        itemList.append("CallPhoneViewController")

		self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemList.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
		cell.textLabel?.text = itemList[indexPath.row]
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let vc = SwiftClassFromString(itemList[indexPath.row])
		self.navigationController?.pushViewController(vc!, animated: true);
	}

}
