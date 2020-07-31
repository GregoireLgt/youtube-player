//
//  Video.swift
//  youtube-player
//
//  Created by Grégoire Laget on 31/07/2020.
//  Copyright © 2020 Grégoire Laget. All rights reserved.
//

import Foundation


struct Video : Decodable {
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = Date()
    
    enum CodingKeys: String, CodingKey{
        
        case snippet
        case high
        case thumbnails
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
    init(from decoder: Decoder) throws {
        
      let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snipperContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //Parse title
        
        self.title = try snipperContainer.decode(String.self, forKey: .title)
        
        //Parse description
        
        self.description = try snipperContainer.decode(String.self, forKey: .description)
        
        //Parse publishedAt
        
        self.published = try snipperContainer.decode(Date.self, forKey: .published)
        
        //Parse thumbnails
        let thumbnailContainer = try snipperContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        //Parse videoId
        
        let resourceIdContainer = try snipperContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
    }
}
