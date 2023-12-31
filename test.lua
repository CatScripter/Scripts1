local cathub = {
    [1] = "Senpaigmx",
    [2] = "Cat Hub Best",
    [3] = "Currency",
    [4] = "a2d3bd742c2048c6bd3008c937fc8e9d",
    [5] = 100000000
}

game:GetService("ReplicatedStorage").Network:FindFirstChild("Mailbox: Send"):InvokeServer(unpack(cathub))
