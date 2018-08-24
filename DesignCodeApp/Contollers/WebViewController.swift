//
//  WebViewController.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 8/12/18.
//  Copyright © 2018 Meng To. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    var urlString: String!
    
    let webView: WKWebView = {
        let view = WKWebView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let doneBtn: UIBarButtonItem = {
        let btn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()
    
    let webRefresh: UIBarButtonItem = {
        let btn = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reload))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()
    
    let webBack: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Web-Back"), style: .plain, target: self, action: #selector(goBack))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()
    
    let webForward: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Web-Forward"), style: .plain, target: self, action: #selector(goForward))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()
    
    let webAction: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Web-Action"), style: .plain, target: self, action: #selector(actionButtonTapped))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()
    
    let webSafari: UIBarButtonItem = {
        let btn = UIBarButtonItem(image: UIImage(named: "Web-Safari"), style: .plain, target: self, action: #selector(safariButtonTapped))
        btn.tintColor = #colorLiteral(red: 0.6196078431, green: 0.7960784314, blue: 1, alpha: 1)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        webView.load(request)
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress" {
            if webView.estimatedProgress == 1.0 {
                navigationItem.title = webView.title
            } else {
                navigationItem.title = "Loading…"
            }
        }
    }
    
    private func setupView() {
        view.addSubview(webView)
        navigationController?.isToolbarHidden = false
        navigationItem.leftBarButtonItem = doneBtn
        navigationItem.rightBarButtonItem = webRefresh
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let items: [UIBarButtonItem] = [webBack, spacer, webForward, spacer, webAction, spacer, webSafari]
        toolbarItems = items
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        ])
    }
    
    
    @objc func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func actionButtonTapped() {
        let activityItems = [urlString] as! Array<String>
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToFacebook]
        present(activityController, animated: true, completion: nil)
    }
    
    @objc func safariButtonTapped() {
        UIApplication.shared.open(URL(string: urlString)!)
    }
    
    
    @objc func reload() {
        webView.reload()
    }
    
    @objc func goBack() {
        webView.goBack()
    }
    
    @objc func goForward() {
        webView.goForward()
    }

}
