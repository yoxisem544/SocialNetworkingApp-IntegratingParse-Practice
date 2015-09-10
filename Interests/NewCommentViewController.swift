//
//  NewCommentViewController.swift
//  ProjectInterest
//
//  Created by Duc Tran on 6/3/15.
//  Copyright (c) 2015 Developer Inspirus. All rights reserved.
//

import UIKit

class NewCommentViewController: UIViewController
{
 
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var currentUserProfileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.barTintColor = UIColor(hex: "EE8222")
        
        // Show the keyboard
        commentTextView.becomeFirstResponder()
        commentTextView.text = ""
        
        // Do any additional setup after loading the view.
        // Notification for keyboard
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - Target Action
    
    @IBAction func postDidTap()
    {
        commentTextView.resignFirstResponder()
        createNewComment()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // Later use - Send to Parse
    
    func createNewComment()
    {
    
    }
    
    @IBAction func dismissComposer()
    {
        commentTextView.resignFirstResponder()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Text View Keyboard Handling
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)   // remove the notification when deinit
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo ?? [:]
        let keyboardSize = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).CGRectValue().size
        self.commentTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        
        self.commentTextView.scrollIndicatorInsets = self.commentTextView.contentInset
    }
    
    func keyboardWillHide(notification: NSNotification) {
        self.commentTextView.contentInset = UIEdgeInsetsZero
        self.commentTextView.scrollIndicatorInsets = UIEdgeInsetsZero
    }
    

}
