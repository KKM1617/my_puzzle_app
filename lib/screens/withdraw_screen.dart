import 'package:flutter/material.dart';

class WithdrawScreen extends StatefulWidget {
  @override
  _WithdrawScreenState createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  double balance = 0.0; // You can connect this later with real earnings if needed.
  final TextEditingController emailController = TextEditingController();

  void requestWithdrawal() {
    if (balance >= 1000.0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Withdrawal Requested Successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Minimum withdrawal amount is \$1000')),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text('Withdraw Balance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('Your Current Balance', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('\$${balance.toStringAsFixed(2)}', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 30),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your PayPal Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: requestWithdrawal,
              child: Text('Request Withdraw'),
            ),
          ],
        ),
      ),
    );
  }
}
