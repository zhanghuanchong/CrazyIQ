
function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

ez = {}
ez.COLOR_BROWN = ccc3(79, 57, 30)

require("app.MyApp").new():run()
