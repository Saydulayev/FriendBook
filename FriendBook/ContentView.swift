//
//  ContentView.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//


import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\User.name)]) private var allUsers: [User]
    @State private var sortOrder: SortDescriptor<User> = SortDescriptor(\User.name)
    @State private var sortedUsers: [User] = []

    var body: some View {
        NavigationStack {
            if sortedUsers.isEmpty {
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
                    ForEach(sortedUsers) { user in
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
                .toolbar {
                    Menu("Sort", systemImage: "line.horizontal.3.decrease.circle") {
                        Picker("Sort by", selection: $sortOrder) {
                            Text("Name").tag(SortDescriptor(\User.name))
                            Text("Age").tag(SortDescriptor(\User.age))
                            Text("Registered").tag(SortDescriptor(\User.registered))
                        }
                        .onChange(of: sortOrder) {newValue, oldValue in
                            sortUsers()
                        }
                    }
                }

            }
        }
        .onAppear {
            sortUsers()
        }
        .task {
            let dataLoader = DataLoader(context: modelContext)
            await dataLoader.fetchData()
            sortUsers() // Обновляем данные после загрузки
        }
    }

    private func sortUsers() {
        sortedUsers = allUsers.sorted(using: [sortOrder])
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [User.self, Friend.self])
}












