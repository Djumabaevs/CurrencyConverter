//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Bakyt Dzhumabaev on 29/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var kztLabel: UILabel!
    @IBOutlet weak var rubLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var btcLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }


    @IBAction func getRatesClicked(_ sender: Any) {
        
        //Request and session
        //Response and Data
        //Parsing and JSON serialization
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=5266294d492a4affa7aa06bfef673f91")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            
        }
    }
}

