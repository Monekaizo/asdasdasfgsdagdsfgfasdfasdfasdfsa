local Framework, Connections, Funcs = {}, {}, {}
local Banned = {}
local BuildParent = workspace.Terrain
local Prefix = "-"
local LockBuildingParts = true
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
function Framework.Notify(title,text)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = title;
		Text = text
	})
end
if _G.Loaded == true then
	Framework.Notify("Error", "Already loaded.")
	return
end
Framework.Notify("Loaded.","Press ] to open the Command Bar.")
_G.Loaded = true

function checkregion(point,range)
	range = Vector3.new(range,range,range)
	return workspace:FindPartsInRegion3(Region3.new(point-Vector3.new(2,2,2)*range/2,point+Vector3.new(2,2,2)*range/2))
end


local memrframework = Instance.new("ScreenGui") memrframework.Enabled = false
local m = Instance.new("Frame")
local input = Instance.new("TextBox")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local title = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
local status = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
local UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
local sug = Instance.new("TextLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")

memrframework.Name = "memr framework"
memrframework.Parent = game:GetService("CoreGui")
memrframework.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

m.Name = "m"
m.Parent = memrframework
m.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
m.BackgroundTransparency = 0.200
m.BorderSizePixel = 0
m.Position = UDim2.new(0, 0, 0.748358846, 0)
m.Size = UDim2.new(0.232031256, 0, 0.251641124, 0)

input.Name = "input"
input.Parent = m
input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
input.BackgroundTransparency = 0.500
input.Position = UDim2.new(0.161616161, 0, 0.278260857, 0)
input.Size = UDim2.new(0.6734007, 0, 0.434782594, 0)
input.Font = Enum.Font.SourceSans
input.PlaceholderText = "command here, cmds for commands"
input.Text = ""
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.TextScaled = true
input.TextSize = 14.000
input.TextWrapped = true

UITextSizeConstraint.Parent = input
UITextSizeConstraint.MaxTextSize = 14

UIAspectRatioConstraint.Parent = input
UIAspectRatioConstraint.AspectRatio = 4.000

title.Name = "title"
title.Parent = m
title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1.000
title.Position = UDim2.new(0.161616161, 0, 0, 0)
title.Size = UDim2.new(0.6734007, 0, 0.156521738, 0)
title.Font = Enum.Font.Gotham
title.Text = "memr"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.TextSize = 14.000
title.TextWrapped = true

UITextSizeConstraint_2.Parent = title
UITextSizeConstraint_2.MaxTextSize = 14

UIAspectRatioConstraint_2.Parent = title
UIAspectRatioConstraint_2.AspectRatio = 11.111

status.Name = "status"
status.Parent = m
status.BackgroundColor3 = Color3.fromRGB(116, 116, 116)
status.BackgroundTransparency = 1.000
status.Position = UDim2.new(0.161616161, 0, 0.79130435, 0)
status.Size = UDim2.new(0.6734007, 0, 0.156521738, 0)
status.Font = Enum.Font.Gotham
status.Text = "status: not attached"
status.TextColor3 = Color3.fromRGB(126, 126, 126)
status.TextScaled = true
status.TextSize = 14.000
status.TextWrapped = true

UITextSizeConstraint_3.Parent = status
UITextSizeConstraint_3.MaxTextSize = 14

UIAspectRatioConstraint_3.Parent = status
UIAspectRatioConstraint_3.AspectRatio = 11.111

UIAspectRatioConstraint_4.Parent = m
UIAspectRatioConstraint_4.AspectRatio = 2.583

sug.Parent = m
sug.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
sug.BackgroundTransparency = 0.200
sug.BorderSizePixel = 0
sug.Position = UDim2.new(0, 0, -0.1652174, 0)
sug.Size = UDim2.new(1, 0, 0.1652174, 0)
sug.Font = Enum.Font.Roboto
sug.Text = ""
sug.TextColor3 = Color3.fromRGB(255, 255, 255)
sug.TextScaled = true
sug.TextSize = 14.000
sug.TextWrapped = true

UITextSizeConstraint_4.Parent = sug
UITextSizeConstraint_4.MaxTextSize = 14

UIAspectRatioConstraint_5.Parent = sug
UIAspectRatioConstraint_5.AspectRatio = 15.632
Player:GetMouse().KeyDown:Connect(function(k)
	if k == "]" then
		if memrframework.Enabled == true then
			memrframework.Enabled = false
		else
			memrframework.Enabled = true
		end
	end
end)
function Framework.Submatch(a, b)
	return a:sub(1, b:len()):lower() == b:lower()
end
function Framework.BToolsApi(Arguements)
	local BTools = (Player.Backpack:FindFirstChild("Building Tools") or Player.Character:FindFirstChild("Building Tools")) or (Player.Backpack:FindFirstChild("F3X") or Player.Character:FindFirstChild("F3X"))
	if BTools then
		status.Text = "status: attached"
		return BTools:FindFirstChildWhichIsA("BindableFunction"):FindFirstChildWhichIsA("RemoteFunction"):InvokeServer(table.unpack(Arguements))

	else
		status.Text = "status: unattached"
		return
	end
end
function Framework.Lock(basepart, status)
	local args = {
		"SetLocked",
		{basepart},
		status
	}
	Framework.BToolsApi(args)
end
function Framework.SetParent(basepart, parent)
	local args = {
		"SetParent",
		{basepart},
		status
	}
	Framework.BToolsApi(args)
