class Balance {
  double _amount;
  double _amountSinceCreation;

  Balance(this._amount, this._amountSinceCreation);

  double getAmount() {
    return _amount;
  }

  double getamountSinceCreation() {
    return _amountSinceCreation;
  }

  void setamountSinceCreation(double amountSinceCreation) {
    _amountSinceCreation = amountSinceCreation;
  }

  void setAmount(double amount) {
    _amount = amount;
  }
}
