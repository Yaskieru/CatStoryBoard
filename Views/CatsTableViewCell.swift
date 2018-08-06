//
//  CatsTableViewCell.swift
//  CatStoryBoard
//
//  Created by Yasmin Almario on 04/08/2018.
//  Copyright © 2018 Yasmin Almario. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class CatsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catTitle: UILabel!
    @IBOutlet weak var catCaption: UILabel!
    
    
    //MARK: - Functions
    
    func setupCell(cat: Cat) {
        self.catTitle.text = cat.title ?? ""
        self.catCaption.text = cat.descriptionValue ?? ""
        
        // Set image using Kingfisher.
        
        let baseURL = "http://fourdevs.com/catlitter/"
        
        if let firstCatMedia = cat.catMedia?.first,
            let path = firstCatMedia.path,
            let filename = firstCatMedia.fileName,
            let fullImageUrlString = "\(baseURL)\(path)\(filename)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            
            // Success optional binding....
            
            let url = URL(string: fullImageUrlString)!
            
            self.catImageView.kf.setImage(with: url)
            
            
            return
        }
        
        // Default image here...
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
