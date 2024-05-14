/*
import 'package:flutter/material.dart';

import 'fill data.dart';
import 'onlyopnehtml.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const FillDataScreen(),
    );
  }
}




*/

/*

import 'package:flutter/material.dart';

void main() {
  runApp(FDCalculatorApp());
}

class FDCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FD Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FDCalculatorScreen(),
    );
  }
}

class FDCalculatorScreen extends StatefulWidget {
  @override
  _FDCalculatorScreenState createState() => _FDCalculatorScreenState();
}

class _FDCalculatorScreenState extends State<FDCalculatorScreen> {
  TextEditingController principalController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController periodController = TextEditingController();
  TextEditingController maturityAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FD Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Principal Amount'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: interestRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Interest Rate (%)'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: periodController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Period (in years)'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton( onPressed: calculateMaturityAmount,
              child: Text('Calculate'),),
            SizedBox(height: 16.0),
            TextFormField(
              controller: maturityAmountController,
              enabled: false,
              decoration: InputDecoration(labelText: 'Maturity Amount'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateMaturityAmount() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double interestRate = double.tryParse(interestRateController.text) ?? 0.0;
    double period = double.tryParse(periodController.text) ?? 0.0;

    double maturityAmount = principal + (principal * interestRate * period) / 100;

    setState(() {
      maturityAmountController.text = maturityAmount.toStringAsFixed(2);
    });
  }
}
*/
/*
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MaterialApp(
  home: Homepage(),
  debugShowCheckedModeBanner: false,
));

class CalculatorController extends GetxController {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final RxDouble interest = 0.0.obs;
  final RxDouble total = 0.0.obs;

  void calculation() {
    final calInterestRate = (double.parse(controller2.text) / 100 / 12) * int.parse(controller3.text);
    final calInterest = calInterestRate * int.parse(controller1.text);
    interest.value = calInterest;
    total.value = int.parse(controller1.text) + interest.value;
  }
}

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              children: [
                SizedBox(height: 20),
                inputForm(title: "Deposit Amount:", controller: controller.controller1, hinttext: "e.g 20000"),
                inputForm(title: "Annual Interest Rate(%):", controller: controller.controller2, hinttext: "e.g 3"),
                inputForm(title: "Period (in months):", controller: controller.controller3, hinttext: "e.g 3"),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () => controller.calculation(),
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        "CALCULATE",
                        style: TextStyle(fontSize: 25, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Obx(() => controller.interest.value != 0.0
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Results:", style: TextStyle(fontSize: 20)),
                    SizedBox(height: 20),
                    Center(
                      child: Text("Interest: RM${controller.interest.value.toStringAsFixed(2)}", style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text("Total: RM${controller.total.value.toStringAsFixed(2)}", style: TextStyle(fontSize: 20)),
                    ),
                  ],
                )
                    : SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget inputForm({required String title, required TextEditingController controller, required String hinttext}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 5),
        Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              hintText: hinttext,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
*/
/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MaterialApp(
  home: RDHomePage(),
  debugShowCheckedModeBanner: false,
));

class RDController extends GetxController {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController periodController = TextEditingController();
  final TextEditingController monthlyDepositController = TextEditingController();
  final RxDouble maturityAmount = 0.0.obs;
  final RxDouble totalInvestment = 0.0.obs;
  final RxDouble totalInterest = 0.0.obs;

  void calculateMaturityAmount() {
    double principal = double.tryParse(principalController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int period = int.tryParse(periodController.text) ?? 0;
    double monthlyDeposit = double.tryParse(monthlyDepositController.text) ?? 0.0;

    double maturity = 0.0;
    double monthlyInterestRate = (rate / 100) / 12;
    int totalMonths = period * 12;
    double totalDeposits = principal + (monthlyDeposit * totalMonths);
    double totalInterest = 0.0;

    for (int i = 0; i < totalMonths; i++) {
      maturity += (principal + (monthlyDeposit * i)) * monthlyInterestRate;
      totalInterest += (principal + (monthlyDeposit * i)) * monthlyInterestRate;
    }

    maturityAmount.value = principal + (monthlyDeposit * totalMonths) + maturity;
    totalInvestment.value = totalDeposits;
    this.totalInterest.value = totalInterest;
  }
}

class RDHomePage extends StatefulWidget {
  @override
  State<RDHomePage> createState() => _RDHomePageState();
}

class _RDHomePageState extends State<RDHomePage> {
  final RDController rdController = RDController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RD Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: rdController.principalController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Principal Amount'),
            ),
            TextField(
              controller: rdController.rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Annual Interest Rate (%)'),
            ),
            TextField(
              controller: rdController.periodController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Investment Period (Years)'),
            ),
            TextField(
              controller: rdController.monthlyDepositController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monthly Deposit'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                rdController.calculateMaturityAmount();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maturity Amount: ${rdController.maturityAmount.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Investment: ${rdController.totalInvestment.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Interest: ${rdController.totalInterest.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MaterialApp(
  home: RDHomePage(),
  debugShowCheckedModeBanner: false,
));

class RDController extends GetxController {
  final TextEditingController monthlyDepositController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController periodController = TextEditingController();
  final RxDouble maturityAmount = RxDouble(0.0);
  final RxDouble totalInvestment = RxDouble(0.0);
  final RxDouble totalInterest = RxDouble(0.0);

  void calculateMaturityAmount() {
    double monthlyDeposit = double.tryParse(monthlyDepositController.text) ?? 0.0;
    double rate = double.tryParse(rateController.text) ?? 0.0;
    int period = int.tryParse(periodController.text) ?? 0;

    double monthlyInterestRate = rate / 100 / 12;
    int totalMonths = period * 12;

    double maturityAmountValue = monthlyDeposit *
        ((pow((1 + monthlyInterestRate), totalMonths) - 1) *
            (1 + monthlyInterestRate)) /
        (monthlyInterestRate);

    double totalInvestmentValue = monthlyDeposit * totalMonths;
    double totalInterestValue = maturityAmountValue - totalInvestmentValue;

    maturityAmount.value = maturityAmountValue;
    totalInvestment.value = totalInvestmentValue;
    totalInterest.value = totalInterestValue;
  }



}

class RDHomePage extends StatefulWidget {
  @override
  State<RDHomePage> createState() => _RDHomePageState();
}

class _RDHomePageState extends State<RDHomePage> {
  final RDController rdController = RDController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RD Calculator'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: rdController.monthlyDepositController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Monthly Deposit'),
            ),
            TextField(
              controller: rdController.rateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Annual Interest Rate (%)'),
            ),
            TextField(
              controller: rdController.periodController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Investment Period (Years)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                rdController.calculateMaturityAmount();
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 20),
            Obx(
                  () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Maturity Amount: ${rdController.maturityAmount.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Investment: ${rdController.totalInvestment.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Total Interest: ${rdController.totalInterest.value.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
