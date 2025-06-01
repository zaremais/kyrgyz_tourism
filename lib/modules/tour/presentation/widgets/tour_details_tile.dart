import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/themes/theme.dart';

class TourDetailTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Color color;
  const TourDetailTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: Image.asset(
        iconPath,
        color: isDark ? Colors.white : Colors.black,
      ),
      title: Text(title, style: FontStyles.bodyInfo),
      subtitle: Text(subtitle, style: FontStyles.bodyLarge),
    );
  }
}
// Widget _buildTourDetails(TourEntity tour) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       _buildDetailTile(
//         iconPath: 'assets/icon/location.png',
//         title: 'Точка сбора',
//         subtitle: tour.location ?? "",
//       ),
//       _buildDetailTile(
//         iconPath: 'assets/icon/calendar.png',
//         title: 'Длительность',
//         subtitle: tour.tourDuration.toString(),
//       ),
//       _buildDetailTile(
//         iconPath: 'assets/icon/hiking.png',
//         title: 'Сложность',
//         subtitle: tour.category ?? '',
//       ),
//       _buildDetailTile(
//         iconPath: 'assets/icon/price.png',
//         title: 'Стоимость',
//         subtitle: tour.price.toString(),
//       ),
//       _buildDetailTile(
//         iconPath: 'assets/icon/human.png',
//         title: 'Возраст от',
//         subtitle: tour.age.toString(),
//       ),
//       _buildDetailTile(
//         iconPath: 'assets/icon/group.png',
//         title: 'Группа',
//         subtitle: tour.groupPeople.toString(),
//       ),
//     ],
//   );
// }