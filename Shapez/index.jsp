<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Shape Generator</title>
	<style>
		* {
			margin: 0;
			padding: 0;
			font-size: 16px;
			font-weight: normal;
		}
		body {
			font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
		    font-size: 16px;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #212529;
		    text-align: left;
		}
		h5 {
			margin-bottom: 5px;
			font-weight: bold;
		}
		ul, li {
			list-style: none;
		}
		.wrapper {
			width: 920px;
			margin: 0 auto;
		}
		nav {
			border: 3px solid #f8f9fa;
			height: 300px;
			margin: 20px 0;
			border-radius: .25rem;
		}
		nav > form {
			padding: 15px;
		}
		main {
			/*border: 3px solid #f8f9fa;*/
			/*border-radius: .25rem;*/
			height: 300px;
			text-align: center;
			padding-top: 50px;
		}
		.outer {
			margin: 0 auto;
			position: relative;
			width: 300px;
			height: 200px;
			background: #2f6f9f;
		}
		.options-shape, .options-text, .options-color {
			width: 27%;
			overflow: auto;
			float: left;
			background-color: rgba(0,0,0,.05);
			border-radius: 4px;
			padding: 15px;
		}
		.options-shape, .options-text {
			margin-right: 35px;
		}
		.options-shape li {
			float: left;
			width: 255px;
		}
		.options-shape li:nth-child(3n) {
			margin-right: 0;
		}
		.text-field {
			width: 90%;
		    height: 20px;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: transparent;
		    background-clip: padding-box;
		    border: none;
		    border-bottom: 1px solid #ced4da;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.inner {
			position: absolute;
			top: 50px;
			left: 100px;
			width: 100px;
			height: 100px;
			background: #fff;
			-moz-border-radius: 50px;
			-webkit-border-radius: 50px;
			border-radius: 50px;
			line-height: 100px;
		}
		.submit {
			width: 100%;
			float: left;
			margin-top: 20px;
		}
		.sbtn {
    		display: block;
		    margin: 0 auto;
			color: #fff;
		    background-color: #007bff;
		    border-color: #007bff;
		    font-weight: 400;
		    text-align: center;
		    white-space: nowrap;
		    vertical-align: middle;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    border: 1px solid transparent;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    border-radius: .25rem;
		    transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
		}
		.shapes {
			display: inline-block;
		}
		.shapes li {
			margin-right: 15px;
			cursor: pointer;
		}
		.shapes > h5 {
			font-style: normal;
			display: inline-block;
		}
		.shapes li:nth-child(1) {
			width: 30px;
			height: 20px;
			background: #007bff;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			border-radius: 10px;
		}
		.shapes li:nth-child(2) {
			width: 30px;
			height: 20px;
			background: #007bff;
		}
		.shapes li:nth-child(3) {
			width: 20px;
			height: 20px;
			background: #007bff;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			border-radius: 10px;
		}
		.shapes input {
			visibility: hidden;
		}
		.slider-hint {
			position: relative;
			top: -3px;
		}
		.slider-val {
			color: #2f6f9f;
		}
		.color-picker {
			width: 30px;
		    height: 35px;
		    border: none;
		}
		.inner {
			color: #4f9fcf;
		}
	</style>
