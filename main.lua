-- Learning Lua

local media = function (vector)
	media = 0
	for i = 1,#vector do
		media = media + vector[i] / #vector
	end
	return media
end

print(media({1, 2, 3, 4, 5, 6, 7}))

