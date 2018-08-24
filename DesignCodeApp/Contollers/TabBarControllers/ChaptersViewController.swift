//
//  ChaptersViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class ChaptersViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        navigationItem.title = "Chapters"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
    }

}
