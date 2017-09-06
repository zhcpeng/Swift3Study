//
//  RegularViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 2017/8/28.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit

class RegularViewController: UIViewController {

    private var emoticonRegex: NSRegularExpression = try! NSRegularExpression(pattern: "\\#.*?\\#", options: [])
    private var text: String = "#12##12345678901234567890#xxxxx#第二个正则#"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.


        let matches = emoticonRegex.matches(in: text, options: [], range: NSRange(location: 0, length: text.characters.count)).filter { return $0.range.length > 3 && $0.range.length < 23 }//.reversed()
        if !matches.isEmpty {
            for one in matches {
//                if one.range.length > 3 && one.range.length < 23
                print(one)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
