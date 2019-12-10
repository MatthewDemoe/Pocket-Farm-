import 'package:flutter/material.dart';
import 'package:badges/badges.dart'; //I was planning on using this for extra visual flair
import 'ShopItem.dart';

//Atiya Nova
class ShopLogic
{
   List<ShopObject> shopItems = new List<ShopObject>();
   List<Column> columns = new List<Column>();
   int itemAmount = 3;

   ShopLogic()
   {
      //the different shop items get added
      shopItems.add(new CarrotSeed());
      shopItems.add(new CabbageSeed());
      shopItems.add(new KaleSeed());
      shopItems.add(new MoreHarvest());
      shopItems.add(new MoreMoney());
      shopItems.add(new MorePlanters());
      shopItems.add(new MoreSeeds());
      shopItems.add(new FasterGrowth());

      //The shop items get initialized
      for (int i = 0; i < shopItems.length; i++) {
      initializeShopObject(i);
      columns.add(new Column(
        children: [
          shopItems[i].theGestureDetector,
          new Text(shopItems[i].theName),
          new Text(shopItems[i].price.toString()),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
      ));
    }
    }

   //to build the view of the windows
   Widget buildItemWindow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(height:100,child:Image.asset('assets/images/shop.png')),
        Row(             
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            columns[0],columns[1]
            ]),
        columns[2],
      ],
    );
  }

  //builds the window for the upgrades
  Widget buildUpgradeWindow()
  {
     return Column(
     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     children: <Widget>[
           Container(height:60,child:Image.asset('assets/images/shop.png')),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
             columns[itemAmount+0], columns[itemAmount+1],
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
             columns[itemAmount+2], columns[itemAmount+3],
             ],
           ),
           columns[itemAmount+4],
        ],
     );
  } 

  //initializes each shop item
  void initializeShopObject(int i)
  {
    //sets up the gesturedetector and the image
    shopItems[i].theGestureDetector= new GestureDetector(
        child: Image.asset(
          shopItems[i].imageAddress,
          scale: 3.0,
          fit: BoxFit.cover,
        ),
        onTap: () => _addToCart(i)
    );
  }

  //Just increases the amount that's added to the cart
  void _addToCart(int index)
  {
    shopItems[index].amount += 1;
  }

  //Builds what the player sees when they check their cart of items
  List<Card> buildCheckout()
  {
    List<Card> checkoutItems = new List<Card>();
    for (int i = 0; i < shopItems.length; i++)
    {
      if (shopItems[i].amount>0)
      {checkoutItems.add(new Card(
        child:Row(children: <Widget>[
          Text(shopItems[i].theName), 
          Text(shopItems[i].amount.toString()),
          ]),
      ));
      }
    }

    return checkoutItems;
   }

  //The function that adds the cart items to the inventory
  void checkOut()
  {
    for (int i = 0; i < shopItems.length;i++)
    {
      shopItems[i].AddItem();
    }
  }

  //this is for when the player removes something from their checkout
   void removeItem(int i)
   {
      shopItems[i].amount=0;
   }
}
