USE tap_foods;

-- Revert Menu items to original pattern
UPDATE menu
SET imagePath = CONCAT('images/menu/', REPLACE(LOWER(itemName), ' ', '_'), '.jpg');

-- Specifically apply the user's requested query
UPDATE menu
SET imagePath = 'https://images.unsplash.com/photo-1644289450169-bc58aa16bacb?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fFBsYWluJTIwRG9zYXxlbnwwfHwwfHx8MA%3D%3D'
WHERE itemName = 'Plain Dosa';

-- Revert restaurant images to the 5 known originals, others to empty or default
UPDATE restaurant
SET imagepath = 'https://images.pexels.com/photos/12737656/pexels-photo-12737656.jpeg?auto=compress&cs=tinysrgb&w=800'
WHERE name = 'Mani''s Dum Biryani';

UPDATE restaurant
SET imagepath = 'https://images.unsplash.com/photo-1513104890138-7c749659a591'
WHERE name = 'Olio Pizza & Cafe';

UPDATE restaurant
SET imagepath = 'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe'
WHERE name = 'BTM Pizza';

UPDATE restaurant
SET imagepath = 'https://wallpaperaccess.com/full/1317028.jpg'
WHERE name = 'Vishnu Inn';

UPDATE restaurant
SET imagepath = 'https://images.unsplash.com/photo-1603894584373-5ac82b2ae398'
WHERE name = 'Meghana Foods';
