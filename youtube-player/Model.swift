//
//  Model.swift
//  youtube-player
//
//  Created by Grégoire Laget on 31/07/2020.
//  Copyright © 2020 Grégoire Laget. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos(){
        
        //Create a URL object
        
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Get a URLSession object
        
        let session = URLSession.shared
        
        
        //Get a data task from the URLSession object
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //Check if there were any errors
            if error != nil || data == nil {
                return
            }
            
            //Parsing the data into video objects
        }
        
        //Kick off the task
        dataTask.resume()
        
        
        
    }
}
