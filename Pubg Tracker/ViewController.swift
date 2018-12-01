//
//  ViewController.swift
//  Pubg Tracker
//
//  Created by David on 11/24/18.
//  Copyright © 2018 Wallfly. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    //UI connected to code
    @IBOutlet weak var mainStackViewController: UIStackView!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var platformStackView: UIStackView!
    @IBOutlet weak var xboxButton: UIButton!
    @IBOutlet weak var pcButton: UIButton!
    @IBOutlet weak var regionLabel: UIButton!
    @IBOutlet weak var regionStackView: UIStackView!
    @IBOutlet weak var naButton: UIButton!
    @IBOutlet weak var euButton: UIButton!
    @IBOutlet weak var asButton: UIButton!
    @IBOutlet weak var ocButton: UIButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var usernameStackView: UIStackView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    var pathURL = "https://api.pubg.com/shards/xbox-"
    var url = URL(string: "")
    
    
    //API Key
    let apiKey = String("Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5OTc2NzRlMC0zYmM0LTAxMzYtMDY5NC03ZGM0MmNhOWYyNjgiLCJpc3MiOiJnYW1lbG9ja2VyIiwiaWF0IjoxNTI2NTM2NDMxLCJwdWIiOiJibHVlaG9sZSIsInRpdGxlIjoicHViZyIsImFwcCI6InB1Ymctc3RhdHMtMjE5ZjRiMzktMGQ1Yi00NGFjLWI4MjMtMzJhNzYxYzhlMDhiIn0.91pN6Paa-cqgdo1z3J7RXkCDWp2r8GXw6NFWLh7Fsq4")
    //set up variables to store user options
    var platformType = String()
    var userRegion = String()
    var playerName = String()
    
    //keeps track of which options the user selects (platform,region)
    @IBAction func userSelectedOptions(_ sender: UIButton) {
        switch sender {
        case xboxButton:
            platformType = "xbox"
        case pcButton:
            platformType = "pc"
        case naButton:
            userRegion = "na"
        case euButton:
            userRegion = "eu"
        case asButton:
            userRegion = "as"
        case ocButton:
            userRegion = "oc"
        default:
            break;
        }
    }
    
    //submit button clicked, getting username and submitting all user-given info
    @IBAction func submitButtonClicked(_ sender: Any) {
        playerName = usernameTextField.text!
        pathURL += userRegion + "/players?filter[playerNames]=" + playerName
        url = URL(string: pathURL)
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set up variables for API call
        
        var request = URLRequest(url: url!)
        
        //type of request is GET and adding the apiKey to access the data
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "Authorization")
        request.addValue("application/vnd.api+json", forHTTPHeaderField: "Accept")
        
        let task = URLSession.shared.dataTask(with: url!) {data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: [])
            print(json)
        }
        
        task.resume()
        
        
    }


}

