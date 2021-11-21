# POSPAY 2.1.15

url link: https://play.google.com/store/apps/details?id=com.posindonesia.giropos&hl=en&gl=us

## Summary
layanan transaksi keuangan pos lainnya secara ‘mobile’
- keuangan
- pengelolaan layanan keuangan lewat giropos


## Permissions

1. Lokasi (android.permission.ACCESS_COARSE_LOCATION, android.permission.ACCESS_FINE_LOCATION)

   > aplikasi dapat melihat posisi handphone secara "LIVE"
  
2. Jaringan (android.permission.ACCESS_NETWORK_STATE, android.permission.INTERNET)

  > Aplikasi dapat mengakses internet

3. Contact (android.permission.READ_CONTACTS)

   > Aplikasi dapat membaca kontak telepon di handphone dan juga SMS

4. Process (android.permission.FOREGROUND_SERVICE)

   > Aplikasi dapat berjalan normal di foreground

5. external storage(android.permission.READ_EXTERNAL_STORAGE, android.permission.WRITE_EXTERNAL_STORAGE)

   > Aplikasi dapat membaca dan menulis di external storage (contoh: memory card)

6. Notification (com.google.android.c2dm.permission.RECEIVE, com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE)

    > aplikasi dapat mengirim pesan 

7. Vibrator (android.permission.VIBRATE, android.permission.WAKE_LOCK)

  > digunakan oleh aplikasi supaya handphone tidak mati dalam keadaan standby/lock dan juga dapat menggetarkan handphone

8. Audio Record (android.permission.RECORD_AUDIO)

  > aplikasi dapat merekam audio/ percakapan

9. `android.permission.USE_BIOMETRIC` `android.permission.USE_FINGERPRINT` 
  
  > aplikasi dapat membaca fingerprint buat mengunci aplikasi

10. Phone Access `android.permission.READ_PHONE_STATE`

  > aplikasi dapat membaca aktifitas telepon (kapan terakhir kali telepon, sedang dalam keadaan telepon atau tidak)

## Unique Behaviour

1. Aplikasi ini menggunakan permission yang tidak terlihat pada fitur aplikasi itu sendiri, salah satunya:
  - `android.permission.ACCESS_FINE_LOCATION` fitur mana yang membutuhkan lokasi akurat handphone user
  - `android.permission.RECORD_AUDIO` tidak menemukan fitur yang melakukan record audio
  - `android.permission.READ_CONTACTS` tidak menemukan fitur yang membutuhkan buka kontak
  - `android.permission.READ_PHONE_STATE` tidak menemukan fitur yang membutuhkan untuk mengetahui kapan terakhir kali telepon dan/atau sedang dalam keadaan telepon atau tidak
2. Pendaftaran tidak akan dilanjut (jelas dipaksa) kalau permission "BACA KONTAK" `android.permission.READ_CONTACTS` dan permission "BACA TELEPON" `android.permission.READ_PHONE_STATE` tidak di izinkan