end
function Framework.BuildModel(AssetId, Position, Parent)
	local Asset = game:GetObjects("rbxassetid://"..AssetId)[1] Asset.Parent = BuildParent
	local m = 0
	if Asset:IsA("Model") then
		m = Asset:GetExtentsSize().Y/2
	elseif Asset:IsA("BasePart") then
		m = Asset.Size.Y/2
	end
	Asset:PivotTo(Position*CFrame.new(0,m,0))
	local finished = {}
	local y = 0
	local num = #Asset:GetDescendants()
	pcall(function()
		for i,v in ipairs(Asset:GetDescendants()) do
			y = i
			if v:IsA("BasePart") then
				task.spawn(function()
					local mesh = v:FindFirstChildWhichIsA("SpecialMesh")
					if i == num then
						task.wait()
						Asset:Destroy()
					end
					v.Transparency = .2
					task.defer(function()
						v.Parent = workspace
						v.Anchored = true
					end)
					local caller = "Normal"
					if v:IsA("WedgePart") then
						caller = "Wedge"
					elseif v:IsA("TrussPart") then
						caller = "Truss"
					elseif v:IsA("CornerWedgePart") then
						caller = "Corner"
					elseif v:IsA("Seat") or v:IsA("VehicleSeat") then
						caller = "Seat"

					end
					local crea = {

						[1] = "CreatePart",
						[2] = caller,
						[3] = v.CFrame,
						[4] = Parent or BuildParent
					}
					local ins = Framework.BToolsApi(crea)
					repeat task.wait() until ins
					table.insert(finished, ins)
					Framework.Lock(ins, true)
					local mat = {
						[1] = "SyncMaterial",
						[2] = {
							[1] = {
								["Part"] = ins,
								["Material"] = v.Material
							}
						}
					}
					Framework.BToolsApi(mat)

					local col = {
						[1] = "SyncColor",
						[2] = {
							[1] = {
								["Part"] = ins,
								["Color"] = v.Color,
								["UnionColoring"] = true
							}
						}
					}
					Framework.	BToolsApi(col)
					local Size = {
						[1] = "SyncResize",
						[2] = {
							[1] = {
								["Part"] = ins,
								["CFrame"] = v.CFrame,
								["Size"] = v.Size
							}
						}
					}

					Framework.BToolsApi(Size)
					if mesh then
						local m = {
							[1] = "CreateMeshes",
							[2] = {
								[1] = {
									["Part"] = ins
								}
							}
						}
						local imesh = Framework.BToolsApi(m) 
						repeat task.wait() until imesh
						local sy = {
							[1] = "SyncMesh",
							[2] = {
								[1] = {
									["MeshType"] = mesh.MeshType,
									["Part"] = ins,
									["Scale"] = mesh.Scale,
									["VertexColor"] = mesh.VertexColor,
									["MeshId"] = mesh.MeshId,
									["TextureId"] = mesh.TextureId
								}
							}
						}
						Framework.BToolsApi(sy)
					end
					task.delay(.2,function()
						v:Destroy()
					end)
				end)
			end
		end
	end)
	repeat task.wait() until y == num and #finished ~= 0
	Asset:Destroy()
	return finished
end
function Framework.Destroy(I)
	local args = {
		[1] = "Remove",
		[2] = {
			[1] = I
		}
	}
	Framework.BToolsApi(args)
end
function Framework.Subfind(a, b)
	local ret = nil
	for i,v in ipairs(a:GetChildren()) do
		if Framework.Submatch(v.Name, b) then
			ret = v
			break
		end
	end
	return ret
end
function Framework.ExperimentalCFrame(Char, CF)
	local args = {
		[1] = "SyncMove",
		[2] = {
			[1] = {
				["Pivot"] = CFrame.new(),
				["Model"] = Char
			}
		}
	}
	local dest = CF
	for i,v in ipairs(Char:GetDescendants()) do
		if v:IsA("BasePart") then
			local sav = Char:GetPivot()
			Char:PivotTo(CFrame.new())
			local argz = {
				["Part"] = v,
				["CFrame"] = dest*v.CFrame
			}
			table.insert(args[2], argz)
			Char:PivotTo(sav)

		end
	end
	Framework.BToolsApi(args)
end
if game.PlaceId == 391104146 then
	Players.PlayerAdded:Connect(function(p)
		if table.find(Banned, p.UserId) then
			Framework.Destroy(p)
		end
	end)
	function Funcs.kick(Target)
		local function InteralKick(target)
			Framework.Destroy(target)
		end
		if Target == "all" then
			for i,v in ipairs(Players:GetPlayers()) do
				InteralKick(v)
			end
		elseif Target == "me" then
			InteralKick(Player)

		elseif Target == "others" then
			for i,v in ipairs(Players:GetPlayers()) do
				if v ~= Player then
					InteralKick(v)
				end
			end
		else
			for i,v in ipairs(Players:GetPlayers()) do
				if Framework.Submatch(v.Name, Target) then
					InteralKick(v)
				end
			end
		end
	end
	function Funcs.ban(Target)
		local function InteralKick(target)
			table.insert(Banned, target.UserId)
			Framework.Destroy(target)
		end
		if Target == "all" then
			for i,v in ipairs(Players:GetPlayers()) do
				InteralKick(v)
			end
		elseif Target == "me" then
			InteralKick(Player)

		elseif Target == "others" then
			for i,v in ipairs(Players:GetPlayers()) do
				if v ~= Player then
					InteralKick(v)
				end
			end
		else
			for i,v in ipairs(Players:GetPlayers()) do
				if Framework.Submatch(v.Name, Target) then
					InteralKick(v)
				end
			end
		end
	end
	function Funcs.unban()
		Banned = {}
	end
