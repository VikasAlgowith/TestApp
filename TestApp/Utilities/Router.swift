//
//  Router.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import Foundation
import UIKit

struct Router{
    
    static func pushWeatherlistPage(on viewC: UIViewController) -> Void {
        let vc = UIStoryboard.init(name: AppScreens.MainSB, bundle: nil).instantiateViewController(withIdentifier: "WeatherViewC") as! WeatherViewC
        viewC.navigationController?.pushViewController(vc, animated: true)
    }
    static func pushWeatherDetailPage(on viewC: UIViewController, obj: Employee?) -> Void {
        let vc = UIStoryboard.init(name: AppScreens.MainSB, bundle: nil).instantiateViewController(withIdentifier: "WeatherDetailViewC") as! WeatherDetailViewC
        vc.empObj = obj
        viewC.navigationController?.pushViewController(vc, animated: true)
    }
}

struct AppScreens {
    //Storyboards
    static let MainSB = "Main"
}