</head>
<body>
<% 
            String leMessage = session.getAttribute("message") + "";
            String leColor = session.getAttribute("Color") + "";
            String leStyle = session.getAttribute("fontStyle") + "";
            String leFontSize = session.getAttribute("fontSize") + "";
            String leBGColor = session.getAttribute("BGColor") + "";
            String leX = session.getAttribute("shapeX") + "";
            String leY = session.getAttribute("shapeY") + "";
            String leShape = session.getAttribute("Shape") + "";
            
        %>
	<div class="wrapper">
		<nav>
			<form action="ShapeServ" method="POST" onsubmit="return validate(this)">
				<ul class="options-shape">
					
					<li>
						<h5>Shape</h5>
						<ul class="shapes">
							<li title="Round Rectangle"><input name="Shape" type="radio" id="oval" value="ROUNDRECT" /></li>
							<li title="Rectangle"><input name="Shape" type="radio" id="roundrect" value="RECT" /></li>
							<li title="Oval"><input name="Shape" type="radio" id="roundrect" value="OVAL" /></li>
						</ul>
					</li>
					<li>
						<h5>Size</h5>
						<div class="size-options">
							<div class="slider">
								<p for="innerX">Inner width: <span id="innerWValue" class="slider-val">20</span><span> px</span></p>
								<span class="slider-hint">0 px</span>
								<input id="innerWSlider" type="range" oninput="updateSliderValue(this)" onchange="updateSliderValue(this)" min="0" max="300" value="150" class="slider-bar" id="innerX" name="Y">
								<span class="slider-hint">300 px</span>
							</div>
							<div class="slider">
								<p for="innerY">Inner height: <span id="innerHValue" class="slider-val">20px</span><span> px</span></p>
								<span class="slider-hint">0 px</span>
								<input id="innerHSlider" type="range" oninput="updateSliderValue(this)" onchange="updateSliderValue(this)" min="0" max="150" value="100" class="slider-bar" id="innerY" name="X">
								<span class="slider-hint">150 px</span>
							</div>
						</div>
					</li>
					
				</ul>
				<ul class="options-text">
					<li>
						<h5>Text</h5>
						<input type="text" class="text-field" placeholder="Type message here ..." name="Message">
					</li>
					<li class="size-font">
						<div class="slider">
						<h5>Font Size: <span class="slider-val">20</span><span> px</span></h5>
							<span class="slider-hint">0 px</span>
							<input type="range" oninput="updateSliderValue(this)" onchange="updateSliderValue(this)" min="0" max="40" value="16" class="slider-bar" id="innerY" name="FTSize">
							<span class="slider-hint">40 px</span>
						</div>
					</li>
					<li>
						<h5>Font Style</h5>
						<select name="FTStyle">
						  <option value ="REGULAR">Regular</option>
						  <option value ="BOLD">Bold</option>
						  <option value="ITALIC">Italic</option>
						  <option value="BOLD ITALIC">Bold Italic</option>
						</select>
					</li>
				</ul>
				<ul class="options-color">
					<li>
						<h5>Foreground Color</h5>
						<select name="BGColor">
						  <option value ="red">Red</option>
						  <option value ="blue">Blue</option>
						  <option value="green">Green</option>
						  <option value="yellow">Yellow</option>
						</select>
					</li>
					<li>
						<h5>Background Color</h5>
						<select name="Color">
						  <option value ="red">Red</option>
						  <option value ="blue">Blue</option>
						  <option value="green">Green</option>
						  <option value="yellow">Yellow</option>
						</select>
					</li>
				</ul>
				<div class="submit">
					<input class="sbtn" type="submit" value="Submit My Design">
				</div>
			</form>
		</nav>
		<main class="output">
			<div class="outer">
				<div class="inner">Hello World</div>
				<APPLET code="ShowShape.java" height="300" width="150" align="bottom" >
                        <param name="Message" value="<%=leMessage %>">
                        <param name="Shape" value="<%=leShape %>">
                        <param name="Color" value="<%=leColor %>">
                        <param name="BGColor" value="<%=leBGColor %>">
                        <param name="X" value="<%=leX %>">
                        <param name="Y" value="<%=leY %>">
                        <param name="FTStyle" value="<%=leStyle %>">
                        <param name="FTSize" value="<%=leFontSize %>">
                    </APPLET>				
			</div>
		</main>
	</div>
	<script>
		var sliders = document.getElementsByClassName('slider-bar')
		// console.log(sliders[0].value)
		for (let i = 0; i < sliders.length; i++) {
			updateSliderValue(sliders[i])
		}

		function updateSliderValue(slider) {
			let sliderText = slider.parentElement.getElementsByClassName('slider-val')[0]
			sliderText.innerHTML = slider.value
		}
	</script>
</body>
</html>