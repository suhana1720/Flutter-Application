import 'package:fashion_shop/db/users.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated}

class UserProvider with ChangeNotifier{
    FirebaseAuth _auth;
    FirebaseUser _user;
    Status _status = Status.Uninitialized;
    UserServices _userServices = UserServices();

    Status get status => _status;
    FirebaseUser get user => _user;

    UserProvider.initialize() : _auth = FirebaseAuth.instance {
        _auth.onAuthStateChanged.listen(_onStateChanged);
    }

    Future<bool> signIn(String email, String password) async{
        try{
            _status = Status.Authenticating; // this is a replica for screens
            notifyListeners();
            await _auth.signInWithEmailAndPassword(email: email, password: password);
            return true;
        }catch(e){
          _status = Status.Unauthenticated;
          notifyListeners();
          print(e.toString());
          return false;
        }
    }

    Future<bool> signUp(String name, String email, String password) async{
      try{
        _status = Status.Authenticating;
        notifyListeners();
        await _auth.createUserWithEmailAndPassword(email: email, password: password)
        .then((user) async{
          print("CREATE USER");
          _userServices.createUser({
            'name': name,
            'email':email,
            'uid': user.user.uid,
          });
        });
        return true;
      }catch(e){
        _status = Status.Unauthenticated;
        notifyListeners();
        print(e.toString());
        return false;
      }
    }

    Future<void> signOut() async {

     await _auth.signOut();
      _status = Status.Unauthenticated;
      notifyListeners();
      return Future.delayed(Duration.zero);
    }


    Future<void> _onStateChanged(FirebaseUser event) async{
        if(user == null){
            _status =Status.Unauthenticated; // in this state we showing login pg
        }else{
            _user = user;
            _status=Status.Authenticated;  // user is authenticated showing home pg
        }
        notifyListeners();
  }
}
 // we r using provider so that ur screen stayes their fo eg : if we login in then the pg is authenticated so it will be in home pg so after using sometime pg will be their