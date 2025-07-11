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

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextSection(
              title: 'Detailed Data Practices',
              content:
                  '[App Name] adheres to the highest standards of data privacy and security. Information collected is categorized as [list types, e.g., personal identifiers, financial data, usage metrics] and is strictly used for operational purposes such as service enhancement and personalized user experience.',
            ),
            TextSection(
              title: 'Consent and Control',
              content:
                  'User consent is paramount. We ensure that all data collection and processing activities are transparent and comply with [relevant regulations, e.g., GDPR, CCPA]. Users have full control over their data and can modify consent preferences at any time through their account settings.',
            ),
            TextSection(
              title: 'Security Protocols',
              content:
                  'We implement state-of-the-art security measures including [list measures, e.g., end-to-end encryption, multi-factor authentication, regular audits] to protect your information from unauthorized access or breaches.',
            ),
            TextSection(
              title: 'Rights and Responsibilities',
              content:
                  'As a user of [App Name], you have the right to access, correct, and delete your personal data. For detailed procedures or to raise any concerns about how your information is handled, please contact our Data Protection Officer at [DPO Email].',
            ),
            TextSection(
              title: 'Policy Updates',
              content:
                  'Our Privacy Policy is reviewed and updated regularly to align with new laws and technological advancements. All updates are communicated through official channels to ensure you remain informed about how your data is managed.',
            ),
          ],
        ),
      ),
    );
  }
}
