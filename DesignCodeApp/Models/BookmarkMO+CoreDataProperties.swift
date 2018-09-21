//
//  BookmarkMO+CoreDataProperties.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/20/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//
//

import Foundation
import CoreData


extension BookmarkMO {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookmarkMO> {
        return NSFetchRequest<BookmarkMO>(entityName: "Bookmark")
    }

    @NSManaged public var bookmarkId: String?
    @NSManaged public var contentId: Int16
    @NSManaged public var chapterId: Int16
    @NSManaged public var sectionId: Int16
    @NSManaged public var user: UserMO?

}
