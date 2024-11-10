import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  String selectedCategory = 'All Categories';

  final categories = ['All Categories', 'Cap', 'Men', 'Discount'];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: categories.map((category) {
        bool isSelected = category == selectedCategory;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
         scrollDirection: Axis.horizontal,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue[100] : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide(
                color: isSelected ? Colors.blue : Colors.grey,
              ),
            ),
            onPressed: () {
              setState(() {
                selectedCategory = category;
              });
            },
            child: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.blue : Colors.black,
              ),
            ),
          ),
        ),
        );
      }).toList(),
    );
  }
}



// class CategoryButtons extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: [
//             CategoryButton(label: 'All Categories'),
//             CategoryButton(label: 'Cap'),
//             CategoryButton(label: 'Men'),
//             CategoryButton(label: 'Discount'),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryButton extends StatelessWidget {
//   final String label;
//   CategoryButton({required this.label});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 4.0),
//       child: ElevatedButton(
//         onPressed: () {},
//         child: Text(label),
//         style: ElevatedButton.styleFrom(
//           foregroundColor: Colors.black, backgroundColor: Colors.grey.shade200, shape: StadiumBorder(),
//         ),
//       ),
//     );
//   }
// }