end
function Funcs.crucify(Target)
	pcall(function()
		local function internalcrucify(target)
			task.spawn(function()
				local crucifix = Framework.BuildModel("10625450829",target.Character.HumanoidRootPart.CFrame*CFrame.new(0,-3,0))
				repeat task.wait() until crucifix
				crucifix = crucifix[1]
				local args = {
					[1] = "SyncAnchor",
					[2] = {
						[1] = {
							["Part"] = target.Character.HumanoidRootPart,
							["Anchored"] = true
						}
					}
				}
				Framework.BToolsApi(args)
				Framework.ExperimentalCFrame(target.Character, crucifix.CFrame*CFrame.new(0,3,-.9))

			end)
		end
		if Target == "all" then
			for i,v in ipairs(Players:GetPlayers()) do
				internalcrucify(v)
			end
		elseif Target == "me" then
			internalcrucify(Player)
		elseif Target == "others" then
			for i,v in ipairs(Players:GetPlayers()) do
				if v ~= Player then
					internalcrucify(v)
				end
			end
		else
			for i,v in ipairs(Players:GetPlayers()) do
				if Framework.Submatch(v.Name, Target) then
					internalcrucify(v)
				end
			end
		end
	end)
end

function Funcs.god(Target)
	local function internalgod(target)
		for i,v in ipairs(target.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				Framework.Lock(v, true)
			end
		end
		Framework.Notify("Notification.","Godded, "..target.Name)
	end
	if Target == "all" then
		for i,v in ipairs(Players:GetPlayers()) do
			internalgod(v)
		end
	elseif Target == "me" then
		internalgod(Player)
	elseif Target == "others" then
		for i,v in ipairs(Players:GetPlayers()) do
			if v ~= Player then
				internalgod(v)
			end
		end
	else
		for i,v in ipairs(Players:GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				internalgod(v)
			end
		end
	end
end
function Funcs.bring(Target)
	local function InternalBring(target)
		Framework.ExperimentalCFrame(target.Character, workspace.CurrentCamera.Focus*CFrame.new(5,math.random(-5,5),0))
	end

	if Target == "all" then
		for i,v in ipairs(Players:GetPlayers()) do
			InternalBring(v)
		end
	elseif Target == "me" then
		InternalBring(Player)

	elseif Target == "others" then
		for i,v in ipairs(Players:GetPlayers()) do
			if v ~= Player then
				InternalBring(v)
			end
		end
	else
		for i,v in ipairs(Players:GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				InternalBring(v)
			end
		end
	end
end
function Funcs.kill(Target)
	local function InteralKill(player)
		task.spawn(function()
			Framework.Destroy(player.Character:WaitForChild("Head"))
		end)
	end
	if Target == "all" then
		for i,v in ipairs(Players:GetPlayers()) do
			InteralKill(v)
		end
	elseif Target == "me" then
		InteralKill(Player)

	elseif Target == "others" then
		for i,v in ipairs(Players:GetPlayers()) do
			if v ~= Player then
				InteralKill(v)
			end
		end
	else
		for i,v in ipairs(Players:GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				InteralKill(v)
			end
		end
	end
end 
function Funcs.cmds()
	for i in pairs(Funcs) do
		print(i)
	end
end
function Funcs.loadmodel(id)
	Framework.BuildModel(id, workspace.CurrentCamera.Focus)
end
function Funcs.givesaber()
	task.spawn(function()
		local truesaber = Framework.BuildModel("10563365323",CFrame.new(9e9,9e9,9e9), game:GetService("Players").LocalPlayer.Character)
		repeat task.wait()  until truesaber ~= nil
		truesaber = truesaber[1]
		truesaber.CanCollide = false
		local cons = {}
		local saber = Instance.new("Tool",game:GetService("Players").LocalPlayer.Backpack) saber.RequiresHandle = false
		saber.Name = "Infidel Decapitator"
		local CF = CFrame.new()
		local attacking = false	
		local Actual = CF
		local FakeArm = Framework.BuildModel("10564103577", CFrame.new(9e9,9e9,9e9), game:GetService("Players").LocalPlayer.Character)
		repeat task.wait() until FakeArm
		FakeArm = FakeArm[1]
		FakeArm.CanCollide = false
		local ArmA = CFrame.new()
		local sabcf = ArmA
		table.insert(cons, game:GetService("Players").LocalPlayer:GetMouse().Button1Down:Connect(function()
			if saber then
				if saber.Parent ~= Player.Character then
					return
				end
			else
				return
			end
			if attacking then
				return
			end
			attacking = true
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.2)*CFrame.Angles(math.rad(0),math.rad(.2),math.rad(0)),.18)
				sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait()
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.4)*CFrame.Angles(math.rad(-25),math.rad(.4),math.rad(0)),.18)
				sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait()
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.8)*CFrame.Angles(math.rad(-45),.8,math.rad(0)),.18)
				sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait()
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(.5,.5,-1)*CFrame.Angles(math.rad(-80),0,.5),.18)
				sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait()
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(.5,.5,-1)*CFrame.Angles(math.rad(-90),0,.5),.18)
				sabcf = ArmA*CFrame.new(-1.5,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait()
			for i = 1,5 do
				task.wait()
				ArmA = ArmA:Lerp(CFrame.new(.5,.5,-1)*CFrame.Angles(math.rad(-98),0,.7),.18)
				sabcf = ArmA*CFrame.new(-1.5,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
			end
			task.wait(.08)
			attacking = false
		end))
		table.insert(cons, game:GetService("Players").LocalPlayer:GetMouse().KeyDown:Connect(function(k)
			if attacking or not saber.Parent == game:GetService("Players").LocalPlayer.Character then
				return
			end
			if k == "e" then
				attacking = true
				for i = 1,5 do
					task.wait()
					ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.2)*CFrame.Angles(math.rad(0),math.rad(.2),math.rad(0)),.18)
					sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
				end
				task.wait()
				for i = 1,5 do
					task.wait()
					ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.4)*CFrame.Angles(math.rad(-25),math.rad(.4),math.rad(0)),.18)
					sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
				end
				task.wait()
				for i = 1,5 do
					task.wait()
					ArmA = ArmA:Lerp(CFrame.new(1.5,.5,-.8)*CFrame.Angles(math.rad(-45),.8,math.rad(0)),.18)
					sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
				end
				task.wait()
				for i = 1,5 do
					task.wait()
					ArmA = ArmA:Lerp(CFrame.new(.5,.5,-1)*CFrame.Angles(math.rad(-80),0,.5),.18)
					sabcf = ArmA*CFrame.new(-2,-.8,1.5)*CFrame.Angles(math.rad(20),math.rad(-30),math.rad(0))
				end
				task.delay(2,function()
					attacking = false
				end)
			end
		end))

		table.insert(cons, 	game:GetService("RunService").RenderStepped:Connect(function()
			if not attacking then
				ArmA = ArmA:Lerp(CFrame.new(1.5,.8,.2)*CFrame.Angles(170,-.5,-.2),.18)
				sabcf = ArmA*CFrame.new(-1.3,.1,2.3)*CFrame.Angles(-.1,0,0)
			end
			if attacking then
				local tagged = false
				for i,v in ipairs(checkregion(truesaber.CFrame.p, 3)) do
					if not v:IsDescendantOf(game:GetService("Players").LocalPlayer.Character) and not v.Name:lower():match("base") then
						if v.Name == "HumanoidRootPart" then
							v.Name = "asha basha balasha"
							Framework.BuildModel("10570143563", CFrame.new(v.CFrame.p)*CFrame.new(0,-2,0)*CFrame.Angles(math.rad(-90),0,0),game:GetService("Players").LocalPlayer.Character)		
						end
						local args = {
							[1] = "Remove",
							[2] = {
								[1] = v
							}
						}
						Framework.BToolsApi(args)
					end
				end
			end
			if not saber:IsDescendantOf(game) then
				for i,v in ipairs(cons) do
					v:Disconnect()
				end
			end
			if saber.Parent == game:GetService("Players").LocalPlayer.Character then
				local mat = {
					[1] = "SyncMaterial",
					[2] = {
						[1] = {
							["Part"] =  game:GetService("Players").LocalPlayer.Character:WaitForChild("Right Arm"),
							["Transparency"] = 1
						}
					}
				}
				truesaber.CFrame = game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame*ArmA*sabcf
				FakeArm.CFrame =  game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame*ArmA
				Framework.BToolsApi(mat)
				local args = {
					[1] = "SyncMove",
					[2] = {
						[1] = {
							["Part"] = FakeArm,
							["CFrame"] = game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame*ArmA
						}
					}
				}
				Framework.BToolsApi(args)
				local args2 = {
					[1] = "SyncMove",
					[2] = {
						[1] = {
							["Part"] = truesaber,
							["CFrame"] = game:GetService("Players").LocalPlayer.Character:WaitForChild('HumanoidRootPart').CFrame*ArmA*sabcf
						}
					}
				}
				Framework.BToolsApi(args2)
			else
				local mat = {
					[1] = "SyncMaterial",
					[2] = {
						[1] = {
							["Part"] =  game:GetService("Players").LocalPlayer.Character:WaitForChild("Right Arm"),
							["Transparency"] = 0
						}
					}
				}
				Framework.BToolsApi(mat)
				local args = {
					[1] = "SyncMove",
					[2] = {
						[1] = {
							["Part"] = FakeArm,
							["CFrame"] = CFrame.new(9e9,9e9,9e9)
						}
					}
				}
				Framework.BToolsApi(args)
				local args2 = {
					[1] = "SyncMove",
					[2] = {
						[1] = {
							["Part"] = truesaber,
							["CFrame"] = CFrame.new(9e9,9e9,9e9)
						}
					}
				}
				Framework.BToolsApi(args2)
			end
		end))
	end)
