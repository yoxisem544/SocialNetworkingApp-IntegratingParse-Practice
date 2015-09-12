//
//  Post.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//


import UIKit
import Parse

public class Post : PFObject, PFSubclassing
{
    @NSManaged public var user: PFUser
    @NSManaged public var postImageFile: PFFile!
    @NSManaged public var postText: String
    @NSManaged public var numberOfLikes: Int
    @NSManaged public var interestId: String!
    @NSManaged public var likedUserIds: [String]!
    
    // create new post
    override init() {
        super.init()
    }
    init(user: PFUser, postImage: UIImage!, postText: String, numberOfLikes: Int, interestId: String) {
        super.init()
        if postImage != nil {
            postImageFile = createFileFrom(postImage)
        } else {
            postImageFile = nil
        }
        
        self.user = user
        self.postText = postText
        self.numberOfLikes = numberOfLikes
        self.interestId = interestId
        self.likedUserIds = [String]()
    }
    
    public func like() {
        let currentUserObjectId = User.currentUser()!.objectId!
        if !likedUserIds.contains(currentUserObjectId) {
            numberOfLikes++
            likedUserIds.insert(currentUserObjectId, atIndex: 0)
            self.saveInBackground()
        }
    }
    
    public func dislike() {
        let currentUserObjectId = User.currentUser()!.objectId!
        if let index = likedUserIds.indexOf(currentUserObjectId) {
            numberOfLikes--
            likedUserIds.removeAtIndex(index)
            self.saveInBackground()
        }
    }
    
    public static func parseClassName() -> String {
        return "Post"
    }
    
    // MARK: - PFSubclassing
    override public class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) { () -> Void in
            self.registerSubclass()
        }
    }
//    static let className = "Post"
//    
//    // Properties
//    var id: String
//    var user: User
//    var createdAt: String
//    var postImage: UIImage!     // can be nil
//    var postText: String
//    var numberOfLikes: Int = 0
//    
//    var userDidLike = false
//    
//    // use this interestId to query for posts
//    let interestId: String
    
    
}

