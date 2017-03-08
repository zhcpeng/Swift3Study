//
//  UIThirdViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 2017/3/7.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit

class UIThirdViewController: UIViewController {

    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor.red
        button.reactive.controlEvents(.touchUpInside).observeValues({ [weak self](_) in
            self?.dismiss(animated: true, completion: nil)
        })
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.cyan
        
        view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.equalTo(100)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("\(#file):\(#function)")
    }

}
