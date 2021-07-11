import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../user_page/user_page_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

extension Ex on double {
  double toRounded(int n) => double.parse(toStringAsFixed(n));
}

class MainPageWidget extends StatefulWidget {
  MainPageWidget({Key key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  TextEditingController partnerTextFieldController;
  TextEditingController textController2;
  TextEditingController textController1;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  var totalUnits = 0.0;
  var totalTips = 0.0;

  @override
  void initState() {
    super.initState();
    partnerTextFieldController = TextEditingController(text: partnersItem);
    textController2 = TextEditingController();
    textController1 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: StreamBuilder<UsersRecord>(
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
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'TiM Tips',
                    style: FlutterFlowTheme.title1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
=======
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {return Center(child: CircularProgressIndicator());}

        final mainPageUsersRecord = snapshot.data;

        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.primaryColor,
            automaticallyImplyLeading: true,
            title: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'TiM Tips',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.tertiaryColor,
>>>>>>> Stashed changes
                  ),
                  Text(
                    'Partage équitable des pourboires',
                    style: FlutterFlowTheme.bodyText2.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                      fontSize: 10,
                    ),
                  )
                ],
              ),
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
                    icon: Icon(
                      Icons.keyboard_control,
                      color: FlutterFlowTheme.tertiaryColor,
                      size: 30,
                    ),
                    iconSize: 30,
                  ),
                )
              ],
              centerTitle: true,
              elevation: 4,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print('FloatingActionButton pressed ...');
              },
              backgroundColor: FlutterFlowTheme.primaryColor,
              elevation: 8,
              child: IconButton(
                onPressed: () {
                  print('IconButton pressed ...');
                },
                icon: Icon(
                  Icons.add,
                  color: FlutterFlowTheme.tertiaryColor,
                  size: 30,
                ),
                iconSize: 30,
              ),
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment(0, -1),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 24, 8, 8),
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

                                // Tips To Share
                                Expanded(
                                  child: Align(
                                    alignment: Alignment(0, 0),
                                    child: TextFormField(
                                      controller: textController1,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: 'Saisir un montant...',
                                        hintStyle:
                                            FlutterFlowTheme.title1.override(
                                          fontFamily: 'Poppins',
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.title1.override(
                                        fontFamily: 'Poppins',
                                      ),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (val.isEmpty) {
                                          return 'Saisie non valide';
                                        }
                                        if (val.length < 1) {
                                          return 'Requires at least 1 characters.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
<<<<<<< Updated upstream
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.primaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: FlutterFlowTheme.primaryColor,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.primaryColor,
                                      ),
                                    ),
                                    child: Align(
                                      alignment: Alignment(0, 0),
                                      child: Text(
                                        '17${mainPageUsersRecord.unit}',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                        ),
                                      ),
=======

                                // Total units
                                StreamBuilder<List<PartnersRecord>>(
                                    stream: queryPartnersRecord(
                                      queryBuilder: (partnersRecord) =>
                                          partnersRecord.where('owner_id',
                                              isEqualTo: currentUserReference),
>>>>>>> Stashed changes
                                    ),
                                    builder: (context, snapshot) {

                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) { return Center(child: CircularProgressIndicator()); }
                                      List<PartnersRecord> listViewPartnersRecordList = snapshot.data;
                                      // Customize what your widget looks like with no query results.
                                      if (snapshot.data.isEmpty) { return Text('Pas de données.');}

                                        totalUnits = listViewPartnersRecordList.fold(0, (acc, e) => acc + e.units);

                                      print(totalUnits);

                                      return
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.primaryColor,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: FlutterFlowTheme.primaryColor,
                                                  )
                                                ],
                                                borderRadius: BorderRadius.circular(0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.primaryColor,
                                                ),
                                              ),
                                              child: Align(
                                                alignment: Alignment(0, 0),
                                                child: Text('A partager selon ${mainPageUsersRecord.unit}',
                                                  style:
                                                  FlutterFlowTheme.bodyText1.override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme.tertiaryColor,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                    }
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
<<<<<<< Updated upstream
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            final partners =
                                mainPageUsersRecord.partnersName?.toList() ??
                                    [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: partners.length,
                              itemBuilder: (context, partnersIndex) {
                                final partnersItem = partners[partnersIndex];
                                return Padding(
                                  padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
=======
                    ),
                    Expanded(
                      child: StreamBuilder<List<PartnersRecord>>(
                        stream: queryPartnersRecord(
                          queryBuilder: (partnersRecord) =>
                              partnersRecord.where('owner_id',
                                  isEqualTo: currentUserReference),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }
                          List<PartnersRecord> listViewPartnersRecordList =
                              snapshot.data;
                          // Customize what your widget looks like with no query results.
                          if (snapshot.data.isEmpty) {
                            return Container(
                              height: 100,
                              child: Center(
                                child: Text('No results.'),
                              ),
                            );
                          }


                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPartnersRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              totalUnits = listViewPartnersRecordList.fold(0, (acc, e) => acc + e.units);
                              final listViewPartnersRecord = listViewPartnersRecordList[listViewIndex];
                              final tipsPercentage = (listViewPartnersRecord.units / totalUnits * 100).toRounded(2);
                              final tipsValue = ( mainPageUsersRecord.tipsToShare * tipsPercentage / 100).toRounded(2);
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.primaryColor,
                                      barrierColor:
                                          FlutterFlowTheme.tertiaryColor,
                                      context: context,
                                      builder: (context) {
                                        return UpdatePartnerWidget(
                                          partnerRef:
                                              listViewPartnersRecord.reference,
                                        );
                                      },
                                    );
                                  },
>>>>>>> Stashed changes
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(8, 0, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color:
                                                FlutterFlowTheme.primaryColor,
                                          ),
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  2, 0, 2, 0),
                                              child: TextFormField(
                                                controller: textController2,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Unités',
                                                  hintStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .tertiaryColor,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                ),
                                                keyboardType:
                                                    TextInputType.number,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.fromLTRB(4, 0, 4, 0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFEEEEEE),
                                              ),
                                              child: TextFormField(
                                                controller:
                                                    partnerTextFieldController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  hintText: 'Nom',
                                                  hintStyle: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 8, 0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),

                                          // Tips
                                          child: Align(
                                            alignment: Alignment(0, 0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                              children: [
                                                // Tips
                                                Align(
                                                  alignment: Alignment(0, 0),
                                                  child: Text('$tipsValue €',textAlign: TextAlign.end,style: FlutterFlowTheme.title3.override(fontFamily: 'Poppins',color: FlutterFlowTheme.primaryColor,fontWeight:FontWeight.w600,),),
                                                ),
                                                Align(
                                                  alignment: Alignment(0, 0),
                                                  child: AutoSizeText('($tipsPercentage %)',style: FlutterFlowTheme.bodyText1.override(fontFamily: 'Poppins',color: Color(0xFF787878), fontSize: 10,),),
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
      ),
    );
  }
}
