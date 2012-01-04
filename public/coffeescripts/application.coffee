#
# return a random int 0 <= f < n
#
rand = (n) ->
	Math.floor(Math.random() * n)

#
# return a random int min <= f < max
#
rand2 = (min, max) ->
	min + rand(max-min)

#
# place a new star on the canvas at a specific point
#
placeStar = (x,y) ->
	star = "<div class='star' style='left: #{x}px; top: #{y}px;'>&#127775;</div>"
	placedStar = $('body').append(star)
	# $('body .star:last-child').fadeOut('slow')

#
# generate a star at random coordinates and place it
#
placeRandStar = ->
	min_x = 0
	min_y = 0
	max_x = $('body').width() - 16
	max_y = $('body').height() - 16
	placeStar( rand2(min_x,max_x), rand2(min_y,max_y) )

starPlacer = ->
	placeRandStar() for n in [1..100]

sparkleLoop = ->
	allStars = $('.star')
	star = allStars[ rand2(0, allStars.size() - 1) ]
	$(star).fadeIn(1000)
	setTimeout ( ->
		$(star).fadeOut(1000)
	), 3000
	setTimeout( sparkleLoop, 200)

$ ->
	starPlacer()
	sparkleLoop()
