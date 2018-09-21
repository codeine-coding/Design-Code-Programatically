//
//  Data.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import Foundation

struct Section: Codable {
    var title: String
    var caption: String
    var body: String
    var imageName: String
    var publishDate: Date
    
    enum CodingKeys: String, CodingKey {
        case title, caption, body
        case imageName = "image"
        case publishDate = "publish_date"
    }
}

struct Bookmark: Codable {
    var typeName: String
    var chapterNumber: String
    var sectionTitle: String
    var partHeading: String
    var content: String
    
    enum BookmarkType: String {
        case text, image, video, code
    }
    
    var type: BookmarkType?
    
    enum CodingKeys: String, CodingKey {
        case content
        case sectionTitle = "section"
        case partHeading = "part"
        case typeName = "type"
        case chapterNumber = "chapter"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        typeName = try values.decode(String.self, forKey: .typeName)
        chapterNumber = try values.decode(String.self, forKey: .chapterNumber)
        sectionTitle = try values.decode(String.self, forKey: .sectionTitle)
        partHeading = try values.decode(String.self, forKey: .partHeading)
        content = try values.decode(String.self, forKey: .content)
        
        type = BookmarkType(rawValue: typeName)
    }
}

struct Testimonial: Codable {
    var text: String
    var personFullName: String
    var personJobDescription: String
    var avatar: String
    
    enum CodingKeys: String, CodingKey {
        case text, avatar
        case personFullName = "name"
        case personJobDescription = "job"
    }
}

struct Benefit: Codable {
    var subheader: String
    var title: String
    var body: String
    var imageName: String
    
    enum CodingKeys: String, CodingKey {
        case body, title
        case subheader = "subhead"
        case imageName = "image"
    }
}

let exercises = [
    "chapter-1-iOS-11-Design": [
        [
            "question": "What are the 3 core philosophies for iOS design?",
            "correctAnswer": "Deference, clarity and depth",
            "answers": [
                "Intuition, clarity and beauty",
                "Deference, clarity and depth",
                "Fun, clarity and perception",
                "Good, great and insanely great",
                "Clarity, depth and intuition",
            ]
        ],
        [
            "question": "What is the recommended line-height for readability?",
            "correctAnswer": "120% to 145%",
            "answers": [
                "100% to 110%",
                "110% to 120%",
                "110% to 150%",
                "120% to 145%",
                "100% to 160%",
            ],
            ],
    ],
    "chapter-1-Sketch": [
        [
            "question": "What's the big feature in Sketch 47?",
            "correctAnswer": "Libraries",
            "answers": [
                "New Emojis",
                "Nested Symbols",
                "Symbol Overrides",
                "Resizing Constraints",
                "Libraries",
            ]
        ],
    ],
]
