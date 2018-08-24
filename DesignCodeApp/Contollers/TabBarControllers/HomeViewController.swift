//
//  ViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit
import AVKit

class HomeViewController: UIViewController {
    
    let cellID = "CellID"
    
    let presentSectionViewController = PresentSectionViewController()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    // HERO VIEW
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
        sv.spacing = 50
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
    
    // FIRST CHAPTER SECTION
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
    
    let chapter1collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = false
        return collectionView
    }()
    
    // NAVIGATION BAR
    let logoBarButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Logo-DesignCode"), style: .plain, target: self, action: nil)
        return btn
    }()
    
    let loginBarButton: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Login", style: .done, target: self, action: nil)
        btn.tintColor = .white
        return btn
    }()
    
    let navigationTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.frame.size = CGSize(width: 120, height: 28)
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 0, y: 0, width: 120, height: 28)
        btn.setTitle("Get the book", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        btn.layer.cornerRadius = 14
        view.addSubview(btn)
        return view
    }()
    
    // TESTIMONIAL CONTAINER VIEW
    let testimonialVC = TestimonialViewController()
    
    var isStatusBarHidden = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        chapter1collectionView.delegate = self
        chapter1collectionView.dataSource = self
        chapter1collectionView.register(SectionCell.self, forCellWithReuseIdentifier: cellID)
        
        setupView()
    }
    
    private func setupView() {
        navigationController?.navigationBar.barStyle = .black
        navigationItem.titleView = navigationTitleView
        navigationController?.setNavigationBarHidden(true, animated: false)
        navigationItem.leftBarButtonItem = logoBarButton
        navigationItem.rightBarButtonItem = loginBarButton
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
        
        thirdStackView.addArrangedSubview(downloadLabel)
        thirdStackView.addArrangedSubview(gigsLabel)
        thirdStackView.addArrangedSubview(filesLabel)
        thirdStackView.addArrangedSubview(lineView3)
        
        mainStackView.addArrangedSubview(firstStackView)
        mainStackView.addArrangedSubview(SecondStackView)
        
        statsView.contentView.addSubview(mainStackView)
        
        bookContentView.addSubview(bookImageView)
        bookContentView.addSubview(bookLabel)
        bookContentView.addSubview(beginnerLabel)
        
        chapterView.addSubview(chapterLabel)
        chapterView.addSubview(chapter1collectionView)
        
        scrollView.addSubview(heroView)
        scrollView.addSubview(bookContentView)
        scrollView.addSubview(chapterView)
        
        testimonialVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        // set testimonial vc
        addChild(testimonialVC)
        
        // add testimonial vc view to parrent
        scrollView.addSubview(testimonialVC.view)
        
        // register testimonial vc
        testimonialVC.didMove(toParent: self)
        
        // called from Home+Constraints.swift
        displayConstraints()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @objc private func playButtonTapped() {
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
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 50)
        ]
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
        
        let navigationIsHidden = offsetY <= 0
        navigationController?.setNavigationBarHidden(navigationIsHidden, animated: true)
        
    }
    
    private func animateCell(cellFrame: CGRect) -> CATransform3D {
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
        destinationController.transitioningDelegate = self
        let attributes = chapter1collectionView.layoutAttributesForItem(at: indexPath)!
        let cellFrame = chapter1collectionView.convert(attributes.frame, to: view)
        presentSectionViewController.cellFrame = cellFrame
        presentSectionViewController.cellTransform = animateCell(cellFrame: cellFrame)
        isStatusBarHidden = true
        UIView.animate(withDuration: 0.5, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        })
        present(destinationController, animated: true, completion: nil)
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return presentSectionViewController
    }
}
