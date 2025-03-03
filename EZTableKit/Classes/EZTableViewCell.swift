//
//  EZTableViewCell.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/13.
//

import Foundation

@objcMembers open class EZTableViewCell : UITableViewCell {
    
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellDidCreate()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        cellDidCreate()
    }
    
    public required init?(coder: NSCoder) { nil }
    
    /// Called after init. Requires override. Requires super.
    open func cellDidCreate() {
        selectionStyle = .none
    }
}
