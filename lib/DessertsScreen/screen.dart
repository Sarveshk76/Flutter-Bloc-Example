import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/DessertsScreen/bloc/dessert_bloc.dart';

class DessertsScreen extends StatefulWidget {
  const DessertsScreen({super.key});

  @override
  State<DessertsScreen> createState() => _DessertsScreenState();
}

class _DessertsScreenState extends State<DessertsScreen> {
  @override
  Widget build(BuildContext context) {
    List dessertItems = [
      {
        'title': 'Chocolate Berry Cake',
        'desc': 'Description of Item 1',
        'price': '₹50',
        'asset': 'assets/images/desserts/chocolate_berry_cake.png'
      },
      {
        'title': 'Coffee Ice Cream',
        'desc': 'Description of Item 2',
        'price': '₹50',
        'asset': 'assets/images/desserts/coffee_ice_cream.png'
      },
      {
        'title': 'Panna Cotta',
        'desc': 'Description of Item 1',
        'price': '₹50',
        'asset': 'assets/images/desserts/panna_cotta.png'
      },
    ];
    return Column(
      children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            itemCount: dessertItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(
                    children: [
                      Text(dessertItems[index]['title']),
                      Image(
                        image: AssetImage(dessertItems[index]['asset']),
                        height: 100,
                        width: 100,
                      ),
                      Text(dessertItems[index]['desc']),
                      BlocConsumer<DessertBloc, DessertState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.deepOrange, width: 1)),
                              onPressed: () {
                                BlocProvider.of<DessertBloc>(context).add(
                                    DessertItemAddToCartEvent(
                                        dessertItems[index]));
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
