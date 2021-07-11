import 'package:intl/intl.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/add_partner_widget.dart';
import '../components/change_tip_widget.dart';
import '../components/update_partner_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../user_page/user_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MainPageWidget extends StatefulWidget {
  MainPageWidget({Key key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var totalUnits = 0.0;
  var totalTips = 0.0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final mainPageUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,

            // Page Title
            // ----------
            title: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('TiM Tips',style: FlutterFlowTheme.title1.override(fontFamily: 'Poppins',color: FlutterFlowTheme.tertiaryColor,),),
                Text('Partage équitable des pourboires', style: FlutterFlowTheme.bodyText2.override(fontFamily: 'Poppins', color: FlutterFlowTheme.tertiaryColor, fontSize: 10,),)
              ],
            ),

            // Top right menu (Preferences)
            // -------------------------------
            actions: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                child: IconButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 300),
                        reverseDuration: Duration(milliseconds: 300),
                        child: UserPageWidget(),
                      ),
                    );
                  },
                  icon: Icon(Icons.keyboard_control, color: FlutterFlowTheme.tertiaryColor, size: 30,),
                  iconSize: 30,
                ),
              )
            ],

            centerTitle: true,
            elevation: 4,
          ),

          // Add partner Floating button
          // ----------------------------
          floatingActionButton: FloatingActionButton(
            backgroundColor: FlutterFlowTheme.primaryColor,
            elevation: 8,
            child: IconButton(
              onPressed: () async {
                await showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: FlutterFlowTheme.primaryColor,
                  barrierColor: FlutterFlowTheme.tertiaryColor,
                  context: context,
                  builder: (context) => AddPartnerWidget(),
                );
              },
              icon: Icon(Icons.add, color: FlutterFlowTheme.tertiaryColor, size: 30,),
              iconSize: 30,
            ),
          ),

          // Page Body
          // ----------
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [

                    // Header
                    // ---------
                    StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference),
                        builder: (context, snapshot) {
                          totalTips = mainPageUsersRecord.tipsToShare;
                          return Align(
                            alignment: Alignment(0, -1),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
                              child: InkWell(
                                onTap: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: FlutterFlowTheme.primaryColor,
                                    barrierColor: FlutterFlowTheme.tertiaryColor,
                                    context: context,
                                    builder: (context) => ChangeTipWidget(),
                                  );
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(0),
                                      bottomRight: Radius.circular(0),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color: FlutterFlowTheme.primaryColor,
                                      width: 3,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [

                                      // Total Tips
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                                            child: Text(
                                              '${NumberFormat.currency(locale: 'fr_FR', symbol: "€").format(totalTips)}',
                                              style: FlutterFlowTheme.title1.override(
                                                fontFamily: 'Poppins',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Shared Tips method
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.primaryColor,
                                            boxShadow: [BoxShadow(color: FlutterFlowTheme.primaryColor,)],
                                            borderRadius: BorderRadius.circular(0),
                                            border: Border.all(color: FlutterFlowTheme.primaryColor,),
                                          ),
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Text(
                                              'A partager en ${mainPageUsersRecord.unit}',
                                              style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins', color: FlutterFlowTheme.tertiaryColor,),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),


                    // Partners
                    // ------------
                    Expanded(
                      child: StreamBuilder<List<PartnersRecord>>(
                        stream: queryPartnersRecord(queryBuilder: (partnersRecord) => partnersRecord.where('owner_id', isEqualTo: currentUserReference),),
                        builder: (context, snapshot) {

                          // Loading....
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          List<PartnersRecord> listViewPartnersRecordList = snapshot.data;

                          // No results...
                          if (snapshot.data.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(child: Text('Pas de résultats.'),),
                            );
                          }

                          // Result in list
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPartnersRecordList.length,
                            itemBuilder: (context, listViewIndex) {

                              totalUnits = listViewPartnersRecordList.fold(0, (acc, e) => acc + e.units);
                              final listViewPartnersRecord = listViewPartnersRecordList[listViewIndex];
                              final tipsPercentage = (listViewPartnersRecord.units / totalUnits);
                              final tipsValue = ( mainPageUsersRecord.tipsToShare * tipsPercentage);

                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),

                                // On partner item Tapped
                                // -----------------------
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: FlutterFlowTheme.primaryColor,
                                      barrierColor:FlutterFlowTheme.tertiaryColor,
                                      context: context,
                                      builder: (context) => UpdatePartnerWidget(partnerRef: listViewPartnersRecord.reference),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [

                                      // Partner units
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width *0.15,
                                          height: 60,
                                          decoration: BoxDecoration(color:FlutterFlowTheme.primaryColor),
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(
                                                  listViewPartnersRecord.units.toString(),
                                                  textAlign: TextAlign.end, style: FlutterFlowTheme.title3.override(fontFamily: 'Poppins', color: FlutterFlowTheme.tertiaryColor, fontWeight: FontWeight.w600),
                                                ),
                                                Text(
                                                    '${mainPageUsersRecord.unit}',
                                                  style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins', color: Colors.black, fontSize: 10,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Partner Name
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
                                              child: Align(
                                                alignment: Alignment(-1, 0),
                                                child: Text(listViewPartnersRecord.name, style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // Partner Tips and %
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width * 0.3,
                                          height: 60,
                                          decoration: BoxDecoration(color: Color(0xFFEEEEEE),),
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [

                                                // Partner Tips
                                                Align(
                                                  alignment: Alignment(0, 0),
                                                  child: Text(
                                                    '${NumberFormat.currency(locale: 'fr_FR', symbol: "€").format(tipsValue)}',
                                                    textAlign: TextAlign.end, style: FlutterFlowTheme.title3.override(fontFamily: 'Poppins', color: FlutterFlowTheme.primaryColor, fontWeight: FontWeight.w600),
                                                  ),
                                                ),

                                                // Partner Percentage
                                                Align(
                                                  alignment: Alignment(0, 0),
                                                  child: AutoSizeText(

                                                    '(${NumberFormat.decimalPercentPattern(locale: 'fr_FR', decimalDigits: 2).format(tipsPercentage)})',
                                                    style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins', color: Color(0xFF787878), fontSize: 10,),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}