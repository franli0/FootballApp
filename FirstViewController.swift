//
//  FirstViewController.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/3/25.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Get the articles from the article model
        model.delegate = self
        model.getArticles()
        
    }
}

extension FirstViewController: ArticleModelProtocol {
    
    // MARK: - Article Model Protocol Methods
    
    func articlesRetrieved(_ articles: [Article]) {
            
        print("Articles return from model")
        
    }
}

