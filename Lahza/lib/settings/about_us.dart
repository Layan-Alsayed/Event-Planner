import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String title;
  final String content;
  const TextSection({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Text(content, style: const TextStyle(fontSize: 16, height: 1.5)),
        const SizedBox(height: 20),
      ],
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'About Us ',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextSection(
              title: 'Introduction',
              content:
                  'Welcome to [App Name], the premier platform designed to revolutionize [specific function]. Established in [Year] by [Founder’s Name(s)], our application harnesses cutting-edge technology to offer seamless, intuitive solutions that cater to [specific needs].',
            ),
            TextSection(
              title: 'Our Mission',
              content:
                  'At [App Name], we are driven by a single purpose: to empower [target audience] with the tools they need to succeed. Our mission is to simplify complex processes through a user-friendly interface, allowing our users to achieve [specific outcomes] with precision and ease.',
            ),
            TextSection(
              title: 'Our Vision',
              content:
                  'Our vision extends beyond mere functionality; we aim to be the global standard for [app’s primary function]. Through continuous innovation and unwavering dedication, we aspire to shape the future of [industry] and set new benchmarks for excellence.',
            ),
            TextSection(
              title: 'Core Values',
              content:
                  '[App Name] is built on the core values of innovation, reliability, and user-centricity. We believe that technology should be accessible, reliable, and transformative, enhancing every interaction with substantial and measurable outcomes.',
            ),
            TextSection(
              title: 'Meet Our Team',
              content:
                  'Our team comprises industry veterans and visionary technologists, each bringing over [number] years of experience in [relevant fields]. Their expertise is the backbone of our success, driving [App Name] to new heights in a competitive landscape.',
            ),
            TextSection(
              title: 'Contact Us',
              content:
                  'Engage with us at [Contact Email], or for a deeper connection, visit our website at [Website URL]. We are eager to support your journey with [App Name] and partner with you for success.',
            ),
          ],
        ),
      ),
    );
  }
}
