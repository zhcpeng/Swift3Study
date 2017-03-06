//
//  RTLabelViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 17/1/6.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit
import RTLabel

class RTLabelViewController: UIViewController {
    
    private lazy var label : RTLabel = {
        let view = RTLabel(frame: CGRect.zero)
        view.backgroundColor = UIColor.green
        return view
    }()
    
    private lazy var label1 : UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.backgroundColor = UIColor.green
        view.numberOfLines = 2
        view.text = "WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW"
        return view
    }()
    
    private lazy var label2 : UILabel = {
        let view = UILabel(frame: CGRect.zero)
        view.backgroundColor = UIColor.red
        view.text = "AAAAAAA"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.addSubview(label)
        label.frame = CGRect.init(x: 0, y: 100, width: 200, height: 30)
//        label.snp.makeConstraints { (make) in
//            make.edges.equalTo(view)
//        }
        
//        label.textAlignment = RTTextAlignmentJustify
//        label.lineBreakMode = RTTextLineBreakModeClip
        label.text = "<font color=\"#8E919C\">华晨华晨华晨华晨华晨华晨华晨</font><font color=\"red\">宝马</font>-之诺"
//        label.text = "<font face='HelveticaNeue-CondensedBold' size=20><u color=blue>underlined</u> <uu color=red>text</uu></font>"
        print(label)
        
        
        
        view.addSubview(label1)
        view.addSubview(label2)
        label1.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(200)
            make.left.equalToSuperview().offset(20)
            make.right.lessThanOrEqualTo(label2.snp.left).offset(-20)
        }
        label2.snp.makeConstraints { (make) in
            make.top.equalTo(label1)
            make.right.equalToSuperview().offset(-20)
        }
        
//        label2.setContentHuggingPriority(UILayoutPriorityRequired, for: .horizontal)
        label2.setContentCompressionResistancePriority(UILayoutPriorityRequired, for: .horizontal)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
