//
//  EZTableRow.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/13.
//

import Foundation

@objcMembers open class EZTableRow : NSObject {
    
    public internal(set) var section: EZTableSection?
    
    /// `nil` if not appended into an `EZTableSection`.
    public var index: Int? {
        section?.allRows().firstIndex(of: self)
    }
    
    /// `nil` if not appended into an `EZTableSection` or the section isn't appended into an `EZTableDataSource`.
    public var indexPath: IndexPath? {
        if let sectionIndex = section?.index, let rowIndex = index {
            return IndexPath(row: rowIndex, section: sectionIndex)
        }
        return nil
    }
    
    open weak var tableView: UITableView?
    
    /// Default is 44.
    open var cellHeight: CGFloat = 44
    /// Default is 44.
    open var estimatedCellHeight: CGFloat = 44
    /// `UITableViewAutomaticDimension` instead of `cellHeight` if true.
    /// Default is true.
    open var adjustsCellHeightAutomatically = true
    
    /// Called in `tableView(_:didSelectRowAt:)`.
    open var didSelectRowHandler: ((UITableView, IndexPath) -> Void)?
    /// Will call `deselectRow(at:animated:true)` in `tableView(_:didSelectRowAt:)` if true.
    /// Default is true.
    open var automaticDeselectRowWhenDidSelectRow = true
    
    /// The default return is `NSStringFromClass(Self.self)`.
    open func reuseIdentifier() -> String {
        NSStringFromClass(Self.self)
    }
    
    /// The default return is an instance of `"\(NSStringFromClass(Self.self))Cell"`.
    open func createNewTableViewCell() -> UITableViewCell {
        if let cellClass = NSClassFromString("\(NSStringFromClass(Self.self))Cell") as? UITableViewCell.Type {
            return cellClass.init(style: .default, reuseIdentifier: reuseIdentifier())
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier())
        }
    }
    
    public func cellForTableView(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.dequeueReusableCell(withIdentifier: reuseIdentifier()) ?? createNewTableViewCell()
    }
    
    /// Requires override. Requires super.
    open func updateCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        
    }
}
