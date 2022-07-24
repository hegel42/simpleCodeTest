part of 'bloc_persons.dart';

abstract class EventBlocProducts {}

class EventFectchProducts extends EventBlocProducts {
  final String? title;
  EventFectchProducts(this.title);
}

class EventProductsSort extends EventBlocProducts {
  EventProductsSort(this.id);

  final String id;
}

class EventProductsCategory extends EventBlocProducts {
  final String? category;

  EventProductsCategory(this.category);
}

class EventProductsRating extends EventBlocProducts {
  final num rating;

  EventProductsRating(this.rating);
}
