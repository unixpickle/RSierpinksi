class Rect
	attr :width
	attr :height
	attr :x
	attr :y
	def initialize(x, y, w, h)
		@width = w
		@height = h
		@x = x
		@y = y
	end
end

def drawTriangle(rect, remaining, &proc)
	x, y, w, h = rect.x, rect.y, rect.width, rect.height
	if remaining == 0
		yield 'fill', Rect.new(x, y, w, h)
	else
		rect1 = Rect.new(x + w / 4.0, y, w / 2.0, h / 2.0)
		rect2 = Rect.new(x, y + h / 2.0, w / 2.0, h / 2.0)
		rect3 = Rect.new(x + w / 2.0, y + h / 2.0, w / 2.0, h / 2.0)
		proc.call 'stroke', rect1
		proc.call 'stroke', rect2
		proc.call 'stroke', rect3
		drawTriangle(rect1, remaining - 1, &proc)
		drawTriangle(rect2, remaining - 1, &proc)
		drawTriangle(rect3, remaining - 1, &proc)
	end
end
