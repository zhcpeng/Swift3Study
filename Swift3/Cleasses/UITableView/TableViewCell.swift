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
    
    lazy var imgView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .ScaleAspectFit
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
            imgView.sd_setImageWithURL(NSURL.init(string:(model?.mobile_image_one)!))
//            imgView.sd_setImageWithURL(NSURL.init(string:(model?.mobile_image_one)!), placeholderImage: UIImage.init(named: "001.jpg"))
            titleLabel.text = model?.brand_name!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(imgView)
        self.contentView.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imgView.snp_makeConstraints { (make) in
            make.top.equalTo(self.contentView.snp_top).offset(4)
            make.left.equalTo(self.contentView.snp_left).offset(8)
            make.right.equalTo(self.contentView.snp_right).offset(-8)
            make.height.equalTo(imgView.snp_width).multipliedBy(0.48)
//            make.width.equalTo(kScreenWidth - 18)
//            make.height.equalTo((kScreenWidth - 16) * 0.48)
        }
        
        titleLabel.snp_makeConstraints { (make) in
            make.left.equalTo(self.contentView.snp_left).offset(8)
            make.right.equalTo(self.contentView.snp_right).offset(8)
            make.top.equalTo(imgView.snp_bottom).offset(4)
            make.bottom.equalTo(self.contentView.snp_bottom).offset(-4)
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
