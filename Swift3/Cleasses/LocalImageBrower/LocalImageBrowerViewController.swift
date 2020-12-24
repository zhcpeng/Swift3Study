//
//  LocalImageBrowerViewController.swift
//  Swift4
//
//  Created by zhcpeng on 2020/12/23.
//  Copyright © 2020 zhcpeng. All rights reserved.
//

import UIKit

class LocalImageBrowerViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    fileprivate lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: kScreenWidth, height: kScreenHeight)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return flowLayout
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: self.flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.scrollsToTop = false
        collectionView.isPagingEnabled = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ImageBrowerCollectionViewCell.self, forCellWithReuseIdentifier: "ImageBrowerCollectionViewCell")
        return collectionView
    }()
    
    
    
    private var currentIndex: Int = Int.max
    
    private var rotating: Bool = false
    
    private let paths = NSHomeDirectory() + "/Documents/image"
    private var itemList: [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        
        if !FileManager.default.fileExists(atPath: paths) {
            try? FileManager.default.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }
        try? itemList = FileManager.default.contentsOfDirectory(atPath: paths)
        if !itemList.isEmpty {
            print("load success")
            collectionView.reloadData()
        }
    }

    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        print("\(#function)")
        rotating = true
        let page = collectionView.contentOffset.x / collectionView.bounds.width
        let width: CGFloat = toInterfaceOrientation.isPortrait ? min(kScreenWidth, kScreenHeight) : max(kScreenWidth, kScreenHeight)
        let height: CGFloat = toInterfaceOrientation.isPortrait ? max(kScreenWidth, kScreenHeight) : min(kScreenWidth, kScreenHeight)
        let contentWidth = width * CGFloat(itemList.count)
        
        UIView.animate(withDuration: duration, animations: {
            self.collectionView.contentSize = CGSize(width: contentWidth, height: height)
            self.collectionView.setContentOffset(CGPoint(x: width * page, y: 0), animated: false)
            self.collectionView.collectionViewLayout.invalidateLayout()
        })
    }
    
    override func willAnimateRotation(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        rotating = false
        print("\(#function)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return view.frame.size
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageBrowerCollectionViewCell", for: indexPath) as! ImageBrowerCollectionViewCell
//        cell.image = image
        
        let path = paths + "/" + itemList[indexPath.row]
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url, options: []), let image = UIImage(data: data){
            cell.image = image
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard currentIndex != indexPath.item, rotating == false else { return }
        guard let imageCell = cell as? ImageBrowerCollectionViewCell else { return }
        //            imageCell.image = result
        let path = paths + "/" + itemList[indexPath.row]
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url, options: []), let image = UIImage(data: data){
            imageCell.image = image
        }
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        print("end display: \(currentIndex)")
    }

}
