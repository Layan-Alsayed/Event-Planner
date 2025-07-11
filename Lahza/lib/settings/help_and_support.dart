import 'package:flutter/material.dart';

class HelpSupport extends StatelessWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TextSection(
              title: 'Comprehensive Assistance',
              content:
                  'Whether you are new to [App Name] or an experienced user, our extensive support network is designed to assist you at every step. From initial setup to advanced feature utilization, our Help Center provides detailed articles and video tutorials.',
            ),
            TextSection(
              title: 'Direct Support',
              content:
                  'Encounter an issue? Connect with our customer support team directly via [methods, e.g., email, phone, live chat]. Our specialists are available 24/7 to offer personalized assistance and ensure your experience is smooth and productive.',
            ),
            TextSection(
              title: 'Proactive Support',
              content:
                  'We proactively monitor our systems to anticipate and solve potential issues before they affect your workflow. Should you need any specific guidance, our [specific support departments, e.g., technical, billing, account management] are ready to assist.',
            ),
            TextSection(
              title: 'Feedback Loop',
              content:
                  'Your feedback is vital for our continuous improvement. Please share your experiences and suggestions through our feedback portal, accessible within the app or on our website. We are committed to listening and adapting based on user input.',
            ),
            TextSection(
              title: 'Privacy Policy',
              content:
                  'Detailed Data Practices: "[App Name] adheres to the highest standards of data privacy and security. Information collected is categorized as [list types, e.g., personal identifiers, financial data, usage metrics] and is strictly used for operational purposes such as service enhancement and personalized user experience." Consent and Control: "User consent is paramount. We ensure that all data collection and processing activities are transparent and comply with [relevant regulations, e.g., GDPR, CCPA]. Users have full control over their data and can modify consent preferences at any time through their account settings." Security Protocols: "We implement state-of-the-art security measures including [list measures, e.g., end-to-end encryption, multi-factor authentication, regular audits] to protect your information from unauthorized access or breaches." Rights and Responsibilities: "As a user of [App Name], you have the right to access, correct, and delete your personal data. For detailed procedures or to raise any concerns about how your information is handled, please contact our Data Protection Officer at [DPO Email]." Policy Updates: "Our Privacy Policy is reviewed and updated regularly to align with new laws and technological advancements. All updates are communicated through official channels to ensure you remain informed about how your data is managed."',
            ),
          ],
        ),
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  final String title;
  final String content;

  const TextSection({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            content,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
