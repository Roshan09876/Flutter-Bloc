part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

//Until the data is comming loading UI will be shown
class HomeLoadingState extends HomeState {}

//After data is loaded Loading UI should be removed and data should be shown
class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

//If Shomw Error will be occur then this state will be called
class HomeErrorState extends HomeState {}

class HomeNavigatetoWishlistPageActionState extends HomeActionState {}

class HomeNavigatetoCartPageActionState extends HomeActionState {}
