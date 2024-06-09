from flask import Flask, render_template, request, redirect, url_for, session, flash
from sqlalchemy import create_engine, text
from sqlalchemy.exc import IntegrityError

app = Flask(__name__)
app.secret_key = 'a_random_secure_secret_key'

hostname = "bnmxmc1oa4gjmdzpizlf-mysql.services.clever-cloud.com"
db_name = "bnmxmc1oa4gjmdzpizlf"
username = "ut66dkwvd5yvmkwg"
password = "uWfo0yELOLwLRF4vE603"
port = 3306

# Create engine
engine = create_engine(f'mysql+pymysql://{username}:{password}@{hostname}:{port}/{db_name}?charset=utf8mb4')

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/search', methods=['GET', 'POST'])
def search():
    if request.method == 'POST':
        search_query = request.form['search_query']
        with engine.connect() as connection:
            result = connection.execute(
                text("SELECT * FROM products WHERE name LIKE :search_query OR description LIKE :search_query"),
                {"search_query": f"%{search_query}%"}
            )
            products = result.fetchall()
        return render_template('search_results.html', products=products, search_query=search_query)
    return redirect(url_for('home'))

@app.route('/mainsearch', methods=['GET', 'POST'])
def mainsearch():
    if request.method == 'POST':
        search_query = request.form['search_query']
        with engine.connect() as connection:
            result = connection.execute(
                text("SELECT * FROM products WHERE name LIKE :search_query OR description LIKE :search_query"),
                {"search_query": f"%{search_query}%"}
            )
            products = result.fetchall()
        return render_template('main_search.html', products=products, search_query=search_query)
    return redirect(url_for('home'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        sql = text("SELECT * FROM users WHERE email = :email")
        with engine.connect() as connection:
            result = connection.execute(sql, {'email': email}).mappings().fetchone()

        if result and result['password'] == password:
            session['user_id'] = result['id']
            session['user_name'] = result['first_name']
            session['login_success'] = True 
            return redirect(url_for('main'))
        else:
            return render_template('login.html', error="Invalid email or password")

    signup_success = session.pop('signup_success', None)
    return render_template('login.html', signup_success=signup_success)

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        first_name = request.form['first_name']
        last_name = request.form['last_name']
        phone = request.form['phone']
        email = request.form['email']
        street = request.form['street']
        city = request.form['city']
        landmark = request.form['landmark']
        state = request.form['states']
        pincode = request.form['pincode']
        dob = request.form['dob']
        password = request.form['password']

        sql_check_email = text("SELECT * FROM users WHERE email = :email")
        with engine.connect() as connection:
            result = connection.execute(sql_check_email, {'email': email}).mappings().fetchone()

        if result:
            return render_template('signup.html', error="Email already registered")

        sql_insert = text("""
            INSERT INTO users (first_name, last_name, phone, email, street, city, landmark, state, pincode, dob, password)
            VALUES (:first_name, :last_name, :phone, :email, :street, :city, :landmark, :state, :pincode, :dob, :password)
        """)

        with engine.connect() as connection:
            connection.execute(sql_insert, {
                'first_name': first_name,
                'last_name': last_name,
                'phone': phone,
                'email': email,
                'street': street,
                'city': city,
                'landmark': landmark,
                'state': state,
                'pincode': pincode,
                'dob': dob,
                'password': password
            })
            connection.commit()

        session['signup_success'] = True
        return redirect(url_for('login'))

    return render_template('signup.html')

@app.route('/main')
def main():
    if 'user_id' not in session:
        return redirect(url_for('login'))
    
    login_success = session.pop('login_success', None) 
    return render_template('main.html', login_success=login_success)

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    session.pop('user_name', None)
    return redirect(url_for('home'))

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/main_about')
def main_about():
    return render_template('main_about.html')

@app.route('/main_contact' , methods=['GET', 'POST'])
def main_contact():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        message = request.form['message']

        sql_insert = text("""
            INSERT INTO contact (name, email, message)
            VALUES (:name, :email, :message)
        """)

        with engine.connect() as connection:
            connection.execute(sql_insert, {
                'name': name,
                'email': email,
                'message': message
            })
            connection.commit()

        session['contact_success'] = True
        flash('Your feedback is submitted successfully', 'success')
        return redirect(url_for('main_contact'))
    return render_template('main_contact.html')

@app.route('/carouselbirthday')
def carouselbirthday():
    return render_template('carouselbirthday.html')

@app.route('/carouselcake')
def carouselcake():
    return render_template('carouselcake.html')

@app.route('/carouselflower')
def carouselflower():
    return render_template('carouselflower.html')

@app.route('/persionalized')
def persionalized():
    return render_template('persionalized.html')

@app.route('/mainbirthday')
def mainbirthday():
    return render_template('main_birthday.html')

@app.route('/maincake')
def maincake():
    return render_template('main_cake.html')

@app.route('/mainflower')
def mainflower():
    return render_template('main_flower.html')

@app.route('/mainpersonal')
def mainpersonal():
    return render_template('main_personal.html')

@app.route('/mainprof')
def mainprof():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']

    sql = text("SELECT * FROM users WHERE id = :user_id")
    with engine.connect() as connection:
        user = connection.execute(sql, {'user_id': user_id}).mappings().fetchone()

    if user:
        return render_template('main_prof.html', user=user)
    else:
        return redirect(url_for('login'))

@app.route('/cart')
def cart():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    sql = text("""
        SELECT p.id, p.name, p.price, c.quantity, p.price * c.quantity as total_price, p.image_url as image
        FROM cart c
        JOIN products p ON c.product_id = p.id
        WHERE c.user_id = :user_id
    """)

    with engine.connect() as connection:
        cart_items = connection.execute(sql, {'user_id': user_id}).mappings().all()
        total_amount = sum(item['total_price'] for item in cart_items)

    return render_template('cart.html', cart_items=cart_items, total_amount=total_amount)

@app.route('/cart/add', methods=['POST'])
def add_to_cart():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    product_id = request.form['id']

    sql_check = text("SELECT * FROM cart WHERE user_id = :user_id AND product_id = :product_id")
    sql_insert = text("INSERT INTO cart (user_id, product_id, quantity) VALUES (:user_id, :product_id, 1)")
    sql_update = text("UPDATE cart SET quantity = quantity + 1 WHERE user_id = :user_id AND product_id = :product_id")

    with engine.connect() as connection:
        result = connection.execute(sql_check, {'user_id': user_id, 'product_id': product_id}).fetchone()
        if result:
            connection.execute(sql_update, {'user_id': user_id, 'product_id': product_id})
        else:
            connection.execute(sql_insert, {'user_id': user_id, 'product_id': product_id})
        connection.commit()

    return redirect(url_for('cart'))

@app.route('/cart/update', methods=['POST'])
def update_cart():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    product_id = request.form['product_id']
    action = request.form['action']

    sql_check = text("SELECT quantity FROM cart WHERE user_id = :user_id AND product_id = :product_id")
    sql_update = text("UPDATE cart SET quantity = quantity + :increment WHERE user_id = :user_id AND product_id = :product_id")
    sql_delete = text("DELETE FROM cart WHERE user_id = :user_id AND product_id = :product_id")

    with engine.connect() as connection:
        result = connection.execute(sql_check, {'user_id': user_id, 'product_id': product_id}).fetchone()
        
        if result:
            quantity = result['quantity'] if isinstance(result, dict) else result[0]
            if action == 'increment':
                connection.execute(sql_update, {'increment': 1, 'user_id': user_id, 'product_id': product_id})
            elif action == 'decrement':
                if quantity > 1:
                    connection.execute(sql_update, {'increment': -1, 'user_id': user_id, 'product_id': product_id})
                else:
                    connection.execute(sql_delete, {'user_id': user_id, 'product_id': product_id})
            connection.commit()

    return redirect(url_for('cart'))

@app.route('/remove_from_cart', methods=['POST'])
def remove_from_cart():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    product_id = request.form['product_id']

    sql = text("""
        DELETE FROM cart
        WHERE user_id = :user_id AND product_id = :product_id
    """)
    with engine.connect() as connection:
        connection.execute(sql, {'user_id': user_id, 'product_id': product_id})

    return redirect(url_for('cart'))

@app.route('/wallet', methods=['GET', 'POST'])
def wallet():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']

    if request.method == 'POST':
        amount = float(request.form['amount'])
        sql_insert_update = text("""
            INSERT INTO wallet (user_id, balance)
            VALUES (:user_id, :amount)
            ON DUPLICATE KEY UPDATE balance = balance + :amount
        """)
        try:
            with engine.connect() as connection:
                connection.execute(sql_insert_update, {'user_id': user_id, 'amount': amount})
                connection.commit()
        except IntegrityError:
            flash('A wallet already exists for this user.', 'error')
            return redirect(url_for('wallet'))

    sql_select_balance = text("SELECT balance FROM wallet WHERE user_id = :user_id")
    with engine.connect() as connection:
        result = connection.execute(sql_select_balance, {'user_id': user_id})
        balance = result.fetchone()
        balance = balance[0] if balance else 0.0

    return render_template('wallet.html', balance=balance)

@app.route('/checkout', methods=['POST'])
def checkout():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']

    # Fetch the total amount in the cart
    sql_cart_total = text("""
        SELECT SUM(p.price * c.quantity) as total_amount
        FROM cart c
        JOIN products p ON c.product_id = p.id
        WHERE c.user_id = :user_id
    """)
    with engine.connect() as connection:
        result = connection.execute(sql_cart_total, {'user_id': user_id}).fetchone()
        total_amount = result[0] if result and result[0] else 0

    # Fetch the user's wallet balance
    sql_wallet_balance = text("SELECT balance FROM wallet WHERE user_id = :user_id")
    with engine.connect() as connection:
        result = connection.execute(sql_wallet_balance, {'user_id': user_id}).fetchone()
        balance = result[0] if result and result[0] else 0

    if total_amount <= balance:
        # Deduct the total amount from the wallet
        sql_update_balance = text("UPDATE wallet SET balance = balance - :total_amount WHERE user_id = :user_id")
        with engine.connect() as connection:
            connection.execute(sql_update_balance, {'total_amount': total_amount, 'user_id': user_id})
            connection.commit()

        # Fetch cart items to save as orders
        sql_cart_items = text("""
            SELECT p.id as product_id, c.quantity, p.price * c.quantity as total_price
            FROM cart c
            JOIN products p ON c.product_id = p.id
            WHERE c.user_id = :user_id
        """)
        with engine.connect() as connection:
            cart_items = connection.execute(sql_cart_items, {'user_id': user_id}).mappings().all()

        # Save order details into the orders table
        sql_insert_order = text("""
            INSERT INTO orders (user_id, product_id, quantity, total_price)
            VALUES (:user_id, :product_id, :quantity, :total_price)
        """)
        with engine.connect() as connection:
            for item in cart_items:
                connection.execute(sql_insert_order, {
                    'user_id': user_id,
                    'product_id': item['product_id'],
                    'quantity': item['quantity'],
                    'total_price': item['total_price']
                })
            connection.commit()

        # Clear the cart
        sql_clear_cart = text("DELETE FROM cart WHERE user_id = :user_id")
        with engine.connect() as connection:
            connection.execute(sql_clear_cart, {'user_id': user_id})
            connection.commit()

        session['purchase_success'] = True  # Set success message in session
        flash('Cart is empty. Order placed successfully.', 'successfully')
        return redirect(url_for('order'))
    else:
        # Render the cart page with insufficient funds modal
        flash('Not enough balance in wallet. Please add more funds.', 'error')
        return redirect(url_for('cart', insufficient_funds=True))

@app.route('/order')
def order():
    if 'user_id' not in session:
        return redirect(url_for('login'))

    user_id = session['user_id']
    
    # Fetch the order details
    sql = text("""
        SELECT p.id, p.name, o.total_price, o.quantity, p.image_url as image
        FROM orders o
        JOIN products p ON o.product_id = p.id
        WHERE o.user_id = :user_id
    """)
    with engine.connect() as connection:
        order_items = connection.execute(sql, {'user_id': user_id}).mappings().all()
    
    purchase_success = session.pop('purchase_success', None)  # Retrieve and remove the session variable
    return render_template('order.html', order_items=order_items, purchase_success=purchase_success)

if __name__ == '__main__':
    app.run(debug=True)