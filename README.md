# 📅 Timetable Scraper  
## _Automated SICSR Timetable to Google Sheets_

[![Dart](https://img.shields.io/badge/Dart-3-blue.svg)](https://dart.dev/)  
[![CLI](https://img.shields.io/badge/Type-CLI-green)](#)  
[![Google Sheets](https://img.shields.io/badge/Google%20Sheets-Automated-brightgreen)](#)

**Timetable Scraper** is a Dart-based command-line tool that automatically:

- Scrapes daily timetable data from the SICSR website  
- Filters only your relevant BCA Sem VI classes  
- Formats the data cleanly  
- Sends it to Google Sheets via Apps Script  
- Works automatically for the next 7 days  

It is designed using **modular, industry-style architecture** with clear separation of concerns.

---

## ✨ What it does

- You run one command  
- It fetches timetable for today + next 6 days  
- Extracts only *your* classes  
- Sends them to Google Sheets automatically  
- No manual copying, no Excel work  

**Magic? No. Just automation.**

---

## 🚀 Features

- ✔️ Web scraping using `html` parser  
- ✔️ Clean data model (`ClassSession`)  
- ✔️ Service-based architecture  
- ✔️ Google Sheets sync via Apps Script  
- ✔️ Automatic 7-day date iteration  
- ✔️ Modular & maintainable code  
- ✔️ Easy to debug and extend  

---

## 📁 Project Structure

bin/
└── main.dart

lib/
├── models/
│ └── class_session.dart
│
├── services/
│ ├── timetable_service.dart
│ └── sheets_service.dart
│
└── constants.dart


---

## 🧠 Architecture

| Component | Responsibility |
|-----------|---------------|
| **ClassSession (Model)** | Represents one class entry |
| **TimetableService** | Scrapes the website |
| **SheetsService** | Sends data to Google Sheets |
| **Constants** | Stores URLs |
| **main.dart** | Controls program flow |

---

## 🛠️ Tech Stack

This project is built with:

- [Dart](https://dart.dev/) — Core language  
- [http](https://pub.dev/packages/http) — Network requests  
- [html](https://pub.dev/packages/html) — Web scraping  
- [intl](https://pub.dev/packages/intl) — Date formatting  
- Google Apps Script — Sheets automation  

---

## 📦 Installation

Make sure you have **Dart installed**.

Then clone the repo and install dependencies:

```sh
git clone <your-repo-url>
cd timetable-scraper
dart pub get

▶️ How to Run
Run from project root:
dart run bin/main.dart

Example output:
Fetching for: 2026-01-17
Classes found: 2
Sent: BCA Sem VI Div A
Fetching for: 2026-01-18
Classes found: 1
Sent: BCA Sem VI (AIML)

📤 Google Sheets Setup
Create a Google Sheet
Open Extensions → Apps Script
Deploy as Web App
Copy the Web App URL
Paste it inside:
lib/constants.dart → sheetsWebhook
Your Apps Script should accept JSON and append rows.

🔍 Filtering Logic
Currently, the scraper sends only classes whose title contains:
"BCA Sem VI"

You can customize this inside:
lib/services/timetable_service.dart
