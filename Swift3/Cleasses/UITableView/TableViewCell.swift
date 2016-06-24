//
//  TableViewCell.swift
//  Swift3
//
//  Created by zhcpeng on 16/6/2.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

let kTableViewCellIdentifier = "kTableViewCellIdentifier"

class TableViewCell: UITableViewCell {
    
    var imageMain: UIImage?
    
    lazy var imgView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    lazy var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = kUIColor(0x555500)
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFontOfSize(16)
        return titleLabel
    }()

    var model : TableViewModel? {
        didSet {
//            imgView.sd_setImageWithURL(NSURL.init(string:(model?.mobile_image_one)!))
            imgView.sd_setImageWithURL(NSURL.init(string:(model?.mobile_image_one)!)) { (image, error, _, _) in
                self.imageMain = image
            }
            titleLabel.text = model?.brand_name!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(imgView)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp_makeConstraints { (make) in
            make.top.equalTo(self.snp_top).offset(4)
            make.left.equalTo(self.snp_left).offset(8)
            make.right.equalTo(self.snp_right).offset(-8)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left).offset(8)
            make.right.equalTo(self.snp_right).offset(8)
            make.top.equalTo(imgView.snp_bottom).offset(4)
            make.bottom.equalTo(self.snp_bottom).offset(-4)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
