import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final void Function()? onPressed;

  const CustomAppBar({super.key, required this.height, this.onPressed});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        boxShadow: [
          BoxShadow(blurRadius: 5, spreadRadius: -3, offset: Offset(1, 1)),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/ellipse2.png'),
            ),
          ),
          SizedBox(width: 10),
          Text(
            'Захарова Анна',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),

          IconButton(
            onPressed: onPressed,
            color: Colors.black,
            icon: Icon(Icons.arrow_forward_ios, size: 12),
          ),
          SizedBox(width: 10),
          Spacer(),
          LanguageSwitchWidget(),
        ],
      ),
    );
  }
}

// / import 'package:flutter/material.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? imageAppBar;
//   final double height;
//   final bool showImage;

//   const CustomAppBar({
//     super.key,
//     this.imageAppBar,
//     required this.height,
//     required this.showImage,
//     required Null Function() onPressed,
//   });

//   @override
//   Size get preferredSize => Size.fromHeight(height);

//   @override
//   Widget build(BuildContext context) {
//     final darkTheme = Theme.of(context).brightness == Brightness.dark;
//     return Stack(
//       fit: StackFit.expand,
//       children: [
//         if (showImage && imageAppBar != null)
//           ClipRRect(
//             borderRadius: const BorderRadius.only(
//               bottomLeft: Radius.circular(16),
//               bottomRight: Radius.circular(16),
//             ),
//             child: Image.asset(imageAppBar!, fit: BoxFit.cover),
//           ),
//         Positioned(
//           top: 16,
//           left: 0,
//           right: 0,
//           child: Container(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             decoration: BoxDecoration(
//               color:
//                   darkTheme
//                       ? Colors.grey.shade900
//                       : Colors.white.withValues(alpha: 0.8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 5,
//                   offset: Offset(1, 1),
//                 ),
//               ],

//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Image.asset('assets/images/logo.png', width: 54),
//                 Builder(
//                   builder:
//                       (context) => IconButton(
//                         icon: Icon(Icons.menu),
//                         onPressed: () {
//                           Scaffold.of(context).openDrawer();
//                         },
//                       ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
