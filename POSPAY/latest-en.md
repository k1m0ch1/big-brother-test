# POSPAY 2.1.15

url link: https://play.google.com/store/apps/details?id=com.posindonesia.giropos&hl=en&gl=us

## Summary
layanan transaksi keuangan pos lainnya secara ‘mobile’
- keuangan
- pengelolaan layanan keuangan lewat giropos


## Permissions

1. Location (android.permission.ACCESS_COARSE_LOCATION, android.permission.ACCESS_FINE_LOCATION)

   > tl;dr application can get the live current device location
  
2. Networking (android.permission.ACCESS_NETWORK_STATE, android.permission.INTERNET)

  > the application can connect to the internet

3. Contact (android.permission.READ_CONTACTS)

   > tl;dr real all of your contact on phone, may read all of your SMS too

4. Process (android.permission.FOREGROUND_SERVICE)

   > tl;dr the application show at the status bar notification

5. external storage(android.permission.READ_EXTERNAL_STORAGE, android.permission.WRITE_EXTERNAL_STORAGE)

   > used by the application to read and write external storage

6. Notification (com.google.android.c2dm.permission.RECEIVE, com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE)

7. Vibrator (android.permission.VIBRATE, android.permission.WAKE_LOCK)

  > used by the application to stay awake so your phone is not locked on

8. Audio Record (android.permission.RECORD_AUDIO)

  > used by the application to record the audio

9. `android.permission.USE_BIOMETRIC` `android.permission.USE_FINGERPRINT` 
  
  > this just simply using the fingerprint to lock or unlock

10. Phone Access `android.permission.READ_PHONE_STATE`

  > this application can read phone activity

## Unique Behaviour

1. This Application need specific permission while the application clearly didn't need it, example 
  - `android.permission.ACCESS_FINE_LOCATION` permission didn't used by any feature in application
  - `android.permission.RECORD_AUDIO` I didn't see any feature that need to record audio
  - `android.permission.READ_CONTACTS` which feature that you need to read contact ?, even transfer didn't need to open contact
  - `android.permission.READ_PHONE_STATE` which feature you need to read phone call or phone state ?
2. Registration will be stopped if the permission "READ CONTACT" and permission "READ PHONE STATE" is not allowed, clearly the application is forced to allow the permission