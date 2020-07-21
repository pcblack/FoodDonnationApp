//
//  SignUpPAgeViewController.swift
//  FoodDonation
//
//  Created by Vaibhav Dutt on 2020-07-21.
//  Copyright © 2020 Vaibhav Dutt. All rights reserved.
//

import UIKit

class SignUpPAgeViewController: UIViewController {

    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SignUp(_ sender: Any) {
        let getemail = userEmail.text;
        var getpassword = userPassword.text;
        let confirmpassword = confirmPassword.text;
        
        // Checking if empty
        if(getemail!.isEmpty||getpassword!.isEmpty||confirmpassword!.isEmpty)
        {
            displayAlertMessages(userMessages: "All Fields Are Required");
            return;
            
        }
        //checking password matches or not
        
        if(getpassword != confirmpassword)
        {
            displayAlertMessages(userMessages: "Password thik sai dal bc");
            
            return;
        }
        
        //storing data
        UserDefaults.standard.set(getemail,forKey:"getemail");
        UserDefaults.standard.set(getpassword,forKey:"getpassword");
        UserDefaults.standard.synchronize();
        // dispalying saving
        
         var myAlert = UIAlertController(title: "Alert", message: "SuccessFully Registered", preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in self.dismiss(animated: true, completion: nil);
            
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func returnlogin(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
