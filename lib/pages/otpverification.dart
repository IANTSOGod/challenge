import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:challenge/pages/login.dart';

class Otpverification extends StatelessWidget {
  const Otpverification({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<ShadFormState>();
    final TextEditingController _otpcontroller = TextEditingController();

    return Scaffold(
      body: Center(
        child: ShadForm(
          key: formKey,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                ShadInputOTP(
                  maxLength: 6,
                  onChanged: (v) => {_otpcontroller.text = v},
                  children: [
                    ShadInputOTPGroup(
                      children: [
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                        ShadInputOTPSlot(keyboardType: TextInputType.number),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const ShadCard(
                  child: Text("Enter the code sent by email here"),
                ),
                const SizedBox(height: 50),
                ShadButton(
                  width: 350,
                  child: Text(
                    "Verify",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    final otp = _otpcontroller.text;
                    Fluttertoast.showToast(msg: otp);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
