# Track Analytic Telkom

Domain:
1. track.analytic.rocks
2. ~~static.analytic.rocks~~
3. code.analytic.rocks
(analytic.rocks is not a valid domain if you wondering)

52.221.55.48
52.77.99.172
52.220.229.117
52.221.60.108 

https://beta.shodan.io/host/52.221.60.108
https://beta.shodan.io/domain/analytic.rocks

code.analytic.rocks:149.129.218.105, 147.139.208.215
code.analytic.rocks:track.analytic.rocks
static.analytic.rocks:track.analytic.rocks
static.analytic.rocks:149.129.218.105, 147.139.208.215
static.analytic.rocks:147.139.208.215, 149.129.218.105
track.analytic.rocks:147.139.208.215, 149.129.218.105
track.analytic.rocks:52.77.99.172
track.analytic.rocks:52.221.55.48no ptr records found
track.analytic.rocks:52.221.55.48
track.analytic.rocks:149.129.218.105, 147.139.208.215

## ZoomEye Result
1. have more like 20 result, and mostly load using script like this

```html
<script src="https://track.analytic.rocks/load/" async></script>
```

this script will lead load this script https://static.analytic.rocks/js/events/collect.js 

and doing this

```js
_tar.send_data = function (data, type_encrypt){
	var temp_result = [];
	_tar.$.each(data ,function(key, value){
		if(typeof value.value !== undefined && value.value !== 0 && value.value !== ''){
			temp_result.push(value);
		}
	});
	var data_send = {};
	data_send.id_pub = _tar.ID;
	data_send.url = window.location.href;
	if(typeof type_encrypt === 'undefined' || type_encrypt === 'blowfish'){
		data_send.s_cd = 'b64';
		data_send.s_cr = 'bf';
		data_send.value = _tar_blowfish.encrypt(JSON.stringify(temp_result),  'blanja', {cipherMode: 0, outputType: 0});
	}else
	{
		data_send.s_cd = 'b64';
		data_send.value = window.btoa(JSON.stringify(temp_result),  'blanja', {cipherMode: 0, outputType: 0});
	}

	_tar.$.ajax({
		type: "POST",
		url: 'https://track.analytic.rocks/log_event/',
		data: data_send,
		xhrFields: { withCredentials: true },
		dataType: 'json',
		// success: function (call_back) {
			// console.log(call_back);
		// },
		// error: function (xHr, error) {
		// 	console.log(xHr);
		// 	console.log(error);
		// }
	});
}
```

it will sent data to https://track.analytic.rocks/log_event/

## Pemanfaatan Data
`appName` (mereka punya list aplikasi yang pakai tracker ini (?))
`event` (memungkinkan tracker mengetahui user sedang melakukan apa didalam aplikasi)
`device_id` (tau dari mana kalau ID tu adalah device tersebut atau sebenernya ini cuman ID di data ini)
`launch_type` (tracker tau kalau user sedang buka page posisi apa dan resume dari page mana)
`device_name` (memungkinkann tracker mengetahui device apa saja yang melakukan akses ke aplikasi, apa yang tidak cukup dari firebase analytic)
`ram` (memungkinkan tracker paham kalau device ini penggunaannya seefektif apa diaplikasi)
`storage` ()
`cpu` (tau pengguna aplikasi itu pakai CPU apa aja)
`fw` (android version)
`carrier` (selular)
`network_type` (jaringannya pake apa wifi/mobile/4g/3g)
`version` (sekarang si user pake versi paplikasi mana)

data data yang `-` artinya data ini belum jelas dapat di record dari mana ?

## update 30 september 2021
- yang awalnya disingapura sekarang udah dipindahin ke indonesia