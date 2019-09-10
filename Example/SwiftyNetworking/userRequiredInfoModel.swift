//
//  userRequiredInfoModel.swift
//  SwiftyNetworking_Example
//
//  Created by Ramy Ayman Sabry on 9/10/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation



struct UserRequiredInfoModel: Codable{
    let Id: Int
    let status: Bool
    
    init(ID: Int, Status: Bool){
        self.Id = ID
        self.status = Status
    }
}