end
function Funcs.givedetain()
	local det = Framework.BuildModel("10564835653", CFrame.new(9e9,9e9,9e9), game:GetService("Players").LocalPlayer.Character)
	repeat task.wait() until det
	det = det[1]
	det.CanCollide = false
	local Detained = nil
	local ren
	local fakedet = Instance.new("Tool", game:GetService("Players").LocalPlayer.Backpack) fakedet.Name = "Detain"
	local handle = Instance.new("Part",fakedet)
	handle.CanCollide = false
	handle.Size = Vector3.new()
	handle.Name = "Handle"
	fakedet.Unequipped:Connect(function()
		task.spawn(function()
			if Detained then
				local args = {
					[1] = "SyncAnchor",
					[2] = {
						[1] = {
							["Part"] = Detained.Character.HumanoidRootPart,
							["Anchored"] = false
						}
					}
				}
				Framework.BToolsApi(args)
			end
			wait()
			Detained = nil
		end)
	end)
	fakedet.Activated:Connect(function()
		if game:GetService("Players"):GetPlayerFromCharacter(game:GetService("Players").LocalPlayer:GetMouse().Target.Parent) then
			Detained = game:GetService("Players"):GetPlayerFromCharacter(game:GetService("Players").LocalPlayer:GetMouse().Target.Parent)
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = Detained.Character.HumanoidRootPart,
						["Anchored"] = true
					}
				}
			}
			Framework.BToolsApi(args)
		end

	end)
	ren = game:GetService("RunService").RenderStepped:Connect(function()
		if fakedet.Parent == Player.Character then
			det.CFrame = handle.CFrame
			local args = {
				[1] = "SyncMove",
				[2] = {
					[1] = {
						["Part"] = 	det,
						["CFrame"] = handle.CFrame
					}
				}
			}
			Framework.BToolsApi(args)
		else
			local args = {
				[1] = "SyncMove",
				[2] = {
					[1] = {
						["Part"] = det,
						["CFrame"] = CFrame.new(9e9,9e9,9e9)
					}
				}
			}
			Framework.BToolsApi(args)

		end
	end)

	task.spawn(function()
		while true  do
			task.wait(.03)
			if fakedet.Parent == Player.Character and Detained ~= nil then
				Framework.ExperimentalCFrame( Detained.Character, Player.Character.HumanoidRootPart.CFrame*CFrame.new(0,2,-5))

				if Detained then
					local args = {
						[1] = "SyncAnchor",
						[2] = {
							[1] = {
								["Part"] = Detained.Character.HumanoidRootPart,
								["Anchored"] = true
							}
						}
					}
					Framework.BToolsApi(args)
				end
			end
		end
	end)
