import 'package:mini_shopping_cart/models/product_data_model.dart';

// https://static.vecteezy.com/system/resources/thumbnails/024/841/285/small/wireless-headphone-isolated-on-transparent-background-high-quality-bluetooth-headphone-for-advertising-and-product-catalogs-generative-ai-png.png
// https://static.vecteezy.com/system/resources/thumbnails/047/249/338/small/sweater-shirt-hoodie-isolated-png.png
// https://static.vecteezy.com/system/resources/thumbnails/070/941/805/small/modern-briefcase-design-office-setting-product-photography-urban-background-professional-viewpoint-stylish-concept-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/044/450/838/small/black-large-t-shirt-mockup-front-transparent-background-isolated-graphic-resource-t-shirt-tee-branding-design-png.png
// https://static.vecteezy.com/system/resources/thumbnails/036/152/778/small/ai-generated-delicious-honey-jar-with-dipper-sweet-organic-beehive-product-png.png
// https://static.vecteezy.com/system/resources/thumbnails/055/555/108/small/spicy-chili-sauce-against-transparent-background-for-food-branding-culinary-promotions-or-hot-sauce-product-designs-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/051/015/996/small/round-hair-brush-roll-comb-3d-illustration-for-hairdressing-salon-concept-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/056/101/978/small/a-bottle-of-cola-is-shown-on-a-transparent-background-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/055/236/490/small/stylish-polished-leather-belt-with-silver-buckle-perfect-for-formal-and-casual-attire-in-fashion-branding-and-product-showcase-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/055/753/502/small/grey-hoodie-mockup-casual-wear-comfortable-style-against-transparent-background-for-fashion-or-apparel-branding-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/055/130/484/small/realistic-american-football-leather-ball-with-white-laces-high-detail-product-photography-free-png.png
// https://static.vecteezy.com/system/resources/thumbnails/049/207/357/small/pink-and-orange-gradient-t-shirt-mockup-isolated-on-transparent-background-free-png.png
// https://i.ibb.co.com/DgD1xzvJ/2.png
// https://i.ibb.co.com/jPPpj95T/3.png
// https://i.ibb.co.com/84xBxZgK/4.png
// https://i.ibb.co.com/d05swsHf/1.png
// https://i.ibb.co.com/prJvFRSM/5.png
// https://i.ibb.co.com/HTZ2dwFk/6.png
// https://i.ibb.co.com/YFJPb2QV/7.png
// https://i.ibb.co.com/0RQYdk8T/8.png
// https://i.ibb.co.com/RGn3rgp4/9.png
// https://i.ibb.co.com/vG5qnv6/10.png
// https://i.ibb.co.com/jPxqhMFp/11.png
// https://i.ibb.co.com/ynRPyqGn/12.png
// https://i.ibb.co.com/fzsBNyV0/13.png

