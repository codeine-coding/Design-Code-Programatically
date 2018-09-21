//
//  SectionViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class SectionViewController: UIViewController {
    
    var section: Section!
    var indexPath: IndexPath!
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        view.contentSize = CGSize(width: self.view.bounds.width, height: 2000)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    let scrollContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let heroView: UIView = {
        let heroView = UIView()
        heroView.translatesAutoresizingMaskIntoConstraints = false
        heroView.backgroundColor = .white
        heroView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 420)
        heroView.clipsToBounds = true
        return heroView
    }()
    
    let coverImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 452)
        iv.image = UIImage(named: "ios11.jpg")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Learn iOS 11 Design"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    let captionLabel: UILabel = {
        let captionLabel = UILabel()
        captionLabel.translatesAutoresizingMaskIntoConstraints = false
        captionLabel.text = "Learn colors, typography and layout for iOS"
        captionLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        captionLabel.numberOfLines = 0
        return captionLabel
    }()
    
    let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Three years ago, Apple completely revamped their design language for the modern users. It is now much simpler, allowing designers to focus on animation and function rather than intricate visual details."
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    let progressView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1/12"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7)
        return label
    }()
    
    let btnCloseView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setImage(UIImage(named: "Action-Close.jpg"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return closeButton
    }()
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(heroView)
        heroView.addSubview(coverImage)
        heroView.addSubview(titleLabel)
        heroView.addSubview(captionLabel)
        scrollContentView.addSubview(descriptionLabel)
        progressView.contentView.addSubview(progressLabel)
        heroView.addSubview(progressView)
        btnCloseView.contentView.addSubview(closeButton)
        view.addSubview(btnCloseView)
        titleLabel.text = section.title
        captionLabel.text = section.caption
        descriptionLabel.text = section.body
        coverImage.image = UIImage(named: section.imageName)
        progressLabel.text = "\(indexPath.row+1) / \(ContentApi.shared.sections.count)"
        let scrollviewBottomConstraint = scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0.0)
        scrollviewBottomConstraint.priority = UILayoutPriority(rawValue: 999)
        
        let scrollviewTrailingConstraint = scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0.0)
        scrollviewTrailingConstraint.priority = UILayoutPriority(rawValue: 999)
        
        let coverImageBottomConstraint = coverImage.bottomAnchor.constraint(equalTo: heroView.bottomAnchor)
        coverImageBottomConstraint.priority = UILayoutPriority(rawValue: 999)
        
        let coverImageHeightConstraint = coverImage.heightAnchor.constraint(equalToConstant: 432)
        coverImageHeightConstraint.priority = UILayoutPriority(rawValue: 999)
        
        NSLayoutConstraint.activate([
            
            btnCloseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            btnCloseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            btnCloseView.heightAnchor.constraint(equalToConstant: 36),
            btnCloseView.widthAnchor.constraint(equalToConstant: 36),
            
            closeButton.topAnchor.constraint(equalTo: btnCloseView.topAnchor, constant: 0.0),
            closeButton.leadingAnchor.constraint(equalTo: btnCloseView.leadingAnchor, constant: 0.0),
            closeButton.trailingAnchor.constraint(equalTo: btnCloseView.trailingAnchor, constant: 0.0),
            closeButton.bottomAnchor.constraint(equalTo: btnCloseView.bottomAnchor, constant: 0.0),
        
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0.0),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0.0),
            scrollContentView.heightAnchor.constraint(equalToConstant: 2000),
            scrollContentView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            scrollviewTrailingConstraint,
            scrollviewBottomConstraint,
            
            heroView.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            heroView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            heroView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            heroView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            heroView.heightAnchor.constraint(equalToConstant: 420),
            
            coverImage.topAnchor.constraint(equalTo: heroView.topAnchor),
            coverImageBottomConstraint,
            coverImage.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            coverImage.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            coverImageHeightConstraint,
            
            titleLabel.topAnchor.constraint(equalTo: heroView.topAnchor, constant: 66),
            titleLabel.leadingAnchor.constraint(equalTo: heroView.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 264),
            
            captionLabel.bottomAnchor.constraint(equalTo: heroView.bottomAnchor, constant: -30),
            captionLabel.leadingAnchor.constraint(equalTo: heroView.leadingAnchor, constant: 20),
            captionLabel.widthAnchor.constraint(equalToConstant: 264),
            
            progressView.topAnchor.constraint(equalTo: heroView.topAnchor, constant: 20),
            progressView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor, constant: 20),
            progressView.heightAnchor.constraint(equalToConstant: 36),
            
            progressLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            progressLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            progressView.widthAnchor.constraint(equalTo: progressLabel.widthAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: heroView.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -20),
            
        ])
        
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }

}
