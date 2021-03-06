//
//  InterestHeaderView.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit

protocol InterestHeaderViewDelegate {
    func closeButtonClicked()
}

class InterestHeaderView: UIView
{
    // MARK: - Public API
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    var delegate: InterestHeaderViewDelegate! {
        didSet {
            print("interest header view delegate did set")
        }
    }
    
    private func updateUI()
    {
//        backgroundImageView?.image! = interest.featuredImage
        interestTitleLabel?.text! = interest.title
        numberOfMembersLabel.text! = "\(interest.numberOfMembers) members"
        numberOfPostsLabel.text! = "\(interest.numberOfPosts) posts"
        pullDownToCloseLabel.text! = "Pull down to close"
        pullDownToCloseLabel.hidden = true
    }

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    @IBOutlet weak var numberOfMembersLabel: UILabel!
    @IBOutlet weak var numberOfPostsLabel: UILabel!
    @IBOutlet weak var pullDownToCloseLabel: UILabel!
    @IBOutlet weak var closeButtonBackgroundView: UIView!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        closeButtonBackgroundView.layer.cornerRadius = closeButtonBackgroundView.bounds.width / 2
        closeButtonBackgroundView.layer.masksToBounds = true
    }
    
    @IBAction func closeButtonTapped(sender: UIButton)
    {
        print("clsoe button tapped gets called")
        // delegate right now is InterestViewController
        delegate.closeButtonClicked()
    }
}

























