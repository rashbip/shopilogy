## 🛍️ Shopilogy – Sneaker Shopping UI App

[![Flutter](https://img.shields.io/badge/Flutter-3.13.0-blue?logo=flutter\&logoColor=white)](https://flutter.dev/)
[![Provider](https://img.shields.io/badge/State%20Management-Provider-yellowgreen)](https://pub.dev/packages/provider)
[![Platform](https://img.shields.io/badge/Platform-Mobile%20%7C%20Web%20%7C%20Desktop-informational)]()
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

A sleek, cross-platform **Flutter UI** for a sneaker shopping experience. *Shopilogy* provides a modern, responsive interface featuring brand filtering, product detail views, and a mock cart system — built using `Provider` for state management.

---

## 📚 Table of Contents

* [Features](#features)
* [Screenshots](#screenshots)
* [Tech Stack & Architecture](#tech-stack--architecture)
* [Getting Started](#getting-started)
* [Installation](#installation)
* [Usage](#usage)
* [Design & UI](#design--ui)
* [Contributing](#contributing)
* [Release & Versioning](#release--versioning)
* [License](#license)
* [Acknowledgments](#acknowledgments)

---

## ✅ Features

* 🏷️ Filter products by brand (Nike, Adidas, Puma, etc.)
* 🖼️ Product detail page with image, price, and size selector
* 🛒 Add to cart functionality (mock with Provider)
* 🌗 Light & dark mode support
* 📱 Fully responsive: mobile, tablet, web, and desktop
* ⚙️ Modular and extensible Flutter UI
* 📦 Organized state management with `Provider`

---

## 📸 Screenshots

| Home Page                 | Product Details              | Add to Cart               |
| ------------------------- | ---------------------------- | ------------------------- |
| ![](screenshots/home.png) | ![](screenshots/details.png) | ![](screenshots/cart.png) |

---

## 🧱 Tech Stack & Architecture

* **Framework**: Flutter (3.x)
* **Language**: Dart
* **State Management**: [`provider`](https://pub.dev/packages/provider)
* **Architecture**: Modular UI components (not yet MVVM or BLoC)
* **Platform Support**: Android, iOS, Web, Desktop

*The app currently uses a simple UI-driven architecture with clean widget separation and centralized state handling via Provider.*

---

## 🚀 Getting Started

### ✅ Prerequisites

* Flutter SDK `>=3.13.0`
* Dart `>=3.1.0`
* IDE: VS Code, Android Studio, or any Flutter-compatible editor
* Device/emulator or web browser

---

## 🛠️ Installation

```bash
git clone https://github.com/yourusername/shopilogy.git
cd shopilogy
flutter pub get
```

Then run:

```bash
flutter run
```

To run for specific platforms:

```bash
flutter run -d chrome        # Web  
flutter run -d android       # Android  
flutter run -d windows       # Desktop  
```

---

## 📱 Usage

* Browse sneakers in a responsive layout
* Use filter chips to filter by brand
* Tap on a product to view details
* Select a size and add the product to cart
* UI updates dynamically using Provider

---

## 🎨 Design & UI

The UI is inspired by **Material 3** principles with:

* Clean cards and product chips
* Responsive `GridView` and `ListView` layouts
* Chip-based filtering
* Intuitive navigation with `Navigator.push`

Design is mobile-first but adapts well across screen sizes, including tablets and web.

---

## 🤝 Contributing

Contributions are welcome!
Want to fix a bug, add a feature, or improve documentation? Go for it.

### 🔧 How to Contribute

```bash
# Fork the repo
git checkout -b feature/your-feature-name
git commit -m "Add your feature"
git push origin feature/your-feature-name
```

Then open a Pull Request 🚀

Please follow consistent code style and include meaningful commit messages.

---

## 📦 Release & Versioning

We follow **Semantic Versioning**: `MAJOR.MINOR.PATCH`

### 📌 Current Version

`v1.0.0` – Initial release
🗓️ Date: 2025-10-16

Includes:

* Product grid/list
* Brand filtering
* Product detail screen
* Add to cart UI logic with Provider

### 🔮 Planned Features

* Search functionality
* Persistent cart storage (local or Firebase)
* Checkout screen
* User authentication
* Wishlist/favorites
* Localization (multi-language support)

---

## 📄 License

This project is licensed under the **MIT License**.
See [`LICENSE`](LICENSE) for details.

---

## 🧠 Acknowledgments

* Flutter & Dart Dev Team
* Provider package contributors
* Dribbble/Behance for UI inspiration
* Sneaker stores & mock data inspiration
