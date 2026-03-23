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

## Features

- **Authentication**: Login plus local sign-up persisted with `UserDefaults`.
- **Browse Products**: Grid-based catalog with pagination / infinite scrolling.
- **Search & Filters**: Search by product name and apply sorting/filter options.
- **Product Details**: Detailed product view with images, rating, and pricing.
- **Favorites**: Save products for quick access.
- **Cart & Checkout**: Quantity stepper, totals, and a complete-order flow.
- **Profile**: User details, address, card info, and sign-out.

---

## Requirements

- iOS 16.0+
- Xcode 14+
- Swift 5.0+

---

## Project Structure

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

## Installation

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

## APIs

- [DummyJSON](https://dummyjson.com)

---

## Technologies Used

- **SwiftUI** — UI development
- **MVVM** — separation of concerns
- **Swift Package Manager** — local `DummyAPI` package
- **UserDefaults** — token + signup persistence

---

## App Preview

https://github.com/user-attachments/assets/66d83048-3a0c-4541-a15c-150d465e102e

---

## Contributing

Contributions are welcome:
- Open an issue for bugs/ideas, or submit a pull request.

---

## License

This project is licensed under the [Apache-2.0 License](./LICENSE).

---

## Author

Deepanshu Bajaj — https://github.com/deepanshubajaj
