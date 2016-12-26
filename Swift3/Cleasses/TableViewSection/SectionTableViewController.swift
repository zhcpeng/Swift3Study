//
//  SectionTableViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/11/23.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    private var timer : dispatch_source_t!
    
    private var count : Int = 5
    private var all : Bool = false
    
    private var itemList : [Int] = [1,2,3,4,5,6,7,8,9]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = 40
        tableView.sectionFooterHeight = 30
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        tableView.registerClass(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "Section")
        tableView.editing = true
        
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 100))
        view.backgroundColor = UIColor.greenColor()
        tableView.tableFooterView = view
//        tableView.tableHeaderView = view
        
//         timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue())
//        dispatch_source_set_timer(timer, dispatch_walltime(nil, 0), 2 * NSEC_PER_SEC, 0)
//        dispatch_source_set_event_handler(timer) { 
//            print("111")
//            self.all = !(self.all)
//            self.tableView.reloadData()
////            self.count++
//        }
//        dispatch_resume(timer)
        
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
        cell.textLabel?.text = "\(itemList[indexPath.row])"

        return cell
    }
    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = tableView.dequeueReusableHeaderFooterViewWithIdentifier("Section")
//        view?.contentView.backgroundColor = UIColor.redColor()
//        return view
//    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .Delete
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle  == .Delete {
            itemList.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

}
