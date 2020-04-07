//
//  Article.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/4/7.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation

struct Article : Decodable {
    
    var author:String?
    var title:String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
    
}
