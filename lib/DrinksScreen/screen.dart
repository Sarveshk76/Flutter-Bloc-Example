import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/drink_bloc.dart';

class DrinksScreen extends StatefulWidget {
  const DrinksScreen({super.key});

  @override
  State<DrinksScreen> createState() => _DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen> {
  List drinkItems = [
    {
      'title': 'Tea',
      'desc': 'Description of Item 1',
      'price': '₹50',
      'asset': 'assets/images/drinks/tea.png'
    },
    {
      'title': 'Coffee',
      'desc': 'Description of Item 2',
      'price': '₹50',
      'asset': 'assets/images/drinks/coffee.png'
    },
    {
      'title': 'Chocolate Milk',
      'desc': 'Description of Item 1',
      'price': '₹50',
      'asset': 'assets/images/drinks/chocolate_milk.png'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: drinkItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(
                    children: [
                      Text(drinkItems[index]['title']),
                      Image(
                        image: AssetImage(drinkItems[index]['asset']),
                        height: 100,
                        width: 100,
                      ),
                      Text(drinkItems[index]['desc']),
                      BlocConsumer<DrinkBloc, DrinkState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.deepOrange, width: 1)),
                              onPressed: () {
                                context.read<DrinkBloc>().add(
                                    DrinkItemsAddToCartEvent(
                                        drinkItems[index]));
                              },
                              child: const Text('+'));
                        },
                      )
                    ],
                  ),
                ),
              );
            })
      ],
    );
  }
}
