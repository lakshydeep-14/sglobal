import 'package:advanced_rich_text/advanced_rich_text.dart';
import 'package:contact/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileTile extends StatefulWidget {
  final UserProfileModel data;
  const UserProfileTile({super.key, required this.data});

  @override
  State<UserProfileTile> createState() => _UserProfileTileState();
}

class _UserProfileTileState extends State<UserProfileTile> {
  void call(String phone) async {
    Uri url = Uri(scheme: 'tel', path: phone);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Can't launch call";
    }
  }

  void mail(String email) async {
    Uri url = Uri(scheme: 'mailto', path: email);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw "Can't launch mail";
    }
  }

  void website(String host) async {
    Uri url = Uri.parse('https://$host');
    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.platformDefault,
      );
    } else {
      throw "Can't launch link";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ListTile(
        title: AdvanceRichText(
          initialText: widget.data.name ?? 'No name',
          secondaryTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          initialTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          textList: [
            TextSpanList(text: ' @'),
            TextSpanList(text: widget.data.username ?? '')
          ],
        ),
        subtitle:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Icon(
                Icons.home,
                size: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(widget.data.address!.street ?? ''),
            ],
          ),
          GestureDetector(
            onTap: () => mail(widget.data.email!.toLowerCase()),
            child: Row(
              children: [
                const Icon(
                  Icons.mail,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(widget.data.email?.toLowerCase() ?? ''),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => website(widget.data.website ?? 'google.com'),
            child: Row(
              children: [
                const Icon(
                  Icons.link,
                  size: 20,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.data.website ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.blue),
                ),
              ],
            ),
          )
        ]),
        trailing: GestureDetector(
          onTap: () => call(widget.data.phone!.contains('x')
              ? widget.data.phone!.split('x').first
              : widget.data.phone.toString()),
          child: widget.data.phone!.contains('x')
              ? Text(
                  widget.data.phone!.split('x').first,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                )
              : Text(
                  widget.data.phone ?? '',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
        ),
      ),
    );
  }
}
