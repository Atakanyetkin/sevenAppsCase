//
//  APIService.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import RxSwift

// MARK: - API Service
/// Uygulamanın API ile iletişimini yöneten servis sınıfı.
/// API isteklerini merkezi bir yerden yöneterek temiz bir mimari sağlar.
final class APIService {
    
    /// Singleton tasarım deseni kullanarak tek bir `APIService` instance'ı oluşturuyoruz.
    static let shared = APIService()
    
    /// Kullanıcı listesini API'den çeker.
    /// `NetworkManager` üzerinden yapılan isteği Observable olarak döndürür.
    func fetchUsers() -> Observable<[User]> {
        return NetworkManager.shared.request(url: Endpoint.users.url)
    }
    
    /// Belirli bir kullanıcıya ait detayları API'den çeker.
    /// Kullanıcı ID'sine göre `NetworkManager`'a istek gönderir ve sonucu Observable olarak döndürür.
    func fetchUserDetail(userID: Int) -> Observable<User> {
        return NetworkManager.shared.request(url: Endpoint.userDetail(id: userID).url)
    }
}
