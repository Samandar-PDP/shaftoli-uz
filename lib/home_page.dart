import 'package:flutter/material.dart';
import 'package:networking/api_service.dart';
import 'package:networking/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _apiService = ApiService(); /// YOZZZZZ!

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shaftoli Uz"),
      ),
      body: FutureBuilder(
        future: _apiService.getProducts(),
        builder: (context, snapshot) {
          if(snapshot.data != null && snapshot.data?.isNotEmpty == true) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
               mainAxisExtent: 300
               // childAspectRatio: (1 / .4)
              ),
              itemBuilder: (context, index) {
                return _productItem(snapshot.data?[index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Widget _productItem(Product? product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.network(product?.image?? "",
                height: 150, width: double.infinity,fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(product?.title ?? "",style: const TextStyle(fontSize: 20),maxLines: 2,),
            const SizedBox(height: 10),
            Text(product?.price.toString() ?? ""),
          ],
        ),
      ),
    );
  }
}
