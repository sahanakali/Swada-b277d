USE tap_foods;

-- Update Menu items
UPDATE menu
SET imagePath = CASE 
    WHEN itemName LIKE '%Biryani%' THEN 'https://images.unsplash.com/photo-1589302168068-964664d93dc0?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Pizza%' THEN 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Burger%' OR itemName LIKE '%Whopper%' THEN 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Pasta%' THEN 'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Dosa%' THEN 'https://images.unsplash.com/photo-1644289450169-bc58aa16bacb?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Chicken%' OR itemName LIKE '%Kabab%' OR itemName LIKE '%Nuggets%' THEN 'https://images.unsplash.com/photo-1604908176997-125f25cc6f3d?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Fries%' THEN 'https://images.unsplash.com/photo-1576107232684-1279f3908594?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Coffee%' OR itemName LIKE '%Soda%' OR itemName LIKE '%Shake%' OR itemName LIKE '%Pepsi%' OR itemName LIKE '%Cola%' THEN 'https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Ice Cream%' OR itemName LIKE '%Jamun%' OR itemName LIKE '%Brownie%' OR itemName LIKE '%Tiramisu%' OR itemName LIKE '%Cake%' OR itemName LIKE '%Meetha%' THEN 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Bread%' OR itemName LIKE '%Bruschetta%' THEN 'https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?w=600&auto=format&fit=crop'
    WHEN itemName LIKE '%Idli%' OR itemName LIKE '%Vada%' OR itemName LIKE '%Pongal%' OR itemName LIKE '%Bath%' OR itemName LIKE '%Poori%' THEN 'https://images.unsplash.com/photo-1589301760014-d929f39ce9b1?w=600&auto=format&fit=crop'
    ELSE 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?w=600&auto=format&fit=crop'
END;

-- Update Restaurants
UPDATE restaurant
SET imagePath = CASE
    WHEN name LIKE '%Biryani%' OR name LIKE '%Meghana%' THEN 'https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a?w=600&auto=format&fit=crop'
    WHEN name LIKE '%Pizza%' THEN 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?w=600&auto=format&fit=crop'
    WHEN name LIKE '%Burger%' OR name LIKE '%KFC%' THEN 'https://images.unsplash.com/photo-1550547660-d9450f859349?w=600&auto=format&fit=crop'
    WHEN name LIKE '%Barbeque%' OR name LIKE '%Truffles%' THEN 'https://images.unsplash.com/photo-1544025162-d76694265947?w=600&auto=format&fit=crop'
    WHEN name LIKE '%Udupi%' OR name LIKE '%Vishnu%' THEN 'https://images.unsplash.com/photo-1610192773928-e6b17c87c0c1?w=600&auto=format&fit=crop'
    ELSE 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=600&auto=format&fit=crop'
END;
