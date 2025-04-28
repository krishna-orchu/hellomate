import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hellomate/domain/entities/user_entity.dart';

class UserModels extends UserEntity{
    UserModels({
        required super.firstName,
        required super.lastName
});
    factory UserModels.fromFirestore(
        DocumentSnapshot<Map<String, dynamic>> snapshot,
        SnapshotOptions? options,
        ) {
        final data = snapshot.data();
        return UserModels(
            firstName: data?['firstName'],
            lastName: data?['lastName']
            // regions:
            // data?['regions'] is Iterable ? List.from(data?['regions']) : null,
        );
    }

    Map<String, dynamic> toFirestore() {
        return {
            if (firstName != null) "firstName": firstName,
            if (lastName != null) "lastName": lastName
        };
    }
}