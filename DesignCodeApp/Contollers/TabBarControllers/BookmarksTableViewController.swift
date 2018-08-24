//
//  BookmarksTableViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit

class BookmarksTableViewController: UITableViewController {
    
    let cellID = "CellID"
    var bookmarks : Array<Dictionary<String,String>> = allBookmarks
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(BookmarkCell.self, forCellReuseIdentifier: cellID)
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        navigationItem.title = "Bookmarks"
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchBar:UISearchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.minimal
        searchBar.placeholder = " Search for titles, terms, and content"
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 16)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookmarks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookmarkCell
        cell.sectionName.text = bookmarks[indexPath.row]["section"]
        cell.partName.text = bookmarks[indexPath.row]["part"]
        cell.chapterNumber.text = bookmarks[indexPath.row]["chapter"]
        cell.contentLabel.text = bookmarks[indexPath.row]["content"]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationController = SectionViewController()
        destinationController.section = sections[indexPath.row]
        destinationController.indexPath = indexPath
        present(destinationController, animated: true, completion: nil)
    }
    
}

extension BookmarksTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(false)
    }
}
