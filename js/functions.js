
function emitterIconFromType(arg) {
	switch (arg) {
		case "animation": return "qrc:/animation.png"
		case "display": return "qrc:/desktop.png"
		case "image": return "qrc:/image.png"
		case "color": return "qrc:/color.png"
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
