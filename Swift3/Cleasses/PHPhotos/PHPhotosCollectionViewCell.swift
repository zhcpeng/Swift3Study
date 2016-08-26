//
//  PHPhotosCollectionViewCell.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/8/25.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class PHPhotosCollectionViewCell: UICollectionViewCell {
	static let identifier = "PHPhotosCollectionViewCell"
	var representedAssetIdentifier = ""

	private lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .ScaleAspectFill
		return imageView
	}()

	var thumbnailImage: UIImage? = nil {
		didSet {
			imageView.image = thumbnailImage
		}
	}

	override init(frame: CGRect) {
		super.init(frame: frame)

		self.clipsToBounds = true

		self.addSubview(imageView)
		imageView.snp_makeConstraints { (make) in
			make.edges.equalTo(self)
		}
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
