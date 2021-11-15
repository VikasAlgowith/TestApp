//
//  ViewController.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit

class LoginViewC: UIViewController {
    var xmppController: XMPPHelper!
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    private let loginViewModel = LoginViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginViewModel.delegate = self
    }


    @IBAction func didTapOnLoginButton(_ sender: Any) {
        self.startActivityIndicator(withMsg: "", onView: self.view)
        let request = LoginRequest(userName: txtUsername.text, userPassword: txtPassword.text)
        loginViewModel.loginUser(loginRequest: request)
    }
}


extension LoginViewC: LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponcse?) {
        self.stopActivityIndicator(spinner: self.view)
        guard let response = loginResponse else{return}
        print("Msg:", response.message ?? "")
        if response.success{
            // navigate to next page
            Router.pushWeatherlistPage(on: self)
            return
        }
        // show alert
        self.showOkAlert(withTitle: "", message: response.message ?? "")
    }
    

  

}
