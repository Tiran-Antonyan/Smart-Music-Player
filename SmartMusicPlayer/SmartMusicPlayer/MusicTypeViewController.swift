//
//  MusicTypeViewController.swift
//  SmartMusicPlayer
//
//  Created by macOSHighSierra1036 on 03/06/2019
//  Copyright © 2019 Group Work. All rights reserved.
//

import UIKit



class MusicTypeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sections = [Section(name: "Song Type ", songType: ["Classic" , "Pop" , "Jazz"], expanded: false),
                    Section(name: "Artist Name ", songType: ["Adell" , "Rihanna" , "Aram Asatryan"], expanded: false),
                    Section(name: "Song Name ", songType: ["Umbrella" , "Na NA NA" , "Years"], expanded: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
       
    }
}
extension MusicTypeViewController: UITableViewDataSource , UITableViewDelegate , HeaderViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].songType.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (sections[indexPath.section].expanded) {
            return 44
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        header.custom(title: sections[section].name, section: section, delegate: self)
        return header
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = sections[indexPath.section].songType[indexPath.row]
        return cell
    }
    
    func toggleSection(header: HeaderView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        
        tableView.beginUpdates()
        for i in 0 ..< sections[section].songType.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let simpleVC = SimpleVC()
//        simpleVC.customInit(imageName: sections[indexPath.section].movies[indexPath.row])
//        tableView.deselectRow(at: indexPath, animated: true)
//        self.navigationController?.pushViewController(simpleVC, animated: true)
//    }
}

