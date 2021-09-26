# PeduliLindungi v3.4.6

Because of the data leak eHac, the "feature" of the eHac is moved to this Application, so people will always be catius to install any application that include KTP, photo, name or phone for register requirement.

So here the [PeduliLindungi](https://play.google.com/store/apps/details?id=com.telkom.tracencare&hl=en&gl=US) mobile app, currently available for android and iphone.

I do check the apps and I'm not doing full analyze, because there is so many source that I need to analyze, probably this is enough, So here is what I found

and yeah I made a video about this on youtube https://www.youtube.com/watch?v=KExoyqgB1Bk

## !!Disclaimer!!

> What I do to get this information, is a public information, anyone can get it and this is a public information, I'm not use any hacking attempt or breach to get into the system to get the information, this is pure the public information that extracted from the internet without alter the application.

## TL;DR
1. [MobSF Dynamic Analysis](dynamic-analysis.pdf)
1. [MobSF Static Analysis](static-analysis.pdf)
1. [Source Code Decompiled 3.6.6](source-decompiled-3.6.6.zip)

## List of found
1. [Technology](#technology)
2. [Application Permissions](#permissions)
3. [Weird Traffic](#weird-traffic)
4. [HTTP Traffic Caputre Log](http-traffic-capture.txt)
5. [SQLite](#sqlite)
6. [CPU, Storage and RAM is stored on firebase](#stored-resources)
7. [Force close application on mock location](#exit-onmock-location)
8. [Locally saved location on your device](#location-sqlite)
9. [Some page will store your access token](#store-access-token)
10. [Some of the URL is visible at source code](#url-visible)
11. [some old feature is not deleted](#old-feature)

## Technology <a name="technology"></a>

Technology: `Kotlin`
(get from the Koin App on the source)

package ID : `com.telkom.tracencare`

All Version : https://apkcombo.com/pedulilindungi/com.telkom.tracencare/old-versions/

Third Parties:
1. google map
2. firebase
3. Safetynet (probably the security nodes)

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
13. `com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE` is used by Firebase to recognize where the app was installed from.

## CPU, Storage and RAM is stored on firebase <a name="stored-resources"></a>

This data will be recorded and stored at firebase peduli lindungi
```
NAME, LOGGED_WHEN, DEVICE_TYPE, CPU, STORAGE, RAM
```

the data will be sent to firebase (manually by application) when you are trying to ~~login,~~ register, verify login and verify register

why they need the CPU, Storage and RAM, what for ? 

Just try to decompile the application and search with keyword `CPU` within the directory of `com/telkom/tracencare`, you will get the result like this
<p align="left">
    <img height=30% width=30% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/3.4.4-log-CPU.png">
</p>
just click one of the result and it will get a same flow like this 

```yaml
initialize firebase -> get the data -> go to activity
```
<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/code-block-firebase-analytics.png">
</p>

if you go to this link https://firebase.google.com/docs/analytics/get-started?platform=android, it mean peduli lindungi application intentionally sent those data to firebase.

## Weird Traffic <a name="weird-traffic"></a>

when I did the Dynamic Analysis and get a long time to use all the function on the application, I capture the traffic and get this weird data transfer to `unknown`

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/weird-traffic.png">
</p>

so the data that contain "privacy" user is actually is sent to the `track.analytic.rocks`

a weird website that goes nowhere, here is log of the data [weird-data-capture.txt](weird-data-capture.txt)

I do a simple tracking to understand what is the `track.analytic.rocks`

1. check the domain response, nothing

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/cek-domain-track.png">
</p>

2. check the main domain `analytic.rocks`
<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/cek-domain-main.png">
</p>

3. google check

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/google-check-2.png">
</p>
<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/google-check-1.png">
</p>

4. nmap scanning

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/nmap.png">
</p>

5. location of the domain

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/sadf.png">
</p>

6. OSINT - theHarvester or you can see the result [here](osint-result.txt)

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/theHarvester-1.png">
</p>

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/theHarvester-2.png">
</p>

7. OSINT - shodan

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/track.analytic.rocks.png">
</p>

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/domain.png">
</p>

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/hostnya.png">
</p>

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/lol-wat.png">
</p>

8. Virustotal

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/virustotal.png">
</p>

<p align="center">
    <img height=50% width=50% src="https://raw.githubusercontent.com/k1m0ch1/big-brother-test/master/peduli-lindungi/img/virustotal-2.png">
</p>




## The apps store this files <a name="app-store-files"></a>

1. `/data/user/0/com.telkom.tracencare/files/generatefid.lock` 
2. `/data/user/0/com.telkom.tracencare/files/google_app_measurement.db`
3. `data/user/0/com.telkom.tracencare/databases/Rtf9Lv2ZmH7r ` store file SQLite

## SQLite <a name="sqlite"></a>

Table

`room_master_table`
- identity_hash

`Mkv8la9Kpa`
- uid
- PfRla7pqHv5

inside this table stored data like this

```
eyJhcHBOYW1lIjoiWkRObU9HRmtZVGd0WmpRMk1DMDBZelEzTFRoaFpHWXROek0wTmpJek1qVTRNakUyXG4iLCJldmVudCI6IlRHRjFibU5vSUZKbGMzVnRaUT09XG4iLCJkYXRlX3RpbWUiOiJNalV0VTJWd0xUSXdNakVnTURVNk1qUTZNakk2TnpBMFxuIiwiZGV2aWNlX2lkIjoiTkdSa00yWTNNemd0T1dWak9DMDBPRGsyTFRrMU0yTXRORGs0WTJGak1UQmlOR0ZoXG4iLCJ1c2VyX2lkIjoiTFE9PVxuIiwibGF1bmNoX3R5cGUiOiJSbWx5YzNRZ1RHRjFibU5vXG4iLCJkZXZpY2VfbmFtZSI6IlZXNXJibTkzYmp0SGIyOW5iR1VnVUdsNFpXdz1cbiIsInJhbSI6Ik15dzVOVElnVFVJPVxuIiwic3RvcmFnZSI6Ik1USXNOelUySUUxQ1xuIiwiY3B1IjoiZG1KdmVEZzJcbiIsImZ3IjoiT0M0d0xqQT1cbiIsImNvdW50cnkiOiJMUT09XG4iLCJjaXR5IjoiTFE9PVxuIiwibG9uZ2l0dWRlIjoiTFE9PVxuIiwibGF0aXR1ZGUiOiJMUT09XG4iLCJ0aW1lX3NwZW50IjoiTFE9PVxuIiwiYWN0aXZpdHlfMSI6IkxRPT1cbiIsImFjdGl2aXR5XzIiOiJMUT09XG4iLCJhY3Rpdml0eV8zIjoiTFE9PVxuIiwiY3VzdG9tMSI6IkxRPT1cbiIsImN1c3RvbTIiOiJMUT09XG4iLCJjdXN0b20zIjoiTFE9PVxuIiwiZW1haWwiOiJMUT09XG4iLCJuYW1lIjoiTFE9PVxuIiwicGhvbmUiOiJMUT09XG4iLCJnZW5kZXIiOiJMUT09XG4iLCJpcF9hZGRyZXNzIjoiTFE9PVxuIiwiY2FycmllciI6IlFXNWtjbTlwWkE9PVxuIiwibmV0d29ya190eXBlIjoiUVdseUlGQnNZVzVsSUUxdlpHVT1cbiIsInBsYXRmb3JtIjoiUVc1a2NtOXBaQT09XG4iLCJ2ZXJzaW9uIjoiTXk0MExqWT1cbiJ9
```
after decoded will become like this
```
{
    "appName": "ZDNmOGFkYTgtZjQ2MC00YzQ3LThhZGYtNzM0NjIzMjU4MjE2\n",
    "event": "TGF1bmNoIFJlc3VtZQ==\n",
    "date_time": "MjUtU2VwLTIwMjEgMDU6MjQ6MjI6NzA0\n",
    "device_id": "NGRkM2Y3MzgtOWVjOC00ODk2LTk1M2MtNDk4Y2FjMTBiNGFh\n",
    "user_id": "LQ==\n",
    "launch_type": "Rmlyc3QgTGF1bmNo\n",
    "device_name": "VW5rbm93bjtHb29nbGUgUGl4ZWw=\n",
    "ram": "Myw5NTIgTUI=\n",
    "storage": "MTIsNzU2IE1C\n",
    "cpu": "dmJveDg2\n",
    "fw": "OC4wLjA=\n",
    "country": "LQ==\n",
    "city": "LQ==\n",
    "longitude": "LQ==\n",
    "latitude": "LQ==\n",
    "time_spent": "LQ==\n",
    "activity_1": "LQ==\n",
    "activity_2": "LQ==\n",
    "activity_3": "LQ==\n",
    "custom1": "LQ==\n",
    "custom2": "LQ==\n",
    "custom3": "LQ==\n",
    "email": "LQ==\n",
    "name": "LQ==\n",
    "phone": "LQ==\n",
    "gender": "LQ==\n",
    "ip_address": "LQ==\n",
    "carrier": "QW5kcm9pZA==\n",
    "network_type": "QWlyIFBsYW5lIE1vZGU=\n",
    "platform": "QW5kcm9pZA==\n",
    "version": "My40LjY=\n"
}
```
when the value is decoded will be like this 

```
{
  "appName": "d3f8ada8-f460-4c47-8adf-734623258216\n",
  "event": "Launch Resume\n", 
  "date_time": "25-Sep-2021 05:24:22:704\n", 
  "device_id": "4dd3f738-9ec8-4896-953c-498cac10b4aa\n",
  "user_id": "-\n",
  "launch_type": "First Launch\n",
  "device_name": "Unknown;Google Pixel\n",
  "ram": "3,952 MB\n",
  "storage": "12,756 MB\n",
  "cpu": "vbox86\n",
  "fw": "8.0.0\n",
  "country": "-\n",
  "city": "-\n",
  "longitude": "-\n",
  "latitude": "-\n",
  "time_spent": "-\n",
  "activity_1": "-\n",
  "activity_2": "-\n",
  "activity_3": "-\n",
  "custom1": "-\n",
  "custom2": "-\n",
  "custom3": "-\n",
  "email": "-\n",
  "name": "-\n",
  "phone": "-\n",
  "gender": "-\n",
  "ip_address": "-\n",
  "carrier": "Android\n",
  "network_type": "Air Plane Mode\n",
  "platform": "Android\n",
  "version": "3.4.6\n"
}
```
berbeda dengan firebase crashlytic, ini di encode ke base64, dan valuenya di encode ke base64

kenapa nyimpen data activity kaya gini (?)

`room_table_modification_log`

`events`

`user_attributes`
- name
- set_timestamp
- value
- origin
- app_id
- rowid

`messages`
- rowid
- type
- entry


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


https://www.shodan.io/host/52.221.60.108
https://monitor.shodan.io/dashboard/PDDBCGB5KBFW5B6P
https://www.shodan.io/host/52.77.99.172/history
https://www.shodan.io/host/52.221.60.108/history
https://www.virustotal.com/gui/domain/track.analytic.rocks