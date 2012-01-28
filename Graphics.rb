require 'tk'
require './Triangle'

def drawSierpinski(canvas)
	width, height = canvas.width, canvas.height
	drawTriangle(Rect.new(3, 3, width, height), 4) { |fillStyle, rect|
		coords = [rect.x + rect.width / 2.0, rect.y,
				  rect.x, rect.y + rect.height,
				  rect.x + rect.width, rect.y + rect.height]
		fillColor = (fillStyle == 'fill' ? 'green' : 'white')
		TkcPolygon.new(canvas, coords) {
			fill fillColor
			outline 'black'
			disabledoutline ''
			width 1
			state 'normal'
		}
	}
end

root = TkRoot.new {
	title "triangle"
}

canvas = TkCanvas.new(root)
canvas.pack

root.bind('Configure', "%w %h") { |w, h|
	break if w == 1
	if !$winPadding
		$winPadding = w - canvas.width
	end
	canvas.delete 'all'
	canvas.configure('width'=>w - $winPadding, 'height'=>h - $winPadding)
	drawSierpinski(canvas)
}

Tk.mainloop
