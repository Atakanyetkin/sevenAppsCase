//
//  UserModelTests.swift
//  CaseTests
//
//  Created by atakan yetkin on 21.02.2025.
//

import XCTest
@testable import Case

class UserModelTests: XCTestCase {

    func testUserModelEncoding_Failure() {
        // Given: User modeli
        let user = User(id: 1, name: "John Doe", username: "johnny", email: "john@example.com", address: UserAddress(street: "123 Elm St", suite: "Apt 1", city: "Springfield", zipcode: "12345", geo: GeoLocation(lat: "0.0", lng: "0.0")), phone: "123-456-7890", website: "www.johndoe.com", company: Company(name: "John's Company", catchPhrase: "Tech", bs: "Solutions"))
        
        // When: User modelini JSON'a encode ediyoruz
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Daha okunabilir JSON
        
        do {
            let data = try encoder.encode(user)
            let jsonString = String(data: data, encoding: .utf8)!
            print("Encoded JSON: \(jsonString)")  // JSON'u ekrana yazdırıyoruz
                
            // Then: JSON içinde beklediğimiz anahtarların olup olmadığını kontrol ediyoruz
            // Burada beklediğimiz JSON verisini yanlış yazalım
            let expectedJsonString = """
            {
              "id": 1,
              "name": "John Doe",
              "username": "johnny",
              "email": "john.doe@example.com",  // Hatalı email (beklenen değer)
              "address": {
                "street": "123 Elm St",
                "suite": "Apt 1",
                "city": "Springfield",
                "zipcode": "12345",
                "geo": {
                  "lat": "0.1",  // Hatalı lat (beklenen değer)
                  "lng": "0.1"   // Hatalı lng (beklenen değer)
                }
              },
              "phone": "123-456-7890",
              "website": "www.johndoe.com",
              "company": {
                "name": "John's Company",
                "catchPhrase": "Tech",
                "bs": "Solutions"
              }
            }
            """
            // JSON string'lerinin eşleştiğini kontrol edelim
            XCTAssertEqual(jsonString, expectedJsonString, "Encoded JSON does not match the expected JSON.")
        } catch {
            XCTFail("Encoding failed: \(error.localizedDescription)")
        }
    }
}
