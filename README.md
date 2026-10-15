# CampuShare-X-SkillSwap
> **Share. Learn. Save.** — *For Engineering Students, By Engineering Students.*

**CampuShare × SkillSwap** is a campus-exclusive full-stack web ecosystem engineered to streamline peer-to-peer micro-learning, academic resource sharing, and circular commerce for undergraduate engineering students. Developed as a joint capstone project for **Full Stack Java Programming (FSJP)** and **Entrepreneurship Development (ED)** under the **University of Mumbai**.

---

## 🚀 Platform Modules

### 🛒 1. CampuShare (Campus Circular Marketplace)
* *"Share More. Spend Less. Waste Less."*
* **Peer-to-Peer Gear Exchange:** Buy, sell, or rent semester-specific essentials—textbooks, mini drafters, engineering drawing kits, scientific calculators, and lab coats—directly within a verified campus network.
* **Zero Shipping Friction:** Safe, same-day, in-person campus handoffs with category filtering (FE to BE, branch-wise subjects) and price/alphabetical sorting.

### 💡 2. SkillSwap (Learning, Networking & Earning Hub)
* **Academic E-Library:** Centralized repository for branch-wise syllabi, reference textbook PDFs, and Previous Years' Question Papers (PYQs).
* **1:1 Peer Mentorship:** Hourly mentorship booking portal where juniors book syllabus-specific or hackathon guidance and seniors monetize their academic expertise.
* **Curated Course Discovery:** Dynamic aggregator filtering verified certifications across technical domains and subjects.
* **Digital Community & SSO:** Unified student profile and identity verification across both modules.

---

## 🛠️ Technology Stack

| Layer | Technologies Used |
| :--- | :--- |
| **Frontend** | HTML5, CSS3, Tailwind CSS, Vanilla JavaScript |
| **Backend** | Java (JDK 8+), Java Servlets, Scriptlets |
| **Database & Connectivity** | MySQL 8.0, JDBC (`PreparedStatement` parameterized queries) |
| **Web Server** | Apache Tomcat (v9.0 / v10.0) |

---

## 🏗️ System & Database Architecture

The application follows a 3-tier client-server architecture powered by a **two-database, single-login (SSO)** structure:

1. **`ssxcs` (Core Identity & SkillSwap DB):**
   * `mastertable` — Manages single sign-on (SSO) student profiles, verified college emails, branches (`AI & DS`, `Computer`, `IT`, `EXTC`, `Mech`, `Applied Sciences`), and year of study.
   * `Mentorship_Sessions` & `ELibrary_Resources` — Tracks mentor bookings and study materials.
2. **`campushare_db` (Marketplace DB):**
   * `Marketplace_Listings` & `Transactions` — Stores physical gear listings and transaction logs linked via foreign key (`user_id`).

---

## ⚙️ Local Setup & Installation

1. **Clone the Repository:**
   ```bash
   git clone [https://github.com/chinmaypatil44/CampuShare-X-SkillSwap.git](https://github.com/chinmaypatil44/CampuShare-X-SkillSwap.git)
   ```
2. **Database Setup:**
   * Open **MySQL Workbench** and execute the SQL scripts in the `/database` folder to create `ssxcs` and `campushare_db`.
   * Update your MySQL username and password inside `DatabaseConnection.java`.
3. **Configure Apache Tomcat:**
   * Import the project into **Eclipse IDE / IntelliJ IDEA / VS Code** as a Dynamic Web Project.
   * Ensure `mysql-connector-j-8.x.jar` is placed inside `WEB-INF/lib/`.
   * Deploy the project on **Apache Tomcat (v9.0+)** and open `http://localhost:8080/CampuShare-X-SkillSwap/HomePg.html`.

---

## 👥 Team & Contributions

* **Chinmay Patil** — *Backend Integration, Co-Execution & Branding:* Proposed the project merger, co-implemented the MySQL layer, built core Java Servlets and JDBC data-access pipelines, and designed the logos for both platforms.
* **Gangotri N V** — *SkillSwap Lead, Database Architecture & Co-Execution:* Led the SkillSwap product vision, designed the database schema and pipelines, co-implemented the MySQL layer, and drove full-stack integration and documentation.
* **Himesh Pandey** — *CampuShare Lead & Financial Strategy:* Led the CampuShare module, unit economics, break-even modeling, and venture pitch strategy.
* **Rutuja Thakur** — *UI Asset & Icon Design:* Designed visual styling assets, custom iconography, and frontend presentation elements.
* **Suruchi Nagar** — *Content Architecture & Copywriting:* Authored platform copy across modules and structured project documentation.
* **Jagruti Tumbada** — *Academic Resource Curation:* Sourced, verified, and organized branch syllabi, textbook PDFs, and PYQs for the E-Library.
