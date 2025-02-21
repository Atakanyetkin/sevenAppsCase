//
//  UserRepositories.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import RxSwift

// MARK: - UserRepository
/// Kullanıcı verisini yöneten repository katmanı.
/// API'den gelen veriyi alır ve ViewModel'e uygun şekilde döndürür.
/// İleride farklı veri kaynaklarını (örn. CoreData) eklemek kolay olur.
protocol UserRepository {
    func fetchUsers() -> Observable<[User]>
    func fetchUserDetail(userID: Int) -> Observable<User>
}

// MARK: - UserRepositoryImplementation
/// API'den veri çeken repository implementasyonu.
/// `APIService` kullanarak veri akışını yönetir.
final class UserRepositoryImplementation: UserRepository {
    
    private let apiService: APIService
    
    /// Dependency Injection ile `APIService`'i dışarıdan alıyoruz.
    init(apiService: APIService = APIService.shared) {
        self.apiService = apiService
    }
    
    /// Kullanıcı listesini API’den çeker.
    func fetchUsers() -> Observable<[User]> {
        return apiService.fetchUsers()
    }
    
    /// Belirtilen ID'ye sahip kullanıcı detaylarını API’den çeker.
    func fetchUserDetail(userID: Int) -> Observable<User> {
        return apiService.fetchUserDetail(userID: userID)
    }
}

