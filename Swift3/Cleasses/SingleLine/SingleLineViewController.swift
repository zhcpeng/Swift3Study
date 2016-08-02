//
//  SingleLineViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/7/26.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

/// 1像素线的高度（为解决在Plus上标记为0.5时高度不一样的情况）
let kOnePixelLineHeight : CGFloat = (1 / UIScreen.mainScreen().scale)

class SingleLineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let hView = UIView.init(frame: CGRect.init(x: 50, y: 200.33, width: 200, height: kOnePixelLineHeight))
        hView.backgroundColor = UIColor.redColor()
        self.view.addSubview(hView)
        
        let vView = UIView.init(frame: CGRect.init(x: 50.33, y: 200, width: 0.33, height: 200))
        vView.backgroundColor = UIColor.blackColor()
        self.view.addSubview(vView)
        
        let hView2 = UIView.init(frame: CGRect.init(x: 50, y: 300.33, width: 200, height: 0.5))
        hView2.backgroundColor = UIColor.redColor()
        self.view.addSubview(hView2)
        
        let vView2 = UIView.init(frame: CGRect.init(x: 150.33, y: 200, width: 0.5, height: 200))
        vView2.backgroundColor = UIColor.blackColor()
        self.view.addSubview(vView2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
