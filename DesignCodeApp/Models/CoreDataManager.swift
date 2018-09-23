//
//  CoreDataManager.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/23/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import CoreData

extension NSEntityDescription {
    static func object<T: NSManagedObject>(into context: NSManagedObjectContext) -> T {
        
        return insertNewObject(forEntityName: String(describing: T.self), into: context) as! T
    }
}

extension Section {
    func configure(with codable: SectionCodable) {
        body = codable.body
        caption = codable.caption
        chapterNumber = codable.chapterNumber
        id = codable.id
        title = codable.title
        imageName = codable.imageName
        publishDate = codable.publishDate
    }
}

extension Part {
    func configure(with codable: PartCodable) {
        content = codable.content
        id = codable.id
        title = codable.title
        type = codable.typeName
    }
}

class CoreDataManager {
    static let shared = CoreDataManager()
    
    func loadFromData() {
        let contentAPI = ContentApi.shared
    
        let bookmarksCodable = contentAPI.bookmarks
        let sectionsCodable = contentAPI.sections
        let partsCodable = contentAPI.parts
        
        // Parse them
        for sectionCodable in sectionsCodable {
            let section:  Section  = NSEntityDescription.object(into: context)
            section.configure(with: sectionCodable)
            
            let bookmarksForThisSection = bookmarksCodable.filter { $0.sectionId == section.id }
            
            // Parse the parts
            for partCodable in partsCodable {
                let part: Part = NSEntityDescription.object(into: context)
                
                part.configure(with: partCodable)
                
                section.addToParts(part)
                
                for candidate in bookmarksForThisSection {
                    if candidate.partId == part.id {
                        let bookmark: Bookmark = NSEntityDescription.object(into: context)
                        
                        bookmark.part = part
                        bookmark.section = section
                        
                        break
                    }
                }
            }
        }
        
        saveContext()
    }
    
    func fetch<T: NSFetchRequestResult>(entityName: String, ofType coreDataType: T.Type) -> [T] {
        
        do {
            let entities = try context.fetch(NSFetchRequest<T>(entityName: entityName))
            return entities
        } catch {
            print(error)
        }
        
        return []
    }
    
    lazy var bookmarks: [Bookmark] = fetch(entityName: "Bookmark", ofType: Bookmark.self)
    lazy var sections: [Section] = fetch(entityName: "Section", ofType: Section.self)
    
    func remove(_ bookmark: Bookmark) {
        
        context.delete(bookmark)
        saveContext()
        bookmarks = fetch(entityName: "Bookmark", ofType: Bookmark.self)
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error description: \(error.localizedDescription)")
            }
        })
        
        return container
    }()
    
    var context: NSManagedObjectContext { return persistentContainer.viewContext }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Unresolved error description: \(error.localizedDescription)")
            }
        }
    }
}
