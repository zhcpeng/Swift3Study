//
//  ViewController.swift
//  Swift3
//
//  Created by zhcpeng on 16/5/27.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

import ReactiveCocoa

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			let vc = RootListController()
			self.navigationController?.pushViewController(vc, animated: true)
		}
    }
    
    @IBAction func btnAction(_ sender: UIButton) {
        self.navigationController?.pushViewController(RootListController(), animated: true)
    }
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
