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
			height: 270px;
			margin: 20px 0 30px;
		}
		nav > form {
			padding: 15px;
		}
		main {
			border: 3px solid #f8f9fa;
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
		.options {
			margin: 0 auto;
			overflow: auto
		}
		.options li {
			margin-top: 5px;
			float: left;
			margin: 15px;
			width: 255px;
			height: 60px;
		}
		.options li:nth-child(3n) {
			margin-right: 0;
		}
		.size-font span{
			margin-left: 15px;
		}
		.text-field {
			width: 70%;
		    height: 20px;
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
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
		.shape-options {
			display: inline-block;
		}
		.shape-options li {
			margin-right: 15px;
			cursor: pointer;
		}
		.shape-options > h5 {
			font-style: normal;
			display: inline-block;
		}
		.shape-options li:nth-child(1) {
			width: 30px;
			height: 20px;
			background: #007bff;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			border-radius: 10px;
		}
		.shape-options li:nth-child(2) {
			width: 30px;
			height: 20px;
			background: #007bff;
		}
		.shape-options li:nth-child(3) {
			width: 20px;
			height: 20px;
			background: #007bff;
			-moz-border-radius: 10px;
			-webkit-border-radius: 10px;
			border-radius: 10px;
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
				<ul class="options">
					<li>
						<h5>Text</h5>
						<input type="text" class="text-field" placeholder="Type message here ..." name="Message">
					</li>
					<li>
						<h5>Shape</h5>
						<ul class="shape-options">
							<li><input name="Shape" type="radio" id="oval" value="ROUNDRECT" /></li>
							<li><input name="Shape" type="radio" id="roundrect" value="RECT" /></li>
							<li><input name="Shape" type="radio" id="roundrect" value="OVAL" /></li>
						</ul>
					</li>
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
					<li>
						<h5>Size</h5>
						<div class="size-options">
							<label for="innerX">inner width</label>
							<input type="range" min="1" max="100" value="50" class="slider" id="innerX" name="Y">
							<br>
							<label for="innerY">inner height</label>
							<input type="range" min="1" max="100" value="50" class="slider" id="innerY" name="X">
						</div>
					</li>
					<li class="size-font">
						<h5>Font Size</h5>
						<input type="range" min="1" max="100" value="50" class="slider" id="innerY" name="FTSize">
						<span>20px</span>
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
				<input class="sbtn" type="submit" value="Submit My Design">
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
                        hahahhaa
                    </APPLET>				
			</div>
		</main>
	</div>
</body>
</html>