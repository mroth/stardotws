placeStar = (x,y) ->
	star = "<div class='star' style='left: #{x}px; top: #{y}px;'>&#127775;</div>"
	placedStar = $('body').append(star)
	$('body .star:last-child').fadeOut('slow')

# return a random int 0 <= f < n
rand = (n) ->
	Math.floor(Math.random() * n)

# return a random int min <= f < max
rand2 = (min, max) ->
	min + rand(max-min)

randStar = ->
	min_x = 0
	min_y = 0
	max_x = $('body').width()
	max_y = $('body').height()
	placeStar( rand2(min_x,max_x), rand2(min_y,max_y) )

starPlacer = ->
	randStar()
	setTimeout( starPlacer, 200)

$ ->
	starPlacer()
