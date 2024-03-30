import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {
  final Settings settings;
  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.settings, this.onSettingsChanged, {Key? key})
      : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile(
      key: Key(title.replaceFirst(RegExp(r'é'), 'e')),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings!);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              key: const Key('filters'),
              children: [
                _createSwitch(
                  'Glutén',
                  'Só exibir refeições sem glúten!',
                  settings!.isGlutenFree,
                  (value) => setState(() => settings!.isGlutenFree = value),
                ),
                const Divider(height: 0),
                _createSwitch(
                  'Lactose',
                  'Só exibir refeições sem lactose!',
                  settings!.isLactoseFree,
                  (value) => setState(() => settings!.isLactoseFree = value),
                ),
                const Divider(height: 0),
                _createSwitch(
                  'Vegana',
                  'Só exibir refeições veganas!',
                  settings!.isVegan,
                  (value) => setState(() => settings!.isVegan = value),
                ),
                const Divider(height: 0),
                _createSwitch(
                  'Vegetariana',
                  'Só exibir refeições vegetarianas!',
                  settings!.isVegetarian,
                  (value) => setState(() => settings!.isVegetarian = value),
                ),
                const Divider(height: 0),
              ],
            ),
          )
        ],
      ),
    );
  }
}
