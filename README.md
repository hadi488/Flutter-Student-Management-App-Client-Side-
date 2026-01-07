# Student Management System

A comprehensive mobile application built with **Flutter** for managing student records. This project demonstrates a complete **CRUD** implementation with local **SQLite** storage, featuring a polished UI and a robust dual-theme system.

---

### 🚀 Key Features

- **Local Persistence**: All data is stored locally using `sqflite`, ensuring the app works perfectly offline.
- **Smart Dark Mode**: Built-in Light and Dark themes that adapt to system settings. Includes a manual toggle for instant switching with adaptive colors for reduced eye strain.
- **Smart Add & Update**: A single, efficient screen handles both adding new students and updating existing ones. It pre-fills data for updates and validates inputs to ensure data integrity.
- **Advanced Search**: Filter students instantly by **ID**, **Name**, or **Father's Name**. Deletions can be performed directly from search results.
- **Input Validation**: Secure form handling prevents empty or invalid entries during record creation and updates.

---

### 🛠️ Tech Stack

- **Flutter & Dart**: Core framework and language.
- **SQLite (sqflite)**: High-performance local database engine.
- **MVC Architecture**: Clean separation of Models, Views, and Controllers (Logic).

---

### 📸 App Screenshots

| Dashboard (Light) | Dark Mode | Search Interface |
|:-----------------:|:---------:|:----------------:|
| ![Dashboard](screenshots/dashboard.png) | ![Dark Mode](screenshots/dark_mode.png) | ![Search](screenshots/search_screen.png) |

| Add Record | Update Record |
|:----------:|:-------------:|
| ![Add](screenshots/add_record.png) | ![Update](screenshots/update_screen.jpeg) |

---

### 🏃 How to Run

1. **Clone the repository**:
   ```bash
   https://github.com/hadi488/Flutter-Student-Management-App-Client-Side-.git
   ```
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the app**:
   ```bash
   flutter run
   ```
