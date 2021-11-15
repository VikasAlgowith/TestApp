//
//  LoginVaildation.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import Foundation
import XMPPFramework
struct LoginVaildation{
    func Validate(loginRequest: LoginRequest) -> ValidationResult
    {
        if(loginRequest.userName!.isEmpty)
        {
            return ValidationResult(success: false, error: "Username is empty")
        }

        if(loginRequest.userPassword!.isEmpty)
        {
            return ValidationResult(success: false, error: "Password is empty")
        }

        return ValidationResult(success: true, error: nil)
    }
}

struct ValidationResult
{
    let success: Bool
    let error : String?
}
struct LoginRequest
{
    var userName: String?
    var userPassword: String?
   
}
struct LoginResponcse
{
    let message: String?
    let data: XMPPStream?
    let success: Bool
}
