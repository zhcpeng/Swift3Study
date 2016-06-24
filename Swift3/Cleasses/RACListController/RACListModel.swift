//
//  RACListModel.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/6/20.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import Foundation

class RACListModel: NSObject {
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