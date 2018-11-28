//
//  RequestRegisterUser.swift
//  Carwash
//
//  Created by Bluecore on 18/10/18.
//

import UIKit
import ObjectMapper

/// Mappable Model RequestRegisterUser da API
class RequestRegisterUser: Mappable {

    var RoleId:Int!
    var Email:String?
    var Name:String?
    var Password:String?
    var Document:String?
    var BirthDate:String?
    var Cep:String?
    var Address:String?
    var AddressNumber:Int!
    var Complement:String?
    var District:String?
    var City:String?
    var State:String?
    var PhoneNumber:String?
    
    required init?(map: Map) {
        RoleId = try! map.value("RoleId")
        
        Email = try? map.value("Email")
        Name = try? map.value("Name")
        Password = try? map.value("Password")
        Document = try? map.value("Document")
        BirthDate = try? map.value("BirthDate")
        Cep = try? map.value("Cep")
        Address = try? map.value("Address")
        
        AddressNumber = try! map.value("AddressNumber")
        
        Complement = try? map.value("Complement")
        District = try? map.value("District")
        City = try? map.value("City")
        State = try? map.value("State")
        PhoneNumber = try? map.value("PhoneNumber")
    }
    init(){
    
    }
    
    func mapping(map: Map) {
        
        RoleId <- map["RoleId"]
        
        Email <- map["Email"]
        Name <- map["Name"]
        Password <- map["Password"]
        Document <- map["Document"]
        BirthDate <- map["BirthDate"]
        Cep <- map["Cep"]
        Address <- map["Address"]
        
        AddressNumber <- map["AddressNumber"]
        
        Complement <- map["Complement"]
        District <- map["District"]
        City <- map["City"]
        State <- map["State"]
        PhoneNumber <- map["PhoneNumber"]
        
    }
    
}
