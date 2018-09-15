//
//  BenefitsViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/14/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class BenefitsViewController: UIViewController {
    
    let cellID = "cellID"
    
    var collectionViewHeight: NSLayoutConstraint!
    
    let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let benefitsBackgroundView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Benefits.jpg")
        return iv
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let designLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Design and code this app, from start to finish"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    let headerSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Designed, coded and written by one designer. So you know the material is cohesive and familiar."
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()
    
    let quoteBegin: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Quote-Begin")
        return iv
    }()
    
    let quoteEnd: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Quote-End")
        return iv
    }()
    
    let benefitsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        adjustHeight()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.benefitsCollectionView.reloadData()
        adjustHeight()
    }
    
    func adjustHeight() {
        let now = DispatchTime.now()
        let deadline : DispatchTime = now + .milliseconds(100)
        DispatchQueue.main.asyncAfter(deadline: deadline) { [weak self] in
            guard self != nil else { return }
            
            self!.collectionViewHeight.constant = self!.benefitsCollectionView.contentSize.height
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        benefitsCollectionView.dataSource = self
        benefitsCollectionView.delegate = self
        benefitsCollectionView.register(BenefitsCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
    }
    
    private func setupView() {
        view.addSubview(headerView)
        headerView.addSubview(benefitsBackgroundView)
        headerView.addSubview(designLabel)
        headerView.addSubview(visualEffectView)
        visualEffectView.contentView.addSubview(headerSubtitle)
        visualEffectView.contentView.addSubview(quoteBegin)
        visualEffectView.contentView.addSubview(quoteEnd)
        view.addSubview(benefitsCollectionView)
        
        collectionViewHeight = benefitsCollectionView.heightAnchor.constraint(equalToConstant: 276)
        collectionViewHeight.priority = UILayoutPriority(rawValue: 999)
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 460),
            
            benefitsBackgroundView.topAnchor.constraint(equalTo: headerView.topAnchor),
            benefitsBackgroundView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            benefitsBackgroundView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            benefitsBackgroundView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            
            designLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 80),
            designLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            designLabel.widthAnchor.constraint(equalToConstant: 250),
            
            visualEffectView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            visualEffectView.heightAnchor.constraint(equalToConstant: 160),
            
            headerSubtitle.centerXAnchor.constraint(equalTo: visualEffectView.centerXAnchor),
            headerSubtitle.centerYAnchor.constraint(equalTo: visualEffectView.centerYAnchor),
            headerSubtitle.widthAnchor.constraint(equalToConstant: 250),
            
            quoteBegin.topAnchor.constraint(equalTo: headerSubtitle.topAnchor),
            quoteBegin.trailingAnchor.constraint(equalTo: headerSubtitle.leadingAnchor, constant: -8),
            
            quoteEnd.bottomAnchor.constraint(equalTo: headerSubtitle.bottomAnchor),
            quoteEnd.leadingAnchor.constraint(equalTo: headerSubtitle.trailingAnchor, constant: 8),
            
            benefitsCollectionView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            benefitsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            benefitsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            benefitsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionViewHeight,
        ])
    }
    
}

extension BenefitsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return benefits.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BenefitsCell
        let benefit = benefits[indexPath.row]
        cell.subhead.text = benefit["subhead"]?.uppercased()
        cell.title.text = benefit["title"]
        cell.body.text = benefit["body"]
        cell.image.image = UIImage(named: "Benefit-" + benefit["image"]!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let benefit = benefits[indexPath.row]
        var width : CGFloat = 0.0
        
        switch collectionView.frame.width {
        case 640...959:
            width = collectionView.frame.width / 2
        case 960...3000:
            width = collectionView.frame.width / 3
        default:
            width = collectionView.frame.width
        }
        // Simulating dynamic labels
        
        let titleLabel = UILabel()
        titleLabel.frame.size = CGSize(width: width - 120, height: CGFloat.greatestFiniteMagnitude)
        titleLabel.text = benefit["title"]
        titleLabel.numberOfLines = 1
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        titleLabel.sizeToFit()
        
        let textLabel = UILabel()
        textLabel.frame.size = CGSize(width: width - 120, height: CGFloat.greatestFiniteMagnitude)
        textLabel.text = benefit["body"]
        textLabel.numberOfLines = 5
        textLabel.font = UIFont.preferredFont(forTextStyle: .body)
        textLabel.minimumScaleFactor = 0.5
        textLabel.sizeToFit()
        
        let height = titleLabel.frame.height + textLabel.frame.height + 90
        
        return CGSize(width: width, height: height)
        
    }
    
}
