//
//  UIImageViewCategory.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/7/18.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class UIImageViewCategory: UIViewController {
    
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    private lazy var button :UIButton = {
        let button = UIButton.init(type: .Custom)
        button.setBackgroundImage(UIImage.imageWithColor(kUIColor(0x666666)), forState: .Normal)
        button.setBackgroundImage(UIImage.imageWithColor(kUIColor(0x333333)), forState: .Highlighted)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        self.view.addSubview(self.imageView)
        self.imageView.image = UIImage.init(named: "15.jpg")
        imageView.frame = CGRect.init(x: 0, y: 200, width: kScreenWidth, height: kScreenHeight - 100)

        self.view.addSubview(button)
        button.frame = CGRect.init(x: 0, y: 100, width: kScreenWidth, height: 50)
        
        button.addObserver(self, forKeyPath: "highlighted", options: .New, context: nil)
 
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        let button = object as! UIButton
        self.imageView.showHighlighted = button.highlighted
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit{
//        self.removeObserver(self, forKeyPath: "highlighted")
    }
    
//    func sendSmsWithMobile(licenseNo: String, mobile:String,mode:Int,scene:String,successHandler:(isRegistered:Bool)->Void,failureHandler:(driver:Driver)->Void)
//    {
//        let content = [
//            "DeviceId":DeviceId,
//            "Mobile":mobile,
//            "LicenseNo":licenseNo,
//            "Mode":mode,
//            "Scene":scene,
//            ]
//        let url = "Driver/SendSmsVerify"
//        
//        Alamofire.request(.POST, url.fixUrl(), parameters:content as? [String : AnyObject], encoding: ParameterEncoding.JSON, headers: nil).responseObject { (response: Response<Driver, NSError>) -> Void in
//            
//            var success:Bool=false
//            var driver = Driver()
//            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
//            dispatch_async(dispatch_get_global_queue(priority, 0)) {
//                
//                if (response.result.isFailure) {
//                    success = false
//                    driver.errorMessage = errorString
//                    
//                }
//                else {
//                    let result = response.result.value!
//                    success = result.success
//                    if (!success)  {
//                        driver = result
//                    } else {
//                        driver.isRegistered = result.isRegistered
//                    }
//                }
//                
//                dispatch_async(dispatch_get_main_queue()) {
//                    if (success) {
//                        successHandler(isRegistered: driver.isRegistered)
//                    } else {
//                        failureHandler(driver: driver)
//                    }
//                }
//            }
//        }
//    }
    
}



extension UIImage {
    
    /**
     根据颜色生成图片
     
     - parameter    color:          图片颜色
     - parameter    pixelSize:      图片大小
     - returns:     UIImage
     */
    class func imageWithColor(color: UIColor, pixelSize: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        let pixelScale = UIScreen.mainScreen().scale
        let fillSize = CGSize(width: (pixelSize.width / pixelScale), height: (pixelSize.height / pixelScale))
        let fillRect = CGRect(origin: CGPoint.zero, size: fillSize)
        UIGraphicsBeginImageContextWithOptions(fillRect.size, false, pixelScale)
        let graphicsContext = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(graphicsContext, color.CGColor)
        CGContextFillRect(graphicsContext, fillRect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
