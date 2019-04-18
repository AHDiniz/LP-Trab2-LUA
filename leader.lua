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

		-- Checking if the current point is a leader or not and treating it accordingly:
		for j = 1,#groups do
			if point_distance(points[groups[j][1]], points[i]) <= limit then
				if table_contains(groups[j], i) == false then
					table.insert(groups[j], i)
				end
				leader = false
				break
			end
		end

		-- Adding a new group if the point is a leader:
		if leader then
			group = {i}
			table.insert(groups, group)
		end
	end

	-- Calculating the sum of euclidian distances:
	sse = calculate_sse(points, groups)
	return sse, groups
end

--[[
	Checking if the table has the given element

	Inputs: the table and the element

	Output: boolean that tells if the element is in the table
]]
function table_contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

--[[
	Calculating the distance between two points

	Inputs: the points that will be used in the calculus

	Output: the distance between the points
]]
function point_distance(a, b)
	
	distance = 0

	for i = 1,#a do
		distance = distance + ((a[i] - b[i]) * (a[i] - b[i]))
	end

	return math.sqrt(distance)
end

--[[
	Calculating the center of mass of a given group

	Inputs: the points array and the group (that has the points indexes)

	Output: the center of mass of the given group
]]
function center_of_mass(points, group)

	center = {} -- The group's center of mass

	for i = 1,#points[1] do
		center[i] = 0
	end

	for i = 1,#group do

		point = points[group[i]] -- Getting the point of the group

		-- Calculating the center's coordinates:
		for j = 1,#point do
			center[j] = center[j] + point[j] / #group
		end
	end

	return center
end

--[[
	Calculating the sum of euclidian distances

	Inputs: the points array and the groups array
]]
function calculate_sse(points, groups)

	sse = 0

	for i = 1,#groups do
		center = center_of_mass(points, groups[i])
		for j = 1,#groups[i] do
			sse = sse + point_distance(points[groups[i][j]], center)
		end
	end

	return sse
end
