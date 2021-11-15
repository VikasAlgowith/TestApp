//
//  APIClinet.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import Foundation

struct APIClient{
    static let hostName = "hell.la"
    static let port : UInt16 = 5222
    static let jidPrefix = "@" + hostName
    
    static let weatherApiKey = "9808e141f118668c284ca5cc600c9711"
    static let weatherApi = "https://openweathermap.org/api"
    
    static let employeesApi = "http://dummy.restapiexample.com/api/v1/employees"

}
