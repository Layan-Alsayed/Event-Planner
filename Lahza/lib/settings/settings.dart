import 'package:flutter/material.dart';
import 'package:my_part/settings/about_us.dart';
import 'package:my_part/settings/profile.dart';
import 'package:my_part/settings/privacy_policy.dart';
import 'package:my_part/settings/help_and_support.dart';

Widget buildListTile(IconData icon, String title, VoidCallback onTap) {
  return ListTile(
    leading: Icon(icon), // Leading icon
    title: Text(title), // Title text
    trailing: Icon(Icons.arrow_forward_ios), // Trailing arrow icon
    onTap: onTap, // Action on tap
  );
}

class CustomButtonStyles {
  static ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF70C1FE), // Button color
    minimumSize: Size(double.infinity, 50), // Full width button
    padding: EdgeInsets.symmetric(vertical: 12), // Padding inside the button
    textStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w800,
      color: Color(0x000000),
    ),
  );
}

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(
              color: Colors.grey[800],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xFF4DABFE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Container
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Icon(Icons.copy_all),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Team Nexus'),
                        Text('UX/UI Designers'),
                        GestureDetector(
                          onTap: () {
                            // التنقل إلى صفحة تعديل البروفايل عند النقر
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Profile()), // صفحة تعديل البروفايل
                            );
                          },
                          child: Text(
                            'Edit Profile', // النص الجديد الذي يتيح تعديل البروفايل
                            style: TextStyle(
                              color: Colors.blue, // لون النص قابل للنقر
                              decoration: TextDecoration
                                  .underline, // خط تحت النص ليبدو كنص رابط
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(8.0),
                      width: 100.0,
                      height: 100.0,
                      // child: Image(image: AssetImage("assets/your_image.png")),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF4DABFE),
                          width: 2.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // First settings list (Accounts, Locations, etc.) with Scrollbar
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Scrollbar(
                    thickness: 6.0, // Customize the thickness
                    radius: Radius.circular(10), // Rounded scrollbar
                    thumbVisibility: true, // Always show the scrollbar
                    child: SettingsList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Second help list (About us, Help, etc.) with Scrollbar
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Scrollbar(
                    thickness: 6.0, // Customize the thickness
                    radius: Radius.circular(10), // Rounded scrollbar
                    thumbVisibility: true, // Always show the scrollbar
                    child: helpList(),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Log out action صفحة تسجيل الدخول
                    },
                    style: CustomButtonStyles
                        .elevatedButtonStyle, // Use custom style
                    child: Text('Log out'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Report problem action
                    },
                    style: CustomButtonStyles
                        .elevatedButtonStyle, // Use custom style
                    child: Text('Report problem'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListTile(Icons.location_on, "Locations", () {
          // Action when tapping Locations
        }),
        buildListTile(Icons.payment, "Payment Methods", () {
          // Action when tapping Payment Methods
        }),
        buildListTile(Icons.dark_mode, "Dark Mode", () {
          // Action when tapping Dark Mode
        }),
        buildListTile(Icons.language, "Languages", () {
          // Action when tapping Languages
        }),
      ],
    );
  }
}

class helpList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        buildListTile(Icons.info_outline, "About us", () {
          // Navigate to AboutUs page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        }),
        buildListTile(Icons.help_outline, "Help and Support", () {
          // Action when tapping Help and Support
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSupport()),
          );
        }),
        buildListTile(Icons.check_circle_outline, "Privacy policy", () {
          // Action when tapping Privacy policy
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrivacyPolicy()),
          );
        }),
      ],
    );
  }
}
