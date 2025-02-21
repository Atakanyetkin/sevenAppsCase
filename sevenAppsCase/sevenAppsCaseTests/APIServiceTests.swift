//
//  APIServiceTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import XCTest
import RxSwift
@testable import Case

// MARK: - APIServiceTests
class APIServiceTests: XCTestCase {
    
    var apiService: APIService!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        apiService = APIService()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        apiService = nil
        disposeBag = nil
        super.tearDown()
    }
    
    func testFetchUsers_ShouldReturnData() {
        let expectation = self.expectation(description: "Users API çağrısı başarılı olmalı")
        
        apiService.fetchUsers()
            .subscribe(
                onNext: { users in
                    XCTAssertFalse(users.isEmpty, "API verisi boş olmamalı")
                    expectation.fulfill()
                },
                onError: { error in
                    XCTFail("API çağrısı başarısız oldu: \(error.localizedDescription)")
                }
            )
            .disposed(by: disposeBag)
        
        wait(for: [expectation], timeout: 5)
    }
}

