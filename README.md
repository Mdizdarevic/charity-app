# Cherry-T App
A Flutter application that allows users to search for IRS-verified non-profits via the Every.org API.

## Live Web App: [https://mdizdarevic.github.io/charity-app/](https://mdizdarevic.github.io/charity-app/)

---

# Learning Outcomes

### LO1: 
**Implementation:** Permissions added for device hardware management for profile photo feature
**Location:** `android/app/src/main/AndroidManifest.xml` `lib/presentation/auth/screen/auth_screen.dart`

### LO2: 
**Implementation:** Implemented Clean architecture (data, domain, presentation) to show separation of concerns in the code
**Location:** `lib`

### LO3: 
**Implementation:** Developed custom animation to improve user experience of favoriting charities
**Location:** `lib/presentation/charities/screen/charity_details_screen`

### LO4: 
**Implementation:** Developed complex UI elements (widgets) which react to user interaction
**Location:** `lib/presentation/core/widget/custom_action_button.dat`  `../../widget/custom_text_field.dat`

### LO5: 
**Implementation:** Integrate external frameworks like Firebase into your application for authentication
**Location:** `lib/data/client/firebase_auth.dart`  `lib/presentation/auth/notifier/auth_notifier.dart`

### LO6: 
**Implementation:** Use the Hive database to cache search history data
**Location:** `lib/data/local/search_history_service.dart`.

### LO7:
**Implementation:** Used `async/await` syntax with a 10-second `.timeout()`, and implemented a `try-catch` block specifically for `http.ClientException` to handle network failures.
**Location:** `lib/data/client/charity_api_client.dart` 

---
