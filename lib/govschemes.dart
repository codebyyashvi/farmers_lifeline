import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class GovernmentSchemes extends StatefulWidget {
  const GovernmentSchemes({super.key});

  @override
  State<GovernmentSchemes> createState() => _GovernmentSchemesState();
}

class _GovernmentSchemesState extends State<GovernmentSchemes> {
  // Sample data for schemes
  final List<Map<String, String>> schemes = [
    {
      'name': 'Pradhan Mantri Krishi Sinchai Yojana',
      'description': 'Government of India is committed to accord high priority to water conservation and its management.',
      // 'url': 'https://pmksy.gov.in/'
    },
    {
      'name': 'Rastriya Krishi Vikas Yojana',
      'description': 'The RKVY aims at achieving 4% annual growth in the agriculture sector during the XI Plan period',
      // 'url': 'https://www.myscheme.gov.in/schemes/rkvy'
    },
    {
      'name': 'Paramparagat Krishi Vikas Yojana',
      'description': 'The Paramparagat Krishi Vikas Yojana is a major government initiative to promote organic farming in India.',
      // 'url': 'https://dmsouthwest.delhi.gov.in/scheme/paramparagat-krishi-vikas-yojana/'
    },
    {
      'name': 'Sub-mission On Agriculture Mechanization (Smam)',
      'description': 'To promote the usage of farm mechanization and increase the ratio of farm power to cultivable unit area up to 2.5 kW/ha.',
      // 'url': 'https://www.myscheme.gov.in/schemes/smam'
    },
    {
      'name': 'Pradhan Mantri Fasal Bima Yojana',
      'description': 'The Pradhan Mantri Fasal Bima Yojana (PMFBY) is a crop insurance scheme launched by the Government of India in 2016. ',
      // 'url': 'https://pmfby.gov.in/'
    },
    {
      'name': 'Soil health Card',
      'description': 'Through this scheme, the Indian government aims to improve soil health by providing details about soil health indicators. ',
      // 'url': 'https://google.com'
    },
    {
      'name': 'Sustainable agriculture',
      'description': 'Sustainable agriculture is farming in sustainable ways meeting society present food and textile needs, without compromising the ability for current or future generations to meet their needs.'
    },
    {
      'name': 'Pradhan Mantri Kisan Samman Nidhi',
      'description': 'The Pradhan Mantri Kisan Samman Nidhi (PM-KISAN) Yojana is a farmer welfare scheme launched by the Government of India.'
    }
  ];

  // Method to open URLs
  // Future<void> _launchURL(String url) async {
  //   Uri uri = Uri.parse(url);
  //   if (await canLaunchUrl(uri)) {
  //     await launchUrl(uri, mode: LaunchMode.externalApplication);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Could not launch URL')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Government Schemes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade50, // Start color
              Colors.lightBlue.shade300, // End color
            ],
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: schemes.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lightBlueAccent.shade100,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                title: Text(
                  schemes[index]['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(schemes[index]['description']!),
                // trailing: const Icon(Icons.open_in_browser, color: Colors.blueAccent),
                // onTap: () {
                //   _launchURL(schemes[index]['url']!);
                // },
              ),
            );
          },
        ),
      ),
    );
  }
}
