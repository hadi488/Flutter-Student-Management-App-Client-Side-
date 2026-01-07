# 🎓 Student Management System

A robust and beautifully designed mobile application built with **Flutter** for managing student records efficiently. This project demonstrates a complete **CRUD** (Create, Read, Update, Delete) implementation using a local **SQLite** database.

---

## ✨ Features

### 📋 Dashboard
- **View All Students**: Displays a comprehensive list of all stored student records.
- **Modern UI**: Uses elegant `Card` and `ListTile` layouts for a clean and professional look.
- **Easy Navigation**: Quick access to add new records or search existing ones via Floating Action Buttons.
- **Auto-Refresh**: real-time updates when records are modified or deleted.

### ➕ Add & Update Records
- **Dual-Purpose Screen**: A smart interface that handles both creating new entries and editing existing ones.
- **Input Validation**: Ensures no empty records are saved, maintaining data integrity.
- **User-Friendly Forms**: Centered layout with styled text fields, icons, and clear call-to-action buttons.

### 🔍 Advanced Search
- **Multi-Filter Search**: Find students by **ID**, **Name**, or **Father's Name**.
- **Unified Interface**: A clean, single-card search panel replacing cluttered buttons.
- **Direct Actions**: **Delete** students directly from the search results with immediate list updates.

### 🎨 Beautiful Design
- **Consistent Theme**: A polished **Cyan** color scheme applied globally across AppBars, buttons, and accents.
- **Material Design 3**: Utilizes modern material design principles for elevation, rounded corners, and typography.
- **Responsive Layouts**: Screens are optimized with scrollable views to handle various device sizes and keyboard interactions.

---

## 🛠️ Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Database**: [sqflite](https://pub.dev/packages/sqflite) (Local SQLite Storage)
- **Path Management**: [path](https://pub.dev/packages/path)
- **Architecture**: MVC Pattern (Model-View-Controller separation)

---

## 🚀 Getting Started

Follow these steps to run the project locally on your machine.

### Prerequisites
- Flutter SDK installed ([Guide](https://docs.flutter.dev/get-started/install))
- A reliable IDE (VS Code or Android Studio)
- An Android Emulator or Physical Device

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/student-management-app.git
   ```

2. **Navigate to Project Directory**
   ```bash
   cd student-management-app
   ```

3. **Install Dependencies**
   ```bash
   flutter pub get
   ```

4. **Run the App**
   ```bash
   flutter run
   ```

---

## 📂 Project Structure

```
lib/
├── database_helper.dart      # Singleton class managing SQLite database connection and CRUD operations
├── main.dart                 # Entry point, theme configuration, and route setup
├── model_student.dart        # Data model class for Student objects
├── screen_dashboard.dart     # Main screen displaying the list of students
├── screen_add_update_record.dart # Form screen for adding and updating student details
└── searching_screen.dart     # Search interface with filtering and deletion capabilities
```

---

## 📸 Screenshots

| Dashboard | Add Record | Update Record | Search |
|-----------|------------|---------------|--------|
| ![Dashboard](screenshots/dashboard.png) | ![Add Record](screenshots/add_record.png) | ![Update Record](screenshots/update_screen.jpeg) | ![Search](screenshots/search_screen.png) |



---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

---
**Developed with ❤️ using Flutter**
