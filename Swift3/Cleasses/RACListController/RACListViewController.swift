//
//  RACListViewController.swift
//  Swift3
//
//  Created by ZhangChunpeng on 16/6/20.
//  Copyright © 2016年 zhcpeng. All rights reserved.
//

import UIKit

class RACListViewController: UIViewController {

	private lazy var viewModel: RACListViewModel = {
        let viewModel = RACListViewModel()
        return viewModel
	}()
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
//    private var bindingHelper : TableViewBindingHelper!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
        
        
//        bindingHelper = TableViewBindingHelper(tableView: listTableView, sourceSignal: RACObserve(viewModel, keyPath: "searchResults"), tableViewCell: RACListViewCell)
//        bindingHelper.delegate = self
        
        
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

    
    


}
