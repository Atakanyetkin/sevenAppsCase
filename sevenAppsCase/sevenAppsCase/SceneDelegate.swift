//
//  SceneDelegate.swift
//  sevenAppsCase
//
//  Created by atakan yetkin on 21.02.2025.
//

import UIKit

// MARK: - SceneDelegate
/// Uygulamanın yaşam döngüsünü yöneten ve başlangıç akışını başlatan sınıf.
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator? // Uygulama genelindeki koordinatörü tanımlıyoruz.
    
    /// Uygulama sahnesi (scene) yüklendiğinde çalışır.
    /// Burada window oluşturulup, rootViewController olarak UINavigationController atanır.
    /// Ardından, AppCoordinator başlatılarak navigasyon akışı yönetilmeye başlanır.
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        // Sahne UIWindowScene'e dönüştürülür, aksi halde return edilir.
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // Yeni bir window oluşturulur ve windowScene ile ilişkilendirilir.
        let window = UIWindow(windowScene: windowScene)
        
        // Uygulama genelinde kullanılacak bir UINavigationController oluşturulur.
        let navigationController = UINavigationController()
        
        // AppCoordinator, navigationController ile başlatılır ve atanır.
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator?.start() // Uygulama koordinatörünü başlatarak ilk ekranı (UserListViewController) yüklüyoruz.
        
        // Oluşturulan navigationController, window'un rootViewController'ı olarak atanır.
        window.rootViewController = navigationController
        
        // Window görünür hale getirilir.
        window.makeKeyAndVisible()
        self.window = window
    }


    func sceneDidDisconnect(_ scene: UIScene) {
 
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
       
    }

    func sceneWillResignActive(_ scene: UIScene) {
       
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
       
    }


}
