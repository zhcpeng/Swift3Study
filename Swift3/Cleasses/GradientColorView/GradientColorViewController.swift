//
//  GradientColorViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/7/8.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class GradientColorViewController: UIViewController {

    @IBOutlet weak var gradientView: XCRGradientColorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        gradientView.backgroundColor = UIColor.clear
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
