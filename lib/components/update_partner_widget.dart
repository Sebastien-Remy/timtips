import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdatePartnerWidget extends StatefulWidget {
  UpdatePartnerWidget({
    Key key,
    this.partnerRef,
  }) : super(key: key);

  final DocumentReference partnerRef;

  @override
  _UpdatePartnerWidgetState createState() => _UpdatePartnerWidgetState();
}

class _UpdatePartnerWidgetState extends State<UpdatePartnerWidget> {
  String nameTextFieldValue;
  String unitTextFieldValue;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PartnersRecord>(
      stream: PartnersRecord.getDocument(widget.partnerRef),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final partnerRecord = snapshot.data;
        return Column(
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

                      // Page Title
                      // ---------------
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 32, 0, 16),
                        child: Text('Modifier', style: FlutterFlowTheme.title1),
                      ),


                      // Name
                      // --------
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          controller: TextEditingController.fromValue(
                            TextEditingValue(
                              text: partnerRecord.name,
                              selection: TextSelection.collapsed(offset:partnerRecord.name.length,),
                            ),
                          ),
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
                          onChanged: (value) => nameTextFieldValue = value,
                        ),
                      ),

                      // Units
                      // ------
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(currentUserReference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(child: CircularProgressIndicator());
                              }
                              final userRecord = snapshot.data;

                              return TextFormField(
                                controller: TextEditingController.fromValue(
                                  TextEditingValue(
                                    text: partnerRecord.units.toString(),
                                    selection: TextSelection.collapsed(offset:partnerRecord.units.toString().length,),
                                  ),
                                ),
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
                              );
                            }
                        ),
                      ),

                      // Delete Button
                      // ---------------
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 16, 8, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await partnerRecord.reference.delete();
                            Navigator.pop(context);
                          },
                          text: 'Supprimer',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,
                            color: Color(0xFFF92525),
                            textStyle: FlutterFlowTheme.subtitle2.override(fontFamily: 'Poppins', color: Colors.white,),
                            borderSide: BorderSide(color: Colors.transparent, width: 1,),
                            borderRadius: 12,
                          ),
                        ),
                      ),

                      // Cancel Button
                      //---------------
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
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
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: FFButtonWidget(
                          onPressed: () async {
                            final partnersUpdateData = createPartnersRecordData(
                              ownerId: currentUserReference,
                              name: nameTextFieldValue,
                              units: double.tryParse(unitTextFieldValue) ?? 0,
                            );
                            await partnerRecord.reference.update(partnersUpdateData);
                            Navigator.pop(context);
                          },
                          text: 'Ok',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40,color: FlutterFlowTheme.primaryColor,
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

