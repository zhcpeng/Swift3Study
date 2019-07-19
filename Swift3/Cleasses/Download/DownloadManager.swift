//
//  DownloadManager.swift
//  Swift4
//
//  Created by zhcpeng on 2019/7/19.
//  Copyright © 2019 zhcpeng. All rights reserved.
//

import UIKit
import Alamofire

class DownloadManager: NSObject {
    static let shared: DownloadManager = DownloadManager()
    private var isDownload: Bool = false
    private var downloadList: [String] = []
    private var downloadRequest: DownloadRequest?
    
    private let destination:DownloadRequest.DownloadFileDestination = { _, response in
//        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//        let fileURL = documentURL.appendingPathComponent(response.suggestedFilename!)
        
        let fileURL = ZFileManager.shared.rootURL.appendingPathComponent(response.suggestedFilename!)
        return (fileURL,[.removePreviousFile,.createIntermediateDirectories])
        }
    
    func addDownloadURL(_ url: String) {
        let url = url.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !url.isEmpty && (url.hasSuffix("mp4") || url.hasSuffix("MP4")) {
            downloadList.append(url)
            download()
        }
    }
    
    private func download() {
        if isDownload || downloadList.isEmpty {
            return
        }
        guard let url = downloadList.first, let URL = URL.init(string: url) else { return }
        isDownload = true
        downloadRequest = Alamofire.download(URL, to: destination)
        downloadRequest?.responseData(completionHandler: downloadResponse)
    }
    
    private func downloadResponse(response:DownloadResponse<Data>){
        switch response.result {
        case .success(let _):
            // 下载完成
            DispatchQueue.main.async {
                self.isDownload = false
                if !self.downloadList.isEmpty {
                    self.downloadList.remove(at: 0)
                }
                self.downloadRequest?.cancel()
                self.downloadRequest = nil
                self.download()
                
                print("路径:\(response.destinationURL?.path)")
                
                ZFileManager.shared.loadFile()
                
            }
        case .failure(error:):
            isDownload = false
            download()
            print("下载失败！！！")
            break
        }
    }

}
