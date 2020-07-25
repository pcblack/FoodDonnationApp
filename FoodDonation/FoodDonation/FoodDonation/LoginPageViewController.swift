//
//  LoginPageViewController.swift
//  FoodDonation
//
//  Created by Vaibhav Dutt on 2020-07-21.
//  Copyright © 2020 Vaibhav Dutt. All rights reserved.
//

import UIKit
import CoreData

class LoginPageViewController: UIViewController {

    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    var email :String!
    var password : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func LoginButton(_ sender: Any) {
        
        let UserEmail = userEmail.text;
        let Password = userPassword.text;
        
//        let email = UserDefaults.standard.string(forKey: "getemail");
//
//        let password = UserDefaults.standard.string(forKey: "getpassword");
        
        let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.returnsObjectsAsFaults = false;
        do{
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject]
            {
                email   = data.value(forKey: "email")as? String
                password = data.value(forKey: "password")as? String
            }
        } catch{
            print("Failed")
        }
        
        if(UserEmail==email)
        {
            print(Password!)
            print(email!)
            print(password!)
            
            if(Password==password)
            {
                print("mc")
                 UserDefaults.standard.set(true,forKey:"isuserloggedin");
                UserDefaults.standard.synchronize();
                self.performSegue(withIdentifier: "FoodApp", sender: nil)
                
                
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