end
function Funcs.vest(Target_)
	local function internalvest(Target)
		task.spawn(function()
			pcall(function()

				for i = 1,6 do
					wait(.2)
					local args = {
						[1] = "CreateLights",
						[2] = {
							[1] = {
								["Part"] = Target.Character.HumanoidRootPart,
								["LightType"] = "PointLight"
							}
						}
					}
					Framework.BToolsApi(args)
					local args2 = {
						[1] = "SyncLighting",
						[2] = {
							[1] = {
								["Part"] = Target.Character.HumanoidRootPart,
								["LightType"] = "PointLight",
								["Color"] = Color3.new(1, 0, 0),
								["Brightness"] = 55
							}
						}
					}

					Framework.BToolsApi(args2)
					wait(.5)
					Framework.Destroy(Target.Character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight"))
					if i == 6 then
						for a = 1,10 do
							task.spawn(function()
								local crea = {

									[1] = "CreatePart",
									[2] = "Normal",
									[3] = Target.Character:GetPivot()*CFrame.new(math.random(-13,13),math.random(-13,13),math.random(-13,13)),
									[4] = Target.Character
								}
								local ins = Framework.BToolsApi(crea)
								repeat task.wait() until ins
								local Size = {
									[1] = "SyncResize",
									[2] = {
										[1] = {
											["Part"] = ins,
											["CFrame"] = ins.CFrame,
											["Size"] = Vector3.new()
										}
									}
								}

								Framework.BToolsApi(Size)
								local args = {
									[1] = "CreateDecorations",
									[2] = {
										[1] = {
											["Part"] = ins,
											["DecorationType"] = "Fire"
										}
									}
								}

								Framework.BToolsApi(args)
								local args3 = {
									[1] = "SyncDecorate",
									[2] = {
										[1] = {
											["Part"] = ins,
											["DecorationType"] = "Fire",
											["Size"] = 5555
										}
									}
								}

								Framework.BToolsApi(args3)
								task.delay(1,function()
									Framework.Destroy(ins)
								end)
							end)


						end
						for i,a in ipairs(workspace:GetDescendants()) do
							pcall(function()
								if a:IsA("BasePart") then
									if (a.CFrame.p  - Target.Character:GetPivot().p).Magnitude <= 50 then
										if a.Size.X > 300 then
											return
										end
										task.spawn(function()
											if a.Name == "Head" then
												Framework.Destroy(a)
											end

											local args = {
												[1] = "SyncAnchor",
												[2] = {
													[1] = {
														["Part"] = a,
														["Anchored"] = false
													}
												}
											}
											Framework.BToolsApi(args)

											local mat = {
												[1] = "SyncMaterial",
												[2] = {
													[1] = {
														["Part"] = a,
														["Material"] = Enum.Material.Slate
													}
												}
											}
											Framework.BToolsApi(mat)

											local col = {
												[1] = "SyncColor",
												[2] = {
													[1] = {
														["Part"] = a,
														["Color"] = Color3.new(),
														["UnionColoring"] = true
													}
												}
											}
											Framework.BToolsApi(col)

											local args4 = {
												[1] = "CreateDecorations",
												[2] = {
													[1] = {
														["Part"] = a,
														["DecorationType"] = "Fire"
													}
												}
											}

											Framework.BToolsApi(args4)
											local args5 = {
												[1] = "SyncDecorate",
												[2] = {
													[1] = {
														["Part"] = a,
														["DecorationType"] = "Fire",
														["Size"] = 15
													}
												}
											}

											Framework.BToolsApi(args5)
										end)
									end
								end
							end)
						end
					end
				end
			end)
		end)
	end


	if Target_ == "me" then
		internalvest(game:GetService("Players").LocalPlayer)
	elseif Target_ == "all" then
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			internalvest(v)
		end
	elseif Target_ == "others" then
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			if v ~= game:GetService("Players").LocalPlayer then
				internalvest(v)
			end
		end

	else
		local target = nil
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			if Framework.Submatch(v.Name, Target_) then
				target = v
				break
			end
		end
		if target then
			internalvest(target)
		end
	end
end
function Funcs.base()
	Framework.BuildModel("9111382216", workspace.CurrentCamera.Focus)
end
function Funcs.grabknife()
	local attacking = false
	local cons = {}
	local FArms = {}
	--[[
		FArms.L =  Framework.BuildModel("10564103577", workspace.CurrentCamera.Focus, Player.Character)[1]
	FArms.R =  Framework.BuildModel("10564103577", workspace.CurrentCamera.Focus,Player.Character)[1]
	]]
	local GK  = Framework.BuildModel("10631510967", workspace.CurrentCamera.Focus,Player.Character)
	repeat task.wait() until GK
	--[[
		FArms.L.CanCollide = false
	FArms.R.CanCollide = false
	]]
	local m = Instance.new("Model", workspace)
	wait()
	for i,v in ipairs(GK) do
		v.Parent = m
		v.CanCollide = false
	end
	--[[
		local mat = {
		[1] = "SyncMaterial",
		[2] = {
			[1] = {
				["Part"] =  Player.Character["Right Arm"],
				["Transparency"] = 1
			}
		}
	}
	Framework.BToolsApi(mat)
	local mat2 = {
		[1] = "SyncMaterial",
		[2] = {
			[1] = {
				["Part"] =  Player.Character["Left Arm"],
				["Transparency"] = 1
			}
		}
	}
	Framework.BToolsApi(mat2)
	]]
	Player.Character["Right Arm"]:ClearAllChildren()
	Player.Character["Left Arm"]:ClearAllChildren()
	local grabbed = nil
	local ra, la = CFrame.new(1.5,0,0),CFrame.new(-1.5,0,0)
	local function AttemptGrab()
		if grabbed then
			return
		end
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			if v~=Player and v.Character:FindFirstChild("Head") then
				if (v.Character:GetPivot().p  - workspace.CurrentCamera.Focus.p).Magnitude <= 1+m:GetExtentsSize().Magnitude then
					grabbed = v
				end
			end
		end
	end
	table.insert(cons, Player:GetMouse().Button1Down:Connect(function()
		if attacking then
			if grabbed then
				for i = 1,10 do
					task.wait()
					la=la:Lerp(CFrame.new(-.8,.2,-1.2)*CFrame.Angles(math.rad(90),0,math.rad(45)),.18)
					ra=ra:Lerp(CFrame.new(1.3+i/10,.2,-1.2)*CFrame.Angles(math.rad(90),math.rad(60),math.rad(-60)),.18)
					if i == 10 then
						--grabbed.Character.Parent = workspace
						for i = 1,8 do
							task.spawn(function()
								local crea = {

									[1] = "CreatePart",
									[2] = "Normal",
									[3] = grabbed.Character:GetPivot(),
									[4] = grabbed.Character
								}
								local ins = Framework.BToolsApi(crea)
								repeat task.wait() until ins
								local Size = {
									[1] = "SyncResize",
									[2] = {
										[1] = {
											["Part"] = ins,
											["CFrame"] = ins.CFrame,
											["Size"] = Vector3.new(.5,.25,.5)
										}
									}
								}
								Framework.BToolsApi(Size)
								local col = {
									[1] = "SyncColor",
									[2] = {
										[1] = {
											["Part"] = ins,
											["Color"] = Color3.new(1, 0, 0),
											["UnionColoring"] = true
										}
									}
								}
								Framework.	BToolsApi(col)

								local args3 = {
									[1] = "SyncAnchor",
									[2] = {
										[1] = {
											["Part"] = ins,
											["Anchored"] = false 
										}
									}
								}
								Framework.BToolsApi(args3)
							end)
						end
						Framework.Destroy(grabbed.Character.Head)
						grabbed = nil
						attacking = false
						task.delay(.2,function()
							for i = 1,20 do
								task.wait()
								la=la:Lerp(CFrame.new(-1.5,0,0),.18)
								ra=ra:Lerp(CFrame.new(1.5,0,0),.18)
							end
						end)
					end
				end
			end
			return
		end
		attacking = true
		task.spawn(function()
			for i = 1,50  do
				task.wait()
				AttemptGrab()
			end
		end)
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.5,0,-.5),.18)
			ra=ra:Lerp(CFrame.new(1.5,0,-.5),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.5,.2,-.5),.18)
			ra=ra:Lerp(CFrame.new(1.5,.2,-.5),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.5,.2,-.5)*CFrame.Angles(math.rad(90),0,0),.18)
			ra=ra:Lerp(CFrame.new(1.5,.2,-.5)*CFrame.Angles(math.rad(90),0,0),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.5,.2,-.5)*CFrame.Angles(math.rad(90),0,math.rad(-45)),.18)
			ra=ra:Lerp(CFrame.new(1.5,.2,-.5)*CFrame.Angles(math.rad(90),0,math.rad(45)),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.2,.2,-.8)*CFrame.Angles(math.rad(90),0,math.rad(0)),.18)
			ra=ra:Lerp(CFrame.new(1.2,.2,-.8)*CFrame.Angles(math.rad(90),0,math.rad(0)),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-1.2,.2,-.8)*CFrame.Angles(math.rad(90),0,math.rad(45)),.18)
			ra=ra:Lerp(CFrame.new(1.2,.2,-.8)*CFrame.Angles(math.rad(90),0,math.rad(-45)),.18)
		end
		task.wait()
		for i = 1,5 do
			task.wait()
			la=la:Lerp(CFrame.new(-.8,.2,-1.2)*CFrame.Angles(math.rad(90),0,math.rad(45)),.18)
			ra=ra:Lerp(CFrame.new(1.3,.2,-1.2)*CFrame.Angles(math.rad(90),math.rad(60),math.rad(-60)),.18)
		end
		if grabbed == nil then
			task.wait(.15)
			for i = 1,20 do
				task.wait()
				la=la:Lerp(CFrame.new(-1.5,0,0),.18)
				ra=ra:Lerp(CFrame.new(1.5,0,0),.18)
			end
			attacking = false
		end
	end))
	wait(.8)
	local cc = m:Clone()
	cc.Parent = m.Parent
	m.Parent = nil
	Player.DescendantAdded:Connect(function(b)
		if b:IsA("Weld") then
			task.defer(function()
				b:Destroy()
			end)
		end
	end)
	Player.Character["Right Arm"].ChildAdded:Connect(function(a)
		if a:IsA("Weld") then
			task.defer(function()
				a:Destroy()
			end)
		end
	end)
	Player.Character["Left Arm"].ChildAdded:Connect(function(a)
		if a:IsA("Weld") then
			task.defer(function()
				a:Destroy()
			end)
		end
	end)
	table.insert(cons, game:GetService("RunService").RenderStepped:Connect(function()
		Player.Character["Right Arm"]:ClearAllChildren()
		Player.Character["Left Arm"]:ClearAllChildren()
		Player.Character["Left Arm"].CFrame = Player.Character.HumanoidRootPart.CFrame*la
		Player.Character["Right Arm"].CFrame = Player.Character.HumanoidRootPart.CFrame*ra
		task.spawn(function()
			local argsa = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = Player.Character["Left Arm"],
						["Anchored"] = true 
					}
				}
			}
			Framework.BToolsApi(argsa)
			local argsd = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = Player.Character["Right Arm"],
						["Anchored"] = true 
					}
				}
			}
			Framework.BToolsApi(argsd)
		end)
		cc:PivotTo(Player.Character.HumanoidRootPart.CFrame*ra*CFrame.new(0,-1.25,-1.2)*CFrame.Angles(math.rad(-180),0,0))
		if grabbed and grabbed.Character then

			grabbed.Character:PivotTo( Player.Character:GetPivot()*CFrame.new(0,-.5,-1))

			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = grabbed.Character.HumanoidRootPart,
						["Anchored"] = true 
					}
				}
			}
			Framework.BToolsApi(args)
		else
			local m = Player.Character:FindFirstChildWhichIsA("Model")
			if m then
				m:Destroy()
			end
		end


		local args = {
			[1] = "SyncMove",
			[2] = {
				[1] = {
					["Part"] = Player.Character["Left Arm"],
					["CFrame"] = Player.Character.HumanoidRootPart.CFrame*la
				}
			}
		}
		Framework.BToolsApi(args)

		local args1 = {
			[1] = "SyncMove",
			[2] = {
				[1] = {
					["Part"] = Player.Character["Right Arm"],
					["CFrame"] = Player.Character.HumanoidRootPart.CFrame*ra
				}
			}
		}
		Framework.BToolsApi(args1)
		for i,v in ipairs(cc:GetChildren()) do
			m:GetChildren()[i].Transparency = 1
			local args2 = {
				[1] = "SyncMove",
				[2] = {
					[1] = {
						["Part"] = m:GetChildren()[i],
						["CFrame"] = v.CFrame
					}
				}
			}
			Framework.BToolsApi(args2)
		end
	end))
	task.spawn(function()
		while task.wait(.2) do
			if grabbed then
				Framework.ExperimentalCFrame(grabbed.Character,Player.Character:GetPivot()*CFrame.new(0,-.5,-1))
			end
		end
	end)

	local gkwm = Instance.new("WorldModel", workspace)
	local lastgrabbed = grabbed
	task.spawn(function()
		pcall(function()
			table.insert(cons,	game:GetService("RunService").Stepped:Connect(function()
				if grabbed then
					grabbed.Character.Parent = gkwm
					lastgrabbed = grabbed
				else
					if lastgrabbed then
						lastgrabbed.Character.Parent = workspace
						local cha = lastgrabbed.Character
						local temp
						temp = lastgrabbed.CharacterAdded:Connect(function()
							temp:Disconnect()
							cha:Destroy()

						end)
						lastgrabbed = nil
					end
				end
			end))
		end)
	end)
	-- disconnection
	Player.CharacterRemoving:Connect(function()
		for i,v in ipairs(cons) do
			v:Disconnect()
		end
	end)
