import 'package:cy_road_signs/screens/signs/sign_details.dart';
import 'package:flutter/material.dart';
import 'package:cy_road_signs/gen/assets.gen.dart';

class AllSignsScreen extends StatelessWidget {
  AllSignsScreen({super.key});

  final List<Map<String, String>> mandatorySigns =
      Assets.images.mandatory.values.map((image) {
    String name = image.path.split('/').last.split('.').first;
    return {
      'name': name,
      'image': image.path,
    };
  }).toList();
  final List<Map<String, String>> prohibitorySigns =
      Assets.images.prohibitory.values.map((image) {
    String name = image.path.split('/').last.split('.').first;
    return {
      'name': name,
      'image': image.path,
    };
  }).toList();
  final List<Map<String, String>> warningsSigns =
      Assets.images.warnings.values.map((image) {
    String name = image.path.split('/').last.split('.').first;
    return {
      'name': name,
      'image': image.path,
    };
  }).toList();

  Widget buildSignGrid(List<Map<String, String>> signs) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: signs.length,
      itemBuilder: (context, index) {
        return Hero(
          tag: signs[index]['image']!,
          child: GestureDetector(
            onTap: () {
              //   showDialog(
              //     context: context,
              //     builder: (BuildContext context) {
              //       return Dialog(
              //         child: Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: Column(
              //             mainAxisSize: MainAxisSize.min,
              //             children: [
              //               Image.asset(
              //                 signs[index]['image']!,
              //                 fit: BoxFit.contain,
              //               ),
              //               SizedBox(height: 16.0),
              //               Text(
              //                 signs[index]['name']!,
              //                 style: TextStyle(fontSize: 24),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     },
              //   );
              // },
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    tag: signs[index]['image']!,
                    image: signs[index]['image']!,
                    name: signs[index]['name']!,
                  ),
                ),
              );
            },
            child: Card(
              child: Center(
                child: Image.asset(
                  signs[index]['image']!,
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Signs'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mandatory Signs',
                  style: Theme.of(context).textTheme.titleLarge),
              buildSignGrid(mandatorySigns),
              SizedBox(height: 16),
              Text('Warning Signs',
                  style: Theme.of(context).textTheme.titleLarge),
              buildSignGrid(warningsSigns),
              SizedBox(height: 16),
              Text('Prohibitory Signs',
                  style: Theme.of(context).textTheme.titleLarge),
              buildSignGrid(prohibitorySigns),
            ],
          ),
        ),
      ),
    );
  }
}
