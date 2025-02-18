import 'package:moodtrack/Reusable_Code/IndividualBar.dart';

class BarData{
   final double sunAmount;
   final double monAmount;
   final double tueAmount;
   final double wedAmount;
   final double thuAmount;
   final double friAmount;

   BarData({
     required this.sunAmount,
     required this.friAmount,
     required this.monAmount,
     required this.thuAmount,
     required this.tueAmount,
     required this.wedAmount

});
   List<IndividualBar> barData=[];

   void initializeBarData(){
     barData=[

       IndividualBar(x: 1, y: sunAmount),
       IndividualBar(x: 2, y: monAmount),
       IndividualBar(x: 3, y: tueAmount),
       IndividualBar(x: 4, y: wedAmount),
       IndividualBar(x: 5, y: thuAmount),
       IndividualBar(x: 6, y: friAmount),



     ];

   }

}