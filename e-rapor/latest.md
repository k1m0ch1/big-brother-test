# e-Rapor SMP v2.0

1. ini aplikasi dibuat siapa
   aplikasi ini dibuat oleh kemdikbud (ditsmp.kemdikbud.go.id/erapor)
2. ini aplikasi dipakai siapa
   dipakai oleh siswa
3. ini aplikasi dihost dimana
4. ada base installer, udah gitu baru update

behaviour
1. pada saat login, password di encrypt ke sha512
2. file installer dapat disini https://drive.google.com/drive/u/0/folders/1IRq-fVtyByMmdmhP7oXrASJu3ttCBhpr
3. e-rapor http://202.4.186.135:5739/ dan http://58.145.171.14:367/ sama, cuman beda versi aja
4. aplikasinya disimpen di root C:\
5. didalam file installernya ada script aplikasi, terutama php bisa dibaca, tapi file php nya di encrypt
6. setiap sekolah itu menggunakn e-rapor untuk input rapot siswa, banyak yg menggunakan karena datanya singkron dengan dapodik
7. gimana cara sync-nya ? auth ? non-auth ?
8. dapetin dapodik data https://github.com/eraporsmk/eraporsmk/blob/master/app/Console/Commands/AmbilData.php

https://dapo.kemdikbud.go.id/