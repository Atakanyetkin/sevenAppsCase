//
//  User.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - User Model
/// Kullanıcı bilgilerini içeren model.
/// Codable protokolü sayesinde JSON verisini kolayca parse edebiliriz.
struct User: Codable {
    
    /// Kullanıcının benzersiz ID numarası.
    let id: Int
    
    /// Kullanıcının tam adı.
    let name: String
    
    /// Kullanıcının sistemdeki kullanıcı adı.
    let username: String
    
    /// Kullanıcının e-posta adresi.
    let email: String
    
    /// Kullanıcının adres bilgileri (UserAddress modeli ile ilişkilidir).
    let address: UserAddress
    
    /// Kullanıcının telefon numarası.
    let phone: String
    
    /// Kullanıcının web sitesi.
    let website: String
    
    /// Kullanıcının çalıştığı şirket bilgileri (Company modeli ile ilişkilidir).
    let company: Company
}

 
 
