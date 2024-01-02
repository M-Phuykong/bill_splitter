import 'package:flutter/material.dart';
import 'package:bill_splitter/TotalSplit/functions.dart';
import 'package:flutter/services.dart';

const totalNumberOfPeople = 5;

class TotalSplit extends StatefulWidget {
  const TotalSplit({
    Key? key,
  }) : super(key: key);

  @override
  State<TotalSplit> createState() => _TotalSplitState();
}

class _TotalSplitState extends State<TotalSplit> {

  int numberOfPeople = 1;
  bool isRounding = false;
  final totalController = TextEditingController();
  final tipController = TextEditingController();

  @override
  void dispose() {
    // clean up the controller when te widget is disposed
    totalController.dispose();
    tipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineLarge!.copyWith(
      color: Color.fromRGBO(0, 0, 0, 1),
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    );

    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("Total Split", style: textStyle),
                    SizedBox(height: 30),
                    NumberOfPeopleDropdownMenu(numberOfPeople),
                    SizedBox(height: 30),
                    TextField(
                      controller: totalController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Total",
                        suffixIcon: Icon(Icons.clear),
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                    ),
                    SizedBox(height: 30),
                    TextField(
                      controller: tipController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Tip",
                        suffixIcon: Icon(Icons.clear),
                        prefixIcon: Icon(Icons.attach_money),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rounding",
                        ),
                        Switch.adaptive(
                          value: isRounding,
                          activeColor: theme.primaryColor,
                          onChanged: (value) {
                            setState(() {
                              isRounding = value;
                            });
                          },
                        ),
                      ],
                    ),
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
                    onPressed: () async {
                      var total = double.parse(totalController.text);
                      var tip = double.parse(tipController.text);

                      var result = calculateTotalSplit(total + tip, numberOfPeople);

                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Total Split"),
                              content: Text(
                                  ' Each person pays: ${result.toStringAsFixed(2)} '),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("OK"),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Calculate"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberOfPeopleDropdownMenu extends StatefulWidget {
  const NumberOfPeopleDropdownMenu({
    super.key,
    required this.numberOfPeople
  });

  final int numberOfPeople;

  @override
  State<NumberOfPeopleDropdownMenu> createState() => _NumberOfPeopleDropdownMenuState();
}

class _NumberOfPeopleDropdownMenuState extends State<NumberOfPeopleDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<int>(
      hintText: "Number of People",
      enableSearch: false,
      expandedInsets: EdgeInsets.all(0),
      inputDecorationTheme:
          InputDecorationTheme(outlineBorder: BorderSide.none),
      onSelected: (int? value) {
        // print(value);
        setState(() {
          widget.numberOfPeople = value!;
        });
      },
      dropdownMenuEntries: List<DropdownMenuEntry<int>>.generate(
          totalNumberOfPeople,
          (index) => DropdownMenuEntry<int>(
                value: index + 1,
                label: (index + 1).toString(),
              )),
    );
  }
}
