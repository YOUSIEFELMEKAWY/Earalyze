import 'package:cached_network_image/cached_network_image.dart';
import 'package:earalyze/presentation/home/cubits/profile/profile_cubit.dart';
import 'package:earalyze/presentation/home/cubits/profile/profile_states.dart';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:earalyze/presentation/resources/icons_manager.dart';
import 'package:earalyze/presentation/resources/media_query_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/data_source/local/app_preferences.dart';
import '../../../data/services/firebase_services.dart';
import '../../../generated/l10n.dart';
import '../../common_widgets/custom_elevated_button.dart';
import '../../resources/routes_manager.dart';
import '../widgets/custom_container_profile.dart';
import '../widgets/settings_container.dart';

class ProfilePage extends StatelessWidget {
  final User user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  S.of(context).profile,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontSize: context.width * 0.08,
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.primaryDarkLight
                          : ColorManager.whiteLight),
                ),
              ),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipOval(
                child: CachedNetworkImage(
                  imageUrl: user.photoURL ??
                      'https://default-image-url.com/placeholder.png',
                  placeholder: (context, url) => CircularProgressIndicator(
                    color: AppPreferences.isDarkMode()
                        ? ColorManager.primaryLight
                        : ColorManager.primaryDarkMode,
                  ),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.person, size: 50),
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: GestureDetector(
                  onTap: () async {
                    final ImagePicker imagePicker = ImagePicker();
                    await imagePicker.pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.primaryLight
                          : ColorManager.primaryDarkMode,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppPreferences.isDarkMode()
                            ? ColorManager.whiteLight
                            : ColorManager.whiteDarkMode,
                        width: 2,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: AppPreferences.isDarkMode()
                          ? ColorManager.whiteLight
                          : ColorManager.whiteDarkMode,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            user.displayName!,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            user.email!,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w300,
                color: AppPreferences.isDarkMode()
                    ? ColorManager.blackLight
                    : ColorManager.blackDarkMode),
          ),
          SizedBox(
            height: context.height * 0.03,
          ),
          CustomContainerProfile(title: S.of(context).appSettings),
          SizedBox(
            height: context.height * 0.02,
          ),
          SettingsContainer(
            sName: S.of(context).language,
            option: AppPreferences.getLanguageCode() == 'en'
                ? S.of(context).english
                : S.of(context).arabic,
            onTap: () {
              context.read<ProfileCubit>().changeLanguage();
            },
            icon: Icons.language,
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          SettingsContainer(
            sName: S.of(context).theme,
            option: AppPreferences.isDarkMode()
                ? S.of(context).light
                : S.of(context).dark,
            onTap: () {
              context.read<ProfileCubit>().changeTheme();
            },
            icon: FontAwesomeIcons.lightbulb,
          ),
          CustomContainerProfile(title: S.of(context).security),
          SizedBox(
            height: context.height * 0.02,
          ),
          SettingsContainer(
            sName: '',
            option: S.of(context).changePassword,
            onTap: () {
              Get.toNamed(Routes.forgetPasswordRoute);
            },
            icon: FontAwesomeIcons.repeat,
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          SettingsContainer(
            sName: '',
            option: S.of(context).logout,
            onTap: () {
              FirebaseServices().logOut(context);
            },
            icon: IconsManager.logOut,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomElevatedButton(
                width: context.width * 0.2,
                onPressed: () {},
                name: S.of(context).editProfile,
                isLoading: false,
                fontSize: context.width * 0.04,
                buttonColor: AppPreferences.isDarkMode()
                    ? ColorManager.greenLight
                    : ColorManager.greenDarkMode,
              ),
              CustomElevatedButton(
                width: context.width * 0.2,
                onPressed: () {
                  FirebaseServices().deleteAccount(context, user);
                },
                name: S.of(context).deleteAccount,
                isLoading: false,
                fontSize: context.width * 0.04,
                buttonColor: AppPreferences.isDarkMode()
                    ? ColorManager.errorLight
                    : ColorManager.errorDarkMode,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
