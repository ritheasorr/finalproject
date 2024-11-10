import 'package:flutter/material.dart';
//
// class ItemCard extends StatelessWidget {
//   final String imagePath;
//   final String title;
//   final String price;
//   final String originalPrice;
//
//   ItemCard({
//     required this.imagePath,
//     required this.title,
//     required this.price,
//     required this.originalPrice,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Column(
//         children: [
//           Image.asset(imagePath, fit: BoxFit.cover, height: 100),
//           Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(price, style: TextStyle(color: Colors.blue)),
//               Text(originalPrice,
//                   style: TextStyle(
//                       color: Colors.grey,
//                       decoration: TextDecoration.lineThrough)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ItemList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: [
//         ItemCard(
//           imagePath: 'assets/images/first.png',
//           title: 'Darkness Wrack cap',
//           price: '\$18',
//           originalPrice: '\$20',
//         ),
//         ItemCard(
//           imagePath: 'assets/images/Wrack-post.png',
//           title: 'Darkness Wrack cap',
//           price: '\$18',
//           originalPrice: '\$20',
//         ),
//         // Add more ItemCard widgets as needed
//       ],
//     );
//   }
// }

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width < 600 ? 2 : 3, // Adjusts for smaller screens
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return ItemCard();
      },
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/sample_item.png', height: 100, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Darkness Wrack cap', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('\$18', style: TextStyle(fontSize: 14, color: Colors.blue)),
                Text('\$20', style: TextStyle(fontSize: 12, color: Colors.grey, decoration: TextDecoration.lineThrough)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}