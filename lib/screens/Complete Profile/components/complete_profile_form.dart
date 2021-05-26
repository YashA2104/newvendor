import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendor/components/form_detail.dart';
import 'package:vendor/constants.dart';
import 'package:vendor/screens/Complete%20Profile/components/uploadbutton.dart';
import 'package:vendor/screens/Docs/docs.dart';
import 'package:vendor/screens/OTP/otp_screen.dart';
import 'package:vendor/size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController shopNameController = new TextEditingController();

  String newValue, f_name, l_name, p_number, address, shopName;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  String documentURL;
  final picker = ImagePicker();
  File image;

  Future chooseImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      }
    });
  }

  uploadImages() async {
    var storage = FirebaseStorage.instance.ref('Document').child('img');
    UploadTask uploadTask = storage.putFile(image);
    await uploadTask.whenComplete(() => null).then((value) async {
      await value.ref.getDownloadURL().then((value) => {
            documentURL = value.toString(),
            firebaseFirestore
                .collection('vendor')
                .doc(FirebaseAuth.instance.currentUser.uid.toString())
                .collection('user')
                .doc('details')
                .update({
              newValue: documentURL,
            }).whenComplete(() => {
                      Fluttertoast.showToast(msg: 'ImageDetails Saved!'),
                    }),
          });
    });
  }

  void implement() async {
    await chooseImage();
    await uploadImages();
  }

  void setValue(String value) {
    newValue = value;
  }

  void getValues() {
    f_name = fnameController.text.toString();
    l_name = lnameController.text.toString();
    p_number = phoneNumberController.text.toString();
    address = addressController.text.toString();
    shopName = shopNameController.text.toString();
  }

  void updateValues() async {
    if (f_name.isNotEmpty &&
        l_name.isNotEmpty &&
        p_number.isNotEmpty &&
        address.isNotEmpty) {
      FirebaseFirestore firebaseFirestore = await FirebaseFirestore.instance;
      firebaseFirestore
          .collection('vendor')
          .doc(await FirebaseAuth.instance.currentUser.uid.toString())
          .collection('user')
          .doc('details')
          .update({
        'firstName': f_name,
        'lastName': l_name,
        'phoneNumber': p_number,
        'address': address,
      }).whenComplete(() async => {
                Navigator.pushNamed(context, Docs.routeName),
                Fluttertoast.showToast(msg: 'Data Received Successfully!'),
                firebaseFirestore
                    .collection('vendor')
                    .doc(await FirebaseAuth.instance.currentUser.uid.toString())
                    .collection('shop')
                    .doc('details')
                    .set({
                  'shopType': newValue,
                  'shopName': shopName,
                  'shopAddress': address,
                }),
                firebaseFirestore
                    .collection('shop')
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .set({
                  'shopType': newValue,
                  'shopName': shopName,
                  'shopAddress': address,
                  'shopStatus': 'Not verified',
                  'shopCover': '',
                  'docID': FirebaseAuth.instance.currentUser.uid,
                }),
                FirebaseFirestore.instance
                    .collection('shopDocs')
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .set({
                  'null': null,
                }),
              });
    } else {
      Fluttertoast.showToast(msg: 'Please Fill All the Details');
    }
  }

  String valueChoose;

  List listItems = [
    'Electronics',
    'Daily Needs',
    'Groceries',
    'Medicine',
    'Clothing',
    'Liquor',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            FormDetails(
              controller: fnameController,
              labelText: 'First Name',
              hint: 'Enter your first name',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: lnameController,
              labelText: 'Last Name',
              hint: 'Enter your last name',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: phoneNumberController,
              labelText: 'Phone Number',
              hint: 'Enter your phone number',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: addressController,
              labelText: 'Shop Address',
              hint: 'Enter your Address',
            ),
            SizedBox(
              height: 30,
            ),
            FormDetails(
              controller: shopNameController,
              labelText: 'Shop Name',
              hint: 'Enter your Shop Name',
            ),
            SizedBox(
              height: 40,
            ),
            doc1(),
            SizedBox(
              height: 40,
            ),
            Text(
              '*All your Documents would be verified in the span of 2 days. We will get back to you once all your Documents are verified',
              style: TextStyle(
                fontFamily: 'Muli',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color.fromRGBO(244, 34, 114, 0.7),
              ),
              maxLines: 3,
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                onPressed: () async {
                  await getValues();
                  await updateValues();
                  Navigator.pushNamed(context, Docs.routeName);
                },
                color: kSecondaryColor,
                child: Text('Continue',
                    style: TextStyle(
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kPrimaryColor,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadButton() {
    return Container(
      height: 50,
      width: double.infinity,
      child: RaisedButton(
        onPressed: () async {
          await implement();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).primaryColor,
        child: Text('Upload Your Document',
            style: TextStyle(
              fontFamily: 'Muli',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            )),
      ),
    );
  }

  Container doc1() {
    return Container(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(1)),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: kPrimaryLightColor,
                  width: getProportionateScreenWidth(1)),
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(15))),
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(10),
              right: getProportionateScreenWidth(10)),
          child: DropdownButton(
            hint: Text('Select your Shop Category'),
            dropdownColor: Colors.white,
            icon: Icon(
              Icons.arrow_drop_down,
            ),
            isExpanded: true,
            value: valueChoose,
            onChanged: (newValue) {
              setState(() {
                valueChoose = newValue;
                setValue(newValue);
              });
            },
            items: listItems.map((valueItem) {
              return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
