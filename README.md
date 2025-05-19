# 🎁 WebsiteGifstore

WebsiteGifstore is a **Flask-based e-commerce platform** designed for a seamless and personalized shopping experience. Users can browse gift products, add items to their cart, manage their wallet balance, and complete purchases with ease. The application includes secure user authentication and a responsive frontend for an engaging user experience.

---

## 🚀 Features

- **User Authentication** 🔒: Secure signup and login functionality.
- **Product Search** 🔍: Search for products by name or description.
- **Shopping Cart** 🛒: Add, update, or remove products from the cart.
- **Wallet System** 💳: Add funds to a wallet and use them for purchases.
- **Order Management** 📦: View past orders and purchase history.
- **Contact & Feedback** 📬: Submit feedback via a contact form.
- **Responsive Design** 📱: Mobile-friendly UI with Bootstrap.

---

## 🧠 Technologies Used

| **Layer**            | **Technology**           |
|-----------------------|--------------------------|
| **Backend**           | Flask                   |
| **Database**          | MySQL + SQLAlchemy      |
| **Frontend**          | HTML, CSS, Bootstrap    |
| **Template Engine**   | Jinja2                  |

---

## 📁 Directory Structure

```
WebsiteGifstore
├── templates/                 # HTML templates for frontend
│   ├── index.html            # Homepage
│   ├── search_results.html   # Search results page
│   ├── main_search.html      # Main search page
│   ├── login.html            # Login page
│   ├── signup.html           # Signup page
│   ├── main.html             # User profile page
│   ├── contact.html          # Contact form
│   ├── about.html            # About page
│   ├── main_about.html       # Main about page
│   ├── main_contact.html     # Main contact page
│   ├── carouselbirthday.html # Birthday gift carousel
│   ├── carouselcake.html     # Cake gift carousel
│   ├── carouselflower.html   # Flower gift carousel
│   ├── persionalized.html    # Personalized gift page
│   ├── main_birthday.html    # Main birthday gifts page
│   ├── main_cake.html        # Main cake gifts page
│   ├── main_flower.html      # Main flower gifts page
│   ├── main_personal.html    # Main personalized gifts page
│   ├── main_prof.html        # Main profile page
│   ├── cart.html             # Shopping cart page
│   ├── wallet.html           # Wallet management page
│   ├── order.html            # Order history page
├── static/                   # Static assets
│   ├── css/                  # CSS styles
│   ├── js/                   # JavaScript files
├── app.py                    # Main Flask application
├── requirements.txt          # Python dependencies
└── README.md                 # Project documentation
```

---

## ✅ Prerequisites

Ensure the following are installed on your system:
- 🐍 Python 3.8+
- 🗄 MySQL Database
- 📦 Flask
- 🛠 SQLAlchemy
- 🔗 PyMySQL

---

## 📦 Installation & Running Locally

Follow these steps to set up and run the project on your machine:

### 1. Clone the Repository
```bash
git clone https://github.com/Sachin22424/WebsiteGiftstore
cd your-repo
```

### 2. Create and Activate a Virtual Environment
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
```

### 3. Install Dependencies
Option 1: Install individually
```bash
pip install flask
pip install sqlalchemy
pip install pymysql
```

Option 2: Install from requirements.txt
```bash
pip install -r requirements.txt
```

### 4. Set Up the Database
- The database is hosted online. Configure the connection details in `app.py` using the provided credentials.

### 5. Run the Application
```bash
flask run
```
- Access the application at `http://localhost:5000`.

---
