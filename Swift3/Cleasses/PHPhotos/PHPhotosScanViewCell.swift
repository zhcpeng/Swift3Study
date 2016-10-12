//
//  PHPhotosScanViewCell.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/26.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class PHPhotosScanViewCell: UIView ,UIScrollViewDelegate{
    
    var representedAssetIdentifier = ""
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 1.0
        scrollView.delegate = self
//        scrollView.alwaysBounceVertical = false
//        scrollView.alwaysBounceHorizontal = false
        scrollView.bounces = false
        return scrollView
    }()
    
    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    var thumbnailImage: UIImage? = nil {
        didSet {
            imageView.image = thumbnailImage
            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
//                print(self.thumbnailImage?.size)
//            })
//            if let image = thumbnailImage {
//                var w = image.size.width / UIScreen.mainScreen().scale / kScreenWidth
//                if w < 2 {
//                    w = 2
//                }
//                scrollView.maximumZoomScale = w
//            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        imageView.snp_makeConstraints { (make) in
//            make.edges.equalTo(scrollView)
//            make.center.equalTo(scrollView)
//            make.width.equalTo(scrollView)
            make.left.right.top.bottom.equalTo(scrollView)
        }
//        imageView.frame = frame
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
//    func scrollViewDidZoom(scrollView: UIScrollView) {
//        let height = kScreenWidth * thumbnailImage!.size.height / thumbnailImage!.size.width * scrollView.zoomScale
//        scrollView.contentSize = CGSize.init(width: kScreenWidth * scrollView.zoomScale, height: height < kScreenHeight ? kScreenHeight : height )
//    }

}
