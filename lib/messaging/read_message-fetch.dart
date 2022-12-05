import 'package:cloud_firestore/cloud_firestore.dart';

//TODO not in query

Future<int> getMessageReads(
    dynamic data, dynamic groupName, dynamic isGroup) async {
  int count = 0;

  if (isGroup) {
    await FirebaseFirestore.instance
        .collection("GroupMessages/$groupName/Messages")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['users'].contains(data.email) == false) {
          count += 1;
        }
      }
    }).then((value) {
      return count;
    });
  } else {
    await FirebaseFirestore.instance
        .collection("Student_Detail/${data.prn}/Messages/$groupName/Messages")
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['users'].contains(data.email) == false) {
          count += 1;
        }
      }
    }).then((value) {
      return count;
    });
  }
  return count;
}

void readAll(dynamic data, String groupName, dynamic isGroup) {
  if (isGroup) {
    final ref = FirebaseFirestore.instance
        .collection("Student_Detail/${data.prn}/Messages/$groupName/Messages");
    ref.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['users'].contains(data.email) == false) {
          ref.doc(doc.id).update({
            'users': FieldValue.arrayUnion([data.email])
          });
        }
      }
    });
  } else {
    final ref = FirebaseFirestore.instance
        .collection("Student_Detail/${data.prn}/Messages/$groupName/Messages");
    ref.get().then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if (doc['users'].contains(data.email) == false) {
          ref.doc(doc.id).update({
            'users': FieldValue.arrayUnion([data.email])
          });
        }
      }
    });
  }
}
