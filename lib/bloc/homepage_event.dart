part of 'homepage_bloc.dart';

@immutable
abstract class HomepageEvent {}

class SendData extends HomepageEvent {
  final String title;
  final int userId;
  SendData(this.title,this.userId);
}
