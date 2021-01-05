import 'dart:convert';

RegisterationModel registerationModelFromMap(String str) => RegisterationModel.fromMap(json.decode(str));

String registerationModelToMap(RegisterationModel data) => json.encode(data.toMap());

class RegisterationModel {
    RegisterationModel({
        this.customerId,
        this.customerName,
        this.customerAddress,
        this.customerPhone,
        this.customerEmail,
        this.customerRegType,
        this.customerOwnedVehicle,
        this.customerPassword,
        this.customerOtp,
        this.customerStatus,
        this.customerVerified,
    });

    int customerId;
    String customerName;
    String customerAddress;
    String customerPhone;
    String customerEmail;
    dynamic customerRegType;
    dynamic customerOwnedVehicle;
    String customerPassword;
    int customerOtp;
    int customerStatus;
    int customerVerified;

    factory RegisterationModel.fromMap(Map<String, dynamic> json) => RegisterationModel(
        customerId: json["Customer_ID"],
        customerName: json["Customer_Name"],
        customerAddress: json["Customer_Address"],
        customerPhone: json["Customer_Phone"],
        customerEmail: json["Customer_email"],
        customerRegType: json["Customer_regType"],
        customerOwnedVehicle: json["Customer_OwnedVehicle"],
        customerPassword: json["Customer_Password"],
        customerOtp: json["Customer_OTP"],
        customerStatus: json["Customer_Status"],
        customerVerified: json["Customer_Verified"],
    );

    Map<String, dynamic> toMap() => {
        "Customer_ID": customerId,
        "Customer_Name": customerName,
        "Customer_Address": customerAddress,
        "Customer_Phone": customerPhone,
        "Customer_email": customerEmail,
        "Customer_regType": customerRegType,
        "Customer_OwnedVehicle": customerOwnedVehicle,
        "Customer_Password": customerPassword,
        "Customer_OTP": customerOtp,
        "Customer_Status": customerStatus,
        "Customer_Verified": customerVerified,
    };
}
