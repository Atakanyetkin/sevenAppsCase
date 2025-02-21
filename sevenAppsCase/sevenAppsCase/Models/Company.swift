//
//  Company.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - Company Model
/// Kullanıcının çalıştığı şirket bilgilerini içeren model.
/// Codable protokolü sayesinde JSON verisini kolayca decode edebiliriz.
struct Company: Codable {
    
    /// Şirketin adı.
    let name: String
    
    /// Şirketin sloganı veya pazarlama cümlesi.
    let catchPhrase: String
    
    /// Şirketin iş modelini veya iş kolunu tanımlayan bilgi.
    let bs: String
}
