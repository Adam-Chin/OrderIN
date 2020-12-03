CREATE DATABASE IF NOT EXISTS `OrderInSystem` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `OrderInSystem`;

CREATE TABLE IF NOT EXISTS `accounts` (
`id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_city` varchar(100) NOT NULL,
  `address_state` varchar(100) NOT NULL,
  `address_zip` varchar(50) NOT NULL,
  `address_country` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

INSERT INTO `accounts` (`id`, `email`, `password`, `first_name`, `last_name`, `address_street`, `address_city`, `address_state`, `address_zip`, `address_country`, `admin`) VALUES
(1, 'admin@OrderIn.com', 'admin', 'John', 'Smith', '123 Street Street', 'New York', 'NY', '10001', 'United States', 1);

CREATE TABLE IF NOT EXISTS `categories` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Pizzas'),
(2, 'Pastas'),
(5, 'Salads');

CREATE TABLE IF NOT EXISTS `items` (
`id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desc` text NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `img` text NOT NULL,
  `date_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `items_categories` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO items_categories (`item_id`, `category_id`)
VALUES (1, 2),
(2, 2),
(3, 1),
(4, 2),
(5, 1),
(6, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 1);

insert into items_images (`item_id`, `img`)
VALUES (1, 'pizza.jpg'),
(1, 'pizza2.jpg'),
(2, 'calzone.jpg'),
(3, 'fries.jpg'),
(4, 'pasta.jpg'),
(5, 'rockshrimp.jpg'),
(6, 'duckroll.jpg'),
(7, 'softshellcrab.jpg'),
(8, 'nigiri.jpg'),
(9, 'baconcheeseburger.jpg'),
(10, 'mushroomburger.jpg'),
(11, 'BBQburger.jpg'),
(12, 'cajunfries.jpg');

CREATE TABLE IF NOT EXISTS `items_images` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `items_options` (
`id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `transactions` (
`id` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `payment_amount` decimal(7,2) NOT NULL,
  `payment_status` varchar(30) NOT NULL,
  `created` datetime NOT NULL,
  `payer_email` varchar(255) NOT NULL DEFAULT '',
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `address_street` varchar(255) NOT NULL DEFAULT '',
  `address_city` varchar(100) NOT NULL DEFAULT '',
  `address_state` varchar(100) NOT NULL DEFAULT '',
  `address_zip` varchar(50) NOT NULL DEFAULT '',
  `address_country` varchar(100) NOT NULL DEFAULT '',
  `account_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) NOT NULL DEFAULT 'website'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `transactions_items` (
`id` int(11) NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `txnitem_id` int(11) NOT NULL,
  `txnitem_price` decimal(7,2) NOT NULL,
  `txnitem_quantity` int(11) NOT NULL,
  `txnitem_options` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `restaurants` (
`id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

ALTER TABLE `restaurants`
 ADD PRIMARY KEY (`id`);

 ALTER TABLE `restaurants`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;

INSERT INTO restaurants (`id`, `name`)
VALUES (1, 'Gino''s Pizza'),
(2, 'Fancy Lee'),
(3, 'Burger Bar');

 CREATE TABLE IF NOT EXISTS `items_restaurants` (
`id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

INSERT INTO items_restaurants (`item_id`, `restaurant_id`)
Values (1,1),
(2,1),
(3,1),
(4,1),
(5,2),
(6,2),
(7,2),
(8,2),
(9,3),
(10,3),
(11,3),
(12,3);

ALTER TABLE items AUTO_INCREMENT = 1;

INSERT INTO items (`name`, `desc`, `price`, `quantity`, `img`, `date_added`)
VALUES ('Pizza', 'A robust crust with the freshest mozzarella cheese from local farms.', 19.99, 10, 'pizza.jpg', '2020-11-09 02:01:18'),
('Calzone', 'A pizza that is baked', 10.99, 65, 'calzone.jpg', '2020-11-09 02:02:32'),
('Fries', 'Thin cut crispy fries', 5.99, 100, 'fries.jpg', '2020-11-11 18:40:59'),
('Pasta', 'A homemade pasta with the most robust vodka sauce topped with parsley and parmesan cheese.', 12.99, 50, 'pasta.jpg', '2020-11-11 18:41:42'),
('Rock Shrimp Tempura', 'Rock shrimp fried in a light tempura batter covered in a sweet and spicy sauce.', 6.99, 50, 'rockshrimp.jpg', '2020-11-11 18:50:40'),
('Ganga-Style Duck Roll', 'A fried egg role with duck and an assortment of vegetables with a spicy sauce drizzled over the top.', 6.99, 50, 'duckroll.jpg', '2020-11-11 18:53:34'),
('Soft-Shell Crab Roll', 'Soft shell crab tempura, spicy tuna, avocado and roe wrapped in a soybean nori and served with a spicy eel sauce', 8.99, 50, 'softshellcrab.jpg','2020-11-11 18:56:22' ),
('6x Nigiri Set', 'An assortment of fish with rice on the bottom and a little dollop of wasabi in between.', 6.99, 50, 'nigiri.jpg', '2020-11-12 01:47:14'),
('Bacon Cheeseburger', 'Our secret blend, topped with Applewood smoked bacon, American cheese, lettuce, tomato and red onion.', 12.99, 50, 'baconcheeseburger.jpg', '2020-11-12 01:53:06'),
('Mushroom Cheeseburger', 'Our secret blend topped with the sweetest onions, mushroom and swiss cheese.', 12.99, 50, 'mushroomburger.jpg', '2020-11-12 01:55:19'),
('BBQ Burger', 'Our secret blend, topped with American cheese, Applewood smoked bacon, fried onion rings, and our house made mesquite BBQ sauce.', 15.99, 50, 'BBQburger.jpg', '2020-11-12 02:02:11'),
('Cajun Fries', 'Thin cut fries seasoned with our house made Cajun seasoning.', 4.99, 50, 'cajunfries.jpg', '2020-11-12 02:05:34');

ALTER TABLE `items_restaurants`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `item_id` (`item_id`,`restaurant_id`);

ALTER TABLE `items_restaurants`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1;

ALTER TABLE `accounts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `items`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `items_categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `item_id` (`item_id`,`category_id`);

ALTER TABLE `items_images`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `item_id` (`item_id`,`img`);

ALTER TABLE `items_options`
 ADD PRIMARY KEY (`id`);

ALTER TABLE `transactions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `txn_id` (`txn_id`);

ALTER TABLE `transactions_items`
 ADD PRIMARY KEY (`id`);

ALTER TABLE accounts ADD rID int(11) DEFAULT '0';

ALTER TABLE `accounts`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
ALTER TABLE `items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
ALTER TABLE `items_categories`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
ALTER TABLE `items_images`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=71;
ALTER TABLE `items_options`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=53;
ALTER TABLE `transactions`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
ALTER TABLE `transactions_items`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
