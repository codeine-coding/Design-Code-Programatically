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
    
    lazy var sections: [Section] = {
        
        guard let path = Bundle.main.path(forResource: "Section", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .secondsSince1970
            let sections = try decoder.decode([Section].self, from: data)
            return sections
        } catch {
            print(error)
        }
       return []
    }()
    
    
    lazy var bookmarks: [Bookmark] = {
        guard let path = Bundle.main.path(forResource: "Bookmarks", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let bookmarks = try decoder.decode([Bookmark].self, from: data)
            return bookmarks
        } catch {
            print(error)
        }
        return []
    }()
    
    lazy var testimonials: [Testimonial] = {
        guard let path = Bundle.main.path(forResource: "Testimonials", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let testimonials = try decoder.decode([Testimonial].self, from: data)
            return testimonials
        } catch {
            print(error)
        }
        return []
    }()
    
    lazy var benefits: [Benefit] = {
        guard let path = Bundle.main.path(forResource: "Benefits", ofType: "json") else { return [] }
        let url = URL(fileURLWithPath: path)
        
        guard let data = try? Data(contentsOf: url) else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let benefits = try decoder.decode([Benefit].self, from: data)
            return benefits
        } catch {
            print(error)
        }
        return []
    }()
}
