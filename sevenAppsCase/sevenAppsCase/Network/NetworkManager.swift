//
//  NetworkManager.swift
//  caseStudy
//
//  Created by atakan yetkin on 21.02.2025.
//

import Alamofire
import RxSwift

// MARK: - NetworkManager
/// Uygulamanın ağ isteklerini yöneten sınıf.
/// Alamofire ile API isteklerini gerçekleştirir ve RxSwift ile reaktif veri akışı sağlar.
final class NetworkManager {
    
    /// Singleton tasarım deseni kullanılarak tek bir `NetworkManager` instance'ı oluşturuluyor.
    static let shared = NetworkManager()
    
    /// `init()` fonksiyonu private olarak tanımlandı.
    /// Bu sayede dışarıdan yeni bir `NetworkManager` instance oluşturulması engellenir.
    private init() {}

    /// API'ye HTTP isteği yapan genel fonksiyon.
    /// - Parameters:
    ///   - url: API isteğinin yapılacağı URL.
    ///   - method: HTTP metodunu belirtir (GET varsayılan olarak ayarlandı).
    ///   - parameters: Gönderilecek isteğe ait opsiyonel parametreler.
    /// - Returns: Belirtilen türde (`T: Decodable`) bir `Observable` döndürür.
    func request<T: Decodable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil
    ) -> Observable<T> {
        return Observable.create { observer in
            // Alamofire ile API isteği yapılıyor
            AF.request(url, method: method, parameters: parameters)
                .validate() // Yanıt doğrulaması yapılıyor (status code ve hata kontrolleri)
                .responseDecodable(of: T.self) { response in
                    switch response.result {
                    case .success(let data):
                        observer.onNext(data) // Başarıyla gelen veriyi ilet
                        observer.onCompleted() // İşlemi tamamla
                    case .failure:
                        observer.onError(APIError.networkError("İstek başarısız oldu.")) // Hata durumunda hata ilet
                    }
                }
            
            // Observer’ın iptal edilmesi durumunda kaynağı serbest bırak
            return Disposables.create()
        }
    }
}
