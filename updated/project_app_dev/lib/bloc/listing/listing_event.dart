part of 'listing_bloc.dart';

abstract class ListingEvent extends Equatable {
  const ListingEvent();
}

class FetchListingsEvent extends ListingEvent {
  const FetchListingsEvent();

  @override
  List<Object> get props => [];
}

class AddListingEvent extends ListingEvent {
  final String mobileNumber;
  final String source;
  final String destination;
  final String price;
  final String startDate; // this is string
  final String endDate;
  final String time;
  final String seats;
  final String carumber;
  final String uid;

  const AddListingEvent(
      {required this.uid,
      required this.mobileNumber,
      required this.source,
      required this.destination,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.time,
      required this.seats,
      required this.carumber});

  @override
  List<Object> get props => [
        uid,
        mobileNumber,
        source,
        destination,
        carumber,
        price,
        startDate,
        endDate,
        seats,
        time
      ];
}

class UpdateListingEvent extends ListingEvent {
  final String docId;
  final String mobileNumber;
  final String source;
  final String destination;
  final String price;
  final String startDate; // this is string
  final String endDate;
  final String time;
  final String seats;
  final String carumber;
  final String uid;

  const UpdateListingEvent(
      {required this.docId,
      required this.uid,
      required this.mobileNumber,
      required this.source,
      required this.destination,
      required this.price,
      required this.startDate,
      required this.endDate,
      required this.time,
      required this.seats,
      required this.carumber});

  @override
  List<Object> get props => [
        uid,
        mobileNumber,
        source,
        destination,
        carumber,
        price,
        startDate,
        endDate,
        seats,
        time
      ];
}

class DeleteListingEvent extends ListingEvent {
  final String docId;
  const DeleteListingEvent({required this.docId});
  @override
  List<Object> get props => [docId];
}
