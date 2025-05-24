import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/ui/component/custom_image.dart';
import 'package:vehicle_rental_app/ui/view/home/data/response/vehicle_model.dart';
import 'package:vehicle_rental_app/ui/view/home/screen/car_details_screen.dart';
import 'package:vehicle_rental_app/util/styles.dart';

class CarView extends StatelessWidget {
  final VehicleModel vehicle;
  const CarView({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(CarDetailsScreen(vehicleModel: vehicle)),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.1))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Image
            Hero(
              tag: vehicle.hashCode ?? '0',
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: CustomImage(
                 imageUrl: vehicle.image ?? '',
                  height: 130,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 5),
      
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 // Name and Type
                 Text(
                   '${vehicle.name ?? ''} (${vehicle.type?.toUpperCase() ?? ''})',
                   style: poppinsSemiBold.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 16),
                 ),
                 const SizedBox(height: 5),
      
                 // Status with Color
                 Padding(
                   padding: const EdgeInsets.only(left: 8.0),
                   child: Row(
                     children: [
                       Text('Status: ', style: poppinsRegular.copyWith(fontSize: 14)),
                       Text(
                         vehicle.status ?? 'Unknown',
                         style: TextStyle(
                           color: _getStatusColor(vehicle.status),
                           fontWeight: FontWeight.w600,
                         ),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 8),
      
                 // Battery
                 Row(
                   children: [
                     const Icon(Icons.battery_charging_full, size: 20, color: Colors.orangeAccent,),
                     const SizedBox(width: 8),
                     Text('Battery: ${vehicle.battery ?? 0}%', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 12),),
                   ],
                 ),
                 const SizedBox(height: 8),
      
                 // Cost per Minute
                 Row(
                   children: [
                     const Icon(Icons.attach_money, size: 20),
                     const SizedBox(width: 8),
                     Text('Cost: \$${vehicle.costPerMinute?.toStringAsFixed(2) ?? '0.00'} / min', style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 12),),
                   ],
                 ),
                 const SizedBox(height: 8),
      
                 // Location
                 Row(
                   children: [
                     Icon(Icons.location_on, size: 20, color: Theme.of(context).primaryColor,),
                     const SizedBox(width: 8),
                     Text(
                         '${vehicle.location?.lat ?? 0}-${vehicle.location?.lng ?? 0}',
                         style: poppinsRegular.copyWith(color: Theme.of(context).colorScheme.textColor, fontSize: 12)
                     ),
                   ],
                 ),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case 'available':
        return Colors.green;
      case 'unavailable':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
