//
//  Song.swift
//  SmartMusicPlayer
//
//  Created by macOSHighSierra1036 on 6/3/19.
//  Copyright © 2019 Group Work. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var songImageView: UIImageView!
    static let identifire = "songCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(_ item: MusicItem) {
        artistNameLabel.text = item.artistName
        songNameLabel.text = item.trackName
    }

    @IBAction func playButton(_ sender: UIButton) {
        
    }
}
