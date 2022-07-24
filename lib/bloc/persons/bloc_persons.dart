import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simplecode_test1/repo/repo_products.dart';
import '../../screens/models/products.dart';

part 'events.dart';
part 'states.dart';

class BlocProducts extends Bloc<EventBlocProducts, StateBlocProducts> {
  BlocProducts({
    required this.repo,
  }) : super(StateProductsInitial()) {
    on<EventFectchProducts>(
      (event, emit) async {
        emit(StateProductsLoading());
        final result = await repo.fetchProducts(event.title);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );

    on<EventProductsSort>(
      (event, emit) async {
        emit(StateProductsLoading());
        final result = await repo.sortProducts(event.id);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );

    on<EventProductsCategory>(
      (event, emit) async {
        emit(StateProductsLoading());
        final result = await repo.filterCategory(event.category);
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );

    on<EventProductsRating>(
      (event, emit) async {
        emit(StateProductsLoading());
        final result = await repo.filterRating(
          event.rating,
        );
        if (result.errorMessage != null) {
          emit(
            StateProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          StateProductsData(data: result.productsList!),
        );
      },
    );
  }

  final RepoProducts repo;
}
