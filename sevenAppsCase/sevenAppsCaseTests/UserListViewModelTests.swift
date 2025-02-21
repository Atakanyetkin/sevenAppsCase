//
//  UserListViewModelTests.swift
//  caseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import XCTest
import RxSwift
@testable import Case

// MARK: - UserListViewModelTests
class UserListViewModelTests: XCTestCase {
    
    var viewModel: UserListViewModel!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        super.setUp()
        viewModel = UserListViewModel()
        disposeBag = DisposeBag()
    }
    
    override func tearDown() {
        viewModel = nil
        disposeBag = nil
        super.tearDown()
    }
    
    func testFetchUsers_ShouldReturnUsers() {
        let expectation = self.expectation(description: "Users API çağrısı başarılı olmalı")
        
        viewModel.users
            .skip(1) // Varsayılan boş değer geçilerek test edilir
            .subscribe(onNext: { users in
                XCTAssertFalse(users.isEmpty, "Kullanıcı listesi boş olmamalı")
                expectation.fulfill()
            })
            .disposed(by: disposeBag)
        
        viewModel.fetchUsers()
        wait(for: [expectation], timeout: 5)
    }
}
