//
//  Localizacao.swift
//  Alura Ponto
//
//  Created by Fernanda Nascimento on 11/01/23.
//

import Foundation
import CoreLocation

protocol LocalizacaoDelegate: AnyObject {
    func atualizacaLocalizacaoUsuario(latitude: Double?, longitude: Double?)
}

class Localizacao: NSObject {
    
    private var latitude: CLLocationDegrees?
    private var longitude: CLLocationDegrees?
    weak var delegate: LocalizacaoDelegate?
    
    func permissao(_ gerenciadorDeLocalizacao: CLLocationManager) {
        gerenciadorDeLocalizacao.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            switch gerenciadorDeLocalizacao.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                gerenciadorDeLocalizacao.startUpdatingLocation()
            case .denied:
                break
            case .notDetermined:
                gerenciadorDeLocalizacao.requestWhenInUseAuthorization()
            default:
                break
            }
        }
    }
}

extension Localizacao: CLLocationManagerDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let localizacao = locations.first {
//            print(localizacao.coordinate.latitude)
//            print(localizacao.coordinate.longitude)
            latitude = localizacao.coordinate.latitude
            longitude = localizacao.coordinate.longitude
        }
        delegate?.atualizacaLocalizacaoUsuario(latitude: latitude, longitude: longitude)
    }
}
