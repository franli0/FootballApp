//
//  CacheManager.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/4/9.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url:String, _ imageData:Data) {
        
        // Save the image data along with the URL
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData(_ url:String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
        
    }
    
}
