--[[ access.lua --]]
if ngx.var.log_val ~= nil then
    local request = ngx.var.host..ngx.var.request_uri
    local post = ""
    local delimiter = ""
    local item = ""
    ngx.req.read_body()
    local args, err = ngx.req.get_post_args()
    if args then
        for key, val in pairs(args) do
           item = ""
           if type(val) == "string" then
               key =  string.gsub(key,"%c"," ")
               val = string.gsub(val,"%c"," ")
               item = key.."="..val
           elseif type(val) == "table" then
               item = key.."="
               local tstr = "";
               local tdelimiter = ""
               for k, v in pairs(val) do
                   if type(v) == "string" then
                      tstr = tstr..tdelimiter..v
                      tdelimiter = ','
                   end
               end
               item = item..tstr
           end
           post = post..delimiter..item
           delimiter = "&"
        end
    end
 
                --ngx.var.log_val = request
        deli = "\\u0020"
local function unicode_to_utf8(convertStr)
    if type(convertStr)~="string" then
        return convertStr
    end
    local bit = require("bit")
    local resultStr=""
    local i=1
    while true do
         
        local num1=string.byte(convertStr,i)
        local unicode
         
        if num1~=nil and string.sub(convertStr,i,i+1)=="\\u" then
            unicode=tonumber("0x"..string.sub(convertStr,i+2,i+5))
            i=i+6
        elseif num1~=nil then
            unicode=num1
            i=i+1
        else
            break
        end
 
        if unicode <= 0x007f then
            resultStr=resultStr..string.char(bit.band(unicode,0x7f))
        elseif unicode >= 0x0080 and unicode <= 0x07ff then
            resultStr=resultStr..string.char(bit.bor(0xc0,bit.band(bit.rshift(unicode,6),0x1f)))
            resultStr=resultStr..string.char(bit.bor(0x80,bit.band(unicode,0x3f)))
        elseif unicode >= 0x0800 and unicode <= 0xffff then
            resultStr=resultStr..string.char(bit.bor(0xe0,bit.band(bit.rshift(unicode,12),0x0f)))
            resultStr=resultStr..string.char(bit.bor(0x80,bit.band(bit.rshift(unicode,6),0x3f)))
            resultStr=resultStr..string.char(bit.bor(0x80,bit.band(unicode,0x3f)))
        end
    end
    resultStr=resultStr..'\0'
    return resultStr
end
        deli = unicode_to_utf8(deli)
        ngx.var.log_val = ngx.var.arg_appId..deli..ngx.var.arg_act..deli..ngx.var.arg_tid..deli..ngx.var.arg_tagid..deli..ngx.var.arg_pf..deli..ngx.var.arg_m..deli..ngx.var.arg_did..deli..ngx.var.arg_adid..deli..ngx.var.arg_price..deli..ngx.var.arg_os..deli..ngx.var.arg_bundleld..deli..ngx.var.arg_gaid..deli..ngx.var.arg_currency
end
