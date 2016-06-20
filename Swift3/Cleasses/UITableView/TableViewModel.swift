//
//  TableViewModel.swift
//  Swift3
//
//  Created by zhcpeng on 16/6/2.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class TableViewModel: NSObject {
    /// name
    var brand_name : String?
    var channel : String?
    var preHeat : String?
    var mobile_image_two : String?
    var sell_time_from : String?
    var brand_id : String?
    var c3_brand_status : String?
    var brand_self_logo : String?
    var brand_store_sn : String?
    var warehouse : String?
    var pms_activetips : String?
    var sell_time_to : String?
    var mobile_image_one : String?{
        didSet{
            if let url = mobile_image_one where url.containsString("upcb") {
                mobile_image_one = "http://pic1.vip.com/upload/brand/" + url
            }
        }
    }
}

/*
 - [0] : "brand_name"
 - [1] : "channel"
 - [2] : "preHeat"
 - [3] : "mobile_image_two"
 - [4] : "sell_time_from"
 - [5] : "brand_id"
 - [6] : "c3_brand_status"
 - [7] : "brand_self_logo"
 - [8] : "brand_store_sn"
 - [9] : "warehouse"
 - [10] : "pms_activetips"
 - [11] : "sell_time_to"
 - [12] : "mobile_image_one"
 */