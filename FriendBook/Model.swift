//
//  Model.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import Foundation


struct Friend: Codable, Identifiable {
    let id: UUID
    let name: String
}

struct User: Codable, Identifiable {
    let id: UUID
    let name: String
    let age: Int
    let company: String
    let email: String
    let isActive: Bool
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    // Ключи для сопоставления с JSON
//    enum CodingKeys: String, CodingKey {
//        case id, name, age, company, email, isActive, registered, tags, friends
//    }
}


// MARK: - Friend Model
//@Model
//class Friend: Codable {
//    @Attribute(.unique) var id: UUID
//    var name: String
//
//    // MARK: - CodingKeys
//    enum CodingKeys: String, CodingKey {
//        case id, name
//    }
//
//    // MARK: - Инициализация
//    init(id: UUID, name: String) {
//        self.id = id
//        self.name = name
//    }
//
//    // MARK: - Decodable
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(UUID.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//    }
//
//    // MARK: - Encodable
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//    }
//}


// MARK: - User Model
//@Model
//class User: Codable {
//    @Attribute(.unique) var id: UUID
//    var name: String
//    var age: Int
//    var company: String
//    var email: String
//    var isActive: Bool
//    var registered: Date
//    var tags: [String]
//    @Relationship(deleteRule: .cascade) var friends: [Friend] = []
//
//    // MARK: - CodingKeys
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//        case age
//        case company
//        case email
//        case isActive = "is_active" // JSON key: "is_active"
//        case registered
//        case tags
//        case friends
//    }
//
//    // MARK: - Инициализация
//    init(id: UUID, name: String, age: Int, company: String, email: String, isActive: Bool, registered: Date, tags: [String], friends: [Friend]) {
//        self.id = id
//        self.name = name
//        self.age = age
//        self.company = company
//        self.email = email
//        self.isActive = isActive
//        self.registered = registered
//        self.tags = tags
//        self.friends = friends
//    }
//    
//    // MARK: - Decodable
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(UUID.self, forKey: .id)
//        name = try container.decode(String.self, forKey: .name)
//        age = try container.decode(Int.self, forKey: .age)
//        company = try container.decode(String.self, forKey: .company)
//        email = try container.decode(String.self, forKey: .email)
//        isActive = try container.decode(Bool.self, forKey: .isActive)
//        tags = try container.decode([String].self, forKey: .tags)
//        friends = try container.decode([Friend].self, forKey: .friends)
//
//        let registeredString = try container.decode(String.self, forKey: .registered)
//        let formatter = ISO8601DateFormatter()
//        registered = formatter.date(from: registeredString) ?? Date()
//    }
//
//    // MARK: - Encodable
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(id, forKey: .id)
//        try container.encode(name, forKey: .name)
//        try container.encode(age, forKey: .age)
//        try container.encode(company, forKey: .company)
//        try container.encode(email, forKey: .email)
//        try container.encode(isActive, forKey: .isActive)
//        try container.encode(tags, forKey: .tags)
//        try container.encode(friends, forKey: .friends)
//
//        let formatter = ISO8601DateFormatter()
//        let registeredString = formatter.string(from: registered)
//        try container.encode(registeredString, forKey: .registered)
//    }
//}


