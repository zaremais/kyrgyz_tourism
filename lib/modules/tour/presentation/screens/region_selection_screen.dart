import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegionSelectionScreen extends StatelessWidget {
  final String? selectedRegion;
  final Function(String) onRegionSelected;

  RegionSelectionScreen({
    super.key,
    required this.selectedRegion,
    required this.onRegionSelected,
  });

  final List<String> availableRegions = [
    'Чуй',
    'Osh',
    'Баткен',
    'Нарын',
    'Талас',
    'Иссык-Куль',
    'Джалал-Абад',
    'Bishkek',
    'Ош (город)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выбор региона')),
      body: ListView.separated(
        itemCount: availableRegions.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final region = availableRegions[index];
          final isSelected = region == selectedRegion;
          return ListTile(
            title: Text(region),
            trailing:
                isSelected
                    ? const Icon(Icons.check, color: Colors.green)
                    : null,
            onTap: () {
              onRegionSelected(region);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
