//
//  ViewController.swift
//  DesignCodeApp
//
//  Created by Meng To on 11/14/17.
//  Copyright © 2017 Meng To. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    
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
        heroView.backgroundColor = .red
        heroView.frame = CGRect(x: 0, y: 0, width: 375, height: 452)
        heroView.clipsToBounds = true
        return heroView
    }()
    
    let homeImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.frame = CGRect(x: 0, y: 0, width: 375, height: 452)
        iv.image = UIImage(named: "Home.jpg")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let statsView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.frame = CGRect(x: 0, y: 322, width: 375, height: 128)
        return blurEffectView
    }()
    
    let mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 86, width: 160, height: 172)
        label.text = "Learn to design & code for iOS11"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    let phoneImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.frame = CGRect(x: 193, y: 35, width: 123, height: 319)
        iv.image = UIImage(named: "Art-iPhoneX.jpg")
        return iv
    }()
    
    let videoPlayButtonView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let v = UIVisualEffectView(effect: blurEffect)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.frame = CGRect(x: 226, y: 148, width: 50, height: 50)
        v.layer.cornerRadius = 25
        v.clipsToBounds = true
        return v
    }()
    
    let playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        btn.setImage(UIImage(named: "Action-Play-Small.jpg"), for: .normal)
        btn.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // STATS BLUR CONTENT VIEW
    let watchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 23, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "WATCH"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.sizeToFit()
        return label
    }()
    
    let hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 39, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "40 Hours"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let lessonsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 75, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "of video lessons"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let lineView: UIView = {
        let v = UIView(frame: CGRect(x: 30, y: 105, width: 130, height: 3))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 3
        v.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.2784313725, blue: 0.7254901961, alpha: 1)
        v.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return v
    }()
    
    let firstStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalCentering
        return sv
    }()
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 23, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "SEARCH"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.sizeToFit()
        return label
    }()
    
    let numberOfLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 39, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "50,000"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let wordsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 75, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "words and images"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let lineView2: UIView = {
        let v = UIView(frame: CGRect(x: 195, y: 105, width: 130, height: 3))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 3
        v.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.2784313725, blue: 0.7254901961, alpha: 1)
        v.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return v
    }()
    
    let SecondStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalCentering
        return sv
    }()
    
    let downloadLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 23, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "DOWNLOAD"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.sizeToFit()
        return label
    }()
    
    let gigsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 39, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "10GB"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let filesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 195, y: 75, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "of source files"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let lineView3: UIView = {
        let v = UIView(frame: CGRect(x: 195, y: 105, width: 130, height: 3))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 3
        v.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.2784313725, blue: 0.7254901961, alpha: 1)
        v.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return v
    }()
    
    let thirdStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalCentering
        return sv
    }()
    
    let mainStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 0
        sv.alignment = .fill
        sv.distribution = .equalSpacing
        return sv
    }()
    
    // BOOK CONTENT VIEW
    let bookContentView: UIView = {
        let v = UIView(frame: CGRect(x: 0, y: 452, width: 375, height: 348))
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let bookImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        let image = UIImage(named: "Art-Book.jpg")
        let imageWidth = image?.size.width
        let imageHeight = image?.size.height
        iv.image = image
        iv.frame = CGRect(x: 0, y: 50, width: imageWidth!, height: imageHeight!)
        iv.layer.shadowOpacity = 0.25
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = CGSize(width: 0, height: 0)
        iv.clipsToBounds = false
        return iv
    }()
    
    let bookLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 20, width: 315, height: 53)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "An interactive book on how to design and code an iOS 11 app."
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.2509803922, blue: 0.2509803922, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    let beginnerLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 30, y: 20, width: 315, height: 53)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "For beginners and designers."
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    
    // Chapter Section
    let chapterView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 800, width: 375, height: 380))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        return view
    }()
    
    let chapterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "CHAPTER 1: 12 SECTIONS"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 0.2509803922, green: 0.2509803922, blue: 0.2509803922, alpha: 1)
        return label
    }()
    
    let cellID = "CellID"
    let sectionCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = false
        return collectionView
    }()
    
    // CONTAINER VIEW
    let testimonialVC = TestimonialViewController()
    
    var isStatusBarHidden = false
    
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setupView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        sectionCollectionView.delegate = self
        sectionCollectionView.dataSource = self
        sectionCollectionView.register(SectionCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        mainTitle.alpha = 0
        phoneImageView.alpha = 0
        videoPlayButtonView.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0.3, animations: {
            self.mainTitle.alpha = 1
            self.phoneImageView.alpha = 1
            self.videoPlayButtonView.alpha = 1
        })
        scrollView.addSubview(scrollContentView)
        
        heroView.addSubview(homeImageView)
        heroView.addSubview(mainTitle)
        heroView.addSubview(phoneImageView)
        heroView.addSubview(videoPlayButtonView)
        heroView.addSubview(statsView)
        
        videoPlayButtonView.contentView.addSubview(playButton)
        
        firstStackView.addArrangedSubview(watchLabel)
        firstStackView.addArrangedSubview(hoursLabel)
        firstStackView.addArrangedSubview(lessonsLabel)
        firstStackView.addArrangedSubview(lineView)
        
        SecondStackView.addArrangedSubview(searchLabel)
        SecondStackView.addArrangedSubview(numberOfLabel)
        SecondStackView.addArrangedSubview(wordsLabel)
        SecondStackView.addArrangedSubview(lineView2)
        
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(SecondStackView)
        
        statsView.contentView.addSubview(mainStackView)
        
        bookContentView.addSubview(bookImageView)
        bookContentView.addSubview(bookLabel)
        bookContentView.addSubview(beginnerLabel)
        
        chapterView.addSubview(chapterLabel)
        chapterView.addSubview(sectionCollectionView)
        
        scrollContentView.addSubview(heroView)
        scrollContentView.addSubview(bookContentView)
        scrollContentView.addSubview(chapterView)
        
        testimonialVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        // set testimonial vc
        addChild(testimonialVC)
        
        // add testimonial vc view to parrent
        scrollContentView.addSubview(testimonialVC.view)
        
        // register testimonial vc
        testimonialVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            
            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0.0),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 0.0),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 0.0),
            scrollContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0.0),
            scrollContentView.heightAnchor.constraint(equalToConstant: 2000),
            scrollContentView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            heroView.topAnchor.constraint(equalTo: scrollContentView.topAnchor),
            heroView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            heroView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            heroView.heightAnchor.constraint(equalToConstant: 452),
            heroView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            homeImageView.topAnchor.constraint(equalTo: heroView.topAnchor, constant: -50),
            homeImageView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            homeImageView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            homeImageView.bottomAnchor.constraint(equalTo: heroView.bottomAnchor),
            
            mainTitle.widthAnchor.constraint(equalToConstant: 160),
            mainTitle.heightAnchor.constraint(equalToConstant: 172),
            mainTitle.centerXAnchor.constraint(equalTo: heroView.centerXAnchor, constant: -70),
            mainTitle.centerYAnchor.constraint(equalTo: heroView.centerYAnchor, constant: -34),
            
            phoneImageView.widthAnchor.constraint(equalToConstant: 123),
            phoneImageView.heightAnchor.constraint(equalToConstant: 319),
            phoneImageView.leadingAnchor.constraint(equalTo: mainTitle.trailingAnchor, constant: 4),
            phoneImageView.centerYAnchor.constraint(equalTo: mainTitle.centerYAnchor, constant: 12.5),
            
            videoPlayButtonView.widthAnchor.constraint(equalToConstant: 50),
            videoPlayButtonView.heightAnchor.constraint(equalToConstant: 50),
            videoPlayButtonView.centerXAnchor.constraint(equalTo: phoneImageView.centerXAnchor, constant: -4.5),
            videoPlayButtonView.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor, constant: -11.5),
            
            statsView.heightAnchor.constraint(equalToConstant: 128),
            statsView.leadingAnchor.constraint(equalTo: heroView.leadingAnchor),
            statsView.trailingAnchor.constraint(equalTo: heroView.trailingAnchor),
            statsView.bottomAnchor.constraint(equalTo: heroView.bottomAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: statsView.topAnchor, constant: 20),
            mainStackView.bottomAnchor.constraint(equalTo: statsView.bottomAnchor, constant: -20),
            mainStackView.centerXAnchor.constraint(equalTo: statsView.centerXAnchor),
            
            bookContentView.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: 452),
            bookContentView.centerXAnchor.constraint(equalTo: scrollContentView.centerXAnchor),
            bookContentView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            bookContentView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            bookContentView.heightAnchor.constraint(equalToConstant: 348),
            bookContentView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            
            bookImageView.topAnchor.constraint(equalTo: bookContentView.topAnchor, constant: 50),
            bookImageView.centerXAnchor.constraint(equalTo: bookContentView.centerXAnchor),
            
            bookLabel.centerXAnchor.constraint(equalTo: bookImageView.centerXAnchor),
            bookLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20),
            bookLabel.widthAnchor.constraint(equalToConstant: 315),
            
            beginnerLabel.centerXAnchor.constraint(equalTo: bookLabel.centerXAnchor),
            beginnerLabel.widthAnchor.constraint(equalTo: bookLabel.widthAnchor),
            beginnerLabel.topAnchor.constraint(equalTo: bookLabel.bottomAnchor),
            
            chapterView.topAnchor.constraint(equalTo: bookContentView.bottomAnchor),
            chapterView.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            chapterView.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            chapterView.bottomAnchor.constraint(equalTo: scrollContentView.bottomAnchor, constant: -820),
            chapterView.heightAnchor.constraint(equalToConstant: 380),
            
            chapterLabel.topAnchor.constraint(equalTo: chapterView.topAnchor, constant: 50),
            chapterLabel.leadingAnchor.constraint(equalTo: chapterView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chapterLabel.trailingAnchor.constraint(equalTo: chapterView.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            sectionCollectionView.leadingAnchor.constraint(equalTo: chapterView.leadingAnchor),
            sectionCollectionView.trailingAnchor.constraint(equalTo: chapterView.trailingAnchor),
            sectionCollectionView.bottomAnchor.constraint(equalTo: chapterView.bottomAnchor, constant: -50),
            sectionCollectionView.heightAnchor.constraint(equalToConstant: 248),
            
            testimonialVC.view.topAnchor.constraint(equalTo: chapterView.bottomAnchor),
            testimonialVC.view.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor),
            testimonialVC.view.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor),
            testimonialVC.view.heightAnchor.constraint(equalToConstant: 524),
            
        ])
        
        if traitCollection.horizontalSizeClass == .regular {
            thirdStackView.addArrangedSubview(downloadLabel)
            thirdStackView.addArrangedSubview(gigsLabel)
            thirdStackView.addArrangedSubview(filesLabel)
            thirdStackView.addArrangedSubview(lineView3)
            mainStackView.addArrangedSubview(thirdStackView)
            mainStackView.widthAnchor.constraint(equalToConstant: 450).isActive = true
        } else {
            mainStackView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        }
        updateViewConstraints()
        
        setStatusBarBackgroundColor(color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
    }
    
    func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @objc func playButtonTapped() {
        let urlString = "https://player.vimeo.com/external/235468301.hd.mp4?s=e852004d6a46ce569fcf6ef02a7d291ea581358e&profile_id=175"
        let url = URL(string: urlString)
        let player = AVPlayer(url: url!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        present(playerController, animated: true, completion: {
            player.play()
        })

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        isStatusBarHidden = false
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }


}

extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        // PARALLAX SCROLLING
        if offsetY < 0 {
            heroView.transform = CGAffineTransform(translationX: 0, y: offsetY)
            videoPlayButtonView.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            mainTitle.transform = CGAffineTransform(translationX: 0, y: -offsetY/3)
            phoneImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/4)
            homeImageView.transform = CGAffineTransform(translationX: 0, y: -offsetY/5)
        }
        
        if let collectionView = scrollView as? UICollectionView {
            for cell in collectionView.visibleCells as! [SectionCell] {
                let indexPath = collectionView.indexPath(for: cell)!
                let attributes = collectionView.layoutAttributesForItem(at: indexPath)!
                let cellFrame = collectionView.convert(attributes.frame, to: view)
                
                let translationX = cellFrame.origin.x / 5
                cell.cardBackgroundImageView.transform = CGAffineTransform(translationX: translationX, y: 0)
                
                cell.layer.transform = animateCell(cellFrame: cellFrame)
            }
        }
    }
    
    func animateCell(cellFrame: CGRect) -> CATransform3D {
        let angleFromX = Double((-cellFrame.origin.x) / 10)
        let angle = CGFloat((angleFromX * Double.pi) / 180.0)
        var transform = CATransform3DIdentity
        transform.m34 = -1.0/1000
        let rotation = CATransform3DRotate(transform, angle, 0, 1, 0)
        
        var scaleFromX = (1000 - (cellFrame.origin.x - 200)) / 1000
        let scaleMax: CGFloat = 1.0
        let scaleMin: CGFloat = 0.6
        if scaleFromX > scaleMax {
            scaleFromX = scaleMax
        }
        if scaleFromX < scaleMin {
            scaleFromX = scaleMin
        }
        let scale = CATransform3DScale(CATransform3DIdentity, scaleFromX, scaleFromX, 1)
        
        return CATransform3DConcat(rotation, scale)
    }
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SectionCell
        let section = sections[indexPath.row]
        cell.cardTitle.text = section["title"]
        cell.cardDescription.text = section["caption"]
        cell.cardBackgroundImageView.image = UIImage(named: section["image"]!)
        cell.layer.transform = animateCell(cellFrame: cell.frame)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 304, height: 248)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destinationController = SectionViewController()
        destinationController.section = sections[indexPath.row]
        destinationController.indexPath = indexPath
        present(destinationController, animated: true, completion: nil)
    }
}
