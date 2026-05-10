import 'package:flutter/material.dart';
import 'package:of25_bkash_app/data/models/home_menu_item_model.dart';


class HomeProvider extends ChangeNotifier{

  final List<HomeMenuItemModel> _allItems =HomeMenuItemModel.sampleData;

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;
  List<HomeMenuItemModel> get allItems => _allItems;

  List<HomeMenuItemModel> get visibleItems {
    if (_isExpanded) {
      return _allItems;
    } else {
      return _allItems.take(8).toList();
    }
  }

  List<HomeMenuItemModel> get limitedVisibleItems {

    return _allItems.take(8).toList();

  }

  List<HomeMenuItemModel> get lastFourItems {
    return _allItems.skip(8).take(4).toList();
  }

  List<HomeMenuItemModel> get remainingItems {
    return _allItems.skip(8).toList();
  }

  void toggleExpanded() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

}