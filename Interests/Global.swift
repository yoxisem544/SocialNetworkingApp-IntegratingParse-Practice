//
//  Global.swift
//  Interests
//
//  Created by David on 2015/9/11.
//  Copyright © 2015年 Developer Inspirus. All rights reserved.
//

import UIKit
import Parse

private struct ImageSize {
    static let height: CGFloat = 480.0
}

func createFileFrom(image: UIImage) -> PFFile! {
    let ratio = image.size.width / image.size.height
    let resizedImage = resizeImage(image, toWidth: ImageSize.height * ratio, andHeight: ImageSize.height)
    let imageData = UIImageJPEGRepresentation(resizedImage, 0.8)!
    return PFFile(name: "image.jpg", data: imageData)
}

private func resizeImage(originalImage: UIImage, toWidth width: CGFloat, andHeight height: CGFloat) -> UIImage {
    let newSize = CGSize(width: width, height: height)
    let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
    UIGraphicsBeginImageContext(newSize)
    originalImage.drawInRect(newRectangle)
    
    let resizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return resizedImage
}