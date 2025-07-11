import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // يمكنك إضافة متغيرات قابلة للتغيير هنا، على سبيل المثال:
  String firstName = '';
  String lastName = '';
  String email = '';
  String currentPassword = '';
  String newPassword = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Profile',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // تغيير المحاذاة لتكون في المنتصف
              children: [
                // Stack for the profile picture and edit icon
                Stack(
                  children: [
                    // Profile Picture with a border
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: AssetImage(
                          'assets/profile_image.jpg'), // ضع صورتك هنا
                      backgroundColor: Colors.transparent,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF4DABFE), // لون الإطار حول الصورة
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    // Edit Icon positioned over the profile picture
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: Color(0xFF4DABFE),
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      suffixIcon: Icon(Icons.person_outline),
                      border: InputBorder.none, // إزالة الحدود الافتراضية
                    ),
                    onChanged: (value) {
                      setState(() {
                        firstName = value; // تحديث الاسم الأول
                      });
                    },
                  ),
                ),
                SizedBox(height: 16), // إضافة مسافة بين الحقول

                // Last Name TextField in a box
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      suffixIcon: Icon(Icons.person_outline),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      setState(() {
                        lastName = value; // تحديث الاسم الأخير
                      });
                    },
                  ),
                ),
                SizedBox(height: 16), // إضافة مسافة بين الحقول

                // Email TextField in a box
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        email = value; // تحديث البريد الإلكتروني
                      });
                    },
                  ),
                ),
                SizedBox(height: 16), // إضافة مسافة بين الحقول

                // Current Password TextField in a box
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Current Password',
                      suffixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        currentPassword = value; // تحديث كلمة المرور الحالية
                      });
                    },
                  ),
                ),
                SizedBox(height: 16), // إضافة مسافة بين الحقول

                // New Password TextField in a box
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        newPassword = value; // تحديث كلمة المرور الجديدة
                      });
                    },
                  ),
                ),
                SizedBox(height: 16), // إضافة مسافة بين الحقول

                // Confirm New Password TextField in a box
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Confirm New Password',
                      suffixIcon: Icon(Icons.lock_outline),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                    onChanged: (value) {
                      setState(() {
                        confirmPassword = value; // تأكيد كلمة المرور الجديدة
                      });
                    },
                  ),
                ),
                SizedBox(height: 32),
                // زر الحفظ
                ElevatedButton(
                  onPressed: () {
                    // تنفيذ عملية الحفظ
                    print('First Name: $firstName');
                    print('Last Name: $lastName');
                    print('Email: $email');
                    print('Current Password: $currentPassword');
                    print('New Password: $newPassword');
                    print('Confirm Password: $confirmPassword');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF70C1FE),
                    minimumSize: Size(double.infinity, 50),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  child: Text('Save Changes'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
