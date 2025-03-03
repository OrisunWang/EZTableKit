//
//  DemoRow.swift
//  EZTableKit_Example
//
//  Created by Orisun on 2024/9/14.
//  Copyright © 2024 CocoaPods. All rights reserved.
//

import Foundation
import EZTableKit

class DemoRow : EZTableRow {
    
    let title: String
    var isSelected = false
    
    init(title: String) {
        self.title = title
        super.init()
        cellHeight = 50
        adjustsCellHeightAutomatically = false
    }
    
    override func updateCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        super.updateCell(cell, indexPath: indexPath)
        guard let cell = cell as? DemoRowCell else { return }
        
        cell.iconImageView.image = UIImage(named: "\(title.lowercased()).square.fill")
        cell.titleLabel.text = title
        cell.bottomLine.isHidden = section?.allRows().count == indexPath.row + 1
    }
}

class DemoRowCell : EZTableViewCell {
    
    private let containerView = UIView()
    let iconImageView = UIImageView()
    let titleLabel = UILabel()
    let arrowImageView = UIImageView(image: UIImage(named: "chevron.right"))
    let bottomLine = UIView()
    
    override func cellDidCreate() {
        super.cellDidCreate()
        
        backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(arrowImageView)
        containerView.addSubview(bottomLine)
        
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            containerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            containerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
        ])
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 27),
            iconImageView.heightAnchor.constraint(equalToConstant: 27),
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrowImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16),
            arrowImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        bottomLine.backgroundColor = .lightGray
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomLine.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            bottomLine.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            bottomLine.rightAnchor.constraint(equalTo: containerView.rightAnchor),
            bottomLine.heightAnchor.constraint(equalToConstant: 1 / UIScreen.main.scale),
        ])
    }
}
