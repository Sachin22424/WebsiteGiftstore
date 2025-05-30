create database bnmxmc1oa4gjmdzpizlf;

use bnmxmc1oa4gjmdzpizlf;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    landmark VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(6) NOT NULL,
    dob DATE NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT chk_person_email CHECK (email LIKE '%@%'), 
    CONSTRAINT chk_person_password_length CHECK (LENGTH(password) >= 6), 
    CONSTRAINT chk_person_pincode_length CHECK (LENGTH(pincode) = 6),
    CONSTRAINT chk_person_phone CHECK (phone > 0 AND phone <= 9999999999)
);

-- Insert a user with plain text password for testing
INSERT INTO users (first_name, last_name, phone, email, street, city, landmark, state, pincode, dob, password)
VALUES ('John', 'Doe', '1234567890', 'john.doe@example.com', '123 Main St', 'Anytown', 'Near Park', 'Anystate', '123456', '1980-01-01', '12345678');


-- Create products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    image_url VARCHAR(255) NOT NULL
);

-- Insert example products
INSERT INTO products (name, description, price, image_url)
VALUES 
('Personalized Mothers Day Scented Candle', 'A lovely scented candle for Mothers Day', 699, '//www.bigsmall.in/cdn/shop/files/WhatsAppImage2024-04-22at13.38.17_large.jpg?v=1713773425'),
('Vintage Gramophone Bluetooth Speaker', 'A vintage styled Bluetooth speaker', 2499, '//www.bigsmall.in/cdn/shop/files/webp_large.webp?v=1698326541'),
('3D Acrylic LED Message Board' , 'Illuminate your thoughts, ideas, and messages with the 3D Acrylic LED Message Board' , 850 , 'https://m.media-amazon.com/images/I/71Ye-YDA-pL._SL1500_.jpg'),
('Doraemon Bobblehead Speaker', 'A fun Doraemon bobblehead speaker', 399, 'https://cdn.shopify.com/s/files/1/1305/2183/products/11033_1_720x.jpg?v=1677223136'),
('Personalized Coffee Mug' , 'A coffe mug with persionalized name written on it' , 599 , 'https://cdn.shopify.com/s/files/1/1305/2183/products/10822_5_720x.jpg?v=1680176724'),
('G Lamp with Speaker, Clock and Wireless Charger' , 'A lovely smart G Lamp with Speaker with Clock and Wireless Charger' , 1999 , 'https://www.bigsmall.in/cdn/shop/files/Card1_e3b1926b-b586-49b3-abf2-fb37a2c02a09_large.jpg?v=1702539621'),
('Personalized Gadget Organizer', 'The Personalised Gadget Organizer allows you to maintain organization while on the go' , 999 , 'https://www.bigsmall.in/cdn/shop/files/IMG_0118_large.jpg?v=1690796093'),
('Mickey Mouse Wooden LED Lamp' , 'Mickey Mouse Wooden LED Lamp is a great way to light up your room' , 699 ,'https://cdn.shopify.com/s/files/1/1305/2183/products/9743_9_large.jpg?v=1630661430'),
('Dreamy Baklava Dry Fruit Assorted Delight' , '12 Piece of Dry Fruit Assorted Delight Baklava- 250 g' , 900 , 'https://assets.winni.in/product/primary/2024/4/95047.jpeg?dpr=1&w=400'),
('Sleek Silicone Covered Glass Bottle' , 'Silicone Protective Cover Featuring a silicone protective cover this water bottle offers enhanced durability and grip' , 499 , 'https://assets.winni.in/product/primary/2024/5/95537.jpeg?dpr=1&w=400'),
('Personalised Thoughtful Ficus Compacta Plant' , 'Plant Name - Ficus Compacta Plant Plant Height: Upto 5 Inches Plant Type : Bonsai' , 799 , 'https://assets.winni.in/product/primary/2024/4/95270.jpeg?dpr=1&w=400'),
('Divine Baklava Ring Delights' , '12 Piece of Ring Baklava - 250 g Made of Baklava Dough along with Cow Ghee' , 899 , 'https://assets.winni.in/product/primary/2024/4/95042.jpeg?dpr=1&w=400'),
('Marble Crunch Cake' , 'Cake Flavour: Chocolate Shape: Round Type of Cake: Cream Type of Cream: Chocolate Filling in Layers: Choco Chips ' , 699 , 'https://assets.winni.in/product/primary/2024/3/94564.jpeg?dpr=1&w=300'),
('Handcrafted Ambrari Metal Elephant' , 'A beautiful centerpiece with elaborate minakari art' , 2999 , 'https://cdn.shopify.com/s/files/1/1305/2183/files/9_1fc3352e-c52a-4144-9b98-7ea47b2614e8_720x.jpg?v=1715945343'),
('Wooden Tic Tac Toe Game Board' , 'For unlimited hours of fun and enjoyment, adults and children' , 700 ,'https://cdn.shopify.com/s/files/1/1305/2183/files/IMG_7570_720x.jpg?v=1716749376'),
('Mom Sweet Delights Box' , 'Mix chocoloate box' , 1000 , 'https://assets.winni.in/product/primary/2024/4/95096.jpeg?dpr=1&w=400'),

