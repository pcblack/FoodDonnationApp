//
//  SignUpPAgeViewController.swift
//  FoodDonation
//
//  Created by Vaibhav Dutt on 2020-07-21.
//  Copyright © 2020 Vaibhav Dutt. All rights reserved.
//

import UIKit
import CoreData

class SignUpPAgeViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    

    
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func SignUp(_ sender: Any) {
        let getemail = userEmail.text;
        let getpassword = userPassword.text;
        let confirmpassword = confirmPassword.text;
        
//        // Checking if empty
//        if(getemail!.isEmpty||getpassword!.isEmpty||confirmpassword!.isEmpty)
//        {
//            displayAlertMessages(userMessages: "All Fields Are Required");
//            return;
//
//        }
//        //checking password matches or not
//
//
//
//        //storing data
//        UserDefaults.standard.set(getemail,forKey:"getemail");
//        UserDefaults.standard.set(getpassword,forKey:"getpassword");
//        UserDefaults.standard.synchronize();
         if(getpassword != confirmpassword)
                {
                    displayAlertMessages(userMessages: "Password thik sai dal bc");
        
                    return;
                }
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)
        let newEntity = NSManagedObject(entity: entity!, insertInto: context)
        newEntity.setValue(getemail, forKey: "email")
        newEntity.setValue(getpassword, forKey: "password")
        
        do {
            try context.save()
            NSLog("Saved");
            print("Saved")
        } catch
        {
            NSLog("Failed");
            print("Failed saving")
        }
        
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
    
    @IBAction func imageClicked(_ sender: Any) {
        
//        if UIImagePickerController.isSourceTypeAvailable(.camera){
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
//            imagePicker.sourceType = UIImagePickerController.SourceType.camera
//            imagePicker.allowsEditing = false
//            self.present(imagePicker,animated: true, completion: nil)
//        }
//
    let pickerController = UIImagePickerController()
        pickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
           pickerController.allowsEditing = true
           
           let alertController = UIAlertController(title: "Add Image", message: "Choose", preferredStyle: .actionSheet)
           /*
           let cameraAction = UIAlertAction(title: "Camera", style: .default) { (action) in
               pickerController.sourceType = .camera
               self.present(pickerController, animated: true, completion: nil)
               
           }
    */
           
           let photosLibraryAction = UIAlertAction(title: "Gallery", style: .default)
           { (action) in
               pickerController.sourceType = .photoLibrary
               self.present(pickerController, animated: true, completion: nil)
               
           }
        
        
        
        
        let imagex = UIAlertAction(title: "Camera", style: .default)
        { (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker,animated: true, completion: nil)
            }
            else{
                
                var myAlert = UIAlertController(title: "Alert", message: "Camera Not Available", preferredStyle: UIAlertController.Style.alert);
                let okAction = UIAlertAction(title: "Ok", style: .destructive ,handler: nil)
                    
                
                myAlert.addAction(okAction);
                self.present(myAlert, animated: true, completion: nil)
                
            }
        }
           
          /*
           let savedPhotosAction = UIAlertAction(title: "Saved Photos Album", style: .default) { (action) in
               pickerController.sourceType = .savedPhotosAlbum
               self.present(pickerController, animated: true, completion: nil)
               
           }
           */
           let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
           
           //alertController.addAction(cameraAction)
            alertController.addAction(photosLibraryAction);
            
            alertController.addAction(imagex)
         //  alerrtController.addAction(savedPhotosAction)
           alertController.addAction(cancelAction)
           
            self.present(alertController, animated: true, completion: nil)
           
       }

    func imagePickerController(_ picker: UIImagePickerController,
       didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
       {
        print("am in selected area")
        if let pickedimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            print("image kai uper")
            
            myImage.image = pickedimage
            picker.dismiss(animated: true, completion: nil)
            print("iamge kai nechai")
        }
        else
        {
            print("pc image");
        }
    }
       
       func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
           picker.dismiss(animated: true, completion: nil)
           
       }

    
}

