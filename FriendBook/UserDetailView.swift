//
//  UserDetailView.swift
//  FriendBook
//
//  Created by Saydulayev on 17.12.24.
//

import SwiftUI

struct UserDetailView: View {
    let user: User

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Profile Header
                VStack(alignment: .center, spacing: 10) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.black)
                    
                    Text(user.name)
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.primary)
                    HStack {
                        Text("Company:")
                            .foregroundColor(.secondary)
                        Text(user.company)
                            .font(.headline)
                    }
                    HStack {
                        Circle()
                        .fill(user.isActive ? Color.green : Color.gray)
                        .frame(width: 10, height: 10)
                        Text(user.isActive ? "Active" : "Inactive")
                            .font(.subheadline)
                            .foregroundColor(user.isActive ? .green : .gray)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)

                Divider()

                // Personal Information
                VStack(alignment: .leading, spacing: 15) {
                    Text("Contact Information")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)

                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray)
                        Text(user.email)
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                    HStack(spacing: 15) {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        Text("Age: \(user.age)")
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                    HStack(spacing: 15) {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.gray)
                        Text("Registered: \(user.registered.formatted())")
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                    HStack(spacing: 15) {
                        Image(systemName: "tag.fill")
                            .foregroundColor(.gray)
                        Text("Tags: \(user.tags.joined(separator: ", "))")
                            .font(.body)
                            .foregroundStyle(.primary)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(.tertiarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: Color.black.opacity(0.05), radius: 6, x: 0, y: 2)


                Divider()

                // Friends Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Business Contacts")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.primary)

                    VStack(spacing: 8) {
                        ForEach(user.friends) { friend in
                            HStack {
                                Image(systemName: "person.fill")
                                    .foregroundColor(.gray)
                                Text(friend.name)
                                    .font(.body)
                                    .foregroundStyle(.primary)
                                Spacer()
                            }
                            .padding(8)
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(8)
                            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 2)
                        }
                    }
                }
               
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.indigo.opacity(0.2))
        .scrollBounceBehavior(.basedOnSize)
    }
}





//#Preview {
//    UserDetailView(user: User.init(id: UUID(), name: "Saydulayev", age: 25, company: "SwiftUI", email: "saydulayev@gmail.com", isActive: true, registered: Date(), tags: ["SwiftUI", "UIKit", "SwiftUI"], friends: []))
//}
