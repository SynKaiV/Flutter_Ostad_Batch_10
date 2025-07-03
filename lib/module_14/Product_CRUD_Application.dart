import 'package:first_class/module_14/productController.dart';
import 'package:first_class/module_14/widget/product_card.dart';
import 'package:flutter/material.dart';

class ProductCrudApplication extends StatefulWidget {
  const ProductCrudApplication({super.key});

  @override
  State<ProductCrudApplication> createState() => _ProductCrudApplicationState();
}

class _ProductCrudApplicationState extends State<ProductCrudApplication> {
  final ProductController productController = ProductController();

  Future<void> getData() async {
    await productController.getProducts();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    void productDialog({String ? id, String ? name, String ? img, int ? qty, int ? unitPrice, int ? totalPrice, required bool isUpdate}) {
      TextEditingController productNameController = TextEditingController();
      TextEditingController productQTYController = TextEditingController();
      TextEditingController productImageController = TextEditingController();
      TextEditingController productUnitPriceController = TextEditingController();
      TextEditingController productTotalPriceController = TextEditingController();

      productNameController.text = name ?? '';
      productImageController.text = img ?? '';
      productQTYController.text = qty != null ? qty.toString() : '0';
      productUnitPriceController.text = unitPrice != null ? unitPrice.toString() : '0';
      productTotalPriceController.text = totalPrice != null ? totalPrice.toString() : '0';

      showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text(isUpdate ? 'Edit Details': 'Add Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),

              SizedBox(height: 25),

              TextField(
                controller: productImageController,
                decoration: InputDecoration(
                  labelText: 'Image',
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: productQTYController,
                decoration: InputDecoration(
                  labelText: 'Quantity',
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: productUnitPriceController,
                decoration: InputDecoration(
                  labelText: 'Unit Price',
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: productTotalPriceController,
                decoration: InputDecoration(
                  labelText: 'Total Price',
                ),
              ),

              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Cancel'),
                  ),

                  SizedBox(width: 10),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    onPressed: () async {
                        productController.createAndUpdateProducts(productNameController.text,
                            productImageController.text,
                            int.parse(productQTYController.text),
                            int.parse(productUnitPriceController.text),
                            int.parse(productTotalPriceController.text),
                            id,
                            isUpdate
                        ).then((value) async {
                          if(value){
                            await productController.getProducts();
                            setState(() {
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isUpdate ? 'Product Updated Successfully' : 'Product Created Successfully'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.green,
                                )
                            );
                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isUpdate ? 'Failed to Update Product' : 'Failed to Create Product'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: Colors.red,
                                )
                            );
                          }
                        }
                        );

                        Navigator.pop(context);
                        await getData();
                        setState(() {
                        });
                      },

                    child: Text(isUpdate ? 'Update Product' : 'Add Product'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Product CRUD Application',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),


      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: productController.products.length,
          itemBuilder: (context,index){
            var product = productController.products[index];
            return ProductCard(
              onEdit: () {
                productDialog(
                  id: product.sId,
                  name: product.productName,
                  img: product.img,
                  qty: product.qty,
                  unitPrice: product.unitPrice,
                  totalPrice: product.totalPrice,
                  isUpdate: true
                );
              },
              onDelete: () {
                productController.deleteProduct(product.sId.toString())
                    .then((value) async {
                  if(value){
                    await productController.getProducts();
                    setState(() {

                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product Deleted Successfully'),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.green,
                      )
                    );
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to Delete Product'),
                        duration: Duration(seconds: 3),
                        backgroundColor: Colors.red,
                      )
                    );
                  }
                }
                );
              },
              product: product,
            );
          }
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => productDialog(isUpdate: false),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}