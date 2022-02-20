import 'package:apps/balance.dart';
import 'package:apps/models/matchdetail.dart';

class Basket {
  List<MatchDetail> _selectionActuel = [];
  double _amountBalance = 0;
  double betAmount = 0; // la  somme que l'utilisateur veut parier
  double totalOdd = 0; // somme des cotes
  double potentialGain = 0;

  Basket(Balance balance) {
    _amountBalance = balance.getAmount();
  }

  //add match
  void addElement() {
    //TODO
  }

  //delete all element in the basket
  void clearBasket() {
    //TODO
  }

  //delete an item in the basket by id
  void deleteById() {
    //TODO
  }

  void validateSelection() {
    if (betAmount > _amountBalance) {
      insufficientFunds();
    }
  }

  void insufficientFunds() {
    //TODO
  }

  double computePotentialGain() {
    //TODO

    return 0;
  }
}
