//
//  DataLoader.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import SwiftData
import Foundation

@MainActor
class DataLoader {
    private let modelContext: ModelContext

    init(context: ModelContext) {
        self.modelContext = context
    }

    func fetchData() async {
        // Проверка, есть ли уже данные
        let existingUsers = try? modelContext.fetch(FetchDescriptor<User>())
        guard existingUsers?.isEmpty == true else {
            print("Data already loaded.")
            return
        }

        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }

        do {
            print("Starting data fetch...")
            let (data, response) = try await URLSession.shared.data(from: url)

            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                print("HTTP Error: \(httpResponse.statusCode)")
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try decoder.decode([User].self, from: data)

            // Сохранение данных в SwiftData
            for user in users {
                modelContext.insert(user)
            }
            try modelContext.save()
            print("Data successfully loaded into SwiftData.")
        } catch {
            print("Failed to load data: \(error.localizedDescription)")
        }
    }
}




