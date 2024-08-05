import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  List<String> scopes = [
    'email',
    'profile',
  ];

  Future<void> googleSignIn() async {
    emit(GoogleLoginLoading());
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: scopes);
    if (await googleSignIn.isSignedIn()) {
      googleSignIn.signOut();
    }
    try {
      final response = await googleSignIn.signIn();
      emit(GoogleLoginSuccess(googleSignInAccount: response));
    } catch (error) {
      emit(GoogleLoginError(error: error.toString()));
    }
  }
}
