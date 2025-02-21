//
//  Address.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - UserAddress Model
/// Kullanıcının adres bilgilerini içeren model.
/// JSON verisini Codable protokolü ile kolayca işleyebilmemizi sağlar.
struct UserAddress: Codable {
    /// Kullanıcının yaşadığı sokak adı.
    let street: String
    
    /// Kullanıcının apartman, daire veya ek adres bilgisi.
    let suite: String
    
    /// Kullanıcının yaşadığı şehir.
    let city: String
    
    /// Kullanıcının posta kodu.
    let zipcode: String
    
    /// Kullanıcının konum bilgileri (enlem ve boylam).
    let geo: GeoLocation
}
