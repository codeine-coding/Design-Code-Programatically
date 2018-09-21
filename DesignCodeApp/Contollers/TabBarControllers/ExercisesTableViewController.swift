//
//  ExcercisesTableViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class ExercisesTableViewController: UITableViewController {
    
    let cellID = "Exercise Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: cellID)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ExerciseCell
        cell.questions = Array(exercises.values)[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
   

}

extension ExercisesTableViewController : ExerciseCellDelegate {
    func exerciseCell(_ cell: ExerciseCell, receivedAnswer correct: Bool, forQuestion question: Dictionary<String, Any>) {
        
        let destination = ExerciseDialogViewController()
        destination.modalTransitionStyle = .coverVertical
        destination.modalPresentationStyle = .overFullScreen
        present(destination, animated: true, completion: nil)
    }
    
    func exerciseCell(_ cell: ExerciseCell, didReceiveShareFor exercise: Array<Dictionary<String, Any>>, onScoreCell scoreCell: ScoreCell) {
        
        let message = "🙌 72% in the iOS Design challenge from the Design+Code app by @MengTo"
        let link = URL(string: "https://designcode.io/")!
        guard let image = UIImage(view: scoreCell) else { return }
        
        let objectsToShare = [message, link, image] as Array<Any>
        
        let activity = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activity.excludedActivityTypes = [.airDrop, .addToReadingList, .saveToCameraRoll]
        activity.popoverPresentationController?.sourceView = scoreCell
        
        present(activity, animated: true)
    }
}

extension UIImage {
    
    convenience init?(view: UIView) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        
        guard let currentContext = UIGraphicsGetCurrentContext() else { return nil }
        view.layer.render(in: currentContext)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        if let graphicImage = image?.cgImage {
            self.init(cgImage: graphicImage)
        } else {
            return nil
        }
    }
}
