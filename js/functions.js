
function emitterIconFromType(arg) {
	switch (arg) {
		case "animation": return "qrc:/emitters/animation.png"
		case "display": return "qrc:/emitters/display.png"
		case "image": return "qrc:/emitters/landscape.png"
		case "color": return "qrc:/emitters/color.png"
	}
}


function correctorTextFromType(arg) {
	switch (arg) {
		case "color_enhancer": return "Color enhancer"
		case "brightness": return "Brightness"
		case "red_channel": return "Red"
		case "green_channel": return "Green"
		case "blue_channel": return "Blue"
		case "flickr_effect": return "Flickr effect"

	}

	return arg;
}
