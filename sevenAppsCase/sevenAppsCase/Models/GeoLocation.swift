//
//  GeoLocation.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - GeoLocation Model
/// Kullanıcının konum bilgilerini içeren model.
/// Enlem (latitude) ve boylam (longitude) değerlerini tutar.
/// Codable protokolü ile JSON verisini kolayca decode edebiliriz.
struct GeoLocation: Codable {
    
    /// Kullanıcının enlem bilgisi (latitude).
    let lat: String
    
    /// Kullanıcının boylam bilgisi (longitude).
    let lng: String
}
