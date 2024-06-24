DROP SCHEMA IF EXISTS `full-stack-drinkshop`;

CREATE SCHEMA `full-stack-drinkshop`;
USE `full-stack-drinkshop`;

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `drink_category`;
DROP TABLE IF EXISTS `drink`;
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `orders`;
DROP TABLE IF EXISTS `customer`;
DROP TABLE IF EXISTS `address`;
DROP TABLE IF EXISTS `region`;
DROP TABLE IF EXISTS `city`;
SET FOREIGN_KEY_CHECKS=1;

CREATE TABLE `drink_category` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE=InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE `drink` (
  `id` INT(20) NOT NULL AUTO_INCREMENT,
  `item` VARCHAR(255) DEFAULT NULL,
  `name` VARCHAR(255) DEFAULT NULL,
  `description` VARCHAR(1000) DEFAULT NULL,
  `price` DECIMAL(13,2) DEFAULT NULL,
  `image_url` VARCHAR(255) DEFAULT NULL,
  `date_created` DATETIME DEFAULT NULL,
  `category_id` INT(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category` (`category_id`),
  CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `drink_category` (`id`)
) 
ENGINE=InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO drink_category(category_name) VALUES ('WHISKY');

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1000', 'Jameson Black Barrel', 'Jameson Black Barrel is a blend of small batch grain whiskeys matured in a combination of American oak, sherry & bourbon casks. Fruity with a nose rich in notes of tropical fruits, coconut & cereals. Taste dense and full on the palate, with intense, fatty cream and nuts. Long finish with notes of cinnamon and nutmeg. Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/whisky/whisky-jameson-black-barrel-1000.png',28.48,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1001', 'Jack Daniels', 'Jack Daniels has been produced in the same traditional way for 140 years. It has a rich amber color and a balanced flavor with hints of smoked wood, caramel and vanilla. After distillation, it matures in the cellars in new white oak barrels, while during its maturation, it absorbs various components from the wood of the barrel, which give it its characteristic taste.',
'assets/images/drinks/whisky/whisky-jack-daniels-1001.png',24.86,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1002', 'Tullamore Dew', 'Tullamore Dew, is an Irish blended whisky, known for its smooth and "gentle" character, which matures in bourbon and sherry casks.
Its most characteristic aromas are those of vanilla, citrus fruits and nuts. In the mouth it is soft and spicy. Enjoy with ice.',
'assets/images/drinks/whisky/whisky-tullamore-1002.png',20.10,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1003', 'Johnnie Whalker Blue Label', 'Johnnie Walker Blue Label could be described as the epitome of blending. The numbered bottles, due to the limited production, contain 16 of the rarest and most expensive malt whiskeys in the world, which stood out among millions of barrels. Its taste character is sweet and slightly smoky, bringing perfect balance. At the beginning the distinct flavors of sherry, honey, hazelnuts and rose petals are released, while then aromatic tobacco & bitter chocolate reward the palate.',
'assets/images/drinks/whisky/whisky-johnnie-whalker-blue-1003.png',184.40,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1004', 'Chivas Regal', 'Chivas Regal. Whiskey with the aroma of extracts of wild herbs, heather, honey and orchard fruits. It tastes rounded and creamy with a full, rich taste of honey and ripe pears, vanilla, hazelnut and caramelized butter.',
'assets/images/drinks/whisky/whisky-chivas-1004.png',30.50,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1005', 'Four Roses small', 'Four Roses belongs to the bourbons and has a soft, velvety texture. Its taste is spicy with a sweet, fruity aroma and notes of sweet oak and caramel, thanks to the processes followed for its production. It is served plain, with ice or with a few drops of water.Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/whisky/whisky-four-roses-1005.png',32.69,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1006', 'Cardhu', 'Cardhu is a smooth whiskey rich in aromas of fruit, vanilla cream and spices. It is soft and slightly dry, with notes of smoke. Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/whisky/whisky-cardhu-1006.png',56.63,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1007', 'Glenfiddich 12', 'Glenfiddich 12 years matures for over twelve years in American and European oak barrels.
The exceptional quality of these casks ensures that the whiskey develops complex, elegant, integrated aromas with notes of fresh pear and subtle beech.
It is particularly cool and fruity, beautifully balanced with a long and full flavor.',
'assets/images/drinks/whisky/whisky-glenfiddich-1007.png',39.62,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1008', 'Grants', 'Grants was created in 1898 by William Grant. It is created from around 25 of the best Scotch malt and grain whiskeys with aromas reminiscent of honey, lemon and a light sense of smoke. In the mouth flavors reminiscent of vanilla and cereals dominate. Its aftertaste is pleasant, smooth and with a soft character.',
'assets/images/drinks/whisky/whisky-grants-1008.png',17.53,1, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Whisky - 1009', 'Famous Grouse', 'The Famous Grouse, the famous whiskey takes its name from the red grouse, the symbol of Scotlands National Game Bird. Lovely, with a soft floral aroma on the nose and cereals working in perfect harmony. and actually has quite a light body. Fruity, with a touch of smoke. The secret lies in the way they marry the most refined malt whiskies, such as The Macallan with excellent quality grain whisky, in oak barrels for a very long time. The result is a blend with a very mild taste. Grown in the Scottish Highlands, Famous Grouse has proudly held the title of Scotlands most loved whiskey for over 25 years.',
'assets/images/drinks/whisky/whisky-famous-grouse-1009.png',18.30,1, NOW());

INSERT INTO drink_category(category_name) VALUES ('VODKA');

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1000', 'Serkova Crystal Pure', 'Serkova Crystal Pure is a premium vodka, which completes the Serkova range, leveraging the solid know-how it has established.
It is a refined product, since the ten-fold distillation process results in its perfect composition, its extremely smooth and velvety taste. Its crystalline texture is not accidental at all. Its composition is 100% wheat and the best raw material is always chosen for its creation, which is undoubtedly the most important ingredient for the high quality of Serkova Crystal Pure.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-serkova-1000.png',21.05,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1001', 'Smirnoff Red', 'Smirnoff Red dates back to 1864 in Moscow, Russia and is now one of the most popular vodkas around the world. It is a vodka triple distilled and filtered ten times with the aim of absolute smoothness and clarity. Intense, dry, clean with a hint of black pepper and a long aftertaste. Smirnoff Red is also gluten free and Kosher certified. You can enjoy it plain, with some ice and a slice of lemon and of course in many cocktails.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-smirnoff-red-1001.png',14.99,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1002', 'Beluga', 'Beluga Vodka is a pure wheat distillate of an exclusive species, with Siberian artesian water and is created according to the most modern distillation techniques. It is filtered three times and then "rested" for at least 30 days, which adds to the spirits character. Citrus aromas will follow in a slightly sweet, creamy texture on the palate.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-beluga-1002.png',42.60,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1003', 'Ciroc', 'Ciroc is a premium French vodka produced exclusively from grapes. It is considered the champagne of vodka as it is distilled 5 times. It has refined citrus aromas, with a light, soft grape taste. Ideal for making "On the Rocks" Martini and "Mixability".
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-ciroc-1003.png',34.70,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1004', 'Absolut', 'Absolut is a pure vodka spirit with a rich flavor and distinct wheat character, followed by a hint of dried fruit.
It is made in Sweden, exclusively from natural ingredients and contains no added sugar.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-absolut-1004.png',15.99,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1005', 'Belvedere', 'Belvedere, premium vodka from Poland is a product distilled from a single type of rye (Dankowskie Gold Rye).
It is distilled four times to create perfect balance and purity and is diluted with water from Belvederes artesian wells.
It has a rich alcohol intensity with distinct vanilla aromas & light rye taste. It leaves a soft creamy sensation on the palate as well as a velvety aftertaste.',
'assets/images/drinks/vodka/vodka-belvedere-1005.png',39.50,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1006', 'Grey Goose', 'Gray Goose Vodka is produced from French wheat with water filtered through champagne limestone. Distillation is based on the traditional method of the Cognac region. It has a rounded aroma with a hint of sweetness, reminiscent of fine French macaroons. Its taste is rich and smooth, while its smooth texture offers a buttery and rounded sensation.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-grey-goose-1006.png',40.90,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1007', 'Stolichnaya', 'Authentic Russian Stolichnaya Vodka is double distilled and filtered four times according to the traditional Russian method. It has a balanced, silky taste and is produced from selected grains of superior quality.
Wheat and water are triple distilled using quartz and activated carbon filtration to create Stolichnayas final spirit.',
'assets/images/drinks/vodka/vodka-stolichnaya-1007.png',15.33,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1008', 'Ursus Company NV Roter', 'Ursus Roter is a liqueur based on vodka and sloe berries. It is a sweet vodka, with an intense fruity taste of red forest fruits. Ideal for a shot, you can however enjoy it plain with ice, with soda or as an ingredient in a cocktail.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/vodka/vodka-ursus-1008.png',13.99,2, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Vodka - 1009', 'Snow Leopard', 'Snow Leopard has a crystal clear color. Fresh aroma of flowers and anise. Rich creamy vanilla flavor, crisp and dry with spicy notes. Extremely soft and cool.
Polish vodka, Snow Leopard, is premium vodka and is made in small batches. 15% of profits go to wildlife charities to help protect the critically endangered Snow Leopard - there are only a few thousand in the wild, and Sir David Attenborough describes them as wildlifes holy grail.',
'assets/images/drinks/vodka/vodka-snow-leopard-1009.png',51.80,2, NOW());

INSERT INTO drink_category(category_name) VALUES ('RUM');

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1000', 'Diplomatico Seleccion de familia', 'Diplomatico Seleccion De Familia is aged for 12 years in a combination of American white oak, ex-bourbon and ex-sherry casks. It is a complex rum where you discover aromas of caramel, red fruits, white pepper, ginger, raisins and figs. It has a unique body with excellent balance that is a reference for rum lovers and connoisseurs around the world.
Alcohol: 43%
Region: Venezuela',
'assets/images/drinks/rum/rum-diplomatico-1000.png',51.50,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1001', 'Don Papa', 'Don Papa rum is a premium aged rum from the Philippines, where the best sugar cane is milled to produce this sweet premium rum. It is aged for 7 years in 2 types of barrels, American oak bourbon barrels and American Rioja barrels creating notes of vanilla, honey and candied fruit. Slightly sweet taste, with caramel aftertaste and molasses dominating. The perfect way to enjoy Don Papa Rum is plain or with a large ice cube, which melts imperceptibly in your glass. Combine with chocolate, nuts, dried fruit and cured meats.',
'assets/images/drinks/rum/rum-don-papa-1001.png',46.00,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1002', 'Ron Barcelo Imperial', 'Ron Barcelo Imperial A rum with a bright and warm copper color and aromas of butter, dried cherries, intense vanilla, pineapple jam and caramelized nuts followed by a dry, fruity body full of balance.
On the aftertaste it has notes of carrot cake, walnut, mocha and a strong toasty flavor that slowly fades.',
'assets/images/drinks/rum/rum-ron-barcelo-imperial-1002.png',34.50,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1003', 'Plantation Rum', 'Plantation Anniversary 20th years was created to celebrate Alexandre Gabriels 20th anniversary as a Master Blender.
This is a rum that blends aged excellent rums. Plantation XO is first matured in Bourbon whiskey casks and then in casks it crosses the Atlantic Ocean and is then aged in South West France in small French oak casks.
This double aging process gives incredible smoothness and complexity. It presents aromas of chocolate, vanilla, ripe bananas, coconut and mango.',
'assets/images/drinks/rum/rum-plantation-1003.png',52.50,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1004', 'Ron Zacapa XO', 'Zacapa XO is a rum from a blend of different rums aged from 6 to 25 years. It begins in bourbon casks, continues in Spanish sherry casks and, especially for XO, is finished in French oak cognac casks. A perfectly balanced combination of sugar, spices, fruit and alcohol.
Rich and delicate nose with aromas of dried raisin, cranberries, vanilla and grape. The mouth is particularly full, with good integration of alcohol and notes of plum, clove and bitter chocolate.
Aged in the highlands of Quetzaltenango, Zacapa Rums develop their complex flavor and distinctive character, 2300 meters above sea level, in the secret house above the clouds.',
'assets/images/drinks/rum/rum-ron-zacapa-xo-1004.png',131.00,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1005', 'El Dorado 15 years', 'El Dorado 15 Years Old has been immersed in oak barrels for at least fifteen years while some of its components reach twenty-five years of aging. They are then blended harmoniously and give a balanced and enjoyable rum.
The nose reaches dark brown sugars and a strong toffee aroma with notes of compote, plums and molasses.
Long, intense, creamy finish with dark spices.',
'assets/images/drinks/rum/rum-el-dorado-1005.png',50.95,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1006', 'Bacardi', 'First brewed in 1862, Bacardi rum is the original, easy-to-mix, light rum aged for one to two years in selected oak casks. After aging, there is the blending process and the rum undergoes a second charcoal filtration to achieve maximum Bacardi clarity and smoothness.
Bacardi Superior has a clean and clear appearance, smooth taste and intense vanilla aromas in combination with notes of nuts and tropical fruits. The finish is dry and soft',
'assets/images/drinks/rum/rum-bacardi-1006.png',18.17,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1007', 'Havana Club Anejo 3 Anos', 'Havana Club 3 Year Old comes from at least three years of natural aging in oak barrels. After 2 years the aguardiente is filtered through charcoal to remove impurities and returned to the barrel. This aging process gives it its light straw color that reveals its age.',
'assets/images/drinks/rum/rum-havana-club-1007.png',18.80,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1008', 'Flor De Cana 18 years', 'Flor De Cana 18 Years
 This stunning amber rum is full-bodied, with a rich complexity of flavors and a smooth finish that stays with you long after the sip. Centenario Gold 18 Year Old is nearly two decades in the making, and you can taste the craftsmanship and tradition in every drop.',
'assets/images/drinks/rum/rum-flor-de-cana-18-1008.png',58.35,3, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Rum - 1009', 'Malibu', 'Malibu is made from fruit spirits, along with rum, coconut and Curaçao.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/rum/rum-malibu-1009.png',14.92,3, NOW());

INSERT INTO drink_category(category_name) VALUES ('GIN');

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1000', 'Hendricks Gin', 'Hendricks Gin: The unusual distillation process, combined with a paradoxically delicious set of extracts - including rose and cucumber extracts - gives rise to a one-of-a-kind gin.
Serve in a tall glass with plenty of ice and garnish with thinly sliced ​​cucumber.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/gin/gin-hendricks-1000.png',35.53,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1001', 'Beefeater London Dry', 'Beefeater London is a premium dry gin with a crystal finish made in London at the Kennington Distillery. Notes of juniper, spices and fruit are a combination that results in an aromatic and clean tasting spirit.',
'assets/images/drinks/gin/gin-beefeater-1001.png',19.30,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1002', 'Citadelle De France', 'Citadelle is a gin made by direct ignition of the Charentais copper still, which is used by the same distillery to create Cognac. To it, they add pure French grain spirit and 19 herbs and aromatics: Triple-distilled French gin, based on the original recipe with which it was born, in the late 18th century. Its 19 separate herbs and spices give it a unique complexity and complex character. Ideal for cool gin & tonics, but also many other pleasant cocktails and longdrinks.',
'assets/images/drinks/gin/gin-citadelle-de-france-1002.png',27.49,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1003', 'Bombay Sapphire Distillery', 'Bombay Sapphire is produced based on a recipe from 1761. It is not produced in the traditional way, i.e. by boiling, but through an extraction process, in which the alcohol passes through the herbs in vapor form. This allows each subtle scent to be fully absorbed.
Natural aromas combine to create a subtle, fragrant taste of citrus and wild cypress, rich and exotic spices with a hint of sweetness. Its taste is soft, light but also peppery.',
'assets/images/drinks/gin/gin-bombay-1003.png',23.90,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1004', 'Tanqueray London Dry', 'Tanqueray was created in 1830 by Charles Tanqueray in Tingrith, Bedfordshire. With key ingredients of wild cypress berries, coriander and angelica roots, pure water and a host of fine aromatic herbs, Tanqueray is one of the traditional gins with friends around the world.',
'assets/images/drinks/gin/gin-tanqueray-1004.png',23.50,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1005', 'Schwarzwald Monkey 47', 'Monkey 47 is a complex and unfiltered Gin. The number 47 indicates the number of aromatics used in it, as well as its alcohol content. Quite complex with a good balance of all elements and a spicy finish with freshness. You can enjoy it plain or make a great base for a perfect Martini.',
'assets/images/drinks/gin/gin-schwarzwald-monkey-47-1005.png',42.20,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1006', 'Gordons London Dry', 'Gordons is the first London Dry Gin with the original London secret recipe from 1769, its quality is also characterized by the large content of cedar, giving it a unique authentic refreshing taste. During the herb selection process, 9 out of 10 cedar nuts are discarded, while during distillation, whole herbs are used, not extracts.',
'assets/images/drinks/gin/gin-gordons-1006.png',14.98,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1007', 'Aviation', 'A batch of distilled Gin from America, Gin Aviation offers a Dutch style. Distilled from rye and flavored with juniper, lavender, anise, Sarsaparilla, orange peel and cardamom.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/gin/gin-aviation-1007.png',34.50,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1008', 'Silent Pool', 'Silent Pool Gin is produced on the Albury Estate in the Surrey Hills, right next to Silent Pool, a beautiful, mysterious lake - what a place to create a gin! This gin features 24 botanicals, including kaffir lime, chamomile, local honey and lavender, resulting in a delicately sweet, yet complexly balanced drink. Violet, lavender and lime leaves are found in the aroma, while the taste is dominated by chamomile and orange blossom, with a spark of black pepper. Notes of honey on the finish.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/gin/gin-silent-pool-1008.png',47.00,4, NOW());

INSERT INTO drink (item, name, description, image_url, price, category_id, date_created)
VALUES ('Gin - 1009', 'Martin Millers', 'Martin Millers Gin is distilled and shipped to Iceland, where it is mixed with Icelandic spring water. It is flavored with Tuscan juniper, cassia bark, coriander, Seville citrus peel, nutmeg, cinnamon and licorice.
Users who have bought it distinguish it mainly because it has a nice aroma.',
'assets/images/drinks/gin/gin-martin-millers-1009.png',30.47,4, NOW());

CREATE TABLE `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `region` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--ALTER TABLE `customer` ADD UNIQUE (`email`);

CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_tracking_number` varchar(255) DEFAULT NULL,
  `total_price` decimal(19,2) DEFAULT NULL,
  `total_quantity` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `date_created` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_shipping_address_id` (`shipping_address_id`),
  KEY `K_customer_id` (`customer_id`),
  CONSTRAINT `FK_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_shipping_address_id` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `order_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `drink_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `K_order_id` (`order_id`),
  CONSTRAINT `FK_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `FK_drink_id` FOREIGN KEY (`drink_id`) REFERENCES `drink` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `region` (
  `id` int unsigned NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB;

INSERT INTO `region` VALUES 
(1, 'Περιφέρεια Ανατολικής Μακεδονίας και Θράκης'),
(2, 'Περιφέρεια Αττικής'),
(3, 'Περιφέρεια Βορείου Αιγαίου'),
(4, 'Περιφέρεια Δυτικής Ελλάδας'),
(5, 'Περιφέρεια Δυτικής Μακεδονίας'),
(6, 'Περιφέρεια Ηπείρου'),
(7, 'Περιφέρεια Ιονίων Νήσων'),
(8, 'Περιφέρεια Κεντρικής Μακεδονίας'),
(9, 'Περιφέρεια Κρήτης'),
(10, 'Περιφέρεια Θεσσαλίας'),
(11, 'Περιφέρεια Νότιου Αιγαίου'),
(12, 'Περιφέρεια Πελοποννήσου'),
(13, 'Περιφέρεια Στερεάς Ελλάδας');

CREATE TABLE `city` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `region_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_region` (`region_id`),
  CONSTRAINT `fk_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;

INSERT INTO `city` VALUES 
(1,'Δράμα', 1),
(2,'Έβρος', 1),
(3,'Θάσος', 1),
(4,'Καβάλα', 1),
(5,'Ξάνθη', 1),
(6,'Ροδόπη', 1),
(7,'Κεντρικός τομέας', 2),
(8,'Βόρειος τομέας', 2),
(9,'Δυτικός τομέας', 2),
(10,'Νότιος τομέας', 2),
(11,'Πειραιώς', 2),
(12,'Νήσων', 2),
(13,'Ανατολικής Αττικής', 2),
(14,'Δυτικής Αττικής', 2),
(15,'Λέσβος', 3),
(16,'Λήμνος', 3),
(17,'Χίος', 3),
(18,'Σάμος', 3),
(19,'Ικαρίας', 3),
(20,'Αιτωλοακαρνανίας', 4),
(21,'Αχαίας', 4),
(22,'Ηλείας', 4),
(23,'Γρεβενά', 5),
(24,'Καστοριά', 5),
(25,'Κοζάνη', 5),
(26,'Φλώρινα', 5),
(27,'Άρτας', 6),
(28,'Θεσπρωτίας', 6),
(29,'Ιωαννίνων', 6),
(30,'Πρέβεζας', 6),
(31,'Ζάκυνθος', 7),
(32,'Ιθάκη', 7),
(33,'Κέρκυρα', 7),
(34,'Κεφαλλονιά', 7),
(35,'Λευκάδα', 7),
(36,'Ημαθία', 8),
(37,'Θεσσαλονίκη', 8),
(38,'Κιλκίς', 8),
(39,'Πέλλα', 8),
(40,'Πιερία', 8),
(41,'Σέρρες', 8),
(42,'Χαλκιδική', 8),
(43,'Ηράκλειο', 9),
(44,'Λασίθι', 9),
(45,'Ρέθυμνο', 9),
(46,'Χανιά', 9),
(47,'Λάρισα', 10),
(48,'Μαγνησία', 10),
(49,'Τρίκαλα', 10),
(50,'Καρδίτσα', 10),
(51,'Βόρειες Σποράδες', 10),
(52,'Άνδρος', 11),
(53,'Θήρα', 11),
(54,'Κάλυμνος', 11),
(55,'Κάρπαθος', 11),
(56,'Κέας-Κύθνο', 11),
(57,'Κω', 11),
(58,'Μήλος', 11),
(59,'Μύκονος', 11),
(60,'Νάξος', 11),
(61,'Πάρος', 11),
(62,'Ρόδος', 11),
(63,'Σύρος', 11),
(64,'Τήνος', 11),
(65,'Αργολίδα', 12),
(66,'Αρκαδία', 12),
(67,'Κορινθία', 12),
(68,'Λακωνία', 12),
(69,'Μεσσηνία', 12),
(70,'Βοιωτίας', 13),
(71,'Εύβοιας', 13),
(72,'Ευρυτανίας', 13),
(73,'Φθιώτιδας', 13),
(74,'Φωκίδας', 13);
