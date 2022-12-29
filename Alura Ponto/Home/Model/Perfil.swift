//
//  Perfil.swift
//  Alura Ponto
//
//  Created by Fernanda Nascimento on 29/12/22.
//

import Foundation
import UIKit

class Perfil {
    func salvarImagem(_ image: UIImage)  {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let nomeDaFoto = "perfil.png"
        let urldoArquivo = diretorio.appendingPathComponent(nomeDaFoto)
        
        if FileManager.default.fileExists(atPath: urldoArquivo.path) {
            // remover a foto
        }
        
        guard let imagemData = image.jpegData(compressionQuality: 1) else { return }
        
        do {
            try imagemData.write(to: urldoArquivo)
        } catch let error {
            print(error)
        }
    }
}