('Best Is Yet To Come Personalized Photo Frame' , 'Nurture your loved ones on their special day' , 700 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-best-is-yet-to-come-personalized-photo-frame-283831-m.jpg'),
('Picture-Perfect Wishes' , 'Plush blooms meet a striking assemblage' , 3000 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-picture-perfect-wishes-264438-m.jpg'),
('Smiling Splendor Personalized Birthday Hamper' , 'Make your loved one special day unforgettable with this birthday hamper' , 800 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-smiling-splendor-personalized-birthday-hamper-264759-m.jpg'),
('Royal Rose Extravaganza', 'Indulge in a feast for the senses with this arrangement' , 1500 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-royal-rose-extravaganza-280964-m.jpg'),
('Happy Birthday Personalized LED Crystal Cube' , 'Surprise your loved ones with this LED Crystal Cube' , 1300 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-happy-birthday-personalized-led-crystal-cube-284940-m.jpg'),
('Mango Majesty Cake' ,'Treat your sweet tooth with this luscious half-kg Mango Cream Cake' , 800 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-mango-majesty-cake-half-kg--281119-m.jpg'),
('Pink Bloom Floral And Perfume Combo' , 'Express your affection to your loved ones' , 899 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-pink-bloom-floral-and-perfume-combo-284182-m.jpg'),
('Truffle Decadence Birthday Cake' , 'Indulge in sweetness with this delicious cake' , 699 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-truffle-decadence-birthday-cake-500-gm--276158-m.jpg'),
('Birthday Beauty Floral Arrangement' ,'Say happy birthday to a loved one with this cheerful floral arrangement', 899 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-birthday-beauty-floral-arrangement-203946-m.jpg'),
('Pink Reverie' , 'Oozing with the aura of a pink paradise' , 2000 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-pink-reverie-284955-m.jpg'),

('Rosette Splendor Chocolate Cake' , 'chocolate ecstasy with this decadent mini chocolate ombre cake' , 600 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-rosette-splendor-chocolate-mini-cake-281110-m.jpg'),
('Delicious Truffle Cake' , 'When in doubt, choose chocolate' , 499 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-delicious-truffle-cake-half-kg--145982-m.jpg'),
('Crunchy Butterscotch Cake' , 'delectable butterscotch cake ' , 599 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-crunchy-butterscotch-cake-half-kg--188697-m.jpg'),
('Truffle Delight Cake' , 'choose truffle This yummylicious chocolate cake ' , 699 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-truffle-delight-cake-halfkg--145988-m.jpg'),
('Choco Chip Truffle Cake' , 'Choco Chip Truffle Cake' , 550 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-choco-chip-truffle-cake-300-gm--265855-m.jpg'),
('Belgian Dark Chocolate Ganache Cake' , 'Belgian Dark Chocolate Ganache Cake' , 795 , 'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-belgian-dark-chocolate-ganache-cake-half-kg--145976-m.jpg'),
('Moist Chocolate Cake' , 'Moist Chocolate Cake', 565 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-moist-chocolate-cake-600-gm--195633-m.jpg'),
('Decadent and Creamy Chocolate Truffle Round Cake' , 'Decadent and Creamy Chocolate Truffle Round Cake' , 699 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-decadent-and-creamy-chocolate-truffle-round-cake-half-kg--188711-m.jpg'),
('Red Velvet Buttercream Cake' , 'Red Velvet Buttercream Cake' , 645 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-red-velvet-buttercream-cake-500-gm--270005-m.jpg'),
('Delectable Red Velvet Cake' , 'Delectable Red Velvet Cake' , 599 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-delectable-red-velvet-cake-600-gm--190856-m.jpg'),

('Crystal Glass Flower Vase' , 'Crystal Glass Flower Vase' , 699 , 'https://cdn.shopify.com/s/files/1/1305/2183/products/11171_6_large.jpg?v=1681364583'),
('Garden of Grace' , 'Garden of Grace' , 799 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-garden-of-grace-281101-m.jpg'),
('Pink Petal Perfection', 'Pink Petal Perfection' , 899 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-pink-petal-perfection-278823-m.jpg'),
('Wish Upon a Flower', 'Wish Upon a Flower', 999 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-wish-upon-a-flower-284651-m.jpg'),
('Blush Bouquet' , 'Blush Bouquet', 945 ,'https://cdn.igp.com/f_auto,q_auto,t_pnopt7prodlp/products/p-father-s-day-enchanting-blush-bouquet-223639-m.jpg'),
('Mixed Flowers Bouquet' , 'Mixed Flowers Bouquet', 1200 ,'https://giftcart.com/cdn/shop/files/Untitleddesign_82dbf4e3-6356-4d65-95ae-08c414100027_400x.png?v=1688124462'),
('Colourful Bouquet Of Mixed Flowers' , 'Colourful Bouquet Of Mixed Flowers', 999 ,'https://giftcart.com/cdn/shop/files/Untitleddesign_fd7ceafb-8220-4fb3-80a8-3b0017cece2e_600x.png?v=1688125104'),
('Mystic Blue Flowers Cylindrical Vase' , 'Mystic Blue Flowers Cylindrical Vase', 1100 ,'https://giftcart.com/cdn/shop/files/Untitleddesign_a30946dd-d1b4-4729-9d08-889ff02f4588_600x.png?v=1688126442');

-- Create cart table
CREATE TABLE cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
); 

CREATE TABLE wallet (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    balance DECIMAL(10, 2) NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10, 2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE contact (
    id INT AUTO_INCREMENT,
    name VARCHAR(255),
    email VARCHAR(255),
    message TEXT,
    PRIMARY KEY (id)
);

-- drop database bnmxmc1oa4gjmdzpizlf;
