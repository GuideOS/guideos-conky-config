-- Generiert mit GuideOS Conky Configurator

conky.config = {
-- Generelles
    update_interval = 1,
    cpu_avg_samples = 2,
    net_avg_samples = 2,
    double_buffer = true,
    temperature_unit = 'celsius',

-- Fenster Einstellungen
    own_window_class = 'Conky',
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',
    own_window_argb_visual = true,
    own_window_argb_value = 100,
    own_window_colour = '#3d3846',
    minimum_height = 400,
    minimum_width = 400,
    alignment = 'top_left',
    gap_x = 45,
    gap_y = 65,
    xinerama_head = 1,

-- Text Einstellungen
    use_xft = true,
    use_spacer = right,
    override_utf8_locale = true,
    font = 'UbuntuMono Nerd Font:style=Regular:size=10',
    xftalpha = 0.5,
    uppercase = false,
    default_color = '#DCDCDC',
    color1 = '#DCDCDC',
    color2 = '#0072b5',
}

conky.text = [[
${image /home/ktt73/.conky/images/GuideOS-blau.png -p 160,10 -s 40x40}



${color2}${font UbuntuMono Nerd Font:style=Regular:size=14}${nodename} powered by ${execi 21600 cat /etc/guideos-version 2>/dev/null || echo 'GuideOS'}${color1}

${font UbuntuMono Nerd Font:style=Regular:size=12}󰌽  ${color2}Kernel${color1} [${kernel}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰞌  ${color2}Laufzeit${color1} [${uptime_short}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰚰  ${color2}Updates${color1} [${execi 898 python3 ~/.conky/check-update.py}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰻠  ${color2}CPU${color1} [${execpi 21600 python3 ~/.conky/hwinfo.py cpu}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰘚  ${color2}RAM${color1} [${execpi 21600 python3 ~/.conky/hwinfo.py ram}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰍹  ${color2}GPU${color1} [${execpi 21600 python3 ~/.conky/hwinfo.py gpu}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰒓  ${color2}GPU Treiber${color1} [${execpi 21598 python3 ~/.conky/hwinfo.py gpu_driver}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰘚  ${color2}GPU Speicher${color1} [${execpi 21598 python3 ~/.conky/hwinfo.py gpu_memory}]

${font UbuntuMono Nerd Font:style=Regular:size=12}󰛳  ${color2}Netzwerk${color1}
${font UbuntuMono Nerd Font:style=Regular:size=10}${execpi 10 python3 ~/.conky/hwinfo.py net}

${font UbuntuMono Nerd Font:style=Regular:size=12}󰋊  ${color2}Disk(s)${color1}
${font UbuntuMono Nerd Font:style=Regular:size=10}${execpi 10 python3 ~/.conky/hwinfo.py disk}
]]