import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main_page/main_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.primaryColor,
            border: Border.all(
              color: FlutterFlowTheme.primaryColor,
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment(0, 0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 48, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'TiM Tips',
                        style: FlutterFlowTheme.title1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.tertiaryColor,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                        child: Text(
                          'Partage équitable des pourboires',
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.tertiaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.67),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // User email
                    //------------
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        width: 285,
                        height: 40,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: emailTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Adresse email',
                                  hintStyle: GoogleFonts.getFont('Lato', color: Colors.white, fontSize: 18,),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF3C2452), width: 2,),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF3C2452), width: 2,),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),
                                  ),
                                ),
                                style: GoogleFonts.getFont('Lato', color: Colors.white, fontSize: 18,),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.95, 0.5),
                              child: Icon(Icons.person, color: Colors.white, size: 24,),
                            )
                          ],
                        ),
                      ),
                    ),

                    // Password
                    // ---------
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Container(
                        width: 285,
                        height: 40,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment(0, 0),
                              child: TextFormField(
                                controller: passwordTextController,
                                obscureText: !passwordVisibility,
                                decoration: InputDecoration(
                                  hintText: 'Mot de passe',
                                  hintStyle: GoogleFonts.getFont('Lato', color: Colors.white, fontSize: 18,),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF3C2452), width: 2,),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF3C2452), width: 2,),
                                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),
                                  ),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => passwordVisibility = !passwordVisibility,
                                    ),
                                    child: Icon(
                                      passwordVisibility ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                      size: 22,
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.getFont('Lato', color: Colors.white, fontSize: 18,),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0.95, 0.5),
                              child: Icon(Icons.lock_open, color: Colors.white, size: 24,),
                            )
                          ],
                        ),
                      ),
                    ),


                    // Buttons Sign In / Sing Up
                    // ----------------------------
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          // Sign up
                          FFButtonWidget(
                            onPressed: () async {
                              final user = await createAccountWithEmail(context, emailTextController.text, passwordTextController.text,
                              );
                              if (user == null) { return; }

                              await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPageWidget(),), (r) => false,);
                            },
                            text: 'S\'inscrire',
                            options: FFButtonOptions(
                              width: 125,
                              height: 40,
                              color: Color(0x00FFFFFF),
                              textStyle: GoogleFonts.getFont('Lato', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,),
                              borderSide: BorderSide(color: Color(0xFF553BBA), width: 2,),
                              borderRadius: 0,
                            ),
                          ),

                          // Sign In
                          Padding(
                            padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final user = await signInWithEmail(context, emailTextController.text, passwordTextController.text,);
                                if (user == null) {return;}

                                await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainPageWidget(),), (r) => false,);
                              },
                              text: 'S\'identifier',
                              options: FFButtonOptions(
                                width: 125,
                                height: 40,
                                color: Color(0x00FFFFFF),
                                textStyle: GoogleFonts.getFont('Lato', color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15,),
                                borderSide: BorderSide(color: Color(0xFF553BBA), width: 2,),
                                borderRadius: 0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Forgot Password
                    // ----------------
                    Text('Mot de passe oublié ?', style: GoogleFonts.getFont('Lato', color: Colors.white, fontSize: 16,),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
