//
//  ArticleCell.swift
//  FootballApp
//
//  Created by 廖翊淳 on 2020/4/9.
//  Copyright © 2020 Yi-Chun Liao. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var headlineLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    var articleToDisplay:Article?
    
    func displayArticle(_ article:Article) {
        
        // Clean up the cell before displaying the next article
        articleImageView.image = nil
        headlineLabel.text = ""
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Download and display the image
        
        // Check that the article actually has an image
        guard articleToDisplay!.urlToImage != nil else {
            
            return
            
        }
        
        // Create URL string
        let urlString = articleToDisplay!.urlToImage!
        
        // Check the cachemanager before downloading any image data
        if let imageData = CacheManager.retrieveData(urlString) {
            
            // There is image data, set the imageview and return
            articleImageView.image = UIImage(data: imageData)
            return
            
        }
        
        // Create the URL
        let url = URL(string: urlString)
        
        // Check that the URL isn't nil
        guard url != nil else {
            
            print("Couldn't create url object")
            return
            
        }
        
        // Get a URLSession
        let session = URLSession.shared
        
        // Create a datatask
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // Check that there were no errors
            if error == nil && data != nil {
                
                // Save the data into cache
                CacheManager.saveData(urlString, data!)
                
                // Check if the URL string that the data task went off to download matches the article this cell is set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    
                    DispatchQueue.main.async {
                        
                        // Display the image data in the image view
                        self.articleImageView.image = UIImage(data: data!)
                        
                    }
                    
                }
            } // End if
        } // End data task
        
        // Kick off the datatask
        dataTask.resume()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
