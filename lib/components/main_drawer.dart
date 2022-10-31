import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealapp/src/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(
      IconData icon, String label, BuildContext ctx, String routePage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: GoogleFonts.robotoCondensed(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => Navigator.of(ctx).pushReplacementNamed(routePage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            child: const Text(
              'Menu',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          _createItem(Icons.restaurant, 'Meals', context, AppRoutes.home),
          _createItem(Icons.settings, 'Settings', context, AppRoutes.settings),
        ],
      ),
    );
  }
}
