# Flutter Developer Test Case

## 📌 Project Overview
This Flutter project was developed as part of a technical assessment for a Flutter Developer position. The application includes authentication, an infinite scrolling home page, a profile section, and smooth navigation. Most features were implemented beyond the requirements, with only Firebase integration omitted from the bonus section.

---

## 📱 Features Implemented

### 🔑 Authentication (Login & Register)
- User login and registration functionality.
- Secure storage of session tokens.
- Automatic redirection to the home page upon successful login.

### 🏠 Home Page (Discover)
- Infinite scroll implementation (lazy loading movies 5 at a time).
- Automatic loading indicator.
- Pull-to-refresh functionality.
- Real-time UI updates when favoriting/unfavoriting movies.

### 👤 Profile Page
- Displays user information.
- Shows a list of favorite movies.
- Allows users to upload and change their profile picture.

### 🔀 Navigation
- Bottom Navigation Bar for seamless page transitions.
- Maintains state across navigation.

### 🎁 Limited Offer Bottom Sheet
- Custom bottom sheet implementation for limited-time offers.

---

## 🎯 Bonus Features Implemented
✅ **State Management**: Riverpod used for efficient state handling.
✅ **Animations**: Smooth UI transitions with Lottie.
✅ **Secure Token Management**: Session tokens stored securely.
✅ **Splash Screen & App Icon**: Added branded splash screen & custom app icon.
✅ **Logger Implementation**: Logs structured for debugging & error handling.
✅ **Multi-language Support**: Localization for multiple languages.

❌ **Firebase Integrations (Crashlytics & Analytics) Not Implemented**





## 📸 Screenshots
| Login | Home Page | Profile |
|-------|----------|---------|
| ![Login Screen](screenshots/login.png) | ![Home Screen](screenshots/home.png) | ![Profile Screen](screenshots/profile.png) |

---

## 🚀 Installation & Setup
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/flutter_test_case.git
   ```
2. **Navigate to the Project Folder:**
   ```sh
   cd flutter_test_case
   ```
3. **Install Dependencies:**
   ```sh
   flutter pub get
   ```
4. **Run the App:**
   ```sh
   flutter run
   ```

---

## 📜 License
This project is open-source and available for modification.

---

## 📧 Contact
For any questions, feel free to reach out via [GitHub Issues](https://github.com/yourusername/flutter_test_case/issues).
