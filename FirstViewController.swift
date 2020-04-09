//
//  FirstViewController.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/3/25.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set the firstviewcontroller as the datasource and delegate of the tableview
        tableView.dataSource = self
        tableView.delegate = self
        
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
        
    }
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
     
}

extension FirstViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
            
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
    }
}

