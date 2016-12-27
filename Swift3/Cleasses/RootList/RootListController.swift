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

//		itemList.append("TableViewController")
		itemList.append("CanMoveTableViewController")
		itemList.append("ScrollViewController")
		itemList.append("GradientColorViewController")
		itemList.append("UIImageViewCategory")
		itemList.append("SingleLineViewController")
		itemList.append("YYLabelViewController")
        itemList.append("AssetsLibraryViewController")
//        itemList.append("PHPhotosAlbumViewController")
        itemList.append("OrientationViewController")
        itemList.append("CallPhoneViewController")
        itemList.append("PhotoBrowerViewController")
        itemList.append("ScrollTextViewController")
        itemList.append("SectionTableViewController")

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
            navigationController?.pushViewController(vc, animated: true);
        }
	}

}
