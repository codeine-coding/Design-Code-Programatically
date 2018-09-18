//
//  Data.swift
//  DesignCodeApp
//
//  Created by Allen Whearry on 7/30/18.
//  Copyright © 2018 Allen Whearry. All rights reserved.
//

import Foundation


let sections = [
    [
        "title": "Learn iOS 11 Design",
        "caption": "A complete guide to designing for iOS 11",
        "body": "While the flat design has become universal over the past 5 years, it wasn’t so common before iOS 7. It was the shift that shaped the design landscape. But to say that it hasn’t evolved would be inaccurate. iOS design has adapted to the bigger screens. What started as the ultimate opposite of hyper-realistic designs that preceded it, flat design is now much more nuanced, giving way to gradients, drop shadows and cards.",
        "image": "ios11"
    ],
    [
        "title": "Designing for iPhone X",
        "caption": "Guidelines to designing for iOS 11",
        "body": "iOS 11 marks the introduction of the iPhone X, a much taller iPhone that has virtually no bezel. The 5.8-inch OLED screen is larger than the iPhone 8 Plus’s 5.5-inch, yet the body size is about the same as the iPhone 8. For designers, this means more freedom in our canvas.",
        "image": "ios11-iphone-x"
    ],
    [
        "title": "Design for iPad",
        "caption": "How bigger screens affect your design",
        "body": "Designing for the iPad isn’t as simple as flipping a switch and just making everything bigger. A larger screen provides a real opportunity to present more content while respecting some basic rules in navigation, typography and visual hierarchy. Don’t treat the iPad as just a big iPhone. Instead, treat it more like a desktop computer with touch capabilities. In other words, your users can be more productive, see more content and perform tasks faster like typing, and drag-and-drop and multi-tasking.",
        "image": "ios11-ipad"
    ],
    [
        "title": "Design for Apple Watch",
        "caption": "Designing for people on the go",
        "body": "Apple Watch was introduced on April 24, 2015, and it was highly anticipated by developers, designers, and the media. It was truly the first wearable that broke every expectation, placing Apple as the number one watch manufacturer in the world.",
        "image": "ios11-watch"
    ],
    [
        "title": "Learn Colors",
        "caption": "How to work with colors",
        "body": "Colors are difficult to master because it’s really easy to go overboard. When we design, we have a tendency to over-design. For colors, we tend to use competing colors that distract and just feels completely unnatural. What I can recommend is to simply stick to the basics and temper your use of colors by focusing on its utility and pleasantness. When in doubt, use colors only to draw attention to a button or element of importance.",
        "image": "ios11-colors"
    ]
]


let testimonials = [
    [
        "text": "Design+Code is a wake-up call. Why should I learn a web based technology or a deprecated tool when the obvious choice is to learn Xcode?",
        "name": "Jean-Marc Denis",
        "job": "Product Designer at Facebook",
        "avatar": "avatar-jean-marc"
    ],
    [
        "text": "If you're comfortable with Framer, you can easily transfer your knowledge to Swift. You can animate pretty easily while building an app.",
        "name": "Min-Sang Choi",
        "job": "Interaction Designer at Google",
        "avatar": "avatar-min-sang"
    ],
    [
        "text": "First of all I am 12 years old, live in Britain and I just realised that all I want to do for the rest of my life is design amazing things. (Tom Fox won a scolarship for WWDC 2015)",
        "name": "Tom Fox",
        "job": "Student",
        "avatar": "avatar-tom-fox"
    ],
    [
        "text": "As a developer, I really appreciated the chapters on Color Theory and Typography. It was just the right balance of theory combined with practical examples.",
        "name": "Chris Ching",
        "job": "Teaches iOS Programming",
        "avatar": "avatar-chris-ching"
    ],
    [
        "text": "I began a Swift learning plan 5 days ago, this is part of what I did in five days. I learned a lot from Meng To's Design+Code.",
        "name": "MartinRGB",
        "job": "Designer and Coder",
        "avatar": "avatar-martin-rgb"
    ],
    [
        "text": "Thanks to Design + Code, I just released my first app on the store: Sky Graph. It's been a great learning experience as a designer learning to code.",
        "name": "Wayne Sang",
        "job": "Senior Product Manager at TWG",
        "avatar": "avatar-wayne-sang"
    ],
    [
        "text": "I found and bought Design+Code by Meng To which takes you through each step of the process from design to code to app store submission.",
        "name": "Kenny Chen",
        "job": "User Experience Designer at Bankrate",
        "avatar": "avatar-kenny-chen"
    ],
    [
        "text": "Thanks to @MengTo, I was able to get a rough prototype of my first app working this weekend.",
        "name": "Andrew McCarthy",
        "job": "Product Designer",
        "avatar": "avatar-andrew-mccarthy"
    ]
]


