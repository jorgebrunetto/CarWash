//
//  ResponseViaCep.swift
//  Carwash
//
//  Created by Bluecore on 02/02/19.
//

import UIKit
import ObjectMapper

class ResponseViaCep: Mappable {

    var cep:String?
    var logradouro:String?
    var complemento:String?
    var bairro:String?
    var localidade:String?
    var uf:String?
    
    var unidade:String?
    var ibge:String?
    var gia:String?
    
    required init?(map: Map) {
        cep = try? map.value("cep")
        logradouro = try? map.value("logradouro")
        complemento = try? map.value("complemento")
        bairro = try? map.value("bairro")
        localidade = try? map.value("localidade")
        uf = try? map.value("uf")
        
        unidade = try? map.value("unidade")
        ibge = try? map.value("ibge")
        gia = try? map.value("gia")
    }
    init() {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        cep    <- map["cep"]
        logradouro    <- map["logradouro"]
        complemento    <- map["complemento"]
        bairro    <- map["bairro"]
        localidade    <- map["localidade"]
        uf    <- map["uf"]
        
        unidade    <- map["unidade"]
        ibge    <- map["ibge"]
        gia    <- map["gia"]
    }
}
