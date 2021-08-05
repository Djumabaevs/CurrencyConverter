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
            
            if error != nil {
                
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                
                if data != nil {
                    
                    do {
                        
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        
                        DispatchQueue.main.async {
//                            print(jsonResponse["success"])
                            
                            if let rates = jsonResponse["rates"] as? [String : Any] {
//                                print(rates)
                                if let cad = rates["CAD"] as? Double {
//                                    print(cad)
//                                    self.cadLabel.text = String(cad)
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                                if let rub = rates["RUB"] as? Double {
                                 self.rubLabel.text = "RUB: \(rub)"
                                }
                                if let eur = rates["EUR"] as? Double {
                                 self.eurLabel.text = "EUR: \(eur)"
                                }
                                if let btc = rates["BTC"] as? Double {
                                 self.btcLabel.text = "BTC: \(btc)"
                                }
                                if let kzt = rates["KZT"] as? Double {
                                 self.kztLabel.text = "KZT: \(kzt)"
                                }
                                if let usd = rates["USD"] as? Double {
                                 self.usdLabel.text = "USD: \(usd)"
                                }
                                if let tr = rates["TRY"] as? Double {
                                 self.tryLabel.text = "TRY: \(tr)"
                                }

                            }
                        }
                        
                    } catch {
                        print("error")
                        
                    }
                }
                
            }
        }
        
        task.resume()
    }
}

