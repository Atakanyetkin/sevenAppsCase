//
//  UserListViewModel.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import RxSwift
import RxCocoa     

// MARK: - UserListViewModel
/// Kullanıcı listesini yöneten ViewModel.
/// Repository kullanarak veri akışını yönetir.
final class UserListViewModel {
    
    // Repository instance'ı - Veri katmanı ile iletişim için
    private let repository: UserRepository
    
    // RxSwift aboneliklerini yönetmek için DisposeBag
    // ViewModel deallocate olduğunda memory leak'leri önler
    private let disposeBag = DisposeBag()

    // Kullanıcı listesini tutan BehaviorRelay
    // BehaviorRelay: Hem mevcut değeri tutar hem de değişiklikleri yayınlar
    // Boş array ile başlatılıyor
    let users = BehaviorRelay<[User]>(value: [])
    
    // Yükleme durumunu tutan BehaviorRelay
    // UI'da loading spinner göstermek için kullanılır
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    /// Dependency Injection ile repository'i dışarıdan alıyoruz
    /// Bu sayede:
    /// 1. Unit test yazması kolaylaşır
    /// 2. Bağımlılıklar daha iyi yönetilir
    /// 3. Mock repository kullanılabilir
    init(repository: UserRepository = UserRepositoryImplementation()) {
        self.repository = repository
    }
    
    /// Kullanıcı listesini repository'den getirir
    func fetchUsers() {
        // Yükleme başladığını bildir
        isLoading.accept(true)
        
        repository.fetchUsers()
            .subscribe(
                onNext: { [weak self] users in
                    // Gelen kullanıcıları BehaviorRelay'e aktar
                    self?.users.accept(users)
                    // Yüklemeyi bitir
                    self?.isLoading.accept(false)
                },
                onError: { error in
                    // Hata durumunda console'a yazdır
                    print("Hata: \(error.localizedDescription)")
                    // Hata durumunda da yüklemeyi bitir
                    self.isLoading.accept(false)
                }
            )
            // Aboneliği DisposeBag'e ekle
            .disposed(by: disposeBag)
    }
}
