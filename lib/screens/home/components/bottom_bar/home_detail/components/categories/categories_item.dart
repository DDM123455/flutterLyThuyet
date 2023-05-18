import 'package:flutter/material.dart';
import 'package:flutterfinal/models/categories.dart';
import 'package:flutterfinal/models/hotel.dart';
import 'package:flutterfinal/screens/cart/cart_screen.dart';
import 'cateList.dart';
import 'package:flutterfinal/screens/cart/body.dart';
import 'package:flutterfinal/screens/product_detail/product_detali_screen.dart';
class CateItem extends StatefulWidget{
  final Categories categories;
  const CateItem({Key? key, required this.categories})
      : super(key: key);

  @override
  _CategoriesItem createState() => _CategoriesItem();

}
class _CategoriesItem extends State<CateItem> {
   CategoriesStarService categoriesStarService = CategoriesStarService();
   List<Hotel> hotelsList = [];

  @override
  void initState() {
    super.initState();
  }

    fetchProducts(num star) async {
     hotelsList = await categoriesStarService.categoriesStore(context: context, star: star);
     for(int i=0;i<hotelsList.length;i++){
       return(hotelsList[i]);
     }

     setState(() {});
   }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async {
        // fetchProducts(widget.categories.star ?? 4);
        // hotelsList = await categoriesStarService.categoriesStore(context: context, star: widget.categories.star);
        // // print(hotelsList[0].name);
        // print(hotelsList);
       await fetchProducts(widget.categories.star ?? 4);
        // print( fetchProducts(widget.categories.star ?? 4));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Body(hotel:hotelsList),
          ),
        );
       // Navigator.push(context,MaterialPageRoute(builder: (context) => CartScreen()));

       // Navigator.push(context,MaterialPageRoute(builder: (context) => Body(hotel:hotelsList)));

        // categoriesStarService = (categoriesStarService.categoriesStore(context: context,star: widget.categories.star)) as CategoriesStarService  ;
        // // Handle the tap event here
        // print(categoriesStarService);
      },
      child: Container(
        width: 180,
        height: 180,
        padding: const EdgeInsets.all(5),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(widget.categories.image),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'Khách sạn ${widget.categories.star}',
                      style: TextStyle(fontSize: 16, color: Colors.lightBlue),
                    ),
                    Icon(Icons.star, color: Colors.yellow),
                    SizedBox(width: 5),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}
