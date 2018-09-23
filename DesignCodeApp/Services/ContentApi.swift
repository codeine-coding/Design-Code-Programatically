//
//  ContentApi.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 9/21/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import Foundation

class ContentApi {
    static var shared: ContentApi = ContentApi()
    
    func load<T: Codable>(into swiftType: T.Type, resource: String, ofType type: String = "json") -> T? {
        let path = Bundle.main.path(forResource: resource, ofType: type)
        let url = URL(fileURLWithPath: path!)
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            return try decoder.decode(swiftType.self, from: data)
        } catch {
            print(error)
        }
        return [] as? T
    }
    
    lazy var sections: [SectionCodable] = {
        return load(into: [SectionCodable].self, resource: "Section") ?? []
    }()
    
    
    lazy var bookmarks: [BookmarkCodable] = {
       return load(into: [BookmarkCodable].self, resource: "Bookmarks") ?? []
    }()
    
    lazy var parts: [PartCodable] = {
        return load(into: [PartCodable].self, resource: "Parts") ?? []
    }()
    
    lazy var testimonials: [Testimonial] = {
        return load(into: [Testimonial].self, resource: "Testimonials") ?? []
    }()
    
    lazy var benefits: [Benefit] = {
        return load(into: [Benefit].self, resource: "Benefits") ?? []
    }()
}
