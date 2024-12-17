//
//  ContentView.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import SwiftUI

struct ContentView: View {
    @State private var dataLoader = DataLoader()

    var body: some View {
        NavigationStack {
            // Проверка, загружены ли данные
            if dataLoader.users.isEmpty {
                VStack {
                    ProgressView("Loading users...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                    Text("If this takes too long, please check your connection.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(dataLoader.users) { user in
                        NavigationLink(destination: UserDetailView(user: user)) {
                            HStack {
                                Circle()
                                    .fill(user.isActive ? Color.green : Color.gray)
                                    .frame(width: 10, height: 10)
                                Text(user.name)
                                    .font(.headline)
                            }
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("Users")
            }
        }
        .task {
            await dataLoader.fetchData()
        }
    }
}





#Preview {
    ContentView()
}
