//
//  UserDetailViewModel.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import RxSwift
import RxCocoa     

// MARK: - UserDetailViewModel
// Bu ViewModel, kullanıcı detay iş mantığını ve veri akışını yönetir
final class UserDetailViewModel {
    
    // API servisi için singleton örneği
    private let apiService = APIService.shared
    
    // Bellek sızıntılarını önlemek için DisposeBag kullanılır
    // ViewModel silindiğinde abonelikleri otomatik olarak temizler
    private let disposeBag = DisposeBag()

    // BehaviorRelay, mevcut değeri tutan ve güncellemeleri yayan bir kapsayıcıdır
    // Combine'daki Published'a benzer
    // Başlangıçta nil olan kullanıcı detay verisini tutar
    let userDetail = BehaviorRelay<User?>(value: nil)
    
    // Ağ isteğinin yükleme durumunu takip eder
    // UI'da yükleme göstergelerini göstermek/gizlemek için kullanılır
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    // Belirli bir userID için API'den kullanıcı detayını getirir
    func fetchUserDetail(userID: Int) {
        // Yükleme göstergesini göster
        isLoading.accept(true)
        
        // API çağrısını yap
        apiService.fetchUserDetail(userID: userID)
            .subscribe(
                onNext: { [weak self] user in
                    // Veri geldiğinde userDetail'i güncelle
                    self?.userDetail.accept(user)
                    // Yükleme göstergesini gizle
                    self?.isLoading.accept(false)
                },
                onError: { error in
                    // API hatalarını yönet
                    print("API Error: \(error.localizedDescription)")
                }
            )
            // Düzgün temizlik için aboneliği disposeBag'e ekle
            .disposed(by: disposeBag)
    }
}