class DummyProducts {
  List<ProductDataModel> products = [
    ProductDataModel(
      productId: "1",
      name: "Wireless Headphone",
      description:
          "High-quality bluetooth headphones for an immersive audio experience.",
      price: 59.99,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/024/841/285/small/wireless-headphone-isolated-on-transparent-background-high-quality-bluetooth-headphone-for-advertising-and-product-catalogs-generative-ai-png.png",
      category: "Electronics",
    ),
    ProductDataModel(
      productId: "2",
      name: "Sweater Hoodie",
      description:
          "Comfortable and stylish sweater shirt hoodie for daily wear.",
      price: 35.00,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/047/249/338/small/sweater-shirt-hoodie-isolated-png.png",
      category: "Apparel",
    ),
    ProductDataModel(
      productId: "3",
      name: "Modern Briefcase",
      description: "Professional briefcase design perfect for office settings.",
      price: 85.50,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/070/941/805/small/modern-briefcase-design-office-setting-product-photography-urban-background-professional-viewpoint-stylish-concept-free-png.png",
      category: "Accessories",
    ),
    ProductDataModel(
      productId: "4",
      name: "Black T-Shirt",
      description: "Large black t-shirt mockup with a premium cotton feel.",
      price: 19.99,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/044/450/838/small/black-large-t-shirt-mockup-front-transparent-background-isolated-graphic-resource-t-shirt-tee-branding-design-png.png",
      category: "Apparel",
    ),
    ProductDataModel(
      productId: "5",
      name: "Honey Jar",
      description: "Organic delicious honey jar with a wooden dipper.",
      price: 12.00,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/036/152/778/small/ai-generated-delicious-honey-jar-with-dipper-sweet-organic-beehive-product-png.png",
      category: "Food",
    ),
    ProductDataModel(
      productId: "6",
      name: "Spicy Chili Sauce",
      description:
          "Hot chili sauce perfect for culinary promotions and spicy food lovers.",
      price: 5.99,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/055/555/108/small/spicy-chili-sauce-against-transparent-background-for-food-branding-culinary-promotions-or-hot-sauce-product-designs-free-png.png",
      category: "Food",
    ),
    ProductDataModel(
      productId: "7",
      name: "Round Hair Brush",
      description: "Professional 3D illustration of a round hair roll comb.",
      price: 8.50,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/051/015/996/small/round-hair-brush-roll-comb-3d-illustration-for-hairdressing-salon-concept-free-png.png",
      category: "Personal Care",
    ),
    ProductDataModel(
      productId: "8",
      name: "Cola Bottle",
      description: "Refreshing bottle of cola on a transparent background.",
      price: 1.50,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/056/101/978/small/a-bottle-of-cola-is-shown-on-a-transparent-background-free-png.png",
      category: "Beverages",
    ),
    ProductDataModel(
      productId: "9",
      name: "Leather Belt",
      description: "Stylish polished leather belt with a silver buckle.",
      price: 25.00,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/055/236/490/small/stylish-polished-leather-belt-with-silver-buckle-perfect-for-formal-and-casual-attire-in-fashion-branding-and-product-showcase-free-png.png",
      category: "Accessories",
    ),
    ProductDataModel(
      productId: "10",
      name: "Grey Hoodie",
      description: "Casual grey hoodie mockup for a comfortable style.",
      price: 39.99,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/055/753/502/small/grey-hoodie-mockup-casual-wear-comfortable-style-against-transparent-background-for-fashion-or-apparel-branding-free-png.png",
      category: "Apparel",
    ),
    ProductDataModel(
      productId: "11",
      name: "American Football",
      description: "Realistic leather football ball with detailed white laces.",
      price: 29.99,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/055/130/484/small/realistic-american-football-leather-ball-with-white-laces-high-detail-product-photography-free-png.png",
      category: "Sports",
    ),
    ProductDataModel(
      productId: "12",
      name: "Gradient T-Shirt",
      description: "Pink and orange gradient t-shirt mockup.",
      price: 22.00,
      imageUrl:
          "https://static.vecteezy.com/system/resources/thumbnails/049/207/357/small/pink-and-orange-gradient-t-shirt-mockup-isolated-on-transparent-background-free-png.png",
      category: "Apparel",
    ),
    // Numeric images assigned to "Fruits" category
    ProductDataModel(
      productId: "13",
      name: "Fresh Fruit 2",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/DgD1xzvJ/2.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "14",
      name: "Fresh Fruit 3",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/jPPpj95T/3.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "15",
      name: "Pineapple",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/84xBxZgK/4.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "16",
      name: "Coconut",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/d05swsHf/1.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "17",
      name: "Fresh Fruit 5",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/prJvFRSM/5.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "18",
      name: "Strawberry",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/HTZ2dwFk/6.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "19",
      name: "cherry",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/YFJPb2QV/7.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "20",
      name: "Banana (Sagor)",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/0RQYdk8T/8.png",
      category: "Fruits",
    ),
    ProductDataModel(
      productId: "21",
      name: "Fresh Fruit 9",
      description: "Delicious and organic fruit from our farm.",
      price: 2.99,
      imageUrl: "https://i.ibb.co.com/RGn3rgp4/9.png",
      category: "Fruits",
    ),

