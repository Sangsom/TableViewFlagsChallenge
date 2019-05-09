//
//  ViewController.swift
//  TableViewFlagsChallenge
//
//  Created by Rinalds Domanovs on 09/05/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var flags: [Country] = []
    
    struct Country {
        var name: String
        var abbr: String
        var path: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        flags += [
            Country(name: "Estonia", abbr: "EE", path: "estonia"),
            Country(name: "France", abbr: "FR", path: "france"),
            Country(name: "Germany", abbr: "DE", path: "germany"),
            Country(name: "Ireland", abbr: "IE", path: "ireland"),
            Country(name: "Italy", abbr: "IT", path: "italy"),
            Country(name: "Monaco", abbr: "MC", path: "monaco"),
            Country(name: "Nigeria", abbr: "NG", path: "nigeria"),
            Country(name: "Poland", abbr: "PL", path: "poland"),
            Country(name: "Russia", abbr: "RU", path: "russia"),
            Country(name: "Spain", abbr: "ES", path: "spain"),
            Country(name: "United Kingdom", abbr: "UK", path: "uk"),
            Country(name: "United States", abbr: "US", path: "us")
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let flag = flags[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flags", for: indexPath)
        
        cell.imageView?.image = UIImage(named: flag.path)
        cell.textLabel?.text = flag.name
        cell.detailTextLabel?.text = "This is secondary label"
        return cell
    }

}

