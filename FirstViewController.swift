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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Detect the indexpath the user selected
        let indexPath = tableView.indexPathForSelectedRow
        
        guard indexPath != nil else {
            
            // The user hasn't selected anything
            return
            
        }
        
        // Get the article the user tapped on
        let article = articles[indexPath!.row]
        
        // Get a reference to the first detail view controller
        let firstDetailVC = segue.destination as! FirstDetailViewController
        
        // Pass the article url to the first dertail view controller
        firstDetailVC.articleUrl = article.url!
        
    }
    
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        // Get the article that the tableview is asking about
        let article = articles[indexPath.row]
        
        // TODO: Customize it
        cell.displayArticle(article)
        
        // Return the cell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // User has just selected a row, trigger the segue to go to detail
        performSegue(withIdentifier: "goToFirstDetail", sender: self)
        
    }
     
}

extension FirstViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
            
        // Set the articles property of the view controller to the articles passed back from the model
        self.articles = articles
        
        // Refresh the tableview
        tableView.reloadData()
        
    }
}

