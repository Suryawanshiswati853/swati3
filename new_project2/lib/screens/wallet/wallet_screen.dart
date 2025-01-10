import 'package:flutter/material.dart';



class CardAndWalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
             backgroundColor: Colors.white,

leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
    onPressed: () {
    },
  ),
        title: const Text(
          'Card & Wallets',
          style: TextStyle(color: Colors.black,fontSize: 15,fontWeight:FontWeight.bold),
        ),

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                        Container(
          width: double.infinity, 
          child: Stack(
            children: [
              Image.asset(
                'assets/istock.jpg',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
                const SizedBox(width: 20),
      
              Positioned(
                top: 16,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'LifelineCart',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Purchase Power Card',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ],
                ),
              ),
            
               Positioned(
          top: 90, 
          left: 0,
          right: 0,
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              Icons.lock_outline, // Lock icon
              color: Colors.white,
              size: 40, // Icon size
            ),
          ),
        ),
      
            ],
          ),
        ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 12, color: Colors.black), 
    children: [
      TextSpan(
        text: 'Card Status: ',
        style: TextStyle(color: Colors.black), 
      ),
      TextSpan(
        text: 'Inactive',
        style: TextStyle(color: Colors.red), // Red color for 'Inactive'
      ),
    ],
  ),
),

                        
                        


                         
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ),
                Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                 ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 217, 217, 236),
    foregroundColor:Color (0xFF000080), 
    shape: RoundedRectangleBorder(
       side: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12), 
      
      
    ),
     minimumSize: const Size(100, 40),
    maximumSize: const Size(140, 50),
    elevation: 0,
  ),
  child: const Text('Guide'),
),]),
              const SizedBox(height: 16),
             
              // Activate Card Section
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
      
                      const Text(
                        'Activate your LifelineCard',
                        style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 14),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     
                        children: [
                         
                            
                          
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                              const Text(
                                '₹ 3499/- Life Time',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color (0xFF000080),
                                ),
                              ),
                              const Text(
                                '₹ 9999/Year',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                              ),
                              const Text(
                                'Offer Ends Soon!',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black,
                                ),
                              ),
                               const SizedBox(height: 10),
                                ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Color (0xFF000080),
    foregroundColor:Color (0xFFFFFFFF), 
  
    // Blue text color
    shape: RoundedRectangleBorder(
       side: BorderSide(color: Colors.grey, width: 1),
      borderRadius: BorderRadius.circular(12), 
          ),
     minimumSize: const Size(140, 40),
    maximumSize: const Size(150, 50),
    elevation: 0, 
  ),
  child: const Text('Activate Now'),
),
                            ],
                          ),
                          Row(
                            children: [

                            
                            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                 border: Border.all(
          color: Colors.grey, // Border color
          width: 0.1, // Border width
        ),
                
              ),
              child: Icon(
                Icons.check, // Check icon
                color: Color (0xFF000080),
                size: 24,
              ),
              
            ),
          
                             Image.asset(
              'assets/image.png', 
              height: 80,
              width: 80,
            ),])
                        
                        ],
                      ),
                      const Divider(
                        thickness: 0.1,
                        color: Colors.grey,
                      ),
                      const Text(
                        'Our Features',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Container(
                height: 40,
                width: 135,
                 padding: EdgeInsets.only(right: 5,left: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                   border: Border.all(
          color: Colors.grey, // Border color
          width: 0.1, // Border width
        ),
                ),
                child: Row(
                  children: [
                    Text(
                      'Udhar Limit :',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '₹ 74425',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
              

              SizedBox(width: 2), 

              Container(
                 height: 40,
                width: 135,
                padding: EdgeInsets.only(right: 5,left: 5),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(8.0),
                   border: Border.all(
          color: Colors.grey, // Border color
          width: 0.1, // Border width
        ),
                ),
                child: Row(
                  children: [
                    Text(
                      'CP EMI Limit:',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '₹ 74425',
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                  ],
                ),
              ),
                    ]),

                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          featureIcon(Icons.account_balance_wallet, 'Udhar'),
                          featureIcon(Icons.credit_card, 'CP EMI'),
                          featureIcon(Icons.business, 'Business Funds'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Wallet Section
              Padding(padding: EdgeInsets.only(right: 10,left: 10),
          child:     const Text(
                'Wallet',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),),
              const SizedBox(height: 8),
              walletCard(
                title: 'Lifeline Card Wallet',
                subtitle: 'Upcoming EMI/Udhar',
                titleAmount: '4356',
                trailingAmount: '4356',
                 dateRange: '',
                buttons: ['Withdraw','Transfer','More'],
                leadingWidget: Image.asset('assets/walletimg.jpeg'), 
              ),
              const SizedBox(height: 16),
              walletCard(
                title: 'Lifeline Coin',
                subtitle: 'Lifeline Magic Coin',
                titleAmount: '4356',
                trailingAmount: '600',
                trailingamountColor:Color (0xFF000080),
                dateRange: '11th Sep 2023 To 11 Oct 2023',
                subtitleColor:Color (0xFF000080), 
                 buttons: [ 'More'],
                 leadingWidget: Image.asset('assets/logo.png'), 
              ),
              const SizedBox(height: 16),
              walletCard(
                title: 'Cashback Coin',
                subtitle: 'Add Credit Coin',
                titleAmount: '4356',
                trailingAmount: '',
                dateRange: '11th Sep 2023 To 11 Oct 2023',
                buttons: ['More'],
                subtitleColor: Colors.red,
                leadingWidget: Image.asset('assets/cashback.jpeg'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget featureIcon(IconData icon, String label) {
  return Column(
    children: [
      Container(
        height: 50,
        width: 80,
        padding: const EdgeInsets.only(right: 15,left: 15),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 243, 242, 241), 
          border: Border.all(color: Colors.grey, width: 0.1),
          borderRadius: BorderRadius.circular(10), 
        ),
        child: Icon(icon, color: Colors.black, size: 25),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    ],
  );
}
  Widget walletCard({
    required String title,
    required String subtitle,
    required String titleAmount,
    required String trailingAmount,
    Color? trailingamountColor,
    required String dateRange,
    required List<String> buttons,
    Color? subtitleColor,
    required Widget leadingWidget,
  }) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.all(6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              ListTile(
            leading: CircleAvatar(
              child: leadingWidget, 
              radius: 25,
            ),
              
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),),
                  Text(
                    titleAmount,
                    style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subtitle,
                    style: TextStyle(color: subtitleColor,fontSize: 12),
                  ),
                  Text(
                    trailingAmount,
                    style:  TextStyle(color: trailingamountColor,fontSize: 12),
                  ),
                ],
              ),
              
            ),
           
            SizedBox(height: 4),
           
            if (dateRange.isNotEmpty)
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dateRange,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                     ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 217, 217, 236),
    foregroundColor:Color (0xFF000080), 
    shape: RoundedRectangleBorder(
       side: BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.circular(12), 
          ),
     minimumSize: const Size(100, 40),
    maximumSize: const Size(140, 50),
    elevation: 0, 
  ),
  child: const Text('More'),
),
                ],
              ),
            SizedBox(height: 8),
            // Button Row
            Padding(padding: EdgeInsets.only(right: 5,left: 5),
         child:    Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (buttons.contains('Withdraw') || buttons.contains('Transfer'))
                  Row(
                    children: [
                      if (buttons.contains('Withdraw'))
                        TextButton(
                          onPressed: () {
                          },
                          child: Text('Withdraw',style: TextStyle(color: Color (0xFF000080)),),
                        ),
                        
                      if (buttons.contains('Transfer'))
                        TextButton(
                          onPressed: () {
                          },
                          child: Text('Transfer',style: TextStyle(color: Color (0xFF000080)),),
                        ),
                         SizedBox(width: 10),
                        
                           ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 217, 217, 236),
    foregroundColor:Color (0xFF000080), 
    shape: RoundedRectangleBorder(
       side: BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.circular(12), 
      
      
    ),
     minimumSize: const Size(100, 40),
    maximumSize: const Size(140, 50),
    elevation: 0, 
  ),
  child: const Text('More'),
),
                    ],
                  ),
              
              ],
            ),
        )],
        ),
      ),
    );
  }
}



 
