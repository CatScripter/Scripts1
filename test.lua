local args = {
    [1] = 2
}

game:GetService("ReplicatedStorage").Network.Present_Found:InvokeServer(unpack(args))
