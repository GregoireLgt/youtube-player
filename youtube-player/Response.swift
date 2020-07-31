//
//  Response.swift
//  youtube-player
//
//  Created by Grégoire Laget on 31/07/2020.
//  Copyright © 2020 Grégoire Laget. All rights reserved.
//

import Foundation

struct Response: Decodable{
    var items:[Video]?
    
    
    enum CodingKeys: String, CodingKey{
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decodeIfPresent([Video].self, forKey: .items)
    }
}

