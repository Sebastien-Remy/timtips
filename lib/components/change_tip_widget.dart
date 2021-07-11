import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangeTipWidget extends StatefulWidget {
  ChangeTipWidget({
    Key key,
    this.partnerRef,
  }) : super(key: key);

  final DocumentReference partnerRef;

  @override
  _ChangeTipWidgetState createState() => _ChangeTipWidgetState();
}

class _ChangeTipWidgetState extends State<ChangeTipWidget> {
  String tipsToShareTextFieldValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {

        // Waiting fo loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final changeTipUsersRecord = snapshot.data;

        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        // Title
                        // ------
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Text( 'Pourboires à partager', style: FlutterFlowTheme.title1.override(fontFamily: 'Poppins', fontWeight: FontWeight.w500,),),
                        ),

                        // Tips to share
                        // ---------------
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: TextFormField(
                            controller: TextEditingController.fromValue(
                              TextEditingValue(
                                text: changeTipUsersRecord.tipsToShare.toString(),
                                selection: TextSelection.collapsed(offset:changeTipUsersRecord.tipsToShare.toString().length,),
                              ),
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Total à partager :',
                              labelStyle: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),
                              hintText: '[Entrez le montant total…]',
                              hintStyle: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins'),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Color(0x00000000), width: 1),
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.tertiaryColor,
                            ),
                            style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => tipsToShareTextFieldValue = value,
                          ),
                        ),


                        // Cancel Button
                        // -------------
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: FFButtonWidget(
                            onPressed: () async {Navigator.pop(context);},
                            text: 'Annuler',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              color: FlutterFlowTheme.tertiaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins',color: FlutterFlowTheme.primaryColor,),
                              borderSide: BorderSide(color: Colors.transparent, width: 1,),
                              borderRadius: 12,
                            ),
                          ),
                        ),

                        // Ok Button
                        // ----------
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: FFButtonWidget(
                            onPressed: () async {
                              final usersUpdateData = createUsersRecordData(
                                tipsToShare: double.tryParse(tipsToShareTextFieldValue) ?? 0,
                              );
                              await changeTipUsersRecord.reference.update(usersUpdateData);
                              Navigator.pop(context);
                            },
                            text: 'Ok',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 40,
                              color: FlutterFlowTheme.primaryColor,
                              textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins',color: Colors.white,),
                              borderSide: BorderSide(color: Colors.transparent, width: 1,),
                              borderRadius: 12,
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
