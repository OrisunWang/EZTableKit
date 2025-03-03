//
//  DemoViewController.swift
//  EZTableKit_Example
//
//  Created by Orisun on 2024/9/14.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import EZTableKit

class DemoViewController : EZTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor(red: 242 / 255.0, green: 241 / 255.0, blue: 245 / 255.0, alpha: 1)
        
        let array = [
            ["Wifi", "Bell"],
            ["Text", "Microphone", "Star", "Trash"],
        ]
        for titles in array {
            let section = DemoSection()
            dataSource.appendSection(section)
            
            for title in titles {
                let row = DemoRow(title: title)
                row.didSelectRowHandler = { tableView, indexPath in
                    // do something
                }
                section.appendRow(row)
            }
        }
        tableView.reloadData()
    }
}
