import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/method.dart';

class MFeedBack extends StatefulWidget {
  MFeedBack({Key? key}) : super(key: key);

  @override
  State<MFeedBack> createState() => _MFeedBackState();
}

class _MFeedBackState extends State<MFeedBack> {
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.07,
        leading: IconButton(
          onPressed: () => {},
          icon: const Icon(
            Icons.anchor,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/xiao.svg",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.01,
              ),
              SvgPicture.asset(
                "assets/images/man.svg",
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ],
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.of(context).pop(),
            },
            icon: const Icon(
              Icons.anchor,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Text(
            "我们会认真思考你的建议(认真.jpg)",
            style: Theme.of(context).textTheme.headline3,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              maxLines: 5,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              onChanged: (value) {
                _inputValue = value;
              },
            ),
          ),
          ElevatedButton(
              onPressed: () => {
                    sendFeedBack(
                        "H:${MediaQuery.of(context).size.height.toString()} - W:${MediaQuery.of(context).size.width.toString()}",
                        _inputValue),
                  },
              child: const Text("提交"))
        ],
      ),
    );
  }
}
