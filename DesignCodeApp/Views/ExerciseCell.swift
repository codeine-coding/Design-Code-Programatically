//
//  ExcerciseCell.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/16/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

protocol ExerciseCellDelegate : class {
    func exerciseCell(_ cell : ExerciseCell, receivedAnswer correct : Bool, forQuestion question : Dictionary<String,Any>)
    func exerciseCell(_ cell : ExerciseCell, didReceiveShareFor exercise : Array<Dictionary<String,Any>>, onScoreCell scoreCell : ScoreCell)
}

class ExerciseCell: UITableViewCell {
    
    let cellID = "Question Cell"
    let scoreCellID = "Score Cell"
    var questions : Array<Dictionary<String,Any>>!
    weak var delegate : ExerciseCellDelegate?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.register(ScoreCell.self, forCellWithReuseIdentifier: scoreCellID)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.reloadData()
        setupView()
    }
    
    private func setupView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 550),
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ExerciseCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return questions.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == questions.count {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: scoreCellID, for: indexPath) as! ScoreCell
            
            cell.exercise = questions
            cell.delegate = self
            
            return cell
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! QuestionCell
        
        let question = questions[indexPath.row]
        
        cell.question = question
        cell.delegate = self
        cell.questionLabel.text = question["question"] as? String
        
        if let possibleAnswers = question["answers"] as? Array<String> {
            
            for index in 0..<possibleAnswers.count {
                cell.answerButtons[index].setTitle(possibleAnswers[index], for: .normal)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: self.frame.height)
    }
    
}

extension ExerciseCell: QuestionCellDelegate {
    func questionCell(_ cell: QuestionCell, didTapAnswerButton button: UIButton, forQuestion question: Dictionary<String, Any>) {
        
        var answerCorrect : Bool = false
        
        if let correctAnswer = question["correctAnswer"] as? String, let answer = button.titleLabel?.text {
            answerCorrect = correctAnswer == answer
        }
        
        delegate?.exerciseCell(self, receivedAnswer: answerCorrect, forQuestion: question)
        
        let indexPath = collectionView.indexPath(for: cell)!
        let nextIndex = IndexPath(row: indexPath.row + 1, section: indexPath.section)
        if indexPath.row < question.count {
            collectionView.scrollToItem(at: nextIndex, at: .centeredHorizontally, animated: false)
        }
    }
}


extension ExerciseCell : ScoreCellDelegate {
    
    func scoreCell(_ cell: ScoreCell, didTapShareExercise exercise: Array<Dictionary<String, Any>>) {
        
        delegate?.exerciseCell(self, didReceiveShareFor: exercise, onScoreCell: cell)
    }
    
    func scoreCell(_ cell: ScoreCell, didTapTryAgainExercise exercise: Array<Dictionary<String, Any>>) {
        
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .centeredHorizontally, animated: false)
        collectionView.reloadData()
    }
}
