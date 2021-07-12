import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class AddPartnerWidget extends StatefulWidget {
  AddPartnerWidget({Key key}) : super(key: key);

  @override
  _AddPartnerWidgetState createState() => _AddPartnerWidgetState();
}

class _AddPartnerWidgetState extends State<AddPartnerWidget> {
  TextEditingController nameTextFieldController;
  TextEditingController unitTextFieldController;

  @override
  void initState() {
    super.initState();
    nameTextFieldController = TextEditingController();
    unitTextFieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final userRecord = snapshot.data;
        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment(-1, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      // Page Title
                      // ---------------
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
                        child: Text('Ajouter', style: FlutterFlowTheme.title1),
                      ),

                      // Name TextField
                      // ----------------
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: nameTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Nom :',
                            labelStyle: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),
                            hintText: '[Entrez le nom d\'un partenaire...]',
                            hintStyle: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins',),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),),
                            filled: true,
                            fillColor: FlutterFlowTheme.tertiaryColor,
                          ),
                          style: FlutterFlowTheme.subtitle1.override(fontFamily: 'Poppins',),
                          maxLines: 1,
                        ),
                      ),

                      // Units textfield
                      // ------------------
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: unitTextFieldController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '${userRecord.unit.isEmpty ? 'Unités' : userRecord.unit } :',
                            labelStyle: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),
                            hintText: '[Entrez la quantité de travail...]',
                            hintStyle: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins',),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0x00000000), width: 1,),
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0),),),
                            filled: true,
                            fillColor: FlutterFlowTheme.tertiaryColor,),
                          style: FlutterFlowTheme.subtitle1.override(fontFamily: 'Poppins',),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                        ),
                      ),


                      // Cancel Button
                      // -------------
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                        child: FFButtonWidget(
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          text: 'Annuler',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: FlutterFlowTheme.tertiaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins', color: FlutterFlowTheme.primaryColor,),
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
                            final partnersCreateData = createPartnersRecordData(
                              ownerId: currentUserReference,
                              name: nameTextFieldController.text,
                              units: double.tryParse(unitTextFieldController.text) ?? 0,
                            );
                            await PartnersRecord.collection.doc().set(partnersCreateData);
                            Navigator.pop(context);
                          },
                          text: 'Ok',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: FlutterFlowTheme.primaryColor,
                            textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins', color: Colors.white,),
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
        );
      },
    );
  }
}
