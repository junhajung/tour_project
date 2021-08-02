	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
function initMap() {
	//Options to pass along to the marker clusterer
	const clusterOptions = {
	  imagePath: "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
	  gridSize: 30,
	  zoomOnClick: false,
	  maxZoom: 10,
	};
	
	// Add a marker clusterer to manage the markers.
	const markerClusterer = new MarkerClusterer(map, markers, clusterOptions);
	
	// Change styles after cluster is created
	const styles = markerClusterer.getStyles();
	for (let i=0; i<styles.length; i++) {
	  styles[i].textColor = "red";
	  styles[i].textSize = 18;
	}
}

</script>
 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUGYhhiNdmmRJtBb7EFj0VVQfpVoC356o&callback=initMap"> </script> 

</head>
<body>

</body>
</html>