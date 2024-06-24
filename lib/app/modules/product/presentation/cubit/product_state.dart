part of 'product_cubit.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class Fetching extends ProductState {
  const Fetching();
}

final class Fetched extends ProductState {
  const Fetched();
}
