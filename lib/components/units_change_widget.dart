import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnitsChangeWidget extends StatefulWidget {
  UnitsChangeWidget({Key key}) : super(key: key);

  @override
  _UnitsChangeWidgetState createState() => _UnitsChangeWidgetState();
}

class _UnitsChangeWidgetState extends State<UnitsChangeWidget> {
  TextEditingController textController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.always,
      child: TextFormField(
        onChanged: (_) => setState(() {}),
        controller: textController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: 'Unité :',
          labelStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
          ),
          hintText: 'Unité utilisée (j, h, serv,...)',
          hintStyle: FlutterFlowTheme.bodyText1.override(
            fontFamily: 'Poppins',
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.primaryColor,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.primaryColor,
              width: 1,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              topRight: Radius.circular(4.0),
            ),
          ),
          suffixIcon: textController.text.isNotEmpty
              ? InkWell(
                  onTap: () => setState(
                    () => textController.clear(),
                  ),
                  child: Icon(
                    Icons.clear,
                    color: Color(0xFF757575),
                    size: 22,
                  ),
                )
              : null,
        ),
        style: FlutterFlowTheme.bodyText1.override(
          fontFamily: 'Poppins',
        ),
        validator: (val) {
          if (val.isEmpty) {
            return 'Obligaoire';
          }
          if (val.length < 1) {
            return 'Entrez entre 1 et 3 caractères';
          }
          return null;
        },
      ),
    );
  }
}
