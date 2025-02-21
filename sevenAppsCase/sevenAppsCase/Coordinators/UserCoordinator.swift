//
//  UserCoordinator.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import UIKit

// MARK: - UserCoordinator
/// Kullanıcı akışını yöneten Coordinator.
/// Kullanıcı listesini başlatır ve detay sayfasına yönlendirme işlemlerini gerçekleştirir.
final class UserCoordinator: Coordinator {
    
    /// Uygulama içinde sayfalar arası geçişleri yönetmek için UINavigationController kullanıyoruz.
    var navigationController: UINavigationController
    
    /// UserCoordinator başlatılırken bir navigationController alır.
    /// Böylece kullanıcı arayüzü içinde sayfalar arasında yönlendirme yapabiliriz.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    /// Kullanıcı listesini açan fonksiyon.
    /// `UserListViewController`'ı oluşturur ve navigation stack'e ekler.
    func start() {
        let userListVC = UserListViewController()
        userListVC.coordinator = self // ViewController içinde Coordinator kullanmamızı sağlıyoruz.
        navigationController.pushViewController(userListVC, animated: false)
    }
    
    /// Seçilen kullanıcı için detay sayfasını açar.
    /// Kullanıcı ID'sini `UserDetailViewController`'a ileterek yönlendirme yapar.
    func showUserDetail(userID: Int) {
        let detailVC = UserDetailViewController(userID: userID)
        navigationController.pushViewController(detailVC, animated: true)
    }
}

