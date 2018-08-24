//
//  TestimonialViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {
    
    let cellID = "CellID"
    
    let testimonialCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.clipsToBounds = false
        return collectionView
    }()
    
    let peopleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 39, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.text = "26,000 people"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.sizeToFit()
        return label
    }()
    
    let learningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.frame = CGRect(x: 30, y: 75, width: 58, height: 18)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.text = "are learning from Design+Code"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.6)
        label.sizeToFit()
        return label
    }()
    
    let lineView: UIView = {
        let v = UIView(frame: CGRect(x: 30, y: 105, width: 130, height: 3))
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 1.5
        v.backgroundColor = #colorLiteral(red: 0.6862745098, green: 0.2784313725, blue: 0.7254901961, alpha: 1)
        v.heightAnchor.constraint(equalToConstant: 3).isActive = true
        return v
    }()
    
    let statsStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalCentering
        return sv
    }()
    
    let googleLogo: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Logo-Google.jpg")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let appleLogo: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Logo-Apple.jpg")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let stripeLogo: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Logo-Stripe.jpg")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let logoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 50
        sv.distribution = .equalSpacing
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        testimonialCollectionView.delegate = self
        testimonialCollectionView.dataSource = self
        testimonialCollectionView.register(TestimonialCell.self, forCellWithReuseIdentifier: cellID)
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.1960784314, green: 0.2196078431, blue: 0.262745098, alpha: 1)
        view.addSubview(testimonialCollectionView)
        statsStackView.addArrangedSubview(peopleLabel)
        statsStackView.addArrangedSubview(learningLabel)
        statsStackView.addArrangedSubview(lineView)
        view.addSubview(statsStackView)
        
        logoStackView.addArrangedSubview(googleLogo)
        logoStackView.addArrangedSubview(appleLogo)
        logoStackView.addArrangedSubview(stripeLogo)
        view.addSubview(logoStackView)
        
        NSLayoutConstraint.activate([
            testimonialCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            testimonialCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            testimonialCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            testimonialCollectionView.heightAnchor.constraint(equalToConstant: 235),
            
            statsStackView.topAnchor.constraint(equalTo: testimonialCollectionView.bottomAnchor, constant: 50),
            statsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            logoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }

}

extension TestimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TestimonialCell
        let testimonial = testimonials[indexPath.row]
        cell.testimonialText.text = testimonial["text"]
        cell.personFullName.text = testimonial["name"]
        cell.personJobDescription.text = testimonial["job"]
        cell.avatarImageView.image = UIImage(named: testimonial["avatar"]!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 304, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
