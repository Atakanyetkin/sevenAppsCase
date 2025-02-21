//
//  NetworkManagerTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import XCTest
import RxSwift
@testable import Case

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        // NetworkManager'ı başlatıyoruz
        networkManager = NetworkManager.shared
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        networkManager = nil
        disposeBag = nil
        super.tearDown()
    }

    func testRequestSuccess() {
        // Given
        let expectation = self.expectation(description: "API request should succeed")
        let url = "https://jsonplaceholder.typicode.com/users"  // Gerçek URL
        
        // When: API'yi çağırıyoruz
        networkManager.request(url: url, method: .get, parameters: nil)
            .subscribe(onNext: { (response: [User]) in
                // Then: Verinin doğru şekilde döndüğünü kontrol ediyoruz
                XCTAssertGreaterThan(response.count, 0, "User list should not be empty")
                expectation.fulfill()  // Testi tamamla
            }, onError: { error in
                XCTFail("Request failed with error: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)  // DisposeBag ile aboneliği yönetiyoruz
        
        // Test için bekliyoruz
        waitForExpectations(timeout: 5, handler: nil)
    }

    func testRequestFailure() {
        // Given
        let expectation = self.expectation(description: "API request should fail")
        let url = "https://nonexistenturl.com"  // Hatalı URL
        
        // When: API'yi çağırıyoruz
        networkManager.request(url: url, method: .get, parameters: nil)
            .subscribe(onNext: { (_: [User]) in
                XCTFail("Request should fail but it succeeded.")
            }, onError: { error in
                // Then: Hata durumu kontrol ediliyor
                XCTAssertNotNil(error, "Error should be thrown")
                expectation.fulfill()  // Testi tamamla
            })
            .disposed(by: disposeBag)  // DisposeBag ile aboneliği yönetiyoruz
        
        // Test için bekliyoruz
        waitForExpectations(timeout: 5, handler: nil)
    }
}
