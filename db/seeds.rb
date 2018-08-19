
20.times do 
  fabric = {}
  fabric['fabric_name'] = ["Fire-engine textured silk", "Blue and pink polka dot", "Lavender linen", "Vintage mustard sweatshirting", "Liberty wool suiting", "Forest green coating"].sample 
  fabric['fabric_description'] = Faker::FamousLastWords.last_words
  fabric['meterage'] = rand(1..30)
  fabric['purchased_from'] = Faker::Company.name
  fabric['fibre'] = [["Silk"], ["Cotton"], ["Linen", "Wool"], ["Merino"], ["Modal", "Bamboo"], ["Cashmere"], ["Polyester", "Acetate"], ["Nylon"], ["Lurex"]].sample
  fabric['suitable_for'] = [["Pants"], ["Skirt"], ["Shirt", "Dress"], ["T-Shirt"], ["Shorts"], ["Activewear", "Sweater"], ["Jacket", "Coat"], ["Swimwear"]].sample
  fabric['colour'] = [["Red", "Blue", "Orange"], ["Yellow"], ["Green", "Purple"], ["Black"], ["Grey"], ["Brown", "Pink"], ["Metallic"]].sample
  fabric['printed'] = Faker::Boolean.boolean
  fabric['image'] = ["https://cdn.shopify.com/s/files/1/0379/0765/products/Linen_Gingham_Mustard_Rollshot_1024x1024.jpg?v=1533877671", "https://cdn.shopify.com/s/files/1/0379/0765/products/Linen_Linear_Leaves_Rollshot_1024x1024.jpg?v=1533874470", "https://cdn.shopify.com/s/files/1/0379/0765/products/milled_linen_mustard_roll_1024x1024.jpg?v=1479181230", "https://cdn.shopify.com/s/files/1/0379/0765/products/Merino_195gsm_Rose_Pink_Rollshot_1024x1024.jpg?v=1527559539"].sample
  fabric['user_id'] = 1
  Fabric.create(fabric)
end

