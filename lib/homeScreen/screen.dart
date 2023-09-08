import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../BreakfastScreen/bloc/breakfast_bloc.dart';
import '../BreakfastScreen/screen.dart';
import '../DessertsScreen/bloc/dessert_bloc.dart';
import '../DessertsScreen/screen.dart';
import 'package:badges/badges.dart' as badges;
import '../DrinksScreen/bloc/drink_bloc.dart';
import '../DrinksScreen/screen.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BreakfastBloc>(
              create: (context) => BreakfastBloc(),
            ),
            BlocProvider<DessertBloc>(
              create: (context) => DessertBloc(),
            ),
            BlocProvider<DrinkBloc>(
              create: (context) => DrinkBloc(),
            ),
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(),
            ),
          ],
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: const Center(
                    child: Text(
                  'OrderUp',
                  style: TextStyle(fontSize: 24),
                )),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: badges.Badge(
                      badgeContent: const Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                      position: badges.BadgePosition.topEnd(top: -2, end: 1),
                      child: BlocConsumer<HomeBloc, HomeState>(
                        listenWhen: (previous, current) =>
                            current is NavigateToCartState,
                        buildWhen: (previous, current) =>
                            current is! NavigateToCartState,
                        listener: (context, state) {
                          if (state is NavigateToCartState) {
                            Navigator.pushNamed(context, '/cart');
                          } else {
                            print('Not NavigateToCartState');
                          }
                        },
                        builder: (context, state) {
                          return IconButton(
                            icon: const Icon(Icons.shopping_cart),
                            onPressed: () {
                              context
                                  .read<HomeBloc>()
                                  .add(NavigateToCartEvent());
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
                bottom: const TabBar(
                  tabs: <Widget>[
                    Tab(
                      text: 'Breakfast',
                    ),
                    Tab(
                      text: 'Drinks',
                    ),
                    Tab(
                      text: 'Dessert',
                    ),
                  ],
                ),
              ),
              body: const TabBarView(
                children: <Widget>[
                  Center(
                    child: BreakfastScreen(),
                  ),
                  Center(
                    child: DrinksScreen(),
                  ),
                  Center(
                    child: DessertsScreen(),
                  ),
                ],
              )),
        ));
  }
}
