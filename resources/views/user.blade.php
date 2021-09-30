<!DOCTYPE html>
<html>
<head>
	<title>Laravel Lesson 2(user test)</title>
</head>
<body>
	<h1> Detail </h1>
	{{-- {{backend}} --}}
	<label> Name: <?= $name ?> </label><br>
	<label> Position: {{$position}}</label><br>
	<label> City: {!! $city !!}</label>
</body>
</html>