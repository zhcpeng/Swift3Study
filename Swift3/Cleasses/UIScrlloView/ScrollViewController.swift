//
//  ScrollViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/7/6.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let scrollView : UIScrollView = UIScrollView()
        self.view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.whiteColor()
        scrollView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        var topView :UIView?
        for i in 0...5 {
            let view = UIView()
            view.tag = i
            view.backgroundColor = UIColor.init(red: CGFloat(arc4random_uniform(255)) / 255.0, green: CGFloat(arc4random_uniform(255)) / 255.0, blue: CGFloat(arc4random_uniform(255)) / 255.0, alpha: 1)
            scrollView.addSubview(view)
            
            view.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(300)
                make.height.equalTo(50)
                if i == 0 {
                    make.top.equalTo(scrollView.snp_top)
                }else{
                    make.top.equalTo(topView!.snp_bottom)
                }
                
            })
           topView = view
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(3 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            let view = scrollView.viewWithTag(2)
            view?.snp_updateConstraints(closure: { (make) in
                make.height.equalTo(0)
            })
            UIView.animateWithDuration(1, animations: { 
                scrollView.layoutIfNeeded()
            })
        })
        
        let gradientView = XCRGradientColorView.init(frame: CGRect.init(x: 0, y: 300, width: 300, height: 50))
        gradientView.backgroundColor = UIColor.clearColor()
        scrollView.addSubview(gradientView)
//        gradientView.snp_makeConstraints { (make) in
//            make.left.bottom.right.equalTo(scrollView)
//            make.width.equalTo(scrollView)
//            make.height.equalTo(50)
//        }
        
//        let ggView = UIView.init(frame: CGRect.init(x: 0, y: 400, width: 300, height: 50))
//        let gLayer = CAGradientLayer()
//        gLayer.frame = ggView.frame
//        gLayer.colors = [UIColor.init(white: 0, alpha: 0).CGColor,UIColor.init(white: 1, alpha: 1)]
//        gLayer.startPoint = CGPoint.init(x: 0, y: 1)
//        gLayer.position = CGPoint.init(x: 1, y: 1)
//        ggView.layer.addSublayer(gLayer)
//        gLayer.mask = ggView.layer
//
//        scrollView.addSubview(ggView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
