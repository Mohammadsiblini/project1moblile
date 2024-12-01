// Import necessary Flutter packages
import 'package:flutter/material.dart';

class CurrencyConverterPage extends StatefulWidget {
  @override
  _CurrencyConverterPageState createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _amountController = TextEditingController();
  double _convertedAmount = 0.0;
  String _conversionResult = '';

  // Updated conversion rates
  final double _usdToEurRate = 0.9544; // USD to EUR
  final double _eurToUsdRate = 1.0478; // EUR to USD
  final double _usdToLbpRate = 89000.0; // USD to LBP
  final double _lbpToUsdRate = 0.00001124; // LBP to USD (1 / 89000)
  final double _usdToSypRate = 13001.836; // USD to SYP
  final double _sypToUsdRate = 0.00007688; // SYP to USD

  // Placeholder rates for SYP and LBP conversions to each other
  final double _sypToLbpRate = 6.85; // SYP to LBP (approximate)
  final double _lbpToSypRate = 0.145985; // LBP to SYP (1 / 6.85)

  void _convertCurrency(String conversionType) {
    setState(() {
      double amount = double.tryParse(_amountController.text) ?? 0.0;
      switch (conversionType) {
        case 'USD_TO_EUR':
          _convertedAmount = amount * _usdToEurRate;
          _conversionResult = 'Converted Amount: €${_convertedAmount.toStringAsFixed(2)}';
          break;
        case 'LBP_TO_USD':
          _convertedAmount = amount * _lbpToUsdRate;
          _conversionResult = 'Converted Amount: \$${_convertedAmount.toStringAsFixed(2)}';
          break;
        case 'USD_TO_LBP':
          _convertedAmount = amount * _usdToLbpRate;
          _conversionResult = 'Converted Amount: ${_convertedAmount.toStringAsFixed(2)} LBP';
          break;
        case 'SYP_TO_USD':
          _convertedAmount = amount * _sypToUsdRate;
          _conversionResult = 'Converted Amount: \$${_convertedAmount.toStringAsFixed(2)}';
          break;
        case 'USD_TO_SYP':
          _convertedAmount = amount * _usdToSypRate;
          _conversionResult = 'Converted Amount: ${_convertedAmount.toStringAsFixed(2)} SYP';
          break;
        case 'SYP_TO_LBP':
          _convertedAmount = amount * _sypToLbpRate;
          _conversionResult = 'Converted Amount: ${_convertedAmount.toStringAsFixed(2)} LBP';
          break;
        case 'LBP_TO_SYP':
          _convertedAmount = amount * _lbpToSypRate;
          _conversionResult = 'Converted Amount: ${_convertedAmount.toStringAsFixed(2)} SYP';
          break;
        default:
          _conversionResult = 'Invalid conversion type';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter amount',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _convertCurrency('USD_TO_EUR'),
              child: Text('Convert USD to EUR'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('LBP_TO_USD'),
              child: Text('Convert LBP to USD'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('USD_TO_LBP'),
              child: Text('Convert USD to LBP'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('SYP_TO_USD'),
              child: Text('Convert SYP to USD'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('USD_TO_SYP'),
              child: Text('Convert USD to SYP'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('SYP_TO_LBP'),
              child: Text('Convert SYP to LBP'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _convertCurrency('LBP_TO_SYP'),
              child: Text('Convert LBP to SYP'),
            ),
            SizedBox(height: 20),
            Text(
              _conversionResult,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
