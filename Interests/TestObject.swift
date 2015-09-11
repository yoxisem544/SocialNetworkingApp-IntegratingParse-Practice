//
//  TestObject.swift
//  Interests
//
//  Created by David on 2015/9/11.
//  Copyright © 2015年 Developer Inspirus. All rights reserved.
//

import UIKit
import Parse

class TestObject: PFObject, PFSubclassing {
    
    @NSManaged public var title: String!
    @NSManaged public var objectDescription: String!
    @NSManaged public var numbers: Int
    
    override class func initialize() {
        struct Static {
            static var onceToken: dispatch_once_t = 0
        }
        dispatch_once(&Static.onceToken) { () -> Void in
            self.registerSubclass()
        }
    }
    
    static func parseClassName() -> String {
        return "TestObject"
    }
}
