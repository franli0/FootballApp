//
//  ArticleModel.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/4/7.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieved(_ articles:[Article])
    
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Parse the returned JSAON into article instances and pass it back to the view controller with the protocol and delegate method
        delegate?.articlesRetrieved([Article]())
    }
    
}
