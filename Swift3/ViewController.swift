//
//  ViewController.swift
//  Swift3
//
//  Created by zhcpeng on 16/5/27.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    private lazy var imageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) {
            let vc = RootListController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        self.view.addSubview(imageView)
        imageView.snp_makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
//        imageView.sd_setImageWithURL(NSURL.init(string: ""))
//        imageView.sd_setImageWithURL(<#T##url: NSURL!##NSURL!#>, placeholderImage: <#T##UIImage!#>, options: <#T##SDWebImageOptions#>)
        
//        imageView.snp_makeConstraints { (make) in
//            
//        }
        
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
