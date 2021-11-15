//
//  Services.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit

class Services: NSObject {
   private override init() {
        
    }
    static let shared = Services()
    func fetchWatherApi(completion: @escaping([Employee]?, Error?) ->  ()){
        let urlString = APIClient.employeesApi
        guard let url = URL(string: urlString) else{return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error{
                print("Error:\(err.localizedDescription)")
                completion(nil, err)
            }else{
                guard let data = data else{return}
                var arrEmployees = [Employee]()
                do{
                    let results = try JSONDecoder().decode(Result.self, from: data)
                    results.data?.forEach({ emp in
                        arrEmployees.append(emp)
                    })
                    completion(arrEmployees, nil)
                }catch let jsonError{
                    print("Json error: \(jsonError.localizedDescription)")
                }
                
            }
        }.resume()
    }
}
