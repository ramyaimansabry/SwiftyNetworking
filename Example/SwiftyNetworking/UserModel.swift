//
//  UserModel.swift
//  SwiftyNetworking_Example
//
//  Created by Ramy Ayman Sabry on 9/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation



struct UserModel: Codable {
    let userId: Float
    let id: Float
    let title: String
    let completed: Bool
}

/// response

//{
//    "userId": 1,
//    "id": 1,
//    "title": "delectus aut autem",
//    "completed": false
//}


