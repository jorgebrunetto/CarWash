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

    // traz no metodo listarlistar todos os servicos
    var Id:Int?
    //var Active:Bool
    
    var UserId:Int!
    var ServiceId:Int!
    
    var Name: String!
    var DefaultPrice:Int
    var SpecificPrice:Int?

    required init?(map: Map) {
        Id = try? map.value("Id")
        //Active = try! map.value("Active")
        ServiceId = try? map.value("ServiceId")
        
        Name = try? map.value("Name")
        DefaultPrice = try! map.value("DefaultPrice")

        UserId = try? map.value("UserId")
        SpecificPrice = try? map.value("SpecificPrice")
    }
   
    func mapping(map: Map) {
        Id <- map["Id"]
        //Active <- map["Active"]
        ServiceId <- map["Id"]
        Name <- map["Name"]
        DefaultPrice <- map["DefaultPrice"]

        UserId <- map["UserId"]
        SpecificPrice <- map["SpecificPrice"]
    }

}
