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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let destination = ExerciseDialogViewController()
        destination.modalTransitionStyle = .coverVertical
        destination.modalPresentationStyle = .overFullScreen
        present(destination, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ExcerciseCell.self, forCellReuseIdentifier: cellID)
        setupView()
    }
    private func setupView() {
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! ExcerciseCell
        cell.questions = Array(exercises.values)[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
   

}
