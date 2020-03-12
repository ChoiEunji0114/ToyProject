//
//  UserInformation.swift
//  toy02-SignUp
//
//  Created by 최은지 on 12/03/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation

class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var id: String?
    var password: String?
    
    var phone: String?
    var date: String?
}
