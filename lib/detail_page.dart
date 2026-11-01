
import 'package:flutter/material.dart';

// MODEL DATA MAKANAN
class FoodItem {
  final String name;
  final String category;
  final int price;
  final String description;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String prepTime;
  final String calories;
  final String portion;
  final List<String> ingredients;
  final bool isPopular;

  const FoodItem({
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.prepTime,
    required this.calories,
    required this.portion,
    required this.ingredients,
    required this.isPopular,
  });
}

// DETAIL PAGE
class DetailPage extends StatefulWidget {
  final FoodItem food;

  const DetailPage({
    super.key,
    required this.food,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isFavorite = false;
  int quantity = 1;

  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    final totalPrice = food.price * quantity;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Makanan',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // FOOD IMAGE
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 270,
                  child: Image.network(
                    food.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.fastfood,
                          size: 70,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                if (food.isPopular)
                  Positioned(
                    top: 18,
                    left: 18,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF7043),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'BEST SELLER',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // FOOD INFORMATION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Name and category
                  Text(
                    food.category.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFFFF7043),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    food.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Rating
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 21,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${food.rating}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '(${food.reviewCount} ulasan)',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Price
                  Text(
                    formatPrice(food.price),
                    style: const TextStyle(
                      color: Color(0xFFFF7043),
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 22),

                  const Divider(),

                  // DESCRIPTION
                  const SizedBox(height: 12),

                  const Text(
                    'Deskripsi Makanan',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    food.description,
                    style: const TextStyle(
                      color: Colors.black54,
                      height: 1.6,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 25),

                  // FOOD DETAILS
                  const Text(
                    'Informasi Makanan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: infoCard(
                          Icons.access_time,
                          'Waktu Penyajian',
                          food.prepTime,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: infoCard(
                          Icons.local_fire_department,
                          'Kalori',
                          food.calories,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: infoCard(
                          Icons.restaurant,
                          'Porsi',
                          food.portion,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // INGREDIENTS
                  const Text(
                    'Bahan-Bahan',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  ...food.ingredients.map((ingredient) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.check_circle,
                            color: Color(0xFFFF7043),
                            size: 19,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ingredient,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  const Divider(),

                  // QUANTITY
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Jumlah Pesanan',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                              color: Color(0xFFFF7043),
                            ),
                          ),

                          Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Color(0xFFFF7043),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM ORDER BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Harga',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      formatPrice(totalPrice),
                      style: const TextStyle(
                        color: Color(0xFFFF7043),
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${food.name} sebanyak $quantity berhasil ditambahkan ke pesanan!',
                      ),
                      backgroundColor: const Color(0xFFFF7043),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                label: const Text(
                  'Pesan Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF7043),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // WIDGET INFORMASI
  Widget infoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2ED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xFFFF7043),
            size: 25,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
