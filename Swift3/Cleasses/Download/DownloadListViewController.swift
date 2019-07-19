//
//  DownloadListViewController.swift
//  Swift4
//
//  Created by zhcpeng on 2019/7/19.
//  Copyright © 2019 zhcpeng. All rights reserved.
//

import UIKit

class DownloadListViewController: UIViewController {
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.text = " "
        return textView
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.titleLabel!.font = UIFont.systemFont(ofSize: 14)
        button.backgroundColor = UIColor.blue
        return button
    }()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()
    
    
    private var documentController: UIDocumentInteractionController?

    // MARK: - Life Cycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let text = UIPasteboard.general.string {
            if text.hasSuffix("mp4") || text.hasSuffix("MP4") {
                textView.text = text
            }
            UIPasteboard.general.string = ""
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        commonUI()
        
        ZFileManager.shared.updateFileSuccess = { [weak self]() in
            self?.tableView.reloadData()
        }
        ZFileManager.shared.loadFile()
    }
    
    private func commonUI() {
        let topView = UIView()
        topView.backgroundColor = UIColor.gray
        topView.addSubview(textView)
        topView.addSubview(button)
        self.view.addSubview(topView)
        self.view.addSubview(tableView)
        topView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(64)
            make.height.equalTo(100)
        }
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(topView.snp.bottom)
        }
        button.snp.makeConstraints { (make) in
            make.top.right.bottom.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
            make.width.equalTo(80)
        }
        textView.snp.makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview().inset(10)
            make.right.equalTo(button.snp.left).offset(-10)
        }
        
        button.reactive.controlEvents(.touchUpInside).observeValues { [weak self](_) in
            guard let weakSelf = self else { return }
            if let text = weakSelf.textView.text {
                DownloadManager.shared.addDownloadURL(text)
            }
        }
    }


}

extension DownloadListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZFileManager.shared.fileList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = ZFileManager.shared.fileList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let url = URL.init(fileURLWithPath: ZFileManager.shared.rootPath + "/" + ZFileManager.shared.fileList[indexPath.row])
        documentController = UIDocumentInteractionController(url: url)
        documentController!.presentOpenInMenu(from: CGRect.zero, in: self.view, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        ZFileManager.shared.deleteFile(indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    
}

