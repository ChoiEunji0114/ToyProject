//
//  Friend.swift
//  MyFriends
//
//  Created by 최은지 on 13/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

/*
 {
     "name":"하나",
     "age":22,
     "address_info": {
         "country":"대한민국",
         "city":"울산"
     }
 },
 */

struct Friend: Codable {
    
    struct Address: Codable {
        let country: String
        let city : String
    }
    
    let name: String
    let age: Int
    let address_info: Address
    
    var nameAndAge: String  {
        return self.name + "(\(self.age))"
    }
//
    var fullAddress: String {
        return self.address_info.city + ", " + self.address_info.country
    }
    
//    enum CodingKeys: String, CodingKey {
//        case name, age
//        case addressInfo = "address_Info"
//    }
    
}
