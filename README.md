#### Preview

<p align="center">
  <img src="https://github.com/Saydulayev/FriendBook/blob/main/FriendBook/Sreen./Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-12-17%20at%2013.23.36.png" width="300">
  <img src="https://github.com/Saydulayev/FriendBook/blob/main/FriendBook/Sreen./Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202024-12-17%20at%2013.24.07.png" width="300">
</p>

# FriendBook Challenge Project

This project is a solution to the "FriendBook" challenge from Paul Hudson’s "100 Days of SwiftUI." It demonstrates fetching JSON data from a remote server, decoding it into Swift models using `Codable`, and displaying it in a SwiftUI interface using `NavigationStack`, `List`, and detail views.

## Features

- **Networking with URLSession:**  
  Uses `URLSession` to asynchronously fetch JSON data from [Hacking with Swift's sample API](https://www.hackingwithswift.com/samples/friendface.json).

- **JSON Decoding with Codable:**  
  Implements `User` and `Friend` structs conforming to `Codable` to parse JSON data into strongly typed Swift models. It also uses the `.iso8601` dateDecodingStrategy to handle ISO 8601 date formats.

- **State Management with @Observable (Swift 5.9) or @State / @Published:**  
  Manages state and updates the UI automatically when data loads, ensuring a responsive user experience.

- **SwiftUI Views and Navigation:**  
  Implements a `NavigationStack` to present a list of users, and navigates to a detail view that displays additional user information, including their friends and tags. Each user's "active" status can also be displayed with a simple indicator.

- **Performance and UX Considerations:**  
  Checks if the data has already been loaded before performing a new fetch, reducing unnecessary network calls and improving performance.

## Technologies Used

- SwiftUI
- URLSession
- Codable & JSONDecoder
- ISO 8601 Date Parsing
- NavigationStack & List for UI
- Observable State Management (e.g., `@Observable` from Swift 5.9 or `@Published` in earlier versions)


## How to Run

1. Clone the repository.
2. Open the project in Xcode.
3. Run the app on the simulator or a real device.

You will see a loading indicator while the app fetches the data. Once complete, a list of users is presented, and tapping on a user navigates to a detail view showing their information, registration date, tags, and friends.
