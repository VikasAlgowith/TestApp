//
//  LoginViewModel.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit
import XMPPFramework

protocol LoginViewModelDelegate {
    func didReceiveLoginResponse(loginResponse: LoginResponcse?)
}
class LoginViewModel: NSObject {
    var xmppHelper: XMPPHelper!
    var delegate : LoginViewModelDelegate?
    func loginUser(loginRequest: LoginRequest)
    {
        let validationResult = LoginVaildation().Validate(loginRequest: loginRequest)
        
        if(validationResult.success)
        {
            do {
                try self.xmppHelper = XMPPHelper(userJIDString: loginRequest.userName ?? "",
                                                 password: loginRequest.userPassword ?? "")
                self.xmppHelper.xmppStream.addDelegate(self, delegateQueue: DispatchQueue.main)
                self.xmppHelper.connect()
            } catch {
                print("Something went wrong")
            }
            return
        }
        guard let delegate = delegate else{return}
        delegate.didReceiveLoginResponse(loginResponse: LoginResponcse(message: validationResult.error, data: nil, success: false))
    }
}


extension LoginViewModel: XMPPStreamDelegate {
    
    func xmppStreamDidAuthenticate(_ sender: XMPPStream) {
        print("xmppStreamDidAuthenticate")
        guard let delegate = delegate else{return}
        delegate.didReceiveLoginResponse(loginResponse: LoginResponcse(message: "User authenticated  succesfully", data: sender, success: true))
    }
    
    func xmppStream(_ sender: XMPPStream, didNotAuthenticate error: DDXMLElement) {
        print("Wrong password or username")
        guard let delegate = delegate else{return}
        delegate.didReceiveLoginResponse(loginResponse: LoginResponcse(message: ("Wrong password or username"), data: sender, success: false))
        
    }
    
}
