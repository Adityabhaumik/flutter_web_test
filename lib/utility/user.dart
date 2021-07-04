import 'package:cloud_firestore/cloud_firestore.dart';


class user {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String Name = '';
  String Email = '';
  String phoneNumber = '';
  String accountNymber = '';
  String IFSCcode = '';

  void uploadToFirebase() async {
    await firestore.collection('Ceribrium').add({
      'FullName': '${Name}',
      'Email': "$Email",
      'PhoneNumber': '${phoneNumber}',
      'accountNumber': '${accountNymber}',
      'IFSC': '${IFSCcode}'
    });
  }
}
