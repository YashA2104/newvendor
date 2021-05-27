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
  String email,pass;

  CompleteProfileForm({
   @required this.email,
   @required this.pass,
});
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  TextEditingController fnameController = new TextEditingController();
  TextEditingController lnameController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController shopNameController = new TextEditingController();

  String shopType, f_name, l_name, p_number, address, shopName ;
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
              shopType: documentURL,
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
    shopType = value;
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
        'shopType' : shopType,
        'shopStatus': 'NOT VERIFIED',
        'shopName' : shopName,
              });
      firebaseFirestore.collection('shop').doc(FirebaseAuth.instance.currentUser.uid).set({
        'firstName': f_name,
        'lastName': l_name,
        'phoneNumber': p_number,
        'address': address,
        'shopType' : shopType,
        'shopStatus': 'NOT VERIFIED',
        'shopName' : shopName,
        'shopImage': 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fimage-not-available-855398481144319%2Fphotos%2F&psig=AOvVaw3lT2eaW9zic_3Mi0lRT5_z&ust=1622109220701000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCRpOeJ5_ACFQAAAAAdAAAAABAD',
        'userEmail': FirebaseAuth.instance.currentUser.email.toString(),
        'userID': FirebaseAuth.instance.currentUser.uid,
        'catImage' : 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.facebook.com%2Fimage-not-available-855398481144319%2Fphotos%2F&psig=AOvVaw3lT2eaW9zic_3Mi0lRT5_z&ust=1622109220701000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCMCRpOeJ5_ACFQAAAAAdAAAAABAD',
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
                  if(fnameController.text.isNotEmpty && lnameController.text.isNotEmpty && phoneNumberController.text.isNotEmpty && addressController.text.isNotEmpty && shopNameController.text.isNotEmpty && shopType.isNotEmpty){
                    await Fluttertoast.showToast(msg: 'Details Saved Successfully !! ');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Docs(pass: widget.pass, email: widget.email,address: address,f_name: f_name,l_name: l_name,p_number: p_number,shopName: shopName,shopType: shopType,)));
                  }
                  else{
                    Fluttertoast.showToast(msg: 'Kindly enter all the details carefully !!  ');
                  }
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
