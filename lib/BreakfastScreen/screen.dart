import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/BreakfastScreen/bloc/breakfast_bloc.dart';

class BreakfastScreen extends StatefulWidget {
  const BreakfastScreen({super.key});

  @override
  State<BreakfastScreen> createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  List breakfastItems = [
    {
      'title': 'Idli',
      'desc': 'Description of Item 1',
      'price': '₹50',
      'asset': 'assets/images/breakfast/idli.png'
    },
    {
      'title': 'Puri Subji',
      'desc': 'Description of Item 1',
      'price': '₹50',
      'asset': 'assets/images/breakfast/puri_subji.png'
    },
    {
      'title': 'Upama',
      'desc': 'Description of Item 1',
      'price': '₹50',
      'asset': 'assets/images/breakfast/upama.png'
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
            itemCount: breakfastItems.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  child: Column(
                    children: [
                      Text(breakfastItems[index]['title']),
                      Image(
                        image: AssetImage(breakfastItems[index]['asset']),
                        height: 100,
                        width: 100,
                      ),
                      Text(breakfastItems[index]['desc']),
                      BlocConsumer<BreakfastBloc, BreakfastState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          return OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.deepOrange, width: 1)),
                              onPressed: () {
                                context.read<BreakfastBloc>().add(
                                    BreakfastItemAddToCartEvent(
                                        breakfastItems[index]));
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
