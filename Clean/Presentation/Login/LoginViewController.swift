//
//  LoginViewController.swift
//  Clean
//
//  Created by jcapasix on 20/10/17.
//  Copyright © 2017 Jordan Capa. All rights reserved.
//

import UIKit

protocol LoginProtocol{
    func showHome()
    func showEror(message:String)
}

class LoginViewController: UIViewController, LoginProtocol {

    var presenter:LoginPresenter?
    var router:LoginRouter?
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = LoginConfigurator.sharedInstance.configure(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func TapLoginButton(_ sender: Any) {
        self.presenter?.login(username:self.usernameTextField.text!, password: self.passwordTextField.text!)

    }

    @IBAction func TapRegisterButton(_ sender: Any) {
        self.router?.routeToRegister()

    }

    
    // MARK: - LoginProtocol
    func showHome(){
        self.router?.routeToHome()
    }
    
    func showEror(message:String){
        print(message)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
