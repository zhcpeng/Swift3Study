//
//  PhotosAlbumViewCell.swift
//  Swift4
//
//  Created by ZhangChunPeng on 2017/12/20.
//  Copyright © 2017年 zhcpeng. All rights reserved.
//

import UIKit
import Photos

class PhotosAlbumViewCell: UICollectionViewCell {

    /// 照片资源路径
    var phAsset: PHAsset?

    override var isSelected: Bool {
        didSet{
            selectedMaskView.isHidden = !isSelected
        }
    }

    /// 照片
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private var selectedMaskView: UIView = UIView()


    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        clipsToBounds = true
        initUI()
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
//        select = false
//        representedAssetIdentifier = ""
//        selectedButton.setTitle("", for: .normal)
    }

    private func initUI() {
        selectedMaskView.isHidden = true
        selectedMaskView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
    }

    private func commonInit() {
        contentView.addSubview(imageView)
        contentView.addSubview(selectedMaskView)
        imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        selectedMaskView.snp.makeConstraints { (make) in
            make.edges.equalTo(imageView)
        }
    }
    
}
