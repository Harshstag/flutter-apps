import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  _CurrencyConverterMaterialPage createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  final border = OutlineInputBorder(
    borderSide: BorderSide(
      width: 1,
      color: const Color.fromARGB(255, 1, 88, 15),
    ),
    borderRadius: BorderRadius.circular(10),
  );

  void convert() {
    result = double.parse(textEditingController.text) * 86;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 16, 32),

      appBar: AppBar(
        title: Text(
          "Currency Converter ",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.currency_rupee,
                  color: const Color.fromARGB(255, 0, 97, 3),
                  size: 26,
                ),
                SizedBox(width: 6),
                Text(
                  result.toString(),
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(243, 243, 243, 1),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 15.0,
                right: 15.0,
                bottom: 15.0,
              ),

              child: TextField(
                controller: textEditingController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                style: TextStyle(color: Color.fromRGBO(22, 94, 1, 1)),
                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  prefixIcon: Icon(
                    Icons.monetization_on,
                    color: const Color.fromARGB(255, 0, 97, 3),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                  contentPadding: EdgeInsets.only(
                    bottom: 10,
                    right: 10,
                    left: 10,
                    top: 10,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),

              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 255, 255, 255),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(255, 0, 0, 0),
                  ),
                  minimumSize: WidgetStateProperty.all(
                    Size(double.infinity, 50),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: convert,
                child: Text("Convert"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CurrencyConverterMaterialPagee extends StatelessWidget {
//   const CurrencyConverterMaterialPagee({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double result = 0;
//     final TextEditingController textEditingController = TextEditingController();

//     final border = OutlineInputBorder(
//       borderSide: BorderSide(
//         width: 1,
//         color: const Color.fromARGB(255, 1, 88, 15),
//       ),
//       borderRadius: BorderRadius.circular(10),
//     );

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 0, 16, 32),

//       appBar: AppBar(
//         title: Text(
//           "Currency Converter ",
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       ),

//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               result.toString(),
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromRGBO(243, 243, 243, 1),
//               ),
//             ),

//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 15.0,
//                 top: 15.0,
//                 right: 15.0,
//                 bottom: 15.0,
//               ),

//               child: TextField(
//                 controller: textEditingController,
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//                 style: TextStyle(color: Color.fromRGBO(22, 94, 1, 1)),
//                 decoration: InputDecoration(
//                   hintText: "Please enter the amount in USD",
//                   prefixIcon: Icon(
//                     Icons.monetization_on,
//                     color: const Color.fromARGB(255, 0, 97, 3),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                   focusedBorder: border,
//                   enabledBorder: border,
//                   contentPadding: EdgeInsets.all(10),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15.0),

//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   foregroundColor: WidgetStateProperty.all(
//                     const Color.fromARGB(255, 255, 255, 255),
//                   ),
//                   backgroundColor: WidgetStateProperty.all(
//                     const Color.fromARGB(255, 0, 0, 0),
//                   ),
//                   minimumSize: WidgetStateProperty.all(
//                     Size(double.infinity, 50),
//                   ),
//                   shape: WidgetStateProperty.all(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   result = double.parse(textEditingController.text) * 86;
//                 },
//                 child: Text("Convert"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
