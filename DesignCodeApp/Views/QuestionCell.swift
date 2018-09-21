//
//  QuestionCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/16/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

protocol QuestionCellDelegate: class {
    func questionCell(_ cell: QuestionCell, didTapAnswerButton button: UIButton, forQuestion question: Dictionary<String,Any>)
}

class QuestionCell: UICollectionViewCell {
    
    weak var delegate: QuestionCellDelegate?
    var question: Dictionary<String,Any>!
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 0.15
        return view
    }()
    
    let innerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        return view
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "ios11.jpg")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "iOS Design: 9 / 12 exercises"
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
        return label
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What are the 3 core philosophies for iOS design?"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 5
        return label
    }()
    
    let answerbtn1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intuition, clarity and beauty", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "Exercises-Uncheck"), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return btn
    }()
    
    let answerbtn2: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intuition, clarity and beauty", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "Exercises-Uncheck"), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return btn
    }()
    
    let answerbtn3: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intuition, clarity and beauty", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "Exercises-Uncheck"), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return btn
    }()
    
    let answerbtn4: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intuition, clarity and beauty", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "Exercises-Uncheck"), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return btn
    }()
    
    let answerbtn5: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Intuition, clarity and beauty", for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.3333333333, green: 0.3333333333, blue: 0.3333333333, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        btn.setImage(UIImage(named: "Exercises-Uncheck"), for: .normal)
        btn.contentHorizontalAlignment = .left
        btn.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        return btn
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    
    var answerButtons: [UIButton] { return [answerbtn1, answerbtn2, answerbtn3, answerbtn4, answerbtn5]}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(cardView)
        cardView.addSubview(innerView)
        
        innerView.addSubview(imageView)
        innerView.addSubview(headerLabel)
        innerView.addSubview(visualEffectView)
        innerView.addSubview(stackView)

        visualEffectView.contentView.addSubview(questionLabel)

        stackView.addArrangedSubview(answerbtn1)
        stackView.addArrangedSubview(answerbtn2)
        stackView.addArrangedSubview(answerbtn3)
        stackView.addArrangedSubview(answerbtn4)
        stackView.addArrangedSubview(answerbtn5)
        
        answerbtn1.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        answerbtn2.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        answerbtn3.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        answerbtn4.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        answerbtn5.addTarget(self, action: #selector(didTapAnswerButton(_:)), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            innerView.topAnchor.constraint(equalTo: cardView.topAnchor),
            innerView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            innerView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            innerView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),

            imageView.topAnchor.constraint(equalTo: innerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: stackView.topAnchor),
            
            headerLabel.topAnchor.constraint(equalTo: innerView.topAnchor, constant: 20),
            headerLabel.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            headerLabel.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),

            visualEffectView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor, constant: 20),
            visualEffectView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor, constant: -20),
            visualEffectView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -20),
            
            questionLabel.topAnchor.constraint(equalTo: visualEffectView.topAnchor, constant: 8),
            questionLabel.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor, constant: 8),
            questionLabel.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor, constant: -8),
            questionLabel.bottomAnchor.constraint(equalTo: visualEffectView.bottomAnchor, constant: -8),
            
            stackView.leadingAnchor.constraint(equalTo: innerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: innerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: innerView.bottomAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 300),
            
            ])
    }
    
    @objc func didTapAnswerButton(_ sender: UIButton) {
        delegate?.questionCell(self, didTapAnswerButton: sender, forQuestion: question)
        
        sender.setImage(UIImage(named: "Exercises-Check"), for: .normal)
    }
}
