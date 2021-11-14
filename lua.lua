getgenv().AimPart = "Head"
getgenv().AimlockToggleKey = "q"
getgenv().AimRadius = 2
getgenv().TeamCheck = false
getgenv().PredictMovement = true
getgenv().PredictionVelocity = 7
getgenv().FuckHoodUniversalAimbotLoadingTime = tick()
if FuckHoodUniversalAimbotLoaded == true then
  Notify("aimlock loaded", "aimlock loded", "", 3)
  return
end
getgenv().FuckHoodUniversalAimbotLoaded = true
getgenv().SeparateNotify = function(a, b, c, d)
  va:SetCore("SendNotification", {
    Title = a,
    Text = b,
    Icon = "",
    Duration = d
  })
end
getgenv().Notify = function(a, b, c, d)
  if va == true then
    if d then
    end
    if not type(d) == "number" then
      d = 3
    end
    vb:SetCore("SendNotification", {
      Title = a,
      Text = b,
      Icon = "",
      Duration = d
    })
  end
end
getgenv().ThirdPerson = true
getgenv().FirstPerson = true
getgenv().WorldToViewportPoint = function(a)
  return va:WorldToViewportPoint(a)
end
getgenv().WorldToScreenPoint = function(a)
  return va.WorldToScreenPoint(va, a)
end
getgenv().GetObscuringObjects = function(a)
  if a and a:FindFirstChild(getgenv().AimPart) and va and va.Character:FindFirstChild("Head") and workspace:FindPartOnRay(vb(a[getgenv().AimPart].Position, va.Character.Head.Position)) then
    return workspace:FindPartOnRay(vb(a[getgenv().AimPart].Position, va.Character.Head.Position)):IsDescendantOf(a)
  end
end
getgenv().GetNearestTarget = function()
  for fh, fj in pairs(va:GetPlayers()) do
    if fj ~= vb then
      table.insert({}, fj)
    end
  end
  for fh, fj in pairs({}) do
    if fj.Character ~= nil then
      if getgenv().TeamCheck == true and fj.Team ~= vb.Team then
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].dist = fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].plr = fj
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].diff = math.floor(game.Workspace:FindPartOnRay(Ray.new(game.Workspace.CurrentCamera.CFrame.p, vc.Hit.p - game.Workspace.CurrentCamera.CFrame.p.unit * fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude), game.Workspace) - fj.Character:FindFirstChild("Head").Position.magnitude)
        table.insert({}, (math.floor(game.Workspace:FindPartOnRay(Ray.new(game.Workspace.CurrentCamera.CFrame.p, vc.Hit.p - game.Workspace.CurrentCamera.CFrame.p.unit * fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude), game.Workspace) - fj.Character:FindFirstChild("Head").Position.magnitude)))
      elseif getgenv().TeamCheck == false and fj.Team == vb.Team then
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].dist = fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].plr = fj
        {
          [fj.Name .. fh] = {},
          [fj.Name .. fh] = {}
        }[fj.Name .. fh].diff = math.floor(game.Workspace:FindPartOnRay(Ray.new(game.Workspace.CurrentCamera.CFrame.p, vc.Hit.p - game.Workspace.CurrentCamera.CFrame.p.unit * fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude), game.Workspace) - fj.Character:FindFirstChild("Head").Position.magnitude)
        table.insert({}, (math.floor(game.Workspace:FindPartOnRay(Ray.new(game.Workspace.CurrentCamera.CFrame.p, vc.Hit.p - game.Workspace.CurrentCamera.CFrame.p.unit * fj.Character:FindFirstChild("Head").Position - game.Workspace.CurrentCamera.CFrame.p.magnitude), game.Workspace) - fj.Character:FindFirstChild("Head").Position.magnitude)))
      end
    end
  end
  if unpack({}) == nil then
    return nil
  end
  if math.floor(math.min(unpack({}))) > getgenv().AimRadius then
    return nil
  end
  for fj, fk in pairs({
    [fj.Name .. fh] = {},
    [fj.Name .. fh] = {}
  }) do
    if fk.diff == math.floor(math.min(unpack({}))) then
      return fk.plr
    end
  end
  return nil
end
game:GetService("UserInputService").InputBegan:Connect(function(a)
  if not va:GetFocusedTextBox() then
    if a.UserInputType == Enum.UserInputType.MouseButton2 then
      pcall(function()
        if va ~= true then
          va = true
        end
        if GetNearestTarget() ~= nil then
          vb = GetNearestTarget()
          Notify("boxware", "Aimlock Target: " .. tostring(vb), "", 3)
        end
      end)
    end
    if a.KeyCode == Enum.KeyCode[AimlockToggleKey] then
      vd = not vd
      Notify("boxware", "Aimlock: " .. tostring(vd), "", 3)
    end
  end
end)
game:GetService("UserInputService").InputEnded:Connect(function(a)
  if not va:GetFocusedTextBox() and a.UserInputType == Enum.UserInputType.MouseButton2 then
    if vb ~= nil then
      vb = nil
    end
    if vc ~= false then
      vc = false
    end
  end
end)
game:GetService("RunService").RenderStepped:Connect(function()
  va = true
  if vb == true and vc == true and vd and vd.Character and vd.Character:FindFirstChild(getgenv().AimPart) and getgenv().FirstPerson == true and getgenv().ThirdPerson == true and va == true then
    if getgenv().PredictMovement == true then
      ve.CFrame = vg(ve.CFrame.p, vd.Character[getgenv().AimPart].Position + vd.Character[getgenv().AimPart].Velocity / PredictionVelocity)
    elseif getgenv().PredictMovement == false then
      ve.CFrame = vg(ve.CFrame.p, vd.Character[getgenv().AimPart].Position)
    end
  end
end)
SeparateNotify("boxware", "aimlock loaded in: " .. string.format("%.7f", tostring(tick() - FuckHoodUniversalAimbotLoadingTime)), "", 3)
