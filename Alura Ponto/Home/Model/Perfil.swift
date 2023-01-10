//
//  Perfil.swift
//  Alura Ponto
//
//  Created by Fernanda Nascimento on 29/12/22.
//

import Foundation
import UIKit

class Perfil {
    
    private let nomeDaFoto = "perfil.png"

    func salvarImagem(_ image: UIImage)  {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let urldoArquivo = diretorio.appendingPathComponent(nomeDaFoto)
        
        if FileManager.default.fileExists(atPath: urldoArquivo.path) {
            removerImagem(urldoArquivo.path)
        }
        
        guard let imagemData = image.jpegData(compressionQuality: 1) else { return }
        
        do {
            try imagemData.write(to: urldoArquivo)
        } catch let error {
            print(error)
        }
    }
    
    private func removerImagem(_ url: String) {
        do {
            try FileManager.default.removeItem(atPath: url)
        }
        catch let error {
            print(error)
        }
    }
    
    func carregarImagem() -> UIImage? {
        
        let diretorio = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let urlDoArquivo = NSSearchPathForDirectoriesInDomains(diretorio, userDomainMask, true) //url de armazenagem do diretorio do usuário TRUE Url completa - FALSE omite URL completa
        
        if let caminho = urlDoArquivo.first {
            let urlDaImagem = URL(fileURLWithPath: caminho).appendingPathComponent(nomeDaFoto)
            let imagem = UIImage(contentsOfFile: urlDaImagem.path)
            
            return imagem
        }
        
        return nil
    }
}
