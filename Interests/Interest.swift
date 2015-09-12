//
//  Interest.swift
//  Interests
//
//  Created by Duc Tran on 6/13/15.
//  Copyright © 2015 Developer Inspirus. All rights reserved.
//

import UIKit
import Parse

public class Interest: PFObject, PFSubclassing
{
    // MARK: - Public API
    @NSManaged public var title: String!
    @NSManaged public var interestDescription: String!
    @NSManaged public var numberOfMembers: Int
    @NSManaged public var numberOfPosts: Int
    @NSManaged public var featuredImageFile: PFFile!
    
    public func incrementNumberOfPosts() {
        numberOfPosts++
        self.saveInBackground()
    }
    public func incrementNumberOfMembers() {
        numberOfMembers++
        self.saveInBackground()
    }
//    var title = ""
//    var description = ""
//    var numberOfMembers = 0
//    var numberOfPosts = 0
//    var featuredImage: UIImage!
//    
//    init(title: String, description: String, featuredImage: UIImage!)
//    {
//        self.title = title
//        self.description = description
//        self.featuredImage = featuredImage
//        numberOfMembers = 1
//        numberOfPosts = 1
//    }
    
    public static func parseClassName() -> String {
        return "Interest"
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
}