part of 'bloc_persons.dart';

abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  StateProductsData({
    required this.data,
  });

  final List<Products> data;
}

class StateProductsError extends StateBlocProducts {
  StateProductsError(this.error);

  final String error;
}
