//
//  ViewController.swift
//  TableViewFlagsChallenge
//
//  Created by Rinalds Domanovs on 09/05/2019.
//  Copyright © 2019 Rinalds Domanovs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var countriesList: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        countriesList += [
            Country(name: "Estonia", abbr: "EE", path: "estonia", population: 1_316_000),
            Country(name: "France", abbr: "FR", path: "france", population: 66_990_000),
            Country(name: "Germany", abbr: "DE", path: "germany", population: 82_790_000),
            Country(name: "Ireland", abbr: "IE", path: "ireland", population: 4_784_000),
            Country(name: "Italy", abbr: "IT", path: "italy", population: 60_590_000),
            Country(name: "Monaco", abbr: "MC", path: "monaco", population: 38_695_000),
            Country(name: "Nigeria", abbr: "NG", path: "nigeria", population: 190_900_000),
            Country(name: "Poland", abbr: "PL", path: "poland", population: 38_430_000),
            Country(name: "Russia", abbr: "RU", path: "russia", population: 144_500_000),
            Country(name: "Spain", abbr: "ES", path: "spain", population: 46_720_000),
            Country(name: "United Kingdom", abbr: "UK", path: "uk", population: 66_040_000),
            Country(name: "United States", abbr: "US", path: "us", population: 327_200_000)
        ]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Format population into decimals
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.locale = Locale.current
        
        let country = countriesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flags", for: indexPath)
        
        cell.imageView?.image = UIImage(named: country.path)
        cell.textLabel?.text = country.name
        cell.detailTextLabel?.text = "Population: \(numberFormatter.string(from: NSNumber(value: country.population))!)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 1. try loading the "Detail" view controller and typecasting it to be DetailViewController
        if let vc = storyboard?.instantiateViewController(withIdentifier: "CountryDetail") as? DetailViewController {
            // 2. success! Set its selectedImage property
            vc.countryImage = countriesList[indexPath.row].path
            
            // 3. now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}

