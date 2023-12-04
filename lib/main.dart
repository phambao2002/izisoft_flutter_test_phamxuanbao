import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter ',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: EditProfileUI(),
    );
  }
}

class EditProfileUI extends StatefulWidget {
  @override
  _EditProfileUIState createState()=> _EditProfileUIState();

}
class _EditProfileUIState extends State<EditProfileUI>{
  bool isObscurePassword = true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('User info'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,

          ),
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.blue,

            ),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top :20, right: 15),
        child : GestureDetector(
          onTap:(){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://i1-dulich.vnecdn.net/2022/07/01/nghia-1656640494.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=AmJArMsmzneb1dYCwlL4mg'
                          )
                        )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Colors.blue,

                          ),
                          color: Colors.blue
                        ),
                        child: Icon(
                          Icons.edit,
                          color:Colors.white,
                        ),
                      ),
                    )


                  ],

                ),
              ),
              SizedBox(height: 30),
              buildTextField("Full Name", "Họ tên",false),
              buildTextField("Email", ".....@gmail.com",false),
              buildTextField("Password", "******",true),
              buildTextField("Gender", "",false),
              SizedBox(height: 50),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              child: Container(
                alignment: Alignment.center, // Đặt alignment để căn giữa
                child: Text(
                  "Cập nhật thông tin",
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )


            ],
          ),
        )
      ),
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.remove_red_eye, color:Colors.grey),
              ):null ,
        contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey
          )

        ),
      ),

    );
  }
}




