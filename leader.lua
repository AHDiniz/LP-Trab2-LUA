--[[
	Programming Languages - Assignment #2

	Alan Herculano Diniz

	Solving grouping problem with the leader algorithm

	leader.lua: implementing the leader algorithm and auxiliar functions
]]

--[[
	Calculating the groups and the sum of euclidian distances

	Inputs: the list of points given and the limit distance between the files

	Outputs: the sum of euclidian distances and the groups that were formed
]]
function calculate_results(limit, points)

	-- Creating the first group:
	groups = {{1}}

	-- Iterating through each point in the table:
	for i = 1,#points do

		leader = true

		for j = 1,#groups do

			-- Calculate point distance
			-- Check if goes in a group or if needs a new group

		end

	end

	-- Calculating the sum of euclidian distances:
	sse = 0
	return sse, groups

end
