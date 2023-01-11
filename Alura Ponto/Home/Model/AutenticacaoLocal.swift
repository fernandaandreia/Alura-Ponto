//
//  AutenticacaoLocal.swift
//  Alura Ponto
//
//  Created by Fernanda Nascimento on 11/01/23.
//

import Foundation
import LocalAuthentication

class AutenticacaoLocal {
    
    private let authenticatorContext = LAContext()
    private var error: NSError? //inout muda o parametro
    
    func autorizaUsuario(completion: @escaping(_ autenticacao: Bool) -> Void) {
        if authenticatorContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            if authenticatorContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                
                authenticatorContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "É necessário autenticação para apagar um recibo") { sucesso, error in
                    completion(sucesso)
                    
                }
            }
        }
        
    }
}
