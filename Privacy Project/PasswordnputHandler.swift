//
//  PasswordInputHandler.swift
//  Privacy Project
//
//  Created by Timothy/Ammar/Chandra on 10/17/19.
//  Copyright © 2019 PETS. All rights reserved.
//

import UIKit
import LocalAuthentication

extension String {

    enum ValidityType {
        case age
        case email
        case password
    }

    enum Regex: String {
        case age = "[0-9]{2,2}"
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{6,25}"

    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""


        switch validityType {
        case .age:
            regex = Regex.age.rawValue
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)

    }
    }
}

class PasswordInputHandler: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var clinicTextBox: UITextField!
    @IBOutlet weak var clinicDropDown: UIPickerView!
    
    @IBOutlet weak var therapistTextBox: UITextField!
    @IBOutlet weak var therapistDropDown: UIPickerView!
    
    @IBOutlet weak var accessCodeTextField: UITextField!
    
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var patientDOB: UITextField!
    @IBOutlet weak var patientPasword: UITextField!
    
    @IBOutlet weak var enteredPasswordTextField: UITextField!
    
    var correctPassword = "12345"
    @IBAction func checkPassword(_ sender: Any) {
        
        let passwordEntered = enteredPasswordTextField.text;
        if (passwordEntered?.isEmpty ?? false) {
            displayMyAlertMessage(userMessage: "Please enter the password ");
            return;
        }
        if( passwordEntered != correctPassword ) {
            displayMyAlertMessage(userMessage: "Please enter correct password  ");
            return;
        }
        
    }
     // Display alert message
    func displayMyAlertMessage(userMessage: String) {
        
        let myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle:UIAlertController.Style.alert);
        let okAction = UIAlertAction(title:"OK" , style: UIAlertAction.Style.default, handler: nil);
        myAlert.addAction(okAction);
        self.present(myAlert, animated:true, completion:nil);
    }
    
    // Touch ID setup
    
    @IBAction func touchID(_ sender: Any) {
        let context : LAContext = LAContext();

        if(context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message - Touch ID") { (good, error) in
                if(good){
                    print("Good")
                }
                else{
                    print("Try Again")
                }
            }
        }



    }
    
    
    // Face ID set up

    @IBAction func faceID(_ sender: Any) {

        let context : LAContext = LAContext();

            if(context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)) {
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message - Face ID") { (good, error) in
                    if(good){
                        print("Good")
                    }
                    else{
                        print("Try Again")
                    }
                }
            }



    }
    
    
    
    //Clinic List
    var clinicList = ["Mercy","Sparks"]
    
    //Therapist List
    var therapistList = ["Adam","Bob"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enteredPasswordTextField.delegate = self;
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        var countrows: Int = clinicList.count
        if pickerView == therapistDropDown {
            countrows = therapistList.count
        }

        return countrows
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//        if pickerView == clinicDropDown {
//            let titleRow = clinicList[row]
//            return titleRow
//        }
//
//        else if pickerView == therapistDropDown {
//            let titleRow = therapistList[row]
//            return titleRow
//        }
//
//        self.view.endEditing(true)
//        return ""
//    }
    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if pickerView == clinicDropDown{
//            self.clinicTextBox.text = self.clinicList[row]
//            self.clinicDropDown.isHidden = true
//        }
//        else if pickerView == therapistDropDown{
//            self.therapistTextBox.text = self.therapistList[row]
//            self.therapistDropDown.isHidden = true        }
//    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        /*
//        if textField == self.clinicTextBox {
//            self.clinicDropDown.isHidden = false
//            //if you don't want the users to see the keyboard type:
//
//            textField.endEditing(true)
//        }
//        else if (textField == self.therapistTextBox){
//            self.therapistDropDown.isHidden = false
//
//            textField.endEditing(true)
//
//        }
//        */
//        if textField == self.accessCodeTextField{
//
//        }
//        }
//
//    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        //self.view.endEditing(true)
//        return true
//    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
