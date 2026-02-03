local a = game:GetService("ReplicatedStorage")
local b = a:WaitForChild("Repok")
b = b:FindFirstChild("Idk") or b
b = b:FindFirstChild("Bakentot") or b
local c = b:WaitForChild("Resolver")
local d = {}
local e = {}

local function f(g)
	local h = {}
	local i = g
	while i and i ~= game do
		h[#h + 1] = i.Name
		i = i.Parent
	end
	local j = {}
	for k = #h, 1, -1 do
		j[#j + 1] = h[k]
	end
	return table.concat(j, ".")
end

local function l(m)
	local n = e[m]
	if n then
		return n
	end
	n = c:InvokeServer(m)
	e[m] = n
	return n
end

local function o(p)
	if not p then
		return nil
	end
	local q = {}
	for r in p:gmatch("[^.]+") do
		q[#q + 1] = r
	end
	local s = game
	for t = 1, #q do
		local u = s:FindFirstChild(q[t])
		if not u then
			u = s:WaitForChild(q[t], 5)
			if not u then
				return nil
			end
		end
		s = u
	end
	return s
end

local function v(w)
	local x = f(w)
	local y = l(x)
	local z = o(y)
	if not z then
		e[x] = nil
		y = l(x)
		z = o(y)
	end
	return z
end

local function A(B)
	local C = l(B)
	local D = o(C)
	if not D then
		e[B] = nil
		C = l(B)
		D = o(C)
	end
	return D
end

function d.get(E)
	local F = typeof(E)
	if F == "Instance" then
		return v(E)
	elseif F == "string" then
		return A(E)
	end
	return nil
end

return d
