//
//  EZTableDataSource.swift
//  EZTableKit
//
//  Created by Orisun on 2024/9/13.
//

import Foundation

@objcMembers open class EZTableDataSource : NSObject, UITableViewDataSource {
    
    private var sections: [EZTableSection] = []
    
    // MARK: - append
    
    public func appendSection(_ section: EZTableSection) {
        section.dataSource = self
        sections.append(section)
    }
    
    public func appendSections(_ sections: [EZTableSection]) {
        for section in sections {
            appendSection(section)
        }
    }
    
    // MARK: - insert
    
    public func insertSection(_ section: EZTableSection, at index: Int) {
        section.dataSource = self
        sections.insert(section, at: index)
    }
    
    public func insertSections(_ sections: [EZTableSection], at index: Int) {
        for (i, section) in sections.enumerated() {
            insertSection(section, at: index + i)
        }
    }
    
    // MARK: - remove
    
    public func removeSection(at index: Int) {
        guard index >= 0, index < sections.count else { return }
        let section = sections[index]
        section.dataSource = nil
        sections.remove(at: index)
    }
    
    public func removeSection(_ section: EZTableSection) {
        sections.removeAll { element in
            if element === section {
                element.dataSource = nil
                return true
            }
            return false
        }
    }
    
    // MARK: - check
    
    public func allSections() -> [EZTableSection] {
        sections
    }
    
    public func allRows() -> [EZTableRow] {
        allSections().flatMap {
            $0.allRows()
        }
    }
    
    // MARK: - partial UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        allSections().count
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allSections()[section].allRows().count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = allSections()[indexPath.section].allRows()[indexPath.row]
        let cell = row.cellForTableView(tableView, indexPath: indexPath)
        row.updateCell(cell, indexPath: indexPath)
        return cell
    }
}
