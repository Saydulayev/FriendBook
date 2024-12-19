#### Preview

<p align="center">
  <img src="https://github.com/Saydulayev/FriendBook/blob/main/FriendBook/Sreen./Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-12-17%20at%2013.23.36.png" width="300">
  <img src="https://github.com/Saydulayev/FriendBook/blob/main/FriendBook/Sreen./Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-12-17%20at%2013.24.07.png" width="300">
</p>

## FriendBook Challenge Project

This project is a solution to the "FriendBook" challenge from Paul Hudson’s "100 Days of SwiftUI." It demonstrates fetching JSON data from a remote server, decoding it into Swift models using Codable, and displaying it in a SwiftUI interface. The project explores three different approaches to managing and persisting data, implemented in separate branches.


### Features

#### **Networking and JSON Decoding**
- **Server Data Fetching:** Uses `URLSession` to fetch JSON data from a remote API.
- **JSON Parsing with Codable:** Models conform to `Codable` for seamless JSON decoding, supporting ISO 8601 date parsing.

#### **Three Approaches to Data Management**
1. **Main Branch (Basic Codable Conformance):**
   - Uses structs with automatic `Codable` conformance.
   - Simple and clean approach without custom `CodingKeys` or manual decoding logic.

2. **`feature/custom-coding-keys`:**
   - Implements manual `CodingKeys` and custom `init(from:)`/`encode(to:)` methods for both `User` and `Friend`.
   - Provides precise control over how data is encoded and decoded.

3. **`feature/swiftdata-integration`:**
   - Integrates SwiftData to persist user data locally.
   - Models are annotated with `@Model`, enabling dynamic queries via `@Query`.
   - Combines Codable conformance and SwiftData persistence for a hybrid approach.

#### **Dynamic Sorting and Filtering**
- **Sorting:** Users can sort by name, age, or registration date using a `Picker` with `SortDescriptor`.
- **Filtering:** Local filtering enables dynamic updates to the list view without affecting the data source.

#### **SwiftUI Interface**
- **NavigationStack and List:** Displays a list of users and navigates to detailed user views showing friends, tags, and registration details.
- **Toolbar Menu:** Provides sorting options with a clean, intuitive UI.

---

### Technologies Used
- **SwiftUI:** Declarative UI framework for building user interfaces.
- **SwiftData:** Used in `feature/swiftdata-integration` for data persistence.
- **Codable & JSONDecoder:** Parsing and encoding JSON data.
- **SortDescriptor:** Enables dynamic sorting of list data.
- **State Management:** `@Query`, `@State`, `@Observable`, and `@Published`.

---

### Branches Overview

1. **`main` (Basic Codable):**
   - Models (`User`, `Friend`) rely on Swift’s automatic `Codable` conformance.
   - Ideal for lightweight use cases where simplicity is key.

2. **`feature/custom-coding-keys`:**
   - Adds custom `CodingKeys` and manual decoding/encoding logic.
   - Useful when more control over JSON parsing or encoding is required.

3. **`feature/swiftdata-integration`:**
   - Extends functionality by integrating SwiftData for local persistence.
   - Models are annotated with `@Model`, enabling seamless database integration and dynamic queries via `@Query`.

---

### How to Run

1. Clone the repository.
2. Open the project in Xcode.
3. Switch to the desired branch:
   - `main` for basic Codable functionality.
   - `feature/custom-coding-keys` for custom JSON handling.
   - `feature/swiftdata-integration` for local data persistence.
4. Run the app on a simulator or real device.

---

### Key Use Cases

1. **Explore Codable Basics:** Use the `main` branch for a straightforward implementation of data parsing.
2. **Implement Custom Codable Logic:** Switch to `feature/custom-coding-keys` for fine-grained control over JSON parsing and encoding.
3. **Add Persistence with SwiftData:** Leverage `feature/swiftdata-integration` for a scalable solution with local storage and dynamic queries.
