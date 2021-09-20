# PeduliLindungi v3.4.4

Because of the data leak eHac, the "feature" of the eHac is moved to this Application, so people will always be catius to install any application that include KTP, photo, name or phone for register requirement.

So here the [PeduliLindungi](https://play.google.com/store/apps/details?id=com.telkom.tracencare&hl=en&gl=US) mobile app, currently available for android and iphone.

I do check the apps and I'm not doing full analyze, because there is so many source that I need to analyze, probably this is enough, So here is what I found

## !Disclaimer!!

> What I do to get this information, is a public information, anyone can get it and this is a public information, I'm not use any hacking attempt or breach to get into the system to get the information, this is pure the public information that extracted from the internet without alter the application, you can see my process of the extraction from my streaming video https://www.youtube.com/watch?v=I9Yb3QygoCw

## List of found
1. [Technology](#technology)
2. [Application Permissions](#permissions)
2. [CPU, Storage and RAM is stored on firebase](#stored-resources)
3. [Force close application on mock location](#exit-onmock-location)
4. [Locally saved location on your device](#location-sqlite)
5. [Some page will store your access token](#store-access-token)
6. [Some of the URL is visible at source code](#url-visible)
7. [some old feature is not deleted](#old-feature)

## Technology <a name="technology"></a>

Technology: `Kotlin`
(get from the Koin App on the source)

package ID : `com.telkom.tracencare`

All Version : https://apkcombo.com/pedulilindungi/com.telkom.tracencare/old-versions/

Third Parties:
1. SAFETYNET
2. google map
3. firebase
4. Safetynet (probably the security nodes)

## Application Permissions <a name="permissions"></a>

1. `android.permission.ACCESS_BACKGROUND_LOCATION`  access location while the apps in the background
2. `android.permission.ACCESS_FINE_LOCATION`  get the very accurate your location
3. `android.permission.ACCESS_MEDIA_LOCATION` explore the media such us photo and video (gallery)
4. `android.permission.ACCESS_NETWORK_STATE` which internet you used ? Mobile Phone internet or Wireless
5. `android.permission.CAMERA` Open the camera, found this on the take a picture to update your photo
6. `android.permission.FOREGROUND_SERVICE` on the notification bar you can see the application status
7. `android.permission.INTERNET` Internet acces (?)
8. `android.permission.READ_EXTERNAL_STORAGE` read external storage, probably for used to get the image
9. `android.permission.RECEIVE_BOOT_COMPLETED`  run the application when the device is booted
10. `android.permission.WAKE_LOCK` prevent the device from sleep or lock it self
11. `android.permission.WRITE_EXTERNAL_STORAGE` Allows an application to write to external storage.
12. `com.google.android.c2dm.permission.RECEIVE` Cloud to device messaging probably firebase
13. `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE` still don't get it what is this for

## CPU, Storage and RAM is stored on firebase <a name="stored-resources"></a>

This data will be recorded and stored at firebase peduli lindungi
```
NAME, LOGGED_WHEN, DEVICE_TYPE, CPU, STORAGE, RAM
```

the data will be sent to firebase when you are trying to login, register, verify login and verify register

why they need the CPU, Storage and RAM, what for ? 

## Force close application on mock location <a name="exit-onmock-location"></a>

there is some detection that the application will force close if you mock the location with the other tools

## ~~Locally saved location on your device~~ Removed in version 3.4.6+ <a name="location-sqlite"></a>

This data is stored into sqlite (a file that contain specific information into local device, usually hackers will do everything to get the legit information as many as possible)

## Some page will store your access token <a name="store-access-token"></a>

when you want to access the feature "List Faskses Vaksinasi Mandiri" you will redirected to page `https://www.pedulilindungi.id/faskes` and store `access_token` to the local storage, it meant your access token is stored locally on the browser `WebView`

## Some of the URL is visible at source code<a name="url-visible"></a>

when we check the decompiled application, its easy to see all the URL included the main feature of the application

## Old feature is not deleted <a name="old-feature"></a>

some of the old feature is still on the apps
