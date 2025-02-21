//
//  UserDetailViewModelTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import XCTest
import RxSwift
@testable import Case

// MARK: - UserDetailViewModelTests
class UserDetailViewModelTests: XCTestCase {
    
    var viewModel: UserDetailViewModel!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        viewModel = UserDetailViewModel()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        viewModel = nil
        disposeBag = nil
        super.tearDown()
    }
    
    func testFetchUserDetail_ShouldReturnUser() {
        let expectation = self.expectation(description: "User detail API başarılı olmalı")
        
        viewModel.userDetail
            .skip(1)
            .subscribe(onNext: { user in
                XCTAssertNotNil(user, "Kullanıcı detayları boş olmamalı")
                XCTAssertEqual(user?.id, 1, "Kullanıcı ID'si doğru olmalı")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.fetchUserDetail(userID: 1)
        wait(for: [expectation], timeout: 5)
    }
}
