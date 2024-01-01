part of 'listing_bloc.dart';

enum ListingStatus {
  initial,
  loading,
  loaded,
  error,
}

// ignore: must_be_immutable
class ListingState extends Equatable {
  final ListingStatus listingStatus;

  ListingState({required this.listingStatus});

  factory ListingState.initial() {
    return ListingState(listingStatus: ListingStatus.initial);
  }

  @override
  List<Object> get props => [];

  ListingState copyWith({
    required ListingStatus listingStatus,
  }) {
    return ListingState(listingStatus: this.listingStatus);
  }

  @override
  bool get stringify => true;
}
