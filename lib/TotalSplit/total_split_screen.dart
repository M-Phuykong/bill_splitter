import 'package:flutter/material.dart';

class TotalSplit extends StatelessWidget {
  const TotalSplit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Total Split"),
                    SizedBox(height: 30),
                    Text("Number of People"),
                    SizedBox(height: 30),
                    Text("Total"),
                    SizedBox(height: 30),
                    Text("Tip"),
                    SizedBox(height: 30),
                    Text("Rounding"),
                  ],
                ),
              ),
              Container(
                  width: double.infinity,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Calculate"),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
