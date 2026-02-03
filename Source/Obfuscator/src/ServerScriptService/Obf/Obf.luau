-- Property Of @TheDranxX
local g = game
local GS = function(x) return g:GetService(x) end
local RS = GS("ReplicatedStorage")
local SP = GS("StarterPlayer"):WaitForChild("StarterPlayerScripts")
local P = GS("Players")
math.randomseed(os.clock())
local function r(n)
	local c = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789)(-{ }|_+=~!@#$%^&*\\" -- be carefull for these combination guys
	local o = {}
	for i = 1, n do
		local j = math.random(#c)
		o[i] = c:sub(j, j)
	end
	return table.concat(o)
end
local M = {}
local PR = {
	PlayerModule = true,
	ControlModule = true,
	CommonUtils = true,
	RbxCharacterSounds = true,
	PlayerScriptsLoader = true
}
local IG = {
	Idk = true, -- Change this if your change the remote path reference
	Bakentot = true,
	Resolver = true,
	Repok = true
}
local function prot(x)
	if IG[x.Name] then return true end
	while x and x ~= SP do
		if PR[x.Name] then return true end
		x = x.Parent
	end
	return false
end
local function path(x)
	local t = {}
	while x and x ~= g do
		t[#t+1] = x.Name
		x = x.Parent
	end
	for i = 1, #t // 2 do
		t[i], t[#t-i+1] = t[#t-i+1], t[i]
	end
	return table.concat(t, ".")
end
local function isChar(x)
	return x:IsA("Model") and x.Parent == workspace and P:GetPlayerFromCharacter(x)
end
local function inChar(x)
	x = x.Parent
	while x and x ~= workspace do
		if isChar(x) then return true end
		x = x.Parent
	end
	return false
end
local function ok(x)
	return not (
		x:IsA("Player") or
			x.Parent == P or
			isChar(x) or
			inChar(x)
	)
end
local function obf(root, chk)
	for _, x in ipairs(root:GetDescendants()) do
		if not (IG[x.Name] or (chk and prot(x)) or not ok(x)) then
			local p0 = path(x)
			if pcall(function() x.Name = r(15) end) then -- this for length your object name
				M[p0] = path(x)
			end
		end
	end
end
obf(workspace, false)
obf(RS, false)
obf(SP, true)
local R = RS:WaitForChild("Repok")
R = R:FindFirstChild("Idk") or R
R = R:FindFirstChild("Bakentot") or R
R:WaitForChild("Resolver").OnServerInvoke = function(_, k)
	return M[k]
end

-- Property Of @TheDranxX
