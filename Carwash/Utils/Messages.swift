//
//  Messages.swift
//  Carwash
//
//  Created by Bluecore on 10/09/18.
//

import UIKit


/// Classe responsável pelo gerenciamento de mensagens no app

class Messages: NSObject {

    static let CANT_COMPLETE_REQUEST = "Não foi possível completar a solicitação. Por favor, tente novamente."
    static let EMPTY_EMAIL = "O Campo E-mail é obrigatório."
    static let EMPTY_PASSWORD = "O Campo Senha é obrigatório."
    static let INVALID_EMAIL = "E-mail inválido."
    static let NOT_FOUND_DATA = "Nenhum dado encontrado."
    static let NOT_AVAILABLE_SERVICES = "Este usuário não possui serviços disponíveis no momento."
    static let SELECT_ONE_ITEM = "Selecione ao menos um Item."
    static let SELECT_ONE_DATE = "Selecione uma Data."
    static let SELECT_ONE_HOUR = "Selecione uma Hora."
    static let CREATE_ORDER_SUCCESS = "Pedido criado com sucesso."
}
