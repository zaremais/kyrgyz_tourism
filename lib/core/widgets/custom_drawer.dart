import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kyrgyz_tourism/core/config/route/route.dart';
import 'package:kyrgyz_tourism/core/config/themes/app_sizes.dart';
import 'package:kyrgyz_tourism/core/widgets/language_switch_widget.dart';
import 'package:kyrgyz_tourism/generated/l10n.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 30),
        Center(
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.clear, size: AppSizes.paddingBig),
          ),
        ),
        const SizedBox(height: 100),
        Column(
          children: [
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).aboutcompany,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.push(HomeRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).tours,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.navigate(ToursRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).contacts,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.push(SettingsRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).guides,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.push(GuideRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).login,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.push(AuthRoute());
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Center(
                child: Text(
                  S.of(context).settings,
                  style: TextStyle(fontSize: AppSizes.logoFontSize),
                ),
              ),
              onTap: () {
                context.router.push(SettingsRoute());
                Navigator.pop(context);
              },
            ),
          ],
        ),
        // _buildListTile(context),
        const SizedBox(height: 100),
        SizedBox(height: 50),
        Center(child: const LanguageSwitchWidget()),
      ],
    );
  }
}

// Widget _buildListTile(BuildContext context) {
//    final TourEntity tour;
//   return Column(
//     children: [
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).aboutcompany,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.push(HomeRoute(tour:));
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).tours,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.navigate(ToursRoute());
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).contacts,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.push(SettingsRoute());
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).guides,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.push(GuideRoute());
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).login,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.push(AuthRoute());
//           Navigator.pop(context);
//         },
//       ),
//       ListTile(
//         title: Center(
//           child: Text(
//             S.of(context).settings,
//             style: TextStyle(fontSize: AppSizes.logoFontSize),
//           ),
//         ),
//         onTap: () {
//           context.router.push(SettingsRoute());
//           Navigator.pop(context);
//         },
//       ),
//     ],
//   );
// }
