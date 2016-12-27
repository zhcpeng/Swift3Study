//
//  ViewController.swift
//  Swift3
//
//  Created by zhcpeng on 16/5/27.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(2.0 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)) {
			let vc = RootListController()
			self.navigationController?.pushViewController(vc, animated: true)
		}

//		let str = "预00算222.2元"
//		let x = (str.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "0123456789.").invertedSet) as NSArray).componentsJoinedByString("")
//		print(x)

		// print(formatterString(str))
        
//        let i = INT_MAX
//        
//		 let xx = DBL_MAX
//		 let ss = String(xx)
//		 print(ss.characters.count)

//		let xxx = "000001111122"
//		let sss = delZero(xxx)

//        let d :NSString = "00011001100"
//        let xxxx = d.stringByTrimmingCharactersInSet(NSCharacterSet(charactersInString: "0").invertedSet)
        
        
//        let ss : NSString = "18.49"
//        let xx = ss.doubleValue
//        NSDecimalNumber
        
//        let sss = "18.49"
//        let num = NSDecimalNumber.init(string: sss)
//        let f = num.floatValue * 10000
//        let x = Int(f)
        
//        let xxxx = sizeof(Double)
        // 8
        
        
        
//        let f :Float = 10.99
//        print(f)
//        
//        let f1 : Float = 10.49
//        print(f1)
//        
//        let f2 : Float = 10.88
//        print(f2)
        
	}

//	private func delZero(str: String) -> String {
//		var string = str
//		if string.hasPrefix("0") {
//			string = string.substringWithRange(Range(string.startIndex.successor()..<string.endIndex))
//			string = delZero(string)
//		}
//		return string
//	}

	// private func formatterString(str: String) -> String {
	// let scanner = NSScanner(string: str)
	// //		scanner.scanUpToCharactersFromSet(NSCharacterSet.decimalDigitCharacterSet(), intoString: nil)
	// scanner.scanUpToCharactersFromSet(NSCharacterSet(charactersInString: "0123456789.").invertedSet, intoString: nil)
	// var number = 0
	// scanner.scanInteger(&number)
	// return String(number)
	// }

	// /// 过滤非数字
	// private func formatterString(str: String) -> String {
	// let scanner = NSScanner(string: str)
	// scanner.scanUpToCharactersFromSet(NSCharacterSet.decimalDigitCharacterSet(), intoString: nil)
	// var number = 0
	// scanner.scanInteger(&number)
	// return String(number)
	// }

    @IBAction func btnAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(RootListController(), animated: true)
    }
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
