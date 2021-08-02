<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<script type = "text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Weather</title>
</head>
<body>
<script defer src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" integrity="sha384-vuFJ2JiSdUpXLKGK+tDteQZBqNlMwAjhZ3TvPaDfN9QmbPb7Q8qUpbSNapQev3YF" crossorigin="anonymous"></script>

<script type="text/javascript"> 

$(document).ready(function() {
	weatherCall();
});

function weatherCall(){
	var i = 0;
	setInterval(function(){
	var cities = new Array("보령시", "계룡시", "논산시", "태안군", "서산시", "홍성군", "당진시", "공주시", "천안시", "아산시", "서천군", "부여군", "예산군", "청양군")
	var lat = new Array(
			36.333532724460284, 36.274332974333625, 36.187306185743424,
		    36.74568974706024, 36.785012909923466, 36.60148305596341,
		    36.890083753676414, 36.44674542695392, 36.81531730621386,
		    36.78999343549447, 36.08057779565093, 36.27596016185989,
		    36.67997097613332, 36.459381533576966
	)
	var lon = new Array(
			126.61276495576878, 127.24882699809639, 127.09893321343725,
		    126.29799372509139, 126.45038437111988, 126.66089622693832,
		    126.6458419134505, 127.11905302693529, 127.11386148955481,
		    127.00260524940958, 126.69178356925701, 126.90987482878154,
		    126.84520414228234, 126.80232397111382
	)
	let weatherIcon = { 
			'01' : 'fas fa-sun', 
			'02' : 'fas fa-cloud-sun', 
			'03' : 'fas fa-clouds', 
			'04' : 'fas fa-cloud-meatball', 
			'09' : 'fas fa-cloud-sun-rain', 
			'10' : 'fas fa-cloud-showers-heavy', 
			'11' : 'fas fa-poo-storm', 
			'13' : 'far fa-snowflake', 
			'50' : 'fas fa-smog' 
			}; 
	$.ajax({ 
			url:'http://api.openweathermap.org/data/2.5/weather?lat='+ lat[i] + '&lon='+ lon[i] + '&APPID=86ea8d085876de603292c782699deb8f&units=metric', 
			dataType:'json', 
			type:'GET', 
			async: false,
			success:function(data){ 
				var $Icon = (data.weather[0].icon).substr(0,2); 
				var $Temp = Math.floor(data.main.temp) + 'º'; 
				var $city = cities[i]; 
				var $sky = data.weather[0].main;
				$('.CurrIcon').append('<i class="' + weatherIcon[$Icon] +'"></i>'); 
				$('.CurrTemp').prepend($Temp); 
				$('.City').append($city); 
				$('.Sky').append($sky);
				
				
				document.open();
				document.write('&nbsp;&nbsp;<i class="' + weatherIcon[$Icon] +'" style="color:#eb566c; width:100px;"></i>', '<br/>');
				document.write('&nbsp;&nbsp&nbsp;&nbsp<strong>'+ $Temp + '</strong>');
				document.write('<strong>'+ $city + '</strong>', '<br/>');
				
				// document.write($sky, '<br/><br/>');
				document.clear();
				if (i == 13){
					i = 0;
				}else{
					i++;
				}
			},
		});
	}, 3000)
}
	
</script>
</body>
</html>