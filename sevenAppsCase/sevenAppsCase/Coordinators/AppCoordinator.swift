//
//  AppCoordinator.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import UIKit

// MARK: - AppCoordinator
/// Uygulamanın ana akışını yöneten koordinatör.
/// Uygulama açıldığında UserCoordinator'ı başlatır.
final class AppCoordinator: Coordinator {
    
    // Navigation işlemlerini yönetmek için UINavigationController kullanıyoruz.
    var navigationController: UINavigationController
    
    // AppCoordinator başlatılırken bir navigationController alır.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// Uygulamayı başlatan fonksiyon.
    /// UserCoordinator çağrılarak kullanıcı listesi ekranı açılır.
    func start() {
        let userCoordinator = UserCoordinator(navigationController: navigationController)
        userCoordinator.start()
    }
}
