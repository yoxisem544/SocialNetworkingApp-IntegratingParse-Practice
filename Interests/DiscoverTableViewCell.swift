//
//  DiscoverTableViewCell.swift
//  Interests
//
//  Created by Duc Tran on 6/16/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit

protocol DiscoverTableViewCellDelegate
{
    func joinButtonClicked(interest: Interest!)
}

class DiscoverTableViewCell: UITableViewCell
{
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    var delegate: DiscoverTableViewCellDelegate!
    
    @IBOutlet weak var backgroundViewWithShadow: CardView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var joinButton: InterestButton!
    @IBOutlet weak var interestFeaturedImage: UIImageView!
    @IBOutlet weak var interestDescriptionLabel: UILabel!
    
    func updateUI()
    {
        interestTitleLabel.text! = interest.title
        interestFeaturedImage.image! = interest.featuredImage
        interestDescriptionLabel.text! = interest.description
        
        joinButton.setTitle("→", forState: .Normal)
    }
    
    @IBAction func joinButtonClicked(sender: InterestButton)
    {
        delegate?.joinButtonClicked(interest)
    }
}


