# 💬 Real-Time Chat Application

A fully functional **real-time one-to-one chat application** built using **Flutter**, **Firebase**, and **GetX**.  
This project demonstrates real-world mobile application development, including authentication, real-time communication, state management, and scalable architecture.

---

## 📌 Project Overview

This Chat Application allows users to:
- Sign up and log in securely
- Add friends and start private conversations
- Send and receive messages in real time
- Restrict communication by blocking or unfriending users

The app is designed with a **clean UI**, **reactive state management**, and a **modular architecture**, making it scalable and easy to maintain.

---

## 🚀 Features

- 🔐 **Secure Authentication**
  - Firebase Authentication for user login and registration

- 💬 **Real-Time Messaging**
  - Instant message sending and receiving using Cloud Firestore

- 👥 **User Interaction Controls**
  - Users cannot send messages if blocked or unfriended

- ⚡ **State Management**
  - GetX for reactive UI updates, dependency injection, and routing

- 🎨 **Modern UI**
  - Clean and responsive Flutter UI with error handling

- 🧠 **Scalable Architecture**
  - MVC-inspired structure (Controllers, Services, Views)

---

## 🛠 Tech Stack

| Technology | Purpose |
|----------|--------|
| Flutter | Mobile app development |
| Dart | Programming language |
| Firebase Authentication | User authentication |
| Cloud Firestore | Real-time database |
| GetX | State management & navigation |

---

## 📂 Project Structure

```bash
lib/
├── controllers/      # Handles business logic and state
├── services/         # Firebase and backend-related services
├── views/            # UI screens
├── models/           # Data models
├── theme/            # App colors and styling
├── routes/           # Navigation management
└── main.dart         # App entry point
