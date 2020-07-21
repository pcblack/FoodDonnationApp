//
//  LoginPageViewController.swift
//  FoodDonation
//
//  Created by Vaibhav Dutt on 2020-07-21.
//  Copyright © 2020 Vaibhav Dutt. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButton(_ sender: Any) {
        
        let UserEmail = userEmail.text;
        let UserPassword = userPassword.text;
        
        let email = UserDefaults.standard.string(forKey: "getemail");
        
        let password = UserDefaults.standard.string(forKey: "getpassword");
        
        if(UserEmail==email)
        {
            
            if(UserPassword==password)
            {
                 UserDefaults.standard.set(true,forKey:"isuserloggedin");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil)
                
                
            }
            displayAlertMessages(userMessages: "Password galat bc");
        }
        else{
            displayAlertMessages(userMessages: "Galat hai bc");
        }
    }
    
    func displayAlertMessages(userMessages:String){
        var myAlert = UIAlertController(title: "Alert", message: userMessages, preferredStyle: UIAlertController.Style.alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
