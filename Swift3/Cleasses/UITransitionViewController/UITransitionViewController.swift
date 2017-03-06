//
//  UITransitionViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 2017/3/6.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit

class UITransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let panGesturn = UIPanGestureRecognizer()
//        panGesturn.delegate = self
        view.addGestureRecognizer(panGesturn)
        panGesturn.reactive.stateChanged.observeValues { [weak self](gestureRecognizer) in
            guard let strongSelf = self else { return }
            let translation = gestureRecognizer.translation(in: nil)
            let progress = translation.y / 2 / strongSelf.view.bounds.height
            switch gestureRecognizer.state{
            case .began:
                print("开始")
            case .changed:
                print("移动")
//                strongSelf.tra
            default:
                break
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
