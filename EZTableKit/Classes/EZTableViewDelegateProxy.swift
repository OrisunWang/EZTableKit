//
//  EZTableViewDelegateProxy.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/14.
//

import Foundation

class EZTableViewDelegateProxy : NSObject, UITableViewDelegate {
    
    weak var realDelegate: UITableViewDelegate?
    
    override func responds(to aSelector: Selector!) -> Bool {
        if super.responds(to: aSelector) {
            return true
        }
        return realDelegate?.responds(to: aSelector) ?? false
    }
    
    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        if realDelegate?.responds(to: aSelector) == true {
            return realDelegate
        }
        return super.forwardingTarget(for: aSelector)
    }
    
    // MARK: - partial UITableViewDelegate
    
    // MARK: - section related
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if realDelegate?.responds(to: #selector(tableView(_:heightForHeaderInSection:))) == true {
            return realDelegate?.tableView?(tableView, heightForHeaderInSection: section) ?? .leastNormalMagnitude
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[section]
            if tableSection.adjustsHeaderHeightAutomatically {
                return UITableViewAutomaticDimension
            } else {
                return tableSection.headerHeight
            }
        }
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if realDelegate?.responds(to: #selector(tableView(_:heightForFooterInSection:))) == true {
            return realDelegate?.tableView?(tableView, heightForFooterInSection: section) ?? .leastNormalMagnitude
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[section]
            if tableSection.adjustsFooterHeightAutomatically {
                return UITableViewAutomaticDimension
            } else {
                return tableSection.footerHeight
            }
        }
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if realDelegate?.responds(to: #selector(tableView(_:viewForHeaderInSection:))) == true {
            return realDelegate?.tableView?(tableView, viewForHeaderInSection: section)
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[section]
            return tableSection.tableView(tableView, viewForHeaderInSection: section)
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if realDelegate?.responds(to: #selector(tableView(_:viewForFooterInSection:))) == true {
            return realDelegate?.tableView?(tableView, viewForFooterInSection: section)
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[section]
            return tableSection.tableView(tableView, viewForFooterInSection: section)
        }
        return nil
    }
    
    // MARK: - row related
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if realDelegate?.responds(to: #selector(tableView(_:heightForRowAt:))) == true {
            return realDelegate?.tableView?(tableView, heightForRowAt: indexPath) ?? .leastNormalMagnitude
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[indexPath.section]
            let tableRow = tableSection.allRows()[indexPath.row]
            if tableRow.adjustsCellHeightAutomatically {
                return UITableViewAutomaticDimension
            } else {
                return tableRow.cellHeight
            }
        }
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if realDelegate?.responds(to: #selector(tableView(_:estimatedHeightForRowAt:))) == true {
            return realDelegate?.tableView?(tableView, estimatedHeightForRowAt: indexPath) ?? .leastNormalMagnitude
        }
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[indexPath.section]
            let tableRow = tableSection.allRows()[indexPath.row]
            return tableRow.estimatedCellHeight
        }
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dataSource = tableView.dataSource as? EZTableDataSource {
            let tableSection = dataSource.allSections()[indexPath.section]
            let tableRow = tableSection.allRows()[indexPath.row]
            if tableRow.automaticDeselectRowWhenDidSelectRow {
                tableView.deselectRow(at: indexPath, animated: true)
            }
            tableRow.didSelectRowHandler?(tableView, indexPath)
        }
        if realDelegate?.responds(to: #selector(tableView(_:didSelectRowAt:))) == true {
            realDelegate?.tableView?(tableView, didSelectRowAt: indexPath)
        }
    }
}
