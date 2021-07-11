import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TimtipsFirebaseUser {
  TimtipsFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

TimtipsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TimtipsFirebaseUser> timtipsFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<TimtipsFirebaseUser>(
        (user) => currentUser = TimtipsFirebaseUser(user));
