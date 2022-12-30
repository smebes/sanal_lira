import 'package:flutter/material.dart';
import 'package:sanal_lira/core/constant.dart';

class ConfirmDialogView extends StatefulWidget {
  const ConfirmDialogView({
    Key? key,
    required this.description,
    required this.leftButtonText,
    required this.rightButtonText,
    required this.onAgreeTap,
    required this.onCancelTap,
  }) : super(key: key);

  final String description, leftButtonText, rightButtonText;
  final Function onAgreeTap;
  final Function onCancelTap;

  @override
  State<ConfirmDialogView> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<ConfirmDialogView> {
  @override
  Widget build(BuildContext context) {
    return NewDialog(widget: widget);
  }
}

class NewDialog extends StatelessWidget {
  const NewDialog({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ConfirmDialogView widget;

  @override
  Widget build(BuildContext context) {
    const Widget spacingWidget = SizedBox(width: 4.0);
    const Widget largeSpacingWidget = SizedBox(height: 20.0);
    final Widget headerWidget = Row(
      children: const <Widget>[
        spacingWidget,
        Icon(
          Icons.help_outline,
          color: Colors.white,
        ),
        spacingWidget,
        Text(
          'ONAYLA',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );

    final Widget messageWidget = Text(
      widget.description,
      style: Theme.of(context).textTheme.titleSmall,
    );
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
              height: 60.0,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                color: kPrimaryColor,
              ),
              child: headerWidget),
          largeSpacingWidget,
          Container(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: messageWidget,
          ),
          largeSpacingWidget,
          Divider(
            color: Theme.of(context).iconTheme.color,
            height: 0.4,
          ),
          Row(children: <Widget>[
            Expanded(
                child: MaterialButton(
              height: 50,
              minWidth: double.infinity,
              onPressed: () {
                widget.onCancelTap();
              },
              child: Text(widget.leftButtonText, style: Theme.of(context).textTheme.labelLarge),
            )),
            Container(height: 50, width: 0.4, color: Theme.of(context).iconTheme.color),
            Expanded(
                child: MaterialButton(
              height: 50,
              minWidth: double.infinity,
              onPressed: () {
                widget.onAgreeTap();
              },
              child: Text(
                widget.rightButtonText,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(color: kPrimaryColor),
              ),
            )),
          ])
        ],
      ),
    );
  }
}
