
import 'package:flutter/material.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController =
      TextEditingController();

  String selectedCategory = 'Semua';

  final List<String> categories = [
    'Semua',
    'Makanan',
    'Minuman',
    'Dessert',
    'Snack',
  ];

  final List<FoodItem> products = [
    FoodItem(
      name: 'Nasi Goreng Spesial',
      category: 'Makanan',
      price: 25000,
      description:
          'Nasi goreng spesial dengan telur, ayam suwir, sosis, kerupuk, dan bumbu rempah pilihan yang menghasilkan rasa gurih dan nikmat.',
      imageUrl:
          'https://images.unsplash.com/photo-1603133872878-684f208fb84b?w=800',
      rating: 4.9,
      reviewCount: 120,
      prepTime: '15-20 menit',
      calories: '450 kkal',
      portion: '1 Porsi',
      ingredients: [
        'Nasi putih',
        'Telur ayam',
        'Ayam suwir',
        'Sosis',
        'Bawang merah dan putih',
        'Kecap manis',
      ],
      isPopular: true,
    ),
    FoodItem(
      name: 'Mie Goreng Jawa',
      category: 'Makanan',
      price: 20000,
      description:
          'Mie goreng khas Jawa dengan bumbu tradisional, sayuran segar, telur, dan taburan bawang goreng.',
      imageUrl:
          'https://images.unsplash.com/photo-1585032226651-759b368d7246?w=800',
      rating: 4.8,
      reviewCount: 85,
      prepTime: '15 menit',
      calories: '390 kkal',
      portion: '1 Porsi',
      ingredients: [
        'Mie telur',
        'Telur',
        'Sawi hijau',
        'Kol',
        'Kecap manis',
        'Bumbu rempah',
      ],
      isPopular: true,
    ),
    FoodItem(
      name: 'Ayam Bakar Madu',
      category: 'Makanan',
      price: 30000,
      description:
          'Ayam bakar dengan olesan madu spesial, bumbu meresap hingga ke dalam daging, disajikan dengan sambal dan lalapan.',
      imageUrl:
          'https://images.unsplash.com/photo-1532550907401-a500c9a57435?w=800',
      rating: 4.9,
      reviewCount: 95,
      prepTime: '25 menit',
      calories: '520 kkal',
      portion: '1 Porsi',
      ingredients: [
        'Ayam',
        'Madu',
        'Kecap manis',
        'Bawang putih',
        'Jahe',
        'Sambal',
      ],
      isPopular: true,
    ),
    FoodItem(
      name: 'Sate Ayam',
      category: 'Makanan',
      price: 28000,
      description:
          'Sate ayam pilihan yang dibakar dengan bumbu khas, disajikan bersama saus kacang dan lontong.',
      imageUrl:
          'https://images.unsplash.com/photo-1529042410759-befb1204b468?w=800',
      rating: 4.7,
      reviewCount: 76,
      prepTime: '20 menit',
      calories: '410 kkal',
      portion: '10 Tusuk',
      ingredients: [
        'Daging ayam',
        'Bumbu kacang',
        'Kecap manis',
        'Jeruk limau',
        'Lontong',
      ],
      isPopular: false,
    ),
    FoodItem(
      name: 'Es Kopi Susu',
      category: 'Minuman',
      price: 18000,
      description:
          'Perpaduan kopi pilihan, susu segar, dan gula aren dengan rasa creamy dan aroma kopi yang khas.',
      imageUrl:
          'https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=800',
      rating: 4.8,
      reviewCount: 110,
      prepTime: '5 menit',
      calories: '180 kkal',
      portion: '250 ml',
      ingredients: [
        'Espresso',
        'Susu segar',
        'Gula aren',
        'Es batu',
      ],
      isPopular: true,
    ),
    FoodItem(
      name: 'Jus Strawberry',
      category: 'Minuman',
      price: 15000,
      description:
          'Jus strawberry segar yang dibuat dari buah pilihan dengan rasa manis dan sedikit asam yang menyegarkan.',
      imageUrl:
          'https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=800',
      rating: 4.7,
      reviewCount: 65,
      prepTime: '5 menit',
      calories: '120 kkal',
      portion: '300 ml',
      ingredients: [
        'Buah strawberry',
        'Susu',
        'Gula',
        'Es batu',
      ],
      isPopular: false,
    ),
    FoodItem(
      name: 'Chocolate Cake',
      category: 'Dessert',
      price: 22000,
      description:
          'Kue cokelat lembut dengan lapisan cokelat premium dan tekstur moist yang cocok untuk pencinta dessert.',
      imageUrl:
          'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=800',
      rating: 4.9,
      reviewCount: 89,
      prepTime: '10 menit',
      calories: '350 kkal',
      portion: '1 Slice',
      ingredients: [
        'Tepung terigu',
        'Cokelat',
        'Telur',
        'Mentega',
        'Gula',
        'Krim',
      ],
      isPopular: true,
    ),
    FoodItem(
      name: 'French Fries',
      category: 'Snack',
      price: 16000,
      description:
          'Kentang goreng renyah dengan taburan bumbu pilihan dan saus sambal serta tomat.',
      imageUrl:
          'https://images.unsplash.com/photo-1573080496219-bb080dd4f877?w=800',
      rating: 4.6,
      reviewCount: 58,
      prepTime: '10 menit',
      calories: '280 kkal',
      portion: '1 Porsi',
      ingredients: [
        'Kentang',
        'Garam',
        'Bumbu tabur',
        'Saus tomat',
        'Saus sambal',
      ],
      isPopular: false,
    ),
  ];

  List<FoodItem> get filteredProducts {
    return products.where((food) {
      final matchesSearch = food.name
          .toLowerCase()
          .contains(searchController.text.toLowerCase());

      final matchesCategory =
          selectedCategory == 'Semua' ||
          food.category == selectedCategory;

      return matchesSearch && matchesCategory;
    }).toList();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  String formatPrice(int price) {
    return 'Rp ${price.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Food Menu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFF7043),
              ),
            ),
            Text(
              'Temukan makanan favoritmu',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: Color(0xFFFFE0D6),
              child: Icon(
                Icons.restaurant_menu,
                color: Color(0xFFFF7043),
              ),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Banner
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFF7043),
                    Color(0xFFFF9A76),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Nikmati berbagai pilihan makanan\ndan minuman favorit setiap hari.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 10),
                  Icon(
                    Icons.fastfood,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),

            // Search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Cari makanan favorit...',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Category
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Kategori',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 42,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final selected =
                      selectedCategory == category;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ChoiceChip(
                      label: Text(category),
                      selected: selected,
                      selectedColor: const Color(0xFFFF7043),
                      backgroundColor: Colors.white,
                      labelStyle: TextStyle(
                        color: selected
                            ? Colors.white
                            : Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                      onSelected: (value) {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 18),

            // Product title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Daftar Makanan',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${filteredProducts.length} Menu',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Product List
            Expanded(
              child: filteredProducts.isEmpty
                  ? const Center(
                      child: Text(
                        'Makanan tidak ditemukan',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        final food = filteredProducts[index];

                        return Card(
                          color: Colors.white,
                          elevation: 2,
                          margin: const EdgeInsets.only(bottom: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(food: food),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                // Food Image
                                SizedBox(
                                  width: 125,
                                  height: 140,
                                  child: Image.network(
                                    food.imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder:
                                        (context, error, stackTrace) {
                                      return Container(
                                        color: Colors.grey.shade200,
                                        child: const Icon(
                                          Icons.fastfood,
                                          size: 40,
                                          color: Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),

                                // Food Information
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (food.isPopular)
                                          Container(
                                            padding:
                                                const EdgeInsets.symmetric(
                                              horizontal: 8,
                                              vertical: 4,
                                            ),
                                            decoration: BoxDecoration(
                                              color: const Color(
                                                0xFFFFE0D6,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: const Text(
                                              'BEST SELLER',
                                              style: TextStyle(
                                                fontSize: 9,
                                                color: Color(0xFFFF7043),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),

                                        const SizedBox(height: 6),

                                        Text(
                                          food.name,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        const SizedBox(height: 5),

                                        Text(
                                          food.category,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        ),

                                        const SizedBox(height: 8),

                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 17,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '${food.rating} (${food.reviewCount})',
                                              style: const TextStyle(
                                                fontSize: 11,
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 8),

                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                formatPrice(food.price),
                                                style: const TextStyle(
                                                  color: Color(0xFFFF7043),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                ),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.arrow_forward_ios,
                                              color: Color(0xFFFF7043),
                                              size: 17,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
