//
//  CoordinatorTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import XCTest
@testable import Case

// MARK: - CoordinatorTests
class CoordinatorTests: XCTestCase {
    
    var navigationController: UINavigationController!
    var userCoordinator: UserCoordinator!
    
    override func setUp() {
        super.setUp()
        navigationController = UINavigationController()
        userCoordinator = UserCoordinator(navigationController: navigationController)
    }
    
    override func tearDown() {
        navigationController = nil
        userCoordinator = nil
        super.tearDown()
    }
    
    func testStart_ShouldShowUserListViewController() {
        userCoordinator.start()
        XCTAssertTrue(navigationController.viewControllers.first is UserListViewController)
    }
    
    func testShowUserDetail_ShouldPushUserDetailViewController() {
        userCoordinator.showUserDetail(userID: 1)
        XCTAssertTrue(navigationController.viewControllers.last is UserDetailViewController)
    }
}
