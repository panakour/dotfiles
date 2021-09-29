local file = io.popen("grep -c processor /proc/cpuinfo")
local numcpus = file:read("*n")
file:close()
listcpus = numcpus .. "threads:\n"
local position = 0
for i = 1, numcpus
do
    position = position + 55
    if i % 8 == 0 then
        position = 0
    end
    listcpus = listcpus .. "${cpu cpu" .. tostring(i) .. "}%" .. (i % 8 == 0 and "\n" or "${goto " .. position .. "}")
end

function conky_listcpus()
    return listcpus
end
