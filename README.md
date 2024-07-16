# WebsiteGifstore
This project is a simple e-commerce website built using the HTML, Flask web framework, sqlalchemy and sql for database. It allows users to browse products, add them to their cart, manage their wallet balance, and checkout their orders. The site includes authentication features such as login and signup, and ensures a personalized shopping experience.

How to Run:


Clone the Repository

    git clone https://github.com/your-username/your-repo.git
    cd your-repo

Create and Activate a Virtual Environment

    python3 -m venv venv
    source venv/bin/activate  # On Windows use `venv\Scripts\activate`


Install the Requirements

    pip install flask
    pip install sqlalchemy

    
OR


Install the Dependencies

    pip install -r requirements.txt

Set Up the Database

It is hosted online; you can use the same database connection details in the Flask app configuration.

Running the Application

After installing the dependencies and setting up the database, run the application using:

    flask run

    

-Commerce Web Application
This project is a Flask-based web application that serves as an e-commerce platform. It allows users to sign up, log in, search for products, add items to a shopping cart, manage their cart, make purchases using a wallet system, and view order history.

Features
User Authentication: Users can sign up and log in.
Product Search: Users can search for products by name or description.
Shopping Cart: Users can add, update, and remove products from their shopping cart.
Wallet System: Users can add funds to their wallet and use it to purchase items.
Order Management: Users can view their past orders.
Contact and Feedback: Users can submit feedback through a contact form.
Technologies Used
Flask: For web framework.
SQLAlchemy: For database interaction.
MySQL: As the database.
HTML/CSS: For front-end rendering.
Bootstrap: For responsive design.
Jinja2: For template rendering.

Prerequisites

Python 3.x
MySQL Database
Flask
SQLAlchemy
PyMySQL


Directory Structure
.
├── templates
│   ├── index.html
│   ├── search_results.html
│   ├── main_search.html
│   ├── login.html
│   ├── signup.html
│   ├── main.html
│   ├── contact.html
│   ├── about.html
│   ├── main_about.html
│   ├── main_contact.html
│   ├── carouselbirthday.html
│   ├── carouselcake.html
│   ├── carouselflower.html
│   ├── persionalized.html
│   ├── main_birthday.html
│   ├── main_cake.html
│   ├── main_flower.html
│   ├── main_personal.html
│   ├── main_prof.html
│   ├── cart.html
│   ├── wallet.html
│   ├── order.html
├── static
│   ├── css
│   ├── js
├── app.py
├── requirements.txt
└── README.md

Important Routes
Home: /
Search: /search, /mainsearch
User Authentication: /login, /signup
User Profile: /main
Contact: /contact, /main_contact
About: /about, /main_about
Product Categories: /carouselbirthday, /carouselcake, /carouselflower, /persionalized, /mainbirthday, /maincake, /mainflower, /mainpersonal
Cart Management: /cart, /cart/add, /cart/update, /remove_from_cart
Wallet Management: /wallet
Checkout: /checkout
Order Management: /order
