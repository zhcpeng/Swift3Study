//
//  CanMoveTableViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/7/1.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class CanMoveTableViewController: UITableViewController {

	var itemList = Array<String>()

	override func viewDidLoad() {
		super.viewDidLoad()

		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
		self.tableView.isEditing = true

		for i in 0..<20 {
			itemList.append(String(i))
		}

//		let alert = UIAlertController.init(title: "Alert", message: "String", preferredStyle: .Alert)
//		let cancelButton = UIAlertAction.init(title: "取消", style: .Cancel, handler: { (action) in
//			print("Cancel")
//		})
//		let okButton = UIAlertAction.init(title: "确定", style: .Default, handler: { (action) in
//			print("确定事件处理")
//		})
//		alert.addAction(cancelButton)
//		alert.addAction(okButton)
//		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
//			self.presentViewController(alert, animated: true, completion: nil)
//		}
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
//            self.tableView.moveRowAtIndexPath(NSIndexPath.init(forRow: 5, inSection: 0), toIndexPath: NSIndexPath.init(forRow: 10, inSection: 0))
//        }
        

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
		return 20
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		cell.textLabel?.text = itemList[indexPath.row]

		// Configure the cell...

		return cell
	}

	/*
	 // Override to support conditional editing of the table view.
	 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the specified item to be editable.
	 return true
	 }
	 */

	/*
	 // Override to support editing the table view.
	 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	 if editingStyle == .Delete {
	 // Delete the row from the data source
	 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	 } else if editingStyle == .Insert {
	 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	 }
	 }
	 */

	// Override to support rearranging the table view.
	override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
		let string = itemList[fromIndexPath.row]
		itemList[fromIndexPath.row] = itemList[toIndexPath.row]
		itemList[toIndexPath.row] = string
	}

	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		return .none
	}

	/*
	 // Override to support conditional rearranging of the table view.
	 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	 // Return false if you do not want the item to be re-orderable.
	 return true
	 }
	 */

}
