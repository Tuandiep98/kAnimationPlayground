import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../elements/blur_container.dart';
import '../modules/settings/blocs/setting_bloc.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return BlurContainer(
          color: Colors.grey.shade200,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Theme.of(context).backgroundColor.withOpacity(0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go("/");
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Image.asset(
                        'assets/images/thumb.jpg',
                        width: 45,
                        height: 45,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'iLibrary',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                Row(
                  children: [
                    state is ThemeLoadedWithAccount
                        ? const SizedBox.shrink()
                        : InkWell(
                            onTap: () {
                              context
                                  .read<SettingBloc>()
                                  .add(GoogleSigninClicked());
                            },
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                color: state.themeData.colorScheme.secondary,
                                fontSize: 16,
                              ),
                            ),
                          ),
                    InkWell(
                      onTap: () async {
                        // await DialogUtils.showDialogWithChild(
                        //   context,
                        //   enableBlur: true,
                        //   child: SettingElement(),
                        //   padding: const EdgeInsets.all(12),
                        //   backgroundColor: Colors.transparent,
                        // );
                      },
                      child: Row(
                        children: [
                          state is ThemeLoadedWithAccount
                              ? Text(
                                  'Hi, ${state.currentUser.displayName}',
                                  style: TextStyle(
                                    color:
                                        state.themeData.colorScheme.secondary,
                                    fontSize: 18,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(width: 5),
                          state is ThemeLoadedWithAccount
                              ? CircleAvatar(
                                  radius: 20,
                                  child: Image.asset(
                                    'assets/images/girl_emoji_01.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                )
                              : Icon(
                                  Icons.menu_rounded,
                                  size: 25,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
