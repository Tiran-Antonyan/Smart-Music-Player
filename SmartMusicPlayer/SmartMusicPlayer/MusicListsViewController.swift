//
//  MusicListsViewController.swift
//  SmartMusicPlayer
//
//  Created by macOSHighSierra1036 on 3/06/19.
//  Copyright © 2019 Group Work. All rights reserved.
//

import UIKit
import Alamofire
import MarqueeLabel
import SDWebImage
import AVFoundation

class MusicListsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var musicArray = [MusicItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        Alamofire.request(baseURL + "pitbull").responseJSON { response in
            if let data = response.data {
                do {
                    let result = try JSONDecoder().decode(MusicItems.self, from: data)
                    if let m = result.results {
                        self.musicArray = m
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                      
                        }
                    }
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
    }
extension MusicListsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SongCell.identifire, for: indexPath) as? SongCell else {
            return SongCell()
        }
        let music = musicArray[indexPath.row]
        cell.configure(music)
        cell.activityIndicator.startAnimating()
        cell.songImageView?.sd_setImage(with: URL(string: musicArray[indexPath.row].artworkUrl100)!, completed: { (_, _, _, _) in
           cell.activityIndicator.stopAnimating()
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
