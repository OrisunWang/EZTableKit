//
//  EZTableView.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/13.
//

import Foundation

@objcMembers open class EZTableView : UITableView {
    
    private var delegateProxy: EZTableViewDelegateProxy?
    
    open override var delegate: (any UITableViewDelegate)? {
        get {
            super.delegate
        }
        set {
            if let newValue {
                if delegateProxy == nil {
                    delegateProxy = EZTableViewDelegateProxy()
                }
                delegateProxy?.realDelegate = newValue
            } else {
                delegateProxy = nil
            }
            super.delegate = delegateProxy
        }
    }
    
    deinit {
        delegate = nil
    }
}
