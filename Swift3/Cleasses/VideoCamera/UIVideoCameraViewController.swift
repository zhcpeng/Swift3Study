//
//  UIVideoCameraViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 2017/6/22.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit

import GPUImage

class UIVideoCameraViewController: UIViewController {

    
    private lazy var videoCamera: GPUImageVideoCamera = {
        let camera = GPUImageVideoCamera.init(sessionPreset: AVCaptureSessionPreset1280x720, cameraPosition: .back)
        camera?.outputImageOrientation = .portrait
        return camera!
    }()

    private lazy var fitter: GPUImageSepiaFilter = {
        let fitter = GPUImageSepiaFilter()

        return fitter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
