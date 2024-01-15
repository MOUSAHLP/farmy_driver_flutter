import 'package:flutter/material.dart';
import 'package:pharmy_driver/translations.dart';
import '../resources/color_manager.dart';
import '../resources/font_app.dart';
import '../resources/style_app.dart';

class ActionAlertDialog extends StatelessWidget {
  final String message;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback onCancel;
  final VoidCallback? onConfirm;
  final Function? hideDialog;


  static Future<void> show(
    BuildContext context, {
    required String message,
    String? cancelText,
    String? confirmText,
    required VoidCallback onCancel,
     VoidCallback? onConfirm,
        Alignment? alignment,
        Function? hideDialog,
  }) {
    return showDialog(
      context: context,
      builder: (context) {
        if(hideDialog != null) hideDialog();
          return   Dialog(
          alignment: alignment,
          backgroundColor: ColorManager.primaryGreen,
          insetPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ActionAlertDialog(
            message: message,
            onCancel: onCancel,
            onConfirm: onConfirm,
            cancelText: cancelText,
            confirmText: confirmText ,
          ),
        );
      },
    );
  }

  const ActionAlertDialog({
    Key? key,
    required this.message,
    required this.onCancel,
    required this.onConfirm,
    required this.cancelText,
    required this.confirmText,
    this.hideDialog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 40),
            Text(
              message,
              textAlign: TextAlign.center,
              style: getRegularStyle(color: Colors.white,fontSize: FontSizeApp.s18),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const SizedBox(width: 10),
                if(cancelText != null)
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel,
                    child: Text(cancelText?? AppLocalizations.of(context)?.cancel??'',
                      style:getRegularStyle(color: Colors.white,fontSize: FontSizeApp.s16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                if(confirmText != null)
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(ColorManager.yellow) ),
                    onPressed: onConfirm,
                    child: Text(
                      confirmText!,
                      style: getRegularStyle(color: Colors.white,fontSize: FontSizeApp.s16),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
