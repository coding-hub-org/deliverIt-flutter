# deliverit

An 'Uber Eats' like project but with scope extends to grocery items.

## Getting Started

#### 1. [Setup Flutter](https://flutter.io/setup/)

#### 2. Clone the repo

```sh
$ git clone https://github.com/PSUCoders/DeliverIt-Flutter.git
$ cd DeliverIt-Flutter/
```

#### 3. Setup the Firebase 

1. You'll need to create a new Firebase project. Follow the instructions at https://console.firebase.google.com.
2. Once your Firebase instance is created, you need to enable email authentication.

* Go to the Firebase Console for your new instance.
* Click "Authentication" in the left-hand menu.
* Click the "Sign-in method" tab.
* Click "Email/Password" and enable it.
* Click "Google" and enable it.

3. Create a Cloud Firestore Database
* Click "Database" in the left-hand menu.
* Click the Cloud Firestore "Create Database" button.
* Select "Start in test mode" and "Enable"

3. (skip if not running on Android)

* Create an app within your Firebase instance for Android, with package name com.yourcompany.news
* Run the following command to get your SHA-1 key:

```
keytool -exportcert -list -v \
-alias androiddebugkey -keystore ~/.android/debug.keystore
```


## Dependencies

* [Flutter](https://flutter.io/)
* [Firebase Auth](https://github.com/flutter/plugins/tree/master/packages/firebase_auth)
* [Firebase Database](https://github.com/flutter/plugins/tree/master/packages/firebase_database)
- [Firebase_Firestore](https://github.com/flutter/plugins/tree/master/packages/cloud_firestore)
* [Google_Maps_Flutter](https://github.com/flutter/plugins/tree/master/packages/google_maps_flutter)
* [Location](https://github.com/Lyokone/flutterlocation)
* [Permission_Handler](https://pub.dartlang.org/packages/permission_handler)
* [Flutter_Bloc](https://github.com/felangel/bloc/)
* [Flutter Shared Preferences](https://github.com/flutter/plugins/tree/master/packages/shared_preferences)
