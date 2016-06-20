//
//  TableViewController.swift
//  Swift3
//
//  Created by zhcpeng on 16/6/2.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UIViewController {
    
    var itemList = Array<TableViewModel>()
    
    /** 列表 */
    private lazy var listTableView : UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: kTableViewCellIdentifier)
        tableView.contentInset = UIEdgeInsetsMake(4,0,4,0)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(listTableView)
        
        getData()
        
    }
    
    /** 获取数据 */
    func getData() {
        let url = "http://mapi-shop.appvipshop.com/vips-mobile/router.do?api_key=04e0dd9c76902b1bfc5c7b3bb4b1db92&api_sign=ae1bbba9a1efb1d0b4fea6b7eaeb87b0&app_name=shop_ipad&app_version=2.9&child_menu_id=592&client_type=ipad&format=json&mars_cid=915eb66871a0efddde8fb8a325957c75d6cd78b8&menu_id=1&service=mobile.brand.sellingsoon.get&timestamp=1436926538&user_id=3333955&ver=2.0&warehouse=VIP_BJ"
        Alamofire.request(.GET, url).responseJSON { response in
                
                do{
                    let dictionary = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions())
                    if let dictionary = dictionary as? Dictionary<String, AnyObject> {
                        let msg = dictionary["data"]![0]["brands"]
                        if let msg = msg as? NSArray {
                            for json in msg{
                                if let dict = json as? Dictionary<String, AnyObject>{
                                    if let model = TableViewModel.yy_modelWithDictionary(dict){
                                        self.itemList.append(model)
                                    }
                                }
                            }
                            self.listTableView.reloadData()
                        }
                    } else {
                        
                    }
                }catch{
                    print("ERROR:\(self)")
                }
                
//                do{
//                    let dictionary: AnyObject? = try NSJSONSerialization.JSONObjectWithData(response.data!, options: NSJSONReadingOptions())
//                    if let dictionary = dictionary as? Dictionary<String, AnyObject> {
//                        let msg = dictionary["data"]![0]["brands"]
//                        if let msg = msg as? NSArray {
//                            for json in msg{
//                                if let dict = json as? Dictionary<String, AnyObject>{
//                                    let model = TableViewModel.yy_modelWithDictionary(dict)
//                                    if let model = model{
//                                        self.itemList.append(model)
//                                    }
//                                }
//                            }
//                            self.listTableView.reloadData()
//                        }
//                    } else {
//                        
//                    }
//                }catch{
//                    
//                }
                
//                let json = JSON.init(data: response.data!)
//                let data = json["data"]
//                for dict in data[0]["brands"]{
//                    let model = TableViewModel.yy_modelWithDictionary(dict)
//                    
//                    itemList.insert(<#T##newElement: Element##Element#>, atIndex: <#T##Int#>)
//                }
//                self.itemJSON = data[0]["brands"]
//                self.myTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

extension TableViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCellWithIdentifier(kTableViewCellIdentifier, forIndexPath: indexPath) as! TableViewCell
//        return cell.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
        return (kScreenWidth - 16) * 0.5 + 40
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kTableViewCellIdentifier, forIndexPath: indexPath) as! TableViewCell
        cell.model = itemList[indexPath.row]
        return cell
    }
    
    
}
