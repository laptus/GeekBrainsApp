//
//  ViewController.swift
//  GeekBrainsApp
//
//  Created by Laptev Sasha on 26/11/2017.
//  Copyright © 2017 Laptev Sasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var authenticationScrollView: UIScrollView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keybordWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide,object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginButton_Pressed(_ sender: UIButton) {
        
    }
    
    @objc func keybordWasShown(notification: Notification){
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIKeyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0)
        self.authenticationScrollView?.contentInset = contentInsets
        authenticationScrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        authenticationScrollView?.contentInset = contentInsets
        authenticationScrollView?.scrollIndicatorInsets = contentInsets
    }
    

    @IBAction func authScrollVeiwTapped(_ sender: Any) {
        self.authenticationScrollView?.endEditing(true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if (identifier == "fromLoginToMainView"){
            let isCorrect = isAuthorizationCorrect()
            if !isCorrect{
                showLoginError()
            }
            return isCorrect
        }
        return true
    }
    
    func isAuthorizationCorrect()->Bool{
        if loginTextField.text! == "admin" && passwordTextField.text! == "qwerty"{
            return true
        }
        else{
            return false
        }
    }
    
    func showLoginError(){
        let alert = UIAlertController(title: "Authorization", message:
            "Login/Password Incorrect", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel,
                                      handler: nil))
        present(alert,animated: true, completion: nil)
    }
}

