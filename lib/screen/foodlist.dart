import 'package:flutter/material.dart';
import 'package:food_ui_app/screen/foodDetails.dart';



class FoodListScreen extends StatelessWidget {
  final List food = [
    {
      "name": "Chicken Thai Biriyani",
      "price": "\$60",
      "image": "lib/assets/image/image4.png"
    },
    {
      "name": "Chicken Bhuna",
      "price": "\$30",
      "image": "lib/assets/image/image5.png"
    },
    {
      "name": "Mazalichiken Halim",
      "price": "\$25",
      "image": "lib/assets/image/image6.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),

      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle),
                  child: Icon(Icons.arrow_back),
                ),

                SizedBox(width: 15),

                Text(
                  "My Food List",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tab("All", true),
                tab("Breakfast", false),
                tab("Lunch", false),
                tab("Dinner", false),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Total 03 items",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: food.length,
                itemBuilder: (context, index) {
                  return foodCard(context, food[index]);
                },
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Icon(Icons.grid_view_outlined,color: Colors.grey),

            Icon(Icons.menu,color: Colors.orange),

            Container(
  height: 50,
  width: 50,
  decoration: BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    border: Border.all(
      color: Colors.orange,
      width: 2,
    ),
  ),
  child: Icon(
    Icons.add,
    color: Colors.orange,
  ),
),
            Icon(Icons.notifications_none,color: Colors.grey),

            Icon(Icons.person_outline,color: Colors.grey),

          ],
        ),
      ),
    );
  }

  Widget tab(String text, bool isSelected) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    decoration: BoxDecoration(
      border: isSelected
          ? Border(
              bottom: BorderSide(
                color: Colors.orange,
                width: 3,
              ),
            )
          : null,
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: isSelected ? Colors.orange : Colors.black,
      ),
    ),
  );
}

  Widget foodCard(BuildContext context, Map item) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoodDetailScreen()),
      );
    },
    child: Container(
      
      margin: EdgeInsets.only(bottom: 15, left: 15, right: 15), 
     
      padding: EdgeInsets.all(12), 
      decoration: BoxDecoration(
        color: Colors.white,
        
        borderRadius: BorderRadius.circular(20), 
        
        
        boxShadow: [
          BoxShadow(
           
            color: Colors.black.withOpacity(0.08), 
            
            blurRadius: 15, 
            
            spreadRadius: 1, 
            
            offset: Offset(0, 5), 
          ),
        ],
        // ----------------------------------
      ),
      child: Row(
        
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), 
            child: Image.asset(
              item["image"],
              height: 80, 
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          
          SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  item["name"],
                  style: TextStyle(
                      fontSize: 15, 
                      fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 6),

                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade100,
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  child: Text(
                    "Breakfast",
                    style: TextStyle(
                        fontSize: 11, 
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  ),
                ),

                SizedBox(height: 6),

                Row(
                  children: [
                    Icon(Icons.star,
                        color: Colors.orange,
                        size: 16), // 👇 ஐகான் அளவு

                    SizedBox(width: 4),

                    Text(
                      "4.9",
                      style: TextStyle(
                        fontSize: 13, 
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 6),

                    Text(
                      "(10 Review)",
                      style: TextStyle(
                          fontSize: 12, 
                          color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween, 
            children: [
              Icon(Icons.more_horiz, color: Colors.grey),

             

              Text(
                item["price"],
                style: TextStyle(
                    fontSize: 18, 
                    fontWeight: FontWeight.bold,
                    color: Colors.orange), 
              ),

              SizedBox(height: 4),

              Text(
                "Pick UP",
                style: TextStyle(
                    fontSize: 12, 
                    color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
}