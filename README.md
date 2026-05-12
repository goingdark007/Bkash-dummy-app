# bKash Clone - Flutter UI Study

A dummy clone of the **bKash** app built with Flutter. This project focuses on replicating the UI/UX and smooth transitions of the popular MFS (Mobile Financial Service) application.

> **Note:** This is a static UI project developed for research and study purposes. All data is hardcoded, and there is no backend integration.

---

## 📸 Screenshots

| Splash Screen | Login Screen | Home Screen |
|:---:|:---:|:---:|
| <img width="147.5" height="300" alt="Screenshot_20260512_105400" src="https://github.com/user-attachments/assets/afb10dfd-1f1a-4330-bd6c-b8003f985d60" /> | <img width="147.5" height="300" alt="Screenshot_20260512_105408" src="https://github.com/user-attachments/assets/0149d672-98a0-47b1-be23-a61157cd675a" /> | <img width="147.5" height="300" alt="Screenshot_20260512_105426" src="https://github.com/user-attachments/assets/31232029-ae66-4c64-a058-ba5567d808aa" /> |

---

## ✨ Features & Animations

This project explores advanced Flutter animations and complex UI layouts:

- **Splash Screen:** Implementation of `ScaleTransition` for a smooth logo entry effect.
- **Navigation Transitions:** Custom `PositionTransition` between the Login and Home screens to mimic a native app feel.
- **Dynamic Home Layout:** An advanced `GridView` implementation showcasing bKash services.
- **Interactive Components:** Use of `AnimatedSize` within the grid to provide a responsive and fluid user experience when interacting with UI elements.
- **Pixel Perfect UI:** Hardcoded static views that closely resemble the actual bKash app interface.

## 🛠️ Built With

- [Flutter](https://flutter.dev/) - Framework
- [Dart](https://dart.dev/) - Language
- **Custom Animations:** ScaleTransition, PositionTransition, AnimatedSize.

## 📂 Project Structure

```text
lib/
├── main.dart             # App Entry Point
├── ui/
│   ├── screens/          # Splash, Login, and Home screens
│   ├── widgets/          # Reusable UI components (GridView items, etc.)
│   └── animations/       # Custom transition logic
└── assets/               # Images and icons used in the UI
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed.
- An IDE (VS Code or Android Studio).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/bkash_clone_dummy.git
   ```
2. Navigate to the project directory:
   ```bash
   cd bkash_clone_dummy
   ```
3. Get packages:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---
**Developed as part of the Ostad Flutter Batch 24.**
