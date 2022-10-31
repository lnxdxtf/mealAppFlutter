import 'package:flutter/material.dart';
import 'package:mealapp/components/main_drawer.dart';
import 'package:mealapp/src/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Function(Settings) onSettingsChanged;
  final Settings settings;
  const SettingsScreen(this.settings, this.onSettingsChanged, {super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Settings settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, String option) {
    return SwitchListTile.adaptive(
        value: value,
        title: Text(title),
        subtitle: Text(subtitle),
        onChanged: (value) => setState(() {
              switch (option) {
                case 'isGlutenFree':
                  settings.isGlutenFree = value;
                  break;
                case 'isLactoseFree':
                  settings.isLactoseFree = value;
                  break;
                case 'isVegan':
                  settings.isVegan = value;
                  break;
                case 'isVegetarian':
                  settings.isVegetarian = value;
                  break;
              }
              widget.onSettingsChanged(settings);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'No gluten',
                  'Show Free Gluten Meals',
                  settings.isGlutenFree,
                  'isGlutenFree',
                ),
                _createSwitch(
                  'No Lactose',
                  'Show Free Lactose Meals',
                  settings.isLactoseFree,
                  'isLactoseFree',
                ),
                _createSwitch(
                  'Vegan Meal',
                  'Show Vegan Meals',
                  settings.isVegan,
                  'isVegan',
                ),
                _createSwitch(
                  'Vegetarian Meal',
                  'Show Vegetarian Meals',
                  settings.isVegetarian,
                  'isVegetarian',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
