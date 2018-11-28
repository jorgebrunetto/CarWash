//
//  RequestServiceToWasher.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model RequestServiceToWasher da API
class RequestServiceToWasher: Mappable {
    
    var Token:String?
    var ServiceId:Int!
    var SpecificPrice:Double!
 
    
    required init?(map: Map) {
        ServiceId = try! map.value("ServiceId")
        
        Token = try? map.value("Token")
        
        SpecificPrice = try! map.value("SpecificPrice")
    }
    
    func mapping(map: Map) {
        
        ServiceId <- map["ServiceId"]
        
        Token <- map["Token"]
        
        SpecificPrice <- map["SpecificPrice"]
    }
    
    init(){
    }
}
