//
//  BookmarkCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/5/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class BookmarkCell: UITableViewCell {
    
    let sectionName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SECTION NAME"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let partName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Part Name"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Content - More than ever, iOS11 is going back to its roots bold fonts..."
        label.textColor = .darkGray
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 2
        return label
    }()
    
    let cellInfoStack: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        return sv
    }()
    
    let cbInnerView: UIView = {
        let view = UIView(frame: CGRect(x: 31, y: 0, width: 18, height: 18))
        view.backgroundColor = #colorLiteral(red: 0.2901960784, green: 0.5647058824, blue: 0.8862745098, alpha: 1)
        view.layer.cornerRadius = 9
        return view
    }()
    
    let chapterBadge: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Bookmarks-Code.jpg")
        return iv
    }()

    
    let chapterNumber: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "3"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        addSubview(chapterBadge)
        addSubview(cellInfoStack)
        addSubview(cbInnerView)
        cellInfoStack.addArrangedSubview(sectionName)
        cellInfoStack.addArrangedSubview(partName)
        cellInfoStack.addArrangedSubview(contentLabel)
        chapterBadge.addSubview(cbInnerView)
        cbInnerView.addSubview(chapterNumber)
        
        
        NSLayoutConstraint.activate([
            chapterBadge.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            chapterBadge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            chapterBadge.heightAnchor.constraint(equalToConstant: 44),
            chapterBadge.widthAnchor.constraint(equalToConstant: 44),
            
            chapterNumber.centerXAnchor.constraint(equalTo: cbInnerView.centerXAnchor),
            chapterNumber.centerYAnchor.constraint(equalTo: cbInnerView.centerYAnchor),
            
            
            cellInfoStack.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cellInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            cellInfoStack.leadingAnchor.constraint(equalTo: chapterBadge.trailingAnchor, constant: 13),
        ])
        
    }

}
