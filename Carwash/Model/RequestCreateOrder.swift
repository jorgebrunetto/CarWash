//
//  RequestOrder.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model RequestCreateOrder da API
class RequestCreateOrder: Mappable {

    var Token:String?
    var UserId:Int!
    var WasherId:Int!
    var TotalPrice:Double!
    var ScheduledDateTime:String?
    var ListItens:[RequestOrderItem]?
    
    required init?(map: Map) {
        Token = try? map.value("Token")
        UserId = try! map.value("UserId")
        WasherId = try! map.value("WasherId")
        TotalPrice = try! map.value("TotalPrice")
        ScheduledDateTime = try? map.value("ScheduledDateTime")
        ListItens = try? map.value("ListItens")
    }
    init(){
        
    }
    
    func mapping(map: Map) {
        Token <- map["Token"]
        UserId <- map["UserId"]
        WasherId <- map["WasherId"]
        TotalPrice <- map["TotalPrice"]
        ScheduledDateTime <- map["ScheduledDateTime"]
        ListItens <- map["ListItens"]
    }
}
