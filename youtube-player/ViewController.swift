//
//  ViewController.swift
//  youtube-player
//
//  Created by Grégoire Laget on 30/07/2020.
//  Copyright © 2020 Grégoire Laget. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]() //empty Video array

    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Set itself as the data source and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
        
    }
    
    // MARK: - MoidelDelegate Methods
    
    
    func videosFetched(_ video: [Video]) {
        // Set the returned videos to the video property
        self.videos = video
        
        // Refresh the tableView
        
        tableView.reloadData()
    }
    
    
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        
        // Get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        //Return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

