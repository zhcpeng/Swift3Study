//
//  KuGouViewController.swift
//  Swift4
//
//  Created by zhcpeng on 2021/1/12.
//  Copyright © 2021 zhcpeng. All rights reserved.
//

import UIKit

class KuGouViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "lrc", withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments){
                    if let dict = json as? [String : Any] {
                        let content = dict["content"] as! String
                        
                        let strData = Data(base64Encoded: content, options: Data.Base64DecodingOptions(rawValue: 0))
                        
//                        let str = NSString(data: strData!, encoding: 0)
                        
                        
                        let s = String(data: strData!, encoding: String.Encoding.ascii)
                        
                        print(s)
                        
                    }
                }
            }
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
