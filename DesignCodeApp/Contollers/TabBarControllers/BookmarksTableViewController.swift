//
//  BookmarksTableViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/31/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import UIKit

class BookmarksTableViewController: UITableViewController {
    
    let cellID = "CellID"
    var bookmarks : [Bookmark] { return CoreDataManager.shared.bookmarks }
    var sections: [Section] { return CoreDataManager.shared.sections }
    
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
        let bookmark = bookmarks[indexPath.row]
        let part = bookmark.part
        let section = bookmark.section
        cell.sectionName.text = section?.title?.uppercased()
        cell.partName.text = part?.title
        cell.chapterNumber.text = section?.chapterNumber
        cell.contentLabel.text = part?.content
        cell.chapterBadge.image = UIImage(named: "Bookmarks-" + (part?.type?.capitalized ?? "Text"))
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let bookmark = bookmarks[indexPath.row]
            CoreDataManager.shared.remove(bookmark)
            
            tableView.deleteRows(at: [indexPath], with: .top)
            tableView.endUpdates()
        }
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
