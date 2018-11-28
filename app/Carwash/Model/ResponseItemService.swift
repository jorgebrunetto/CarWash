//
//  ResponseItemService.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseItemService da API
class ResponseItemService: Mappable {

    var Id:Int
    var Name: String?
    var DefaultPrice:Int
    var Active:Bool
    
    var UserId:Int?
    var SpecificPrice:Int?
    
    required init?(map: Map) {
        Id = try! map.value("Id")
        Name = try? map.value("Name")
        DefaultPrice = try! map.value("DefaultPrice")
        Active = try! map.value("Active")
        UserId = try? map.value("UserId")
        SpecificPrice = try? map.value("SpecificPrice")
    }
    
    func mapping(map: Map) {
        Id <- map["Id"]
        Name <- map["Name"]
        DefaultPrice <- map["DefaultPrice"]
        Active <- map["Active"]
        UserId <- map["UserId"]
        SpecificPrice <- map["SpecificPrice"]
    }

}
