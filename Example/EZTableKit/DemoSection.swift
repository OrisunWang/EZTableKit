//
//  DemoSection.swift
//  EZTableKit_Example
//
//  Created by Orisun on 2024/9/14.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import EZTableKit

class DemoSection : EZTableSection {
    
    override init() {
        super.init()
        headerHeight = 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        UIView()
    }
}
