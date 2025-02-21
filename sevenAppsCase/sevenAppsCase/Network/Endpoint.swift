//
//  Endpoint.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation

// MARK: - API Endpoint Yönetimi
/// API isteklerinde kullanılacak uç noktaları (endpoints) yöneten enum.
/// Merkezi bir yapı sayesinde URL hatalarını minimize eder ve kod tekrarını önler.
enum Endpoint {
    
    /// API'nin temel (base) URL adresi.
    private static let baseURL = "https://jsonplaceholder.typicode.com"
    
    /// Kullanıcı listesini getiren endpoint.
    case users
    
    /// Belirli bir kullanıcının detaylarını getiren endpoint.
    /// Kullanıcı ID'sine göre URL oluşturur.
    case userDetail(id: Int)
    
    /// Endpoint'e karşılık gelen tam URL'yi döndüren hesaplanmış özellik.
    var url: String {
        switch self {
        case .users:
            return "\(Endpoint.baseURL)/users"
        case .userDetail(let id):
            return "\(Endpoint.baseURL)/users/\(id)"
        }
    }
}

