import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.redAccent,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  const Text(
                    "PROFILE",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_on),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: ListView(
          children: [
            // Profile Image
            Center(
              child: Container(
                height: 150,
                width: 150,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(136, 0, 0, 0),
                      offset: Offset(1, 7),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.asset(
                    "assets/donar.png",
                    fit: BoxFit.cover,
                    height: 130,
                    width: 130,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              "FELIX GORDAN",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 0, 82, 0.75),
              ),
            ),
            const SizedBox(height: 30),
            // Settings & Preferences
            _buildSettingOption(
              icon: Icons.settings,
              title: "SETTINGS & PREFERENCES",
            ),
            _buildSettingOption(
              icon: Icons.notifications,
              title: "NOTIFICATIONS",
            ),
            _buildSettingOption(
              icon: Icons.gavel,
              title: "TERMS OF USE",
            ),
            _buildSettingOption(
              icon: Icons.privacy_tip,
              title: "PRIVACY POLICY",
            ),
            _buildSettingOption(
              icon: Icons.help,
              title: "HELP & FAQS",
            ),
            _buildSettingOption(
              icon: Icons.contact_page,
              title: "CONTACT US",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingOption({required IconData icon, required String title}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, size: 30, color: Colors.redAccent),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
