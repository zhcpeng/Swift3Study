//
//  ChannelView.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/6/27.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

/// 标签view
open class ChannelView: UIView {
    
    open weak var delegate : ChannelViewDelegate?
    open var itemList : Array<String>?
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

public protocol ChannelViewDelegate : NSObjectProtocol {
    
    func channelView(_ channelView: ChannelView, didSelectedIndex index: Int)
    
}
