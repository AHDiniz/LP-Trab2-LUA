--[[
	Programming Languages - Assignment #2

	Alan Herculano Diniz


	Solving grouping problem with the leader algorithm

	main.lua: program's entry point
]]

require("leader")
require("reader")

pointsFile = "entrada.txt"
distFile = "distancia.txt"

if arg[1] ~= nil and arg[2] ~= nil then
	pointsFile = arg[1]
	distFile = arg[2]
end

points, limit = read_files(pointsFile, distFile)

sse, groups = calculate_results(limit, points)
print_results(sse, groups)
