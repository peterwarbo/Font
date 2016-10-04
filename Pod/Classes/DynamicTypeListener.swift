//
//  DynamicTypeListener.swift
//  Pods
//
//  Created by Adam Yanalunas on 10/9/15.
//
//

import Foundation
import UIKit

@objc public protocol DynamicTypeListener {
    func listenForDynamicTypeChanges()
    func ignoreDynamicTypeChanges()
    func respondToDynamicTypeChanges(notification:NSNotification)
}

public extension DynamicTypeListener where Self:UIViewController {
    func listenForDynamicTypeChanges() {
        NSNotificationCenter.defaultCenter()
            .addObserver(self, selector: #selector(respondToDynamicTypeChanges(_:)), name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
    
    func ignoreDynamicTypeChanges() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIContentSizeCategoryDidChangeNotification, object: nil)
    }
}
