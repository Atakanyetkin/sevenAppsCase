//
//  Coordinator.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import UIKit

// MARK: - BaseCoordinator
/// Tüm coordinator'lar için ortak bir protokol.
/// Bu protokolü implemente eden sınıflar navigasyon işlemlerini yönetir.
protocol Coordinator {
    
    /// Uygulama içinde sayfalar arası geçişleri yönetmek için bir `UINavigationController` kullanılır.
    var navigationController: UINavigationController { get }
    
    /// Coordinator'ı başlatan fonksiyon.
    /// Her coordinator, kendi başlatma mantığını bu fonksiyon içinde uygular.
    func start()
}

