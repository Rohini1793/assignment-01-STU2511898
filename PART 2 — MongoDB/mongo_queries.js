// OP1: insertMany() — insert all 3 documents
db.products.insertMany([
  {
    _id: 101,
    category: "Electronics",
    product_name: "Laptop",
    brand: "Dell",
    price: 70000,
    specifications: {
      processor: "Intel i7",
      ram: "16GB",
      storage: "512GB SSD"
    },
    warranty: {
      years: 2,
      type: "Manufacturer"
    }
  },
  {
    _id: 102,
    category: "Clothing",
    product_name: "T-Shirt",
    brand: "Nike",
    price: 1200,
    sizes: ["S", "M", "L"],
    colors: ["Black", "White"]
  },
  {
    _id: 103,
    category: "Groceries",
    product_name: "Rice",
    brand: "India Gate",
    price: 900,
    expiry_date: "2024-12-31",
    nutritional_info: {
      calories: 130,
      protein: "2.5g"
    }
  }
]);

// OP2: find() — Electronics products with price > 20000
db.products.find({
  category: "Electronics",
  price: { $gt: 20000 }
});

// OP3: find() — Groceries expiring before 2025-01-01
db.products.find({
  category: "Groceries",
  expiry_date: { $lt: "2025-01-01" }
});

// OP4: updateOne() — add discount_percent
db.products.updateOne(
  { _id: 101 },
  { $set: { discount_percent: 10 } }
);

// OP5: createIndex() — index on category
db.products.createIndex({ category: 1 });
