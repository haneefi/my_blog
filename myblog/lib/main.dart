import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myblog/config.dart';
import 'package:myblog/provider/ProductsProvider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
     ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TITLE,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
   
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProductData();
  }



  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(TITLE),
      ),
      body: Consumer<ProductProvider>(

        builder: (BuildContext context, ProductProvider value, Widget child) { 
          if(value.loading)
          {
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (BuildContext ctx,int index){
                    return ListTile(
                      title: Text(value.products[index].title.rendered.toString()),
                    );
                },
                itemCount: value.products.length,
                ),
            );
          }
         },
        
      ),
    );
  }
}

