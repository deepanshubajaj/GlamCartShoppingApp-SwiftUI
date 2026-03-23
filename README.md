<h1 align="center">GlamCart - iOS App</h1>

<p align="center">
  <img src="https://img.shields.io/badge/swift-5.0-orange" alt="Swift Badge" />
  <img src="https://img.shields.io/badge/platform-iOS-blue" alt="Platform Badge" />
  <img src="https://img.shields.io/badge/architecture-MVVM-purple" alt="Architecture Badge" />
  <img src="https://img.shields.io/badge/license-Apache--2.0-green" alt="License Badge" />
  <img src="https://img.shields.io/github/last-commit/deepanshubajaj/GlamCartShoppingApp-SwiftUI" alt="Last Commit" />
  <img src="https://img.shields.io/github/stars/deepanshubajaj/GlamCartShoppingApp-SwiftUI?style=social" alt="GitHub Stars" />
</p>

**GlamCart** is a clean and functional iOS shopping app built with **SwiftUI**. It demonstrates a complete e-commerce flow (browse, search, favorites, cart, checkout) using **MVVM** and a lightweight Swift Package (`DummyAPI`) that consumes the **DummyJSON** API.

---

## ✨ Features:

- **Authentication**: Login plus local sign-up persisted with `UserDefaults`.
- **Browse Products**: Grid-based catalog with pagination / infinite scrolling.
- **Search & Filters**: Search by product name and apply sorting/filter options.
- **Product Details**: Detailed product view with images, rating, and pricing.
- **Favorites**: Save products for quick access.
- **Cart & Checkout**: Quantity stepper, totals, and a complete-order flow.
- **Profile**: User details, address, card info, and sign-out.

---

## 📦 Requirements:

- iOS 16.0+
- Xcode 14+
- Swift 5.0+

---

## ⛓ Project Structure:

    GlamCartShoppingApp-SwiftUI
    .
    ├── DummyAPI                 # Swift Package (DummyJSON API wrapper)
    ├── Shopping                 # Main iOS app target
    │   ├── App                  # App entry + global UI appearance
    │   ├── Core                 # Feature modules (Home, Auth, Cart, etc.)
    │   ├── CustomViews          # Reusable UI components
    │   ├── Helpers              # Colors, view modifiers, utilities
    │   ├── Managers             # Storage / managers
    │   └── Resources            # Assets, previews
    ├── ShoppingTests
    └── ShoppingUITests

---

## 🛠️ Installation:

1. Clone the repository:
   ```bash
   git clone https://github.com/deepanshubajaj/GlamCartShoppingApp-SwiftUI.git
   ```

2. Open in Xcode:
   ```bash
   open Shopping.xcodeproj
   ```

3. Build and run on a simulator or device.

---

## 🌐 APIs:

- [DummyJSON](https://dummyjson.com)

<p align="center">
  <img src="ProjectOutputs/Snapshots/dummyJSON.png" alt="Dummy json"/>
</p>

---

## 🛠 Technologies Used:

- **SwiftUI** — UI development
- **MVVM** — separation of concerns
- **Swift Package Manager** — local `DummyAPI` package
- **UserDefaults** — token + signup persistence

---

## 🎨 App Look:

<p align="center">
  <img src="ProjectOutputs/Snapshots/appLookB.jpg" alt="App Look B" width="30%" />
</p>
<p align="center">
  *App snapshot in the simulator.*
</p>

---

## 🖼️ Screenshots:

<p align="center">
  <img src="ProjectOutputs/Snapshots/SScreen.jpg" alt="Splash Screen 0D" width="30%" />
</p>

<p align="center">
  *Splash screen displayed upon app launch.*
</p>

##

<p align="center">
    <img src="ProjectOutputs/Snapshots/mainScreenD1.jpg" alt="Main Screen 1D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD2.jpg" alt="Main Screen 2D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD3.jpg" alt="Main Screen 3D" width="30%" />
</p>

##

<p align="center">
    <img src="ProjectOutputs/Snapshots/mainScreenD4.jpg" alt="Main Screen 4D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD5.jpg" alt="Main Screen 5D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD6.jpg" alt="Main Screen 6D" width="30%" />
</p>

##

<p align="center">
    <img src="ProjectOutputs/Snapshots/mainScreenD7.jpg" alt="Main Screen 7D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD8.jpg" alt="Main Screen 8D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD9.jpg" alt="Main Screen 9D" width="30%" />
</p>

##

<p align="center">
    <img src="ProjectOutputs/Snapshots/mainScreenD10.jpg" alt="Main Screen 10D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD11.jpg" alt="Main Screen 11D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD12.jpg" alt="Main Screen 11bD" width="30%" />
</p>

##

<p align="center">
    <img src="ProjectOutputs/Snapshots/mainScreenD13.jpg" alt="Main Screen 11bD" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD14.jpg" alt="Main Screen 12D" width="30%" />
    <img src="ProjectOutputs/Snapshots/mainScreenD11.jpg" alt="Main Screen 13D" width="30%" />
</p>


<p align="center">
  *Screenshots of the GlamCart App showing different screens*
</p>

---

## 📱 App Icon:

<p align="center">
  <img src="ProjectOutputs/Snapshots/appIcon.png" alt="App Icon" width="30%" />
</p>
<p align="center">
  *The App Icon reflects the GlamCart Look*
</p>

---

## 🚀 Video Demo:

Here’s a short video showcasing the app's functionality:

<p align="center">
  <img src="ProjectOutputs/WorkingVideo/WorkingVideoD.gif" alt="Working App 1" width="30%" />
</p>

➤ <a href="ProjectOutputs/WorkingVideo/WorkingVideoD.MP4">🎥 Watch Working Video</a>

---

## 🤝 Contributing:

Thank you for your interest in contributing to this project!  
I welcome contributions from the community.

- You are free to use, modify, and redistribute this code under the terms of the **Apache-2.0 License**.
- If you'd like to contribute, please **open an issue** or **submit a pull request**.
- All contributions will be reviewed and approved by the author — **[Deepanshu Bajaj](https://github.com/deepanshubajaj?tab=overview&from=2025-03-01&to=2025-03-31)**.

---

### 📌 How to Contribute:

To contribute:

1. Fork the repository.

2. Create a new branch:
   ```bash
    git checkout -b feature/your-feature-name
   ```

3. Commit your changes:
   ```bash
    git commit -m 'Add your feature'
   ```

4. Push to the branch:
   ```bash
    git push origin feature/your-feature-name
   ```

5. Open a pull request.

---

## 📃 License:

This project is licensed under the [Apache-2.0 License](./LICENSE).  
You are free to use this project for personal, educational, or commercial purposes — just make sure to provide proper attribution.

> **Clarification:** Commercial use includes, but is not limited to, use in products,  
> services, or activities intended to generate revenue, directly or indirectly.

