import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListUsers extends StatefulWidget {
  ListUsers({Key? key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  List searchResult = [];
  String name = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  final TextEditingController _dateController = TextEditingController();
  final user = FirebaseAuth.instance.currentUser!;
  PageController _controller = PageController();

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Text('User have been successfully deleted  '),
          Icon(Icons.done),
        ],
      ),
    ));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person_search),
                  labelText: 'search for user',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: StreamBuilder(
                  //future: _products.get(),
                  stream: _products.snapshots(),
                  builder: (context, AsyncSnapshot streamSnapshot) {
                    if (streamSnapshot.hasData) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView.builder(
                            itemCount: streamSnapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  streamSnapshot.data!.docs[index];
                              return Card(
                                color: Color.fromARGB(255, 226, 226, 226),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        //height: 100,
                                        child: //Icon(Icons.person),
                                            //Image.asset("lib/images/kk.jpg")
                                            CircleAvatar(
                                          //backgroundColor: Color.fromARGB(255, 78, 42, 42),
                                          radius: 50.0,
                                          backgroundImage: AssetImage(
                                              "lib/images/hachem.jpg"),
                                          /*child: ClipRRect(
                            child: Image.asset("lib/images/men3.jpg"),
                            borderRadius: BorderRadius.circular(80.0),
                          ),*/
                                        ),
                                      ),
                                      /**/
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: ListTile(
                                        //leading: Icon(Icons.person,size: 45,color: Color.fromARGB(255, 69, 70, 80),),
                                        //contentPadding: EdgeInsets.symmetric(vertical: 60.0),
                                        title: Text(
                                          documentSnapshot['name'],
                                        ),
                                        subtitle: Text(
                                          documentSnapshot['cin'].toString(),
                                        ),

                                        trailing: IconButton(
                                          onPressed: () {
                                            //_update(documentSnapshot);
                                          },
                                          icon: const Icon(Icons.edit),
                                          color: Colors.black,
                                        ),
                                        onTap: () {
                                          /*_update();
                                        Navigator.of(context)
                                            .pushReplacementNamed("details");*/
                                        },
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                ),
                                                title:
                                                    const Text('Delete User'),
                                                content: const Text(
                                                    'Are you sure to Delete ?'),
                                                actions: <Widget>[
                                                  ElevatedButton.icon(
                                                    onPressed: () {
                                                      _delete(
                                                          documentSnapshot.id);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.green,
                                                    ),
                                                    icon: Icon(
                                                        Icons.person_remove),
                                                    label: Text(
                                                      "Delete",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                  ElevatedButton.icon(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.red,
                                                    ),
                                                    icon: Icon(Icons.close),
                                                    label: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                    //IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }),
            ),
          ],
        ),
      );
}