end
function Funcs.quicksand(Target)
	local function InternalSink(target)
		task.spawn(function()
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = target.Character.HumanoidRootPart,
						["Anchored"] = true 
					}
				}
			}
			Framework.BToolsApi(args)
			task.wait(.5)
			local sand = Framework.BuildModel("10619597207", target.Character:GetPivot()*CFrame.new(0,-4.25,0))
			repeat task.wait() until sand
			sand = sand[1]
			task.wait(.5)
			for i = 1,10 do
				task.wait()
				Framework.ExperimentalCFrame(target.Character, target.Character:GetPivot()*CFrame.new(0,-i/5,0))
				if i == 10 then
					Framework.Destroy(sand)
					Framework.Destroy(target.Character)
				end

			end
		end)
	end

	if Target == "all" then
		for i,v in ipairs(Players:GetPlayers()) do
			InternalSink(v)
		end
	elseif Target == "me" then
		InternalSink(Player)

	elseif Target == "others" then
		for i,v in ipairs(Players:GetPlayers()) do
			if v ~= Player then
				InternalSink(v)
			end
		end
	else
		for i,v in ipairs(Players:GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				InternalSink(v)
			end
		end
	end
end
function Funcs.rocket(Target)
	local function InternalRocket(target)
		task.spawn(function()
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						["Part"] = target.Character.HumanoidRootPart,
						["Anchored"] = true 
					}
				}
			}
			Framework.BToolsApi(args)

			local args2 = {
				[1] = "CreateDecorations",
				[2] = {
					[1] = {
						["Part"] = target.Character.HumanoidRootPart,
						["DecorationType"] = "Fire"
					}
				}
			}
			Framework.BToolsApi(args2)
			local base = target.Character:GetPivot()
			for i = 1,120 do
				task.wait()
				task.spawn(function()
					Framework.ExperimentalCFrame(target.Character, base*CFrame.new(0,i*2,0))
					if i == 120 then
						Framework.Destroy(target.Character.Head)

						for a = 1,10 do
							task.spawn(function()
								local crea = {

									[1] = "CreatePart",
									[2] = "Normal",
									[3] = target.Character:GetPivot()*CFrame.new(math.random(-13,13),math.random(-13,13),math.random(-13,13)),
									[4] = target.Character
								}
								local ins = Framework.BToolsApi(crea)
								repeat task.wait() until ins
								local Size = {
									[1] = "SyncResize",
									[2] = {
										[1] = {
											["Part"] = ins,
											["CFrame"] = ins.CFrame,
											["Size"] = Vector3.new()
										}
									}
								}

								Framework.BToolsApi(Size)
								local args = {
									[1] = "CreateDecorations",
									[2] = {
										[1] = {
											["Part"] = ins,
											["DecorationType"] = "Fire"
										}
									}
								}

								Framework.BToolsApi(args)
								local args3 = {
									[1] = "SyncDecorate",
									[2] = {
										[1] = {
											["Part"] = ins,
											["DecorationType"] = "Fire",
											["Size"] = 5555
										}
									}
								}

								Framework.BToolsApi(args3)
								task.delay(1,function()
									Framework.Destroy(ins)
								end)
							end)


						end
					end
				end)
			end

		end)
	end
	if Target == "all" then
		for i,v in ipairs(Players:GetPlayers()) do
			InternalRocket(v)
		end
	elseif Target == "me" then
		InternalRocket(Player)

	elseif Target == "others" then
		for i,v in ipairs(Players:GetPlayers()) do
			if v ~= Player then
				InternalRocket(v)
			end
		end
	else
		for i,v in ipairs(Players:GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				InternalRocket(v)
			end
		end
	end
end
function Funcs.furrify(Target)
	local function furrify(model)
		pcall(function()
			for i,v in ipairs(model:GetDescendants()) do
				task.spawn(function()
					pcall(function()
						if v:IsA("BasePart") then
							if v.Name == "HumanoidRootPart" then
								local mat = {
									[1] = "SyncMaterial",
									[2] = {
										[1] = {
											["Part"] =  v,
											["Transparency"] = 0
										}
									}
								}
								Framework.BToolsApi(mat)
								local m = {
									[1] = "CreateMeshes",
									[2] = {
										[1] = {
											["Part"] = v
										}
									}
								}
								local imesh = Framework.BToolsApi(m) 
								repeat task.wait() until imesh
								local sy = {
									[1] = "SyncMesh",
									[2] = {
										[1] = {
											["MeshType"] = Enum.MeshType.FileMesh,
											["Part"] = v,
											["Scale"] = Vector3.new(1,1,1),
											["VertexColor"] = Vector3.new(1,1,1),
											["MeshId"] = "rbxassetid://9275559893",
											["TextureId"] = "rbxassetid://9040942525"
										}
									}
								}
								Framework.BToolsApi(sy)
							else
								local mat = {
									[1] = "SyncMaterial",
									[2] = {
										[1] = {
											["Part"] =  v,
											["Transparency"] = 1
										}
									}
								}
								Framework.BToolsApi(mat)
							end
						end
					end)
				end)
			end
		end)
	end

	if Target == "me" then
		furrify(game:GetService("Players").LocalPlayer.Character)
	elseif Target == "all" then
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			furrify(v.Character)
		end
	elseif Target == "others" then
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			if v ~= game:GetService("Players").LocalPlayer then
				furrify(v.Character)
			end
		end

	else
		local target = nil
		for i,v in ipairs(game:GetService("Players"):GetPlayers()) do
			if Framework.Submatch(v.Name, Target) then
				target = v
				break
			end
		end
		if target then
			furrify(target.Character)
		end
	end

end
function Funcs.clearws()
	for i,v in ipairs(workspace:GetDescendants()) do
		task.spawn(function()
			if v:IsA("BasePart") then
				Framework.Destroy(v)
			end
		end)
	end
end
function Funcs.burn()
	for i,v in ipairs(workspace:GetDescendants()) do
		task.spawn(function()
			local args = {
				[1] = "CreateDecorations",
				[2] = {
					[1] = {
						["Part"] = v,
						["DecorationType"] = "Fire"
					}
				}
			}
			Framework.BToolsApi(args)
		end)
	end
end
function Funcs.unanchor()
	for i,v in ipairs(workspace:GetDescendants()) do
		task.spawn(function()
			if v:IsA("BasePart") then
				local args = {
					[1] = "SyncAnchor",
					[2] = {
						[1] = {
							["Part"] = v,
							["Anchored"] = false 
						}
					}
				}
				Framework.BToolsApi(args)
			end
		end)
	end
end
function CheckString(String)
	if String:sub(1, Prefix:len()) == Prefix then
		String = String:lower()
		local Arguements = String:split(" ")
		Arguements[1] = Arguements[1]:gsub(Prefix, "")
		local Command = Arguements[1]
		table.remove(Arguements, table.find(Arguements, Arguements[1]))
		Funcs[Command](table.unpack(Arguements))
	end
end
Player.Chatted:Connect(CheckString)
input.FocusLost:Connect(function(a)
	if a then
		if input.Text:sub(1,Prefix:len()) == Prefix then
			input.Text = input.Text:gsub(Prefix, "")
		end
		CheckString(Prefix..input.Text)
		input.Text = ""
	end
end)



table.insert(Connections, game:GetService("RunService").RenderStepped:Connect(function()
	local t = ""
	for i in pairs(Funcs) do
		if Framework.Submatch(i, input.Text) then
			t = t .. i .. " "
		end
	end
	sug.Text = t
end))