//
//  APIError.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - API Hata Yönetimi
/// Ağ istekleri sırasında oluşabilecek hata durumlarını yöneten enum.
/// Hata mesajlarını localizedDescription ile kullanıcı dostu hale getirir.
enum APIError: Error {
    
    /// Sunucudan geçersiz veya beklenmeyen bir yanıt alındığında oluşan hata.
    case invalidResponse
    
    /// JSON decode işlemi sırasında hata oluşursa tetiklenen hata.
    case decodingError
    
    /// Ağ bağlantısı ile ilgili bir hata oluştuğunda tetiklenen hata.
    /// Dinamik bir hata mesajı alarak detaylı bilgi verir.
    case networkError(String)
    
    /// Hata durumlarını kullanıcı dostu bir mesaj olarak döndüren özellik.
    var localizedDescription: String {
        switch self {
        case .invalidResponse:
            return "Geçersiz yanıt alındı."
        case .decodingError:
            return "Veri işlenirken hata oluştu."
        case .networkError(let message):
            return "Ağ hatası: \(message)"
        }
    }
}