let allBookmarks = [
    [
        "type": "code",
        "chapter": "3",
        "section": "Intro to Storyboards",
        "part": "Object Library",
        "content": "On the bottom right, you’ll find the Object Library. That’s the 3rd tab. The Object Library has all the UI components that you can use for your layout. It’s like Insert in Sketch."
    ],
    [
        "type": "image",
        "chapter": "1",
        "section": "Learn iOS 11 Design",
        "part": "Large Titles",
        "content": "More than ever, iOS 11 is going back to its roots. Bold fonts are everywhere. Titles are big and black. Since screens are now about twice as tall as they were, it only makes sense to have large titles. Another reason for large fonts is accessibility. With billions of people using their phone daily from all age groups, it is important to make the content as clear and readable as possible. Accessibility lets users set very large fonts for apps that support it. In iOS 11, all of Apple’s stock apps support that option.  Because of that reason, you’ll find that users are now expecting it."
    ],
    [
        "type": "image",
        "chapter": "2",
        "section": "Design for iOS 11",
        "part": "Layout Margin",
        "content": "In this Home screen, we use a layout margin of 16px from the left and the right. Like this we ensure that the user interface stay focus in the middle of the screen and doen't look cramped against the edge."
    ],
    [
        "type": "text",
        "chapter": "2",
        "section": "Status Bar",
        "part": "Setting Up the Basics",
        "content": "We need a Status Bar for the top of the screen. You can find the Status Bar in the Insert menu at the Toolbar. If you've installed Sketch Runner, you can search it easily. Go to Plugins > Runner > Run… or press Command + ' (apostrophe) to activate Sketch Runner. Select the Insert tab and type keyword \"status bar black\" and double-click the Symbol and then, place it in the Artboard."
    ],
    [
        "type": "image",
        "chapter": "2",
        "section": "Design for iOS 11",
        "part": "Design+Code Home Screen",
        "content": "We will be designing the new Design+Code Home screen in this tutorial. It contains a hero image, headline, introduction, call-to-action button, chapter and people section."
    ]
]

let benefits : Array<Dictionary<String,String>> = [
    [
        "subhead": "Watch and follow",
        "title": "44 hours of video",
        "body": "Each section is accompanied with captioned, well-paced videos that will help you follow step by step.",
        "image": "Video"
    ],[
        "subhead": "Search and Bookmark",
        "title": "100,000 words",
        "body": "Most online courses either only have texts or videos. Design+Code has both, all searchable.",
        "image": "Words"
    ],[
        "subhead": "Download",
        "title": "10GB Source Files",
        "body": "Over 36 Sketch files, 36 Xcode project files and templates to ensure that you start strong.",
        "image": "Files"
    ],[
        "subhead": "Enjoy Anywhere",
        "title": "iPhone, iPad & Web",
        "body": "Experience the book from your iPhone, iPad and desktop. We got downloadable ePubs too.",
        "image": "iOS"
    ],[
        "subhead": "Read, Browse",
        "title": "Offline Experience",
        "body": "Poor wifi? The app was designed for offline use so that you don't always rely on the internet.",
        "image": "Offline"
    ],[
        "subhead": "Test your Knowledge",
        "title": "Exercises",
        "body": "The questions are hard. Try as many times as you want, get timed and stats to see how you improve.",
        "image": "Exercises"
    ],
]

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
