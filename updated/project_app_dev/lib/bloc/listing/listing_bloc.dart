import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app_dev/bloc/listing/listing_repo.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  ListingRepostory listingRepostory;
  BuildContext context;

  ListingBloc({required this.listingRepostory, required this.context})
      : super(ListingState.initial()) {
    on<UpdateListingEvent>(((event, emit) async {
      emit(state.copyWith(
        listingStatus: ListingStatus.loading,
      ));
// String docId,
//   String mobile,
//   String carNumber,
//   String seat,
//   int price,
//   String time,
//   String strtDay,
//   String endDay,
//   String source,
//   String dest,
//   BuildContext context,
      try {
        await listingRepostory.updateOffer(
            event.docId,
            event.mobileNumber,
            event.carumber,
            event.seats,
            event.price,
            event.time,
            event.startDate,
            event.endDate,
            event.source,
            event.destination,
            context);
      } catch (e) {
        emit(state.copyWith(
          listingStatus: ListingStatus.error,
        ));
      }
    }));

    on<AddListingEvent>(((event, emit) async {
      emit(state.copyWith(
        listingStatus: ListingStatus.loading,
      ));
// String docId,
//   String mobile,
//   String carNumber,
//   String seat,
//   int price,
//   String time,
//   String strtDay,
//   String endDay,
//   String source,
//   String dest,
//   BuildContext context,
      try {
        await listingRepostory.createOffer(
            event.mobileNumber,
            event.carumber,
            event.seats,
            event.price,
            event.time,
            event.startDate,
            event.endDate,
            event.source,
            event.destination,
            context);
      } catch (e) {
        emit(state.copyWith(
          listingStatus: ListingStatus.error,
        ));
      }
    }));

    on<DeleteListingEvent>(((event, emit) async {
      emit(state.copyWith(
        listingStatus: ListingStatus.loading,
      ));
// String docId,
//   String mobile,
//   String carNumber,
//   String seat,
//   int price,
//   String time,
//   String strtDay,
//   String endDay,
//   String source,
//   String dest,
//   BuildContext context,
      try {
        await listingRepostory.deleteOffer(
          context,
          event.docId,
        );
      } catch (e) {
        emit(state.copyWith(
          listingStatus: ListingStatus.error,
        ));
      }
    }));
  }
}
