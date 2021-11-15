

import Foundation
struct Employee : Codable {
    let id : Int?
    let employee_name : String?
    let employee_salary : Int?
    let employee_age : Int?
    let profile_image : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case employee_name = "employee_name"
        case employee_salary = "employee_salary"
        case employee_age = "employee_age"
        case profile_image = "profile_image"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        employee_name = try values.decodeIfPresent(String.self, forKey: .employee_name)
        employee_salary = try values.decodeIfPresent(Int.self, forKey: .employee_salary)
        employee_age = try values.decodeIfPresent(Int.self, forKey: .employee_age)
        profile_image = try values.decodeIfPresent(String.self, forKey: .profile_image)
    }

}

struct Result : Codable {
	let status : String?
	let data : [Employee]?
	let message : String?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case data = "data"
		case message = "message"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		data = try values.decodeIfPresent([Employee].self, forKey: .data)
		message = try values.decodeIfPresent(String.self, forKey: .message)
	}

}
