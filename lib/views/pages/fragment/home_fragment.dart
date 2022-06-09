import 'package:flutter/material.dart';
import 'package:telumerce/const/text_theme.dart';
import 'package:telumerce/data/categories_datasource.dart';
import 'package:telumerce/data/product_datasource.dart';
import 'package:telumerce/model/dummy/category.dart';
import 'package:telumerce/views/responsive/responsive_layout.dart';
import 'package:telumerce/views/widgets/top_bar.dart';

import '../../../model/dummy/product.dart';
import '../../widgets/category_card.dart';
import '../../widgets/home_search_bar.dart';
import '../../widgets/product_card.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({Key? key}) : super(key: key);

  List<Product> productList = ProductDatasource.getAllProductsDummy();
  List<Categories> categoryList = CategoriesDatasource.getAllCategoriesDummy();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main-content
        Positioned(
          top: 50.0,
          left: 0,
          right: 0,
          bottom: 0,
          child: ResponsiveLayout(
            smallMobile: ListView(
              children: [
                // Teks greeting untuk user
                Padding(
                  padding:
                      const EdgeInsets.only(left: 14.0, top: 8.0, bottom: 18.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(height: 1.3),
                      children: [
                        TextSpan(text: 'Hai, ', style: bodyMedium),
                        TextSpan(text: 'Judah Dasuki\n', style: titleMedium),
                        TextSpan(
                            text: 'Ayo cari barang kesukaanmu.',
                            style: bodySmall),
                      ],
                    ),
                  ),
                ),

                // Product random
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 14.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (_, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: productList[index]),
                      );
                    },
                  ),
                ),

                // Kategori
                const Padding(
                  padding: EdgeInsets.only(left: 14.0, top: 24.0, bottom: 12.0),
                  child: Text('Kategori', style: labelMedium),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 14.0, right: 24.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryList.map((category) {
                      return CategoryCard(category: category);
                    }).toList(),
                  ),
                ),

                //  Produk
                const Padding(
                  padding:
                  EdgeInsets.only(left: 14.0, top: 20.0, bottom: 12.0),
                  child: Text('Produk', style: labelMedium),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Column(
                    children: [],
                  ),
                ),
              ],
            ),
            mediumMobile: ListView(
              children: [
                // Teks greeting untuk user
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8.0, bottom: 20.0),
                  child: RichText(
                    text: const TextSpan(
                        style: TextStyle(height: 1.5),
                        children: [
                          TextSpan(text: 'Hai, ', style: bodyLarge),
                          TextSpan(text: 'Judah Dasuki\n', style: titleLarge),
                          TextSpan(
                              text: 'Ayo cari barang kesukaanmu.',
                              style: bodyMedium),
                        ]),
                  ),
                ),

                // Product random
                SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(left: 14.0),
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length,
                    itemBuilder: (_, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ProductCard(product: productList[index],),
                      );
                    },
                  ),
                ),

                // Kategori
                const Padding(
                  padding:
                  EdgeInsets.only(left: 16.0, top: 26.0, bottom: 14.0),
                  child: Text('Kategori', style: labelLarge),
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16.0, right: 24.0),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categoryList.map((category) {
                      return CategoryCard(category: category);
                    }).toList(),
                  ),
                ),

                //  Produk
                const Padding(
                  padding:
                  EdgeInsets.only(left: 16.0, top: 22.0, bottom: 14.0),
                  child: Text('Produk', style: labelLarge),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: const [],
                  ),
                ),
              ],
            ),
          ),
        ),

        // Top-bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: TopBar(
            topBarWidget: const HomeSearchBar(),
          ),
        )
      ],
    );
  }
}
