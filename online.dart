import 'dart:math';

// Function to calculate the total price with optional tax
double calculateTotal(List<double> itemPrices, {double taxRate = 0.0}) {
  double total = itemPrices.fold(0.0, (sum, price) => sum + price);
  double totalWithTax = total + (total * taxRate);
  return totalWithTax;
}

// Higher-order function to apply a discount
double applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.fold(0.0, (sum, price) => sum + discountFunction(price));
}

// Recursive function to calculate factorial
int calculateFactorial(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorial(n - 1);
}

// Function to calculate a special discount based on factorial
double calculateFactorialDiscount(List<double> itemPrices) {
  int numberOfItems = itemPrices.length;
  int factorial = calculateFactorial(numberOfItems);
  double discountPercentage = factorial / 100.0; // Convert factorial to a percentage
  return applyDiscount(itemPrices, (price) => price * (1 - discountPercentage));
}

void main() {
  // Example usage

  // List of item prices
  List<double> prices = [5.0, 15.0, 25.0, 8.0, 12.0];

  // Calculate total with 7% tax
  double totalWithTax = calculateTotal(prices, taxRate: 0.07);
  print("Total with tax: ${totalWithTax.toStringAsFixed(2)}");

  // Filter out items under $10
  List<double> filteredPrices = prices.where((price) => price >= 10.0).toList();
  print("Filtered prices (items \$10 and above): \$${filteredPrices.join(', ')}");

  // Apply a 10% discount to all items
  double applyDiscountExample = applyDiscount(prices, (price) => price * 0.90);
  print("Total with 10% discount: \$${applyDiscountExample.toStringAsFixed(2)}");

  // Calculate a special discount based on the factorial of the number of items
  double specialDiscountedTotal = calculateFactorialDiscount(prices);
  print("Total with factorial discount: \$${specialDiscountedTotal.toStringAsFixed(2)}");
}