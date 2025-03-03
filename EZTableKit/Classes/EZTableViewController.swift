//
//  EZTableViewController.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/14.
//

import Foundation

@objcMembers open class EZTableViewController : UIViewController, UITableViewDelegate {
    
    /// Changed before `viewDidLoad` called if needed.
    open var tableViewStyle = UITableView.Style.grouped
    open var dataSource = EZTableDataSource()
    open lazy var tableView = EZTableView(frame: CGRect(origin: .zero, size: view.bounds.size), style: tableViewStyle)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
}
