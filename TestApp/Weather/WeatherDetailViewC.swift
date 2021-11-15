//
//  WeatherDetailViewC.swift
//  TestApp
//
//  Created by Vikas Kumar Srivastava on 14/11/21.
//

import UIKit

class WeatherDetailViewC: UIViewController {

    @IBOutlet weak var lblEmpSalry: UILabel!
    @IBOutlet weak var lblEmpName: UILabel!
    @IBOutlet weak var lblEmpAge: UILabel!
    
    var empObj :Employee?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Employee Detsils"

        setPageData()
        // Do any additional setup after loading the view.
    }
    func setPageData(){
        guard let empObj = empObj else{return}
        lblEmpName.text = empObj.employee_name ?? ""
        lblEmpSalry.text = "Rs. \(empObj.employee_salary ?? 0)"
        lblEmpAge.text = "\(empObj.employee_age ?? 0)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
