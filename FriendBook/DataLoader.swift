//
//  DataLoader.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import Foundation
import Observation


@MainActor
@Observable
class DataLoader {
    var users: [User] = []
    private let urlString = "https://www.hackingwithswift.com/samples/friendface.json"

    func fetchData() async {
        guard users.isEmpty else {
            print("Data already loaded.")
            return
        }

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        let session = URLSession(configuration: .default)

        do {
            print("Starting data fetch...")
            let (data, response) = try await session.data(from: url)
            
            // Проверка на успешный HTTP-ответ
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                print("HTTP Error: \(httpResponse.statusCode)")
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode([User].self, from: data)
            
            // Валидация данных
            guard !decodedUsers.isEmpty else {
                print("No users found in data.")
                return
            }
            
            users = decodedUsers
            print("Data successfully loaded.")
            
        } catch let DecodingError.dataCorrupted(context) {
            print("Decoding error: Data corrupted: \(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Decoding error: Missing key '\(key.stringValue)' in \(context)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Decoding error: Type mismatch \(type) in \(context)")
        } catch {
            print("Failed to load data: \(error.localizedDescription)")
        }
    }
}


