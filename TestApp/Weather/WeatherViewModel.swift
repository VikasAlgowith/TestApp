//
//  WeatherViewModel.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit

class WeatherViewModel: NSObject {
    weak var vc : WeatherViewC?
    
    func getWeatherList(){
        Services.shared.fetchWatherApi { employees, err in
            if err != nil{
                return
            }
            guard let emps = employees else{return}
            if let viewC = self.vc{
                viewC.employeesDataSource.append(contentsOf: emps)
                DispatchQueue.main.async {
                    viewC.weatherTableView.reloadData()
                }
            }
        }
    }
    
}
