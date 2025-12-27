# Cherry-T App
A Flutter application that allows users to search for IRS-verified non-profits via the Every.org API.

## Live Web App: [https://mdizdarevic.github.io/charity-app/](https://mdizdarevic.github.io/charity-app/)

---

# Learning Outcomes

### LO1: Tooling and Environment
**Implementation:** Configured the Flutter SDK for web targets and managed the production build using the Flutter CLI.
**Location:** Project Root & GitHub Actions Tab.

### LO2: UI/UX Design and Implementation
**Implementation:** Built a responsive layout using `FutureBuilder` to toggle between a `CircularProgressIndicator` and a results list based on the connection state.
**Location:** `lib/screens/charity_search_screen.dart`.

### LO3: Software Architecture and Patterns
**Implementation:** Separated data fetching (Service) and data structure (Model) from the UI (View), following a clean architectural pattern.
**Location:** `lib/services/api_service.dart` and `lib/models/charity.dart`.

### LO4: Logic and State Management
**Implementation:** Utilized `setState` to update the UI when users type into the `TextEditingController` and added logic to prevent empty API queries.
**Location:** `lib/screens/charity_search_screen.dart`.

### LO5: Deployment and Distribution
**Implementation:** Deployed a compiled production build to GitHub Pages using the `--base-href` flag to match the repository name.
**Location:** `gh-pages` branch on GitHub.

### LO6: Data Management & Persistence
**Implementation:** Implemented local storage logic to save and retrieve search history strings, ensuring data persists after the app is closed.
**Location:** `lib/screens/charity_search_screen.dart`.

### LO7: Asynchronous Programming
**Implementation:** Used `async/await` syntax with a 10-second `.timeout()`, and implemented a `try-catch` block specifically for `http.ClientException` to handle network failures.
**Location:** `lib/services/api_service.dart` (Function: `getAllCharities`).

---
