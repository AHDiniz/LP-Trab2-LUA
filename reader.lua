--[[
	Programming Languages - Assignment #2

	Alan Herculano Diniz

	Solving grouping problem with the leader algorithm

	reader.lua: creating file I/O routines
]]

--[[
	Reading the input files and returning the points and the limit distance

	Inputs: the input files locations

	Outputs: the array of points and the limit distance
]]
function read_files(pointsLoc, distLoc)

	pointsFile = io.open(pointsLoc, "r")
	assert(pointsFile ~= nil)
	distFile = io.open(distLoc, "r")
	assert(distFile ~= nil)

	-- Reading the distance file:
	io.input(distFile)
	dist = tonumber(io.read(), 10)
	io.close(distFile)

	-- Reading the points file:
	io.input(pointsFile)

	points = {}
	-- Iterating through the lines of the file:
	for line in io.lines() do

		-- Getting the coordinates of the point (in a string)
		words = {}
		for word in line:gmatch("%S+") do
			table.insert(words, word)
		end

		-- Creating the point and adding it to the points array:
		point = {}
		for i = 1,#words do
			table.insert(point, tonumber(words[i]))
		end
		table.insert(points, point)

	end
	io.close(pointsFile)

	return points, dist
end

function print_results(sse, groups)

	-- Opening the output files:
	result = io.open("result.txt", "w")
	assert(result ~= nil)
	exitFile = io.open("saida.txt", "w")
	assert(exitFile ~= nil)

	-- Printing the sse in the result.txt file:
	io.output(result)
	io.write(string.format("%.4f", sse))
	io.close(result)

	-- Printing the groups in the saida.txt file:
	io.output(exitFile)
	for i = 1,#groups do
		for j = 1,#groups[i] do
			io.write(string.format("%d ", groups[i][j]))
		end
		io.write("\n\n")
	end
	io.close(exitFile)
end
