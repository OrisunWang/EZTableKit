//
//  EZTableSection.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/13.
//

import Foundation

@objcMembers open class EZTableSection : NSObject {
    
    public internal(set) var dataSource: EZTableDataSource?
    private var rows: [EZTableRow] = []
    
    // MARK: - append
    
    public func appendRow(_ row: EZTableRow) {
        row.section = self
        rows.append(row)
    }
    
    public func appendRows(_ rows: [EZTableRow]) {
        for row in rows {
            appendRow(row)
        }
    }
    
    // MARK: - insert
    
    public func insertRow(_ row: EZTableRow, at index: Int) {
        row.section = self
        rows.insert(row, at: index)
    }
    
    public func insertRows(_ rows: [EZTableRow], at index: Int) {
        for (i, row) in rows.enumerated() {
            insertRow(row, at: index + i)
        }
    }
    
    // MARK: - remove
    
    public func removeRow(at index: Int) {
        guard index >= 0, index < rows.count else { return }
        let row = rows[index]
        row.section = nil
        rows.remove(at: index)
    }
    
    public func removeRow(_ row: EZTableRow) {
        rows.removeAll { element in
            if element === row {
                element.section = nil
                return true
            }
            return false
        }
    }
    
    // MARK: - check
    
    /// `nil` if not appended into an `EZTableDataSource`.
    public var index: Int? {
        dataSource?.allSections().firstIndex(of: self)
    }
    
    public func allRows() -> [EZTableRow] {
        rows
    }
    
    // MARK: - partial UITableViewDelegate
    
    /// Default is `CGFloat.leastNormalMagnitude`.
    open var headerHeight = CGFloat.leastNormalMagnitude
    /// Default is `CGFloat.leastNormalMagnitude`.
    open var footerHeight = CGFloat.leastNormalMagnitude
    /// `UITableViewAutomaticDimension` instead of `headerHeight` if true.
    /// Default is false.
    open var adjustsHeaderHeightAutomatically = false
    /// `UITableViewAutomaticDimension` instead of `footerHeight` if true.
    /// Default is false.
    open var adjustsFooterHeightAutomatically = false
    
    /// The default return is nil.
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        nil
    }
    
    /// The default return is nil.
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
}
