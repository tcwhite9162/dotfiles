local waywall = require("waywall")
local helpers = require("waywall.helpers")
local mirror = nil

local config = {
    input = {
        layout = "us",
        repeat_rate = 40,
        repeat_delay = 300,

        sensitivity = 1.0,
        confine_pointer = false,
    },
    theme = {
        background = "#000000ff",
    },
}

config.actions = {
    ["Ctrl-Alt-N"] = function()
        waywall.exec("java -jar /home/tcwhite/Documents/minecraft/speedrun-tools/Ninjabrain-Bot-1.5.2.jar")
    end,

    ["Ctrl-Alt-M"] = function()
        helpers.toggle_floating()
        -- waywall.show_floating(not waywall.floating_shown())
    end,

    ["T"] = function()
        helpers.toggle_res(300, 1080)()
    end,

    ["G"] = function()
        helpers.toggle_res(1920, 300)()
    end,

    ["H"] = function()
        if mirror == nil then
            mirror = waywall.mirror(
                {
                    src = {
                        x = 1920 / 2 - 100,
                        y = 1080 / 2 - 100,
                        w = 200,
                        h = 200,
                    },

                    dst = {
                        x = 1920 / 2 - 400,
                        y = 1080 / 2 - 500,
                        w = 800,
                        h = 1000,
                    },
                }
            )
        else
            mirror:close()
            mirror = nil
        end
    end,


}

return config
