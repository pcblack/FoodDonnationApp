//
//  ViewController.swift
//  FoodDonation
//
//  Created by Vaibhav Dutt on 2020-07-21.
//  Copyright © 2020 Vaibhav Dutt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        
        let UserLoggedIn = UserDefaults.standard.bool(forKey: "isuserloggedin")
       
        
        
    }

    @IBAction func LoggedOutButton(_ sender: Any) {
        UserDefaults.standard.set(false,forKey: "isuserloggedin");
        UserDefaults.standard.synchronize();
        self.dismiss(animated: true, completion: nil)
        
        
    }
}

