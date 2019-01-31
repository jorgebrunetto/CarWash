//
//  ResponseWashers.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit
import ObjectMapper

/// Mappable Model ResponseWashers da API
class ResponseWashers: Mappable {

    var Id:Int
    var RoleId: Int
    var Name: String?
    var Email: String?
    var Document:String?
    var Inserted:String?
    var BirthDate:String?
    var Cep:String?
    var Address:String?
    var AddressNumber:Int
    var Complement:String?
    var District:String?
    var City:String?
    var State:String?
    var PhoneNumber:String?
    var Latitude:String?
    var Longitude:String?
    var Active:Bool
    var Token:String?
    var ScoreAverage:String?
    var MinPrice:Double?
    
    required init?(map: Map) {
        
        Id = try! map.value("Id")
        RoleId = try! map.value("RoleId")
        Name = try? map.value("Name")
        Email = try? map.value("Email")
        
        Document = try? map.value("Document")
        Inserted = try? map.value("Inserted")
        BirthDate = try? map.value("BirthDate")
        Cep = try? map.value("Cep")
        Address = try? map.value("Address")
        AddressNumber = try! map.value("AddressNumber")
        Complement = try? map.value("Complement")
        District = try? map.value("District")
        City = try? map.value("City")
        State = try? map.value("State")
        PhoneNumber = try? map.value("PhoneNumber")
        Latitude = try? map.value("Latitude")
        Longitude = try? map.value("Longitude")
        Active = try! map.value("Active")
        Token = try? map.value("Token")
        
        ScoreAverage = try? map.value("ScoreAverage")
        MinPrice = try? map.value("MinPrice")
    }
    
    func mapping(map: Map) {
        
        Id <- map["Id"]
        
        RoleId <- map["RoleId"]
        Name <- map["Name"]
        Email <- map["Email"]
        Document <- map["Document"]
        Inserted <- map["Inserted"]
        BirthDate <- map["BirthDate"]
        Cep <- map["Cep"]
        Address <- map["Address"]
        AddressNumber <- map["AddressNumber"]
        Complement <- map["Complement"]
        District <- map["District"]
        City <- map["City"]
        State <- map["State"]
        PhoneNumber <- map["PhoneNumber"]
        Latitude <- map["Latitude"]
        Longitude <- map["Longitude"]
        Active <- map["Active"]
        Token <- map["Token"]
        
        ScoreAverage <- map["ScoreAverage"]
        MinPrice <- map["MinPrice"]
    }
}
