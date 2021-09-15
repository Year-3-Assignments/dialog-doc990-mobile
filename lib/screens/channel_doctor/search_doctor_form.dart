import 'package:dialog_doc990_mobile/components/hospital_dropdown.dart';
import 'package:dialog_doc990_mobile/components/rounded_button.dart';
import 'package:dialog_doc990_mobile/components/specialization_dropdown.dart';
import 'package:dialog_doc990_mobile/components/underline_datepicker.dart';
import 'package:dialog_doc990_mobile/components/underline_input_feild.dart';
import 'package:dialog_doc990_mobile/constants.dart';
import 'package:flutter/material.dart';

class SeachDoctorFormScreen extends StatefulWidget {
  @override
  _SeachDoctorFormScreenState createState() => _SeachDoctorFormScreenState();
}

class _SeachDoctorFormScreenState extends State<SeachDoctorFormScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String doctorName = '';
    String hospitalName = '';
    String specilization = '';
    String selectedDate = '';

    void validateAndSubmit() {
      if (doctorName != '' ||
          hospitalName != '' ||
          specilization != '' ||
          selectedDate != '') {
        print(doctorName +
            ' ' +
            hospitalName +
            ' ' +
            specilization +
            ' ' +
            selectedDate);
      } else {
        // display error message
      }
    }

    return Container(
      width: size.width,
      height: size.height * 0.9,
      child: Align(
        alignment: Alignment.topCenter,
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Container(
            width: size.width * 0.9,
            height: size.height * 0.47,
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: UnderLineTextFeild(
                          onChange: (value) {
                            doctorName = value;
                          },
                          iconText: '👨‍⚕️',
                          text: 'Doctor - Max 20 Characters',
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        child: UnderLineHospitalDropDownFeild(
                          text: 'Any Hospital',
                          iconText: '🏥',
                          onChange: (value) {
                            hospitalName = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        child: UnderLineSpecializationDropDownFeild(
                          text: 'Any Specialization',
                          iconText: '🥼',
                          onChange: (value) {
                            specilization = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        child: UnderlineDatePickerField(
                          iconText: '📅',
                          text: 'Any Date',
                          onChange: (value) {
                            selectedDate = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.030,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: RoundedButton(
                          text: 'SEARCH',
                          color: Color(COLOR_PRIMARY),
                          textColor: Colors.white,
                          height: size.height * 0.073,
                          width: size.width * 0.31,
                          action: validateAndSubmit,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
