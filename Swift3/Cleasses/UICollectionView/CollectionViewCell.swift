//
//  CollectionViewCell.swift
//  Swift3
//
//  Created by zhcpeng on 16/6/2.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

let kCollectionViewCellIdentifier = "kCollectionViewCellIdentifier"

class CollectionViewCell: UICollectionViewCell {
    
    lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var title : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.redColor()
        titleLabel.font = UIFont.systemFontOfSize(18)
        return titleLabel
    }()
    
    lazy var detailLabel : UILabel = {
        let detailLabel = UILabel()
        detailLabel.textColor = UIColor.lightGrayColor()
        detailLabel.font = UIFont.systemFontOfSize(14)
        return detailLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(title)
        addSubview(detailLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(4)
            make.left.equalTo(self.snp_left).offset(8)
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.bottom.equalTo(self.snp_bottom).offset(-4)
        }
        
        title.snp_makeConstraints { (make) in
            make.top.equalTo(imageView)
            make.left.equalTo(imageView).offset(8)
            make.right.equalTo(self.snp_right).offset(-8)
        }
        
        detailLabel.snp_makeConstraints { (make) in
            make.left.equalTo(title)
            make.bottom.equalTo(self.snp_bottom).offset(-4)
        }
        
    }
    
    
    var model : CollectionModel? {
        didSet {
            imageView.sd_setImageWithURL(NSURL.init(string: (model?.imageUrl)!), placeholderImage: UIImage.init(named: ""))
            title.text = model?.title
        }
    }
    
    
}
