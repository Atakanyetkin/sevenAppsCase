//
//  APIEndpointTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import Foundation
import XCTest
@testable import Case

class EndpointTests: XCTestCase {
    
    func testUsersEndpoint() {
        // Given
        let endpoint = Endpoint.users
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url, "https://jsonplaceholder.typicode.com/users", "The URL for the users endpoint is incorrect.")
    }
    
    func testUserDetailEndpoint() {
        // Given
        let userID = 1
        let endpoint = Endpoint.userDetail(id: userID)
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url, "https://jsonplaceholder.typicode.com/users/\(userID)", "The URL for the userDetail endpoint is incorrect.")
    }
    
    func testUserDetailEndpointWithDifferentID() {
        // Given
        let userID = 2
        let endpoint = Endpoint.userDetail(id: userID)
        
        // When
        let url = endpoint.url
        
        // Then
        XCTAssertEqual(url, "https://jsonplaceholder.typicode.com/users/\(userID)", "The URL for the userDetail endpoint with a different ID is incorrect.")
    }
}

