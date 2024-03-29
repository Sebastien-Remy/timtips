import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login_page/login_page_widget.dart';
import 'package:flutter/material.dart';

class UserPageWidget extends StatefulWidget {
  UserPageWidget({Key key}) : super(key: key);

  @override
  _UserPageWidgetState createState() => _UserPageWidgetState();
}

class _UserPageWidgetState extends State<UserPageWidget> {
  String unitTextFieldValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final userPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: false,

            // Left Button: Save and Pop
            // -------------------------
            leading: FFButtonWidget(
              onPressed: () async {
                final usersUpdateData = createUsersRecordData(unit: unitTextFieldValue,);
                await userPageUsersRecord.reference.update(usersUpdateData);
                Navigator.pop(context);
              },
              text: 'Ok',
              options: FFButtonOptions(
                width: 130,
                height: 40,
                color: FlutterFlowTheme.primaryColor,
                textStyle: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins', color: Colors.white,),
                elevation: 0,
                borderSide: BorderSide(color: Colors.transparent,),
                borderRadius: 0,
              ),
            ),

            // Title
            // ------
            title: Text('Préférences',style: FlutterFlowTheme.title1.override(fontFamily: 'Poppins',color: FlutterFlowTheme.tertiaryColor,),),

            // Right Button: Cancel and pop
            // ----------------------------
            actions: [
              FFButtonWidget(
                onPressed: () async {Navigator.pop(context);},
                text: 'Annuler',
                options: FFButtonOptions(
                  width: 80,
                  height: double.infinity,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins', color: Color(0xFFF92525),),
                  elevation: 0,
                  borderSide: BorderSide(color: Colors.transparent,),
                  borderRadius: 0,
                ),
              )
            ],
            centerTitle: true,
            elevation: 4,
          ),


          // Page body
          // --------
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(8, 32, 8, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  // User information
                  Text('Compte utilisateur :',style: FlutterFlowTheme.subtitle1.override(fontFamily: 'Poppins',),),

                  // User eMail
                  Text(userPageUsersRecord.email,style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),),

                  Divider(color: FlutterFlowTheme.secondaryColor,),

                  // User preference: Share unit
                  // ---------------------------
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text('Unité la répartion :', style: FlutterFlowTheme.subtitle1.override(fontFamily: 'Poppins',),),
                  ),

                  TextFormField(
                    controller: TextEditingController.fromValue(
                      TextEditingValue(
                        text: userPageUsersRecord.unit,
                        selection: TextSelection.collapsed(offset:userPageUsersRecord.unit.length,),
                      ),
                    ),
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '[Entrez une unité (jour, service, heure...]',
                      hintStyle: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins',),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0),),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0),topRight: Radius.circular(4.0),),
                      ),
                    ),
                    style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),
                    maxLines: 1,
                    onChanged: (value) => unitTextFieldValue = value,
                  ),

                  Divider(color: FlutterFlowTheme.secondaryColor,),

                  // Logout Button
                  // ----------------
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await signOut();
                        await Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPageWidget(),), (r) => false,
                        );
                      },
                      text: 'Déconnection',
                      options: FFButtonOptions(
                        width: 130,
                        height: 40,
                        color: Colors.white,
                        textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins', color: Colors.red,),
                        borderSide: BorderSide(color:Colors.white, width: 1,),
                        borderRadius: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

