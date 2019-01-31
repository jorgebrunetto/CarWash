//
//  RequestEvaluate.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model RequestEvaluate da API
class RequestEvaluate: Mappable {

    var Token: String?
    var OrderedId:Int!
    var UserIdFrom: String?
    var UserIdTo: String?
    var Score: String?
    
    required init?(map: Map) {
        
        OrderedId = try! map.value("OrderedId")
        
        Token = try? map.value("Token")
        UserIdFrom = try? map.value("UserIdFrom")
        UserIdTo = try? map.value("UserIdTo")
        Score = try? map.value("Score")
    }
    
    init(){
        
    }
    
    func mapping(map: Map) {
        
        OrderedId <- map["OrderedId"]
        Token <- map["Token"]
        UserIdFrom <- map["UserIdFrom"]
        UserIdTo <- map["UserIdTo"]
        Score <- map["Score"]
    }
}
