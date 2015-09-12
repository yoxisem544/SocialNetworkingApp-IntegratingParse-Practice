//
//  Comment.swift
//  ProjectInterest
//
//  Created by Duc Tran on 6/3/15.
//  Copyright (c) 2015 Developer Inspirus. All rights reserved.
//

import UIKit
import Parse

public struct CommentKey
{
    static let className = "Comment"
    static let postId = "postId"
    static let author = "author"
    static let commentText = "commentText"
    static let numberOfLikes = "numberOfLikes"
    static let likedUserIds = "likedUserIds"
}

public class Comment: PFObject, PFSubclassing
{
    @NSManaged public var postId: String
    @NSManaged public var user: PFUser!
    @NSManaged public var commentText: String!
    @NSManaged public var numberOfLikes: Int
    @NSManaged public var likedUserIds: [String]!
    
    // MARK: - like / dislike comment by current user
    public func like() {
        let curentUserObjectId = User.currentUser()!.objectId!
        if !likedUserIds.contains(curentUserObjectId) {
            numberOfLikes++
            likedUserIds.insert(curentUserObjectId, atIndex: 0)
            self.saveInBackground()
        }
    }
    
    public func dislike() {
        let curentUserObjectId = User.currentUser()!.objectId!
        if let index = likedUserIds.indexOf(curentUserObjectId) {
            numberOfLikes++
            likedUserIds.removeAtIndex(index)
            self.saveInBackground()
        }
    }
    
    init(postId: String, user: PFUser, commentText: String, numberOfLikes: Int) {
        super.init()
        self.postId = postId
        self.user = user
        self.commentText = commentText
        self.numberOfLikes = numberOfLikes
        self.likedUserIds = [String]()
    }
    
    // MARK: subclassing
    public static func parseClassName() -> String {
        return "Comment"
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
//    var id: String = ""
//    var createdAt: String = "today"
//    let postId: String
//    let user: User
//    var commentText: String
//    var numberOfLikes: Int
//    
//    var userDidLike: Bool = false
    
   
}
