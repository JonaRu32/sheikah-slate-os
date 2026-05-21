-- ==========================================
-- 1. MONITORES (Escalado al 100% para nitidez)
-- ==========================================
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })

-- ==========================================
-- 2. AUTOARRANQUE (Matriz Sheikah + Llavero VS Code)
-- ==========================================
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("awww img /home/jonathan/.config/hypr/wallpapers/fondosheika.png")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("xsettingsd")  -- ← añade esta línea
    hl.exec_cmd("dunst")       -- ← y esta si no la tenías
end)

hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
hl.env("__NV_PRIME_RENDER_OFFLOAD_PROVIDER", "NVIDIA-G0")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "24")

-- ==========================================
-- 3. CONFIGURACIÓN BASE Y ESTÉTICA
-- ==========================================
hl.config({
    input = {
        kb_layout = "es",
        touchpad = {
            natural_scroll = true,
        },
    },

 
        
    general = {
        layout = "dwindle",
        gaps_in = 6,
        gaps_out = 12,
        border_size = 2,
        col = {
            active_border = { colors = {"rgba(00F0FFee)", "rgba(0080FFee)"}, angle = 45 },
            inactive_border = "rgba(303030aa)",
        },
    },
    decoration = {
        rounding = 15,
        blur = {
            enabled = true,
            size = 8,
            passes = 4,
        },
        shadow = {
            enabled = true,
            range = 20,
            render_power = 3,
            color = 0x88000000,

          
        },
    },
})




-- Salida suave y elegante (ventanas que abren)
hl.curve("sheikahOpen",  { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

-- Entrada rápida con ligero rebote (ventanas que cierran)
hl.curve("sheikahClose", { type = "bezier", points = { {0.36, 0}, {0.66, -0.56} } })

-- Workspaces: transición limpia sin rebote
hl.curve("sheikahSlide", { type = "bezier", points = { {0.25, 1}, {0.5, 1} } })

-- Spring para movimiento de ventanas (drag/resize) — sensación física
hl.curve("sheikahSpring", { type = "spring", mass = 1, stiffness = 180, dampening = 22 })


-- VENTANAS
hl.animation({ leaf = "windows",     enabled = true, speed = 4,   bezier = "sheikahOpen",   style = "popin 75%" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4,   bezier = "sheikahOpen",   style = "popin 75%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 3,   bezier = "sheikahClose",  style = "popin 75%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5,   spring = "sheikahSpring" })

-- FADE
hl.animation({ leaf = "fade",        enabled = true, speed = 4,   bezier = "sheikahOpen" })
hl.animation({ leaf = "fadeIn",      enabled = true, speed = 4,   bezier = "sheikahOpen" })
hl.animation({ leaf = "fadeOut",     enabled = true, speed = 3,   bezier = "sheikahClose" })
hl.animation({ leaf = "fadeSwitch",  enabled = true, speed = 5,   bezier = "sheikahSlide" })
hl.animation({ leaf = "fadeDim",     enabled = true, speed = 5,   bezier = "sheikahSlide" })

-- WORKSPACES — deslizamiento lateral con inercia
hl.animation({ leaf = "workspaces",        enabled = true, speed = 5, bezier = "sheikahSlide", style = "slidefade 15%" })
hl.animation({ leaf = "specialWorkspace",  enabled = true, speed = 5, bezier = "sheikahSlide", style = "slidevert" })

-- BORDE ACTIVO — animación de gradiente giratorio (Sheikah pulsante)
hl.animation({ leaf = "border",      enabled = true, speed = 20,  bezier = "sheikahSlide" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 15,   bezier = "sheikahSlide", style = "loop" })


local mainMod = "SUPER"

-- 1. LANZADORES PRINCIPALES
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("rofi -show drun -theme ~/.config/rofi/sheikah.rasi"))hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("spotify"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("networkmanager_dmenu"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("kitty --title 'CAVA Sheikah' cava"))

-- 2. EL WIDGET "COZY" — versión corregida
hl.bind(mainMod .. " + Escape", function()
    hl.dispatch(hl.dsp.window.float({ action = "on" }))
    hl.dispatch(hl.dsp.window.resize({ x = 600, y = 400, exact = true }))
    hl.dispatch(hl.dsp.window.move({ x = 1310, y = 50, exact = true }))
end)

hl.bind(mainMod .. " + Backspace", function()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
end)

-- 3. GESTIÓN DE VENTANAS BÁSICAS
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", function()
    hl.dispatch(hl.dsp.window.fullscreen({ mode = 0 }))
end)-- 4. GESTIÓN DE ESCRITORIOS
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. tostring(i), hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. tostring(i), hl.dsp.window.move({ workspace = i }))
end

-- Navegación de escritorios con las flechas (La original que te funcionaba)
hl.bind(mainMod .. " + Right", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + Left", hl.dsp.focus({ workspace = "e-1" }))

-- 5. SWAP DE VENTANAS EN MOSAICO
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.exec_cmd("hyprctl eval 'hl.dispatch(hl.dsp.window.move({direction=\"u\"}))'"))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.exec_cmd("hyprctl eval 'hl.dispatch(hl.dsp.window.move({direction=\"r\"}))'"))
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.exec_cmd("hyprctl eval 'hl.dispatch(hl.dsp.window.move({direction=\"d\"}))'"))
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.exec_cmd("hyprctl eval 'hl.dispatch(hl.dsp.window.move({direction=\"l\"}))'"))

-- 6. CAPTURAS DE PANTALLA (con freeze de pantalla)
-- Pantalla completa → portapapeles
hl.bind("Print", hl.dsp.exec_cmd("grimblast --freeze copy screen"))

-- Región seleccionada → portapapeles  (la pantalla se CONGELA al pulsar)
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("grimblast --freeze copy area"))

-- Región seleccionada → satty para anotar
hl.bind("CTRL + Print", hl.dsp.exec_cmd("grimblast --freeze save area - | satty -f -"))

-- 7. CONTROL DE HARDWARE DEL LENOVO
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([[sh -c 'wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+']]))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([[sh -c 'wpctl set-mute @DEFAULT_AUDIO_SINK@ 0; wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-']]))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"))
