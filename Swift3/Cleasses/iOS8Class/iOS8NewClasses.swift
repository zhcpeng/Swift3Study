//
//  iOS8NewClasses.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/6/21.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import Foundation

///8 2 0 8.1系统返回false
///8 4 0 8.1系统返回ture
let sys = OperatingSystemVersion.init(majorVersion: 8, minorVersion: 2, patchVersion: 0)
let x = ProcessInfo().isOperatingSystemAtLeast(sys)

//let ciqi_vc = UIViewController()
//let yuqi_vc = UIViewController()
//let huihua_vc = UIViewController()
//let wenhuajiading_vc = UIViewController()
//let zuke_vc = UIViewController()
//let shufa_vc = UIViewController()
//let qingtong_vc = UIViewController()
//let keju_vc = UIViewController()
//var btns2Actions: NSDictionary = [
//	"瓷器": [self.qiciBtn, ciqi_vc],
//	"玉器": [self.yuqiBtn, yuqi_vc],
//	"绘画": [self.huihuaBtn, huihua_vc],
//	"文化嘉定": [self.wenhuajiadingBtn, wenhuajiading_vc],
//	"竹刻": [self.zukeBtn, zuke_vc],
//	"书法": [self.shufaBtn, shufa_vc],
//	"青铜": [self.qingtongBtn, qingtong_vc],
//	"科举": [self.kejuBtn, keju_vc]]
//// 定制每个button事件跳转的视图控制器。
//for (key: AnyObject, value: AnyObject) in btns2Actions {
//	let array = value as NSArray;
//	let btn = array[0] as UIButton;
//	let vc: UIViewController = array[1] as UIViewController;
//	btn.rac_signalForControlEvents(UIControlEvents.TouchUpInside).subscribeNext { _ in
//		self.navigationController.pushViewController(vc, animated: false)
//	}
//}
