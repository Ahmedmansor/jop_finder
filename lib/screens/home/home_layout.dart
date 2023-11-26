import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit/buttom_navigation_bar_screens_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtomNavigationBarScreensCubit,
        ButtomNavigationBarScreensState>(
      builder: (context, state) {
        return Scaffold(
          body: ButtomNavigationBarScreensCubit.get(context)
              .screens[ButtomNavigationBarScreensCubit.get(context).index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: ButtomNavigationBarScreensCubit.get(context).index,
            onTap: (value) {
              ButtomNavigationBarScreensCubit.get(context).changeScreen(value);
            },
            selectedItemColor: Colors.deepOrange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.message,
                ),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: "Applied",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_indent_increase_outlined,
                ),
                label: "Saved",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_2_outlined,
                ),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
