//
//  PhotoBrowerViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/10/21.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class PhotoBrowerViewController: UIViewController, UIScrollViewDelegate {

	private var performingLayout: Bool = false
	private var rotating: Bool = false

	var currentPageIndex: Int = 0 {
		didSet {
			self.title = String(currentPageIndex + 1)
		}
	}
	private lazy var imageViewList: [UIImageView?] = []

	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.pagingEnabled = true
		scrollView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
		scrollView.backgroundColor = UIColor.blackColor()
		scrollView.delegate = self
		return scrollView
	}()

	private lazy var itemList: [String] = ["http://i0.hdslb.com/bfs/archive/7afbb4a41cff90d69dddc3be197c1839033e676a.jpg",
		"http://img4.duitang.com/uploads/item/201505/21/20150521004418_fFv5V.thumb.700_0.jpeg",
		"http://cdn.duitang.com/uploads/item/201507/23/20150723161932_WY3AC.jpeg",
		"http://cdn.duitang.com/uploads/item/201510/10/20151010200119_r5GTP.jpeg",
		"http://a.hiphotos.baidu.com/zhidao/pic/item/060828381f30e924381c3c714a086e061d95f732.jpg",
		"http://www.7772562.cc/imgall/o53telttnfxgc2lnm4xgg3q/large/6f9fb32bgw1e7pphm00lyj20m80y8gtd.jpg",
		"http://cdn.duitang.com/uploads/item/201511/16/20151116134913_LEdVY.thumb.700_0.jpeg",
		"http://img4q.duitang.com/uploads/item/201401/15/20140115211528_BiEmV.thumb.700_0.jpeg",
		"http://img4.duitang.com/uploads/item/201509/07/20150907125451_cufEU.thumb.700_0.jpeg"]

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		view.addSubview(scrollView)
		scrollView.frame = view.bounds
		reloadData()
	}

	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		layoutVisiblePages()
	}

	override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
		rotating = true
	}

	override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
		rotating = false
	}
	func scrollViewDidScroll(scrollView: UIScrollView) {
		if performingLayout || rotating {
			return
		}
		let visibleBounds = scrollView.bounds
		var index = Int(floor(CGRectGetMidX(visibleBounds) / CGRectGetWidth(visibleBounds)))
		if index < 0 { index = 0 }
		if index > numberOfPhotos() - 1 { index = numberOfPhotos() - 1 }
		let previousCurrentPage = currentPageIndex
		currentPageIndex = index
		if previousCurrentPage != currentPageIndex {
			didStartViewingPageAtIndex(index)
		}
	}

	private func layoutVisiblePages() {
		performingLayout = true
		if numberOfPhotos() > 0 {
			scrollView.frame = view.bounds
			scrollView.contentSize = CGSize(width: CGFloat(numberOfPhotos()) * getWidth(), height: getHight())
			scrollView.contentOffset = getPointForIndex(currentPageIndex)
			let imageView = imageViewList[currentPageIndex]
			imageView?.frame = getFrameForIndex(currentPageIndex)
			if currentPageIndex > 1 {
				if let previousImageView = imageViewList[currentPageIndex - 1] {
					previousImageView.frame = getFrameForIndex(currentPageIndex - 1)
				}
			}
			if currentPageIndex < numberOfPhotos() - 1 {
				if let subsequentImageView = imageViewList[currentPageIndex + 1] {
					subsequentImageView.frame = getFrameForIndex(currentPageIndex + 1)
				}
			}
		}

		performingLayout = false
	}

	private func reloadData() {
		let numberOfPhotos: Int = self.numberOfPhotos()
		for imageView in imageViewList {
			imageView?.removeFromSuperview()
		}
		imageViewList = Array(count: numberOfPhotos, repeatedValue: nil)
		if numberOfPhotos > 0 {
			currentPageIndex = max(0, min(currentPageIndex, numberOfPhotos))
		} else {
			currentPageIndex = 0
		}

		scrollView.contentSize = CGSize(width: CGFloat(numberOfPhotos) * view.bounds.size.width, height: view.bounds.size.height)
		scrollView.contentOffset = getPointForIndex(currentPageIndex)
		didStartViewingPageAtIndex(currentPageIndex)
	}

	private func numberOfPhotos() -> Int {
		return itemList.count
	}
	private func photoAtIndex(index: Int) -> UIImageView {
		if index < numberOfPhotos() {
			if let imageView = imageViewList[index] {
				imageView.frame = getFrameForIndex(index)
				return imageView
			} else {
				let imageView = UIImageView()
				imageView.frame = getFrameForIndex(index)
				imageView.contentMode = .ScaleAspectFit
				scrollView.addSubview(imageView)
				imageViewList[index] = imageView
				return imageView
			}
		}
		return UIImageView()
	}

	private func didStartViewingPageAtIndex(index: Int) {
		guard numberOfPhotos() > 0 else {
			return
		}

		let imageView = photoAtIndex(index)
		imageView.kf_setImageWithURL(NSURL(string: itemList[index]))

		if index > 0 {
			for i in 0..<index - 1 {
				imageViewList[i]?.removeFromSuperview()
				imageViewList[i] = nil
			}
		}
		if index < numberOfPhotos() - 1 {
			for i in (index + 2)..<(numberOfPhotos()) {
				imageViewList[i]?.removeFromSuperview()
				imageViewList[i] = nil
			}
		}

		currentPageIndex = index
	}

	private func getFrameForIndex(index: Int) -> CGRect {
		return CGRect(x: CGFloat(index) * scrollView.bounds.size.width, y: 0, width: scrollView.bounds.size.width, height: scrollView.bounds.size.height)
	}
	private func getPointForIndex(index: Int) -> CGPoint {
		return CGPoint(x: CGFloat(index) * view.bounds.size.width, y: 0)
	}
	private func getWidth() -> CGFloat {
		return scrollView.bounds.size.width
	}
	private func getHight() -> CGFloat {
		return scrollView.bounds.size.height
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}
