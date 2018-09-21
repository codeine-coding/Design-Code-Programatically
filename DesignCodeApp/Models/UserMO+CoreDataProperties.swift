//
//  UserMO+CoreDataProperties.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/20/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//
//

import Foundation
import CoreData


extension UserMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserMO> {
        return NSFetchRequest<UserMO>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var bookmark: NSSet?

}

// MARK: Generated accessors for bookmark
extension UserMO {

    @objc(addBookmarkObject:)
    @NSManaged public func addToBookmark(_ value: BookmarkMO)

    @objc(removeBookmarkObject:)
    @NSManaged public func removeFromBookmark(_ value: BookmarkMO)

    @objc(addBookmark:)
    @NSManaged public func addToBookmark(_ values: NSSet)

    @objc(removeBookmark:)
    @NSManaged public func removeFromBookmark(_ values: NSSet)

}
