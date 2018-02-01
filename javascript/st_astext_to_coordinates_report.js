//st_AsText den gelen vt verileri
var poly = "MULTIPOLYGON(((437969.495581771 4427293.19365414,437969.495581771 4426820.75454021,437913.914509544 4426042.61952902,437107.988962242 4424792.0454039,434912.536609248 4425403.4371984,437135.779498356 4427404.3557986,437969.495581771 4427293.19365414)),((441026.454554295 4424291.81575385,440859.711337612 4423513.68074266,438997.745417984 4422679.96465924,437997.286117885 4423513.68074266,438997.745417984 4425125.53183726,440804.130265384 4425403.4371984,441026.454554295 4424291.81575385)),((441026.454554295 4424291.81575385,440859.711337612 4423513.68074266,438997.745417984 4422679.96465924,437997.286117885 4423513.68074266,438997.745417984 4425125.53183726,440804.130265384 4425403.4371984,441026.454554295 4424291.81575385)),((441026.454554295 4424291.81575385,440859.711337612 4423513.68074266,438997.745417984 4422679.96465924,437997.286117885 4423513.68074266,438997.745417984 4425125.53183726,440804.130265384 4425403.4371984,441026.454554295 4424291.81575385)),((441026.454554295 4424291.81575385,440859.711337612 4423513.68074266,438997.745417984 4422679.96465924,437997.286117885 4423513.68074266,438997.745417984 4425125.53183726,440804.130265384 4425403.4371984,441026.454554295 4424291.81575385))";

var static_que = 1;

var polyCount = 1;

if (polyCount > 1) {
	//Eğer Multi polygon ise split edilecek yöntem
var polygons_raw = poly.split('MULTIPOLYGON(')[1].split(')),((');
var polygons_corrected = [];
//polygonCounter
var counter = 1;

polygons_raw.forEach(function (thepolygon){
	if(thepolygon.includes("((")){
		//do the first split
		polygons_corrected.push([counter,thepolygon.split("((")[1]]);
	} else if (thepolygon.includes("))")){
		//do the second split
		polygons_corrected.push([counter,thepolygon.split("))")[0]]);
	} else {
		//do normal stuff
		polygons_corrected.push([counter,thepolygon]);
	}
	counter++;
});



polygons_corrected.forEach(function (thepolygon){
	var semi_static_que = 1;
	var polygon_number = thepolygon[0];
	var coords = thepolygon[1].split(',');

	coords.forEach(function(thexy) {
		var pid = "p"+static_que;
		var sid = "s"+static_que;
		var yid = "y"+static_que;
		var xid = "x"+static_que;

		document.getElementById(pid).innerHTML = polygon_number;
		document.getElementById(sid).innerHTML = semi_static_que;
		document.getElementById(yid).innerHTML = Math.round(parseFloat(thexy.split(' ')[0]));
		document.getElementById(xid).innerHTML = Math.round(parseFloat(thexy.split(' ')[1]));
		static_que++;
		semi_static_que++;
	});
});
}

else{

	polygons_raw = poly.split('POLYGON((')[1].split('))')[0]
	var polygons_corrected = [];
	polygons_corrected.push([1,polygons_raw]);

	polygons_corrected.forEach(function (thepolygon){
	var semi_static_que = 1;
	var polygon_number = thepolygon[0];
	var coords = thepolygon[1].split(',');

	coords.forEach(function(thexy) {
		var pid = "p"+static_que;
		var sid = "s"+static_que;
		var yid = "y"+static_que;
		var xid = "x"+static_que;

		document.getElementById(pid).innerHTML = polygon_number;
		document.getElementById(sid).innerHTML = semi_static_que;
		document.getElementById(yid).innerHTML = Math.round(parseFloat(thexy.split(' ')[0]));
		document.getElementById(xid).innerHTML = Math.round(parseFloat(thexy.split(' ')[1]));
		static_que++;
		semi_static_que++;
	});
});
}

