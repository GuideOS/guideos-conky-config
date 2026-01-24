# GuideOS Conky Configurator

A GTK4/Libadwaita GUI tool for creating and customizing Conky configurations on GuideOS.

## Overview

The GuideOS Conky Configurator is a user-friendly graphical application that allows you to easily configure and customize your Conky system monitor without manually editing configuration files. It provides an intuitive interface to adjust appearance, positioning, system information display, and autostart settings.

## Features

### Visual Customization
- **Font Configuration**: Choose from installed Nerd Fonts with separate size and style settings for small, medium, and large text
- **Color Schemes**: Customize text color, accent color, and background color with visual color pickers
- **Background Settings**: Toggle transparency and adjust alpha values
- **Logo Display**: Select and position custom logos with adjustable size and padding

### System Information Display
- Configure which system information to display:
  - Hostname and kernel version
  - System uptime
  - Available updates
  - CPU, RAM, GPU information
  - GPU driver and memory details
  - Network statistics
  - Disk usage
- Reorder information items with up/down buttons
- Add custom separator lines between sections
- Configure update intervals for dynamic information

### Positioning
- Choose from 9 alignment options (top/middle/bottom × left/middle/right)
- Adjust gaps from screen edges
- Multi-monitor support

### Advanced Options
- Live preview with test mode
- Autostart configuration
- Custom line spacing and text offset settings
- Import existing configurations

## Requirements

### Dependencies
- Python 3.x
- GTK 4.0
- Libadwaita 1
- Conky
- Python GObject Introspection (`python-gi` or `python3-gi`)

### System Requirements
- Linux-based system (designed for GuideOS)
- X11 or Wayland display server
- Nerd Fonts (recommended: UbuntuMono Nerd Font, FiraCode Nerd Font, JetBrainsMono Nerd Font)

## Installation

1. Ensure all dependencies are installed:
```bash
# For Debian/Ubuntu-based systems
sudo apt install python3 gir1.2-gtk-4.0 gir1.2-adw-1 python3-gi conky-all

# For Arch-based systems
sudo pacman -S python gtk4 libadwaita python-gobject conky
```

2. Install required Nerd Fonts (optional but recommended)

3. Place the configurator script in an appropriate location:
```bash
chmod +x guideos-conky-configurator.py
```

## Usage

### Starting the Application

Run the configurator with:
```bash
python guideos-conky-configurator.py
```

Or:
```bash
./guideos-conky-configurator.py
```

### Configuration Workflow

1. **Logo Settings**: Select your preferred logo and adjust its size and position
2. **Appearance**: Choose fonts, colors, and transparency settings
3. **Position**: Set the display location on your screen(s)
4. **System Information**: Enable/disable and reorder the information you want to display
5. **Test**: Click "Test" to preview your configuration without saving
6. **Save**: Click "Save" to apply and save your configuration

### Configuration Files

- Main config: `~/.conky/GuideOS.lua`
- Helper scripts: `~/.conky/hwinfo.py`, `~/.conky/check-update.py`
- Images: `~/.conky/images/`
- Autostart: `~/.config/autostart/guideos-conky-custom.desktop`

### Test Mode

The test button allows you to preview your configuration before saving:
- Click "Test" to start a temporary Conky instance
- Click "Test beenden" (End Test) to stop the preview
- Test configurations are stored in `/tmp/guideos-conky-test/`

### Autostart

Enable the "Autostart aktivieren" (Enable Autostart) option to automatically launch your custom Conky configuration on system startup. This will:
- Create an autostart entry for your custom configuration
- Disable the default system Conky (if present)
- Add a 5-second delay to ensure proper initialization

## System Information Modules

The configurator includes the following information modules:

| Module | Description | Update Type |
|--------|-------------|-------------|
| Hostname | System hostname and GuideOS version | Static |
| Kernel | Linux kernel version | Static |
| Uptime | System uptime | Static |
| Updates | Available system updates | Dynamic (15 min) |
| CPU | CPU model and usage | Dynamic (6 hrs info, realtime usage) |
| RAM | RAM information and usage | Dynamic (10 sec) |
| GPU | GPU model | Dynamic (6 hrs) |
| GPU Driver | Graphics driver version | Dynamic (6 hrs) |
| GPU Memory | GPU memory information | Dynamic (6 hrs) |
| Network | Network adapter details | Dynamic (10 sec) |
| Disk | Disk usage statistics | Dynamic (10 sec) |

## Customization Tips

### Custom Logos
Place custom logo files in one of these locations:
- `./image/` (relative to the configurator)
- `~/.conky/images/`
- System default: `/usr/lib/guideos-conky/images/`

Supported formats: PNG, JPG, JPEG, SVG

### Font Styles
The configurator supports multiple font styles:
- Regular, Bold, Italic, Bold Italic
- Light, Medium, SemiBold
- ExtraBold, Black

### Separator Lines
Add horizontal separator lines between information sections for better visual organization. Use the "Trennlinie einfügen" (Insert Separator) button and reorder as needed.

## Troubleshooting

### Conky doesn't start
- Ensure Conky is installed: `which conky`
- Check the generated configuration: `~/.conky/GuideOS.lua`
- Manually test: `conky -c ~/.conky/GuideOS.lua`

### Fonts not displaying correctly
- Verify Nerd Fonts are installed: `fc-list | grep "Nerd Font"`
- Install additional Nerd Fonts if needed

### Information not updating
- Check that helper scripts are executable: `chmod +x ~/.conky/*.py`
- Verify Python 3 is available: `python3 --version`

### Autostart not working
- Check autostart file: `~/.config/autostart/guideos-conky-custom.desktop`
- Verify file permissions
- Check system logs for startup errors

## Development

### Project Structure
- `SystemInfo`: Defines available system information modules
- `ConkyConfig`: Manages configuration data and Lua generation
- `InfoRow`/`SeparatorRow`: UI components for information items
- `ConkyConfiguratorWindow`: Main application window
- `ConkyConfiguratorApp`: GTK application wrapper

### Adding Custom Information Modules

To add a new information module, extend the `AVAILABLE_INFOS` list in the `SystemInfo` class:

```python
{
    "id": "custom_info",
    "label": "Custom Info",
    "icon": "guideos-conky.svg",
    "script": "custom-script.py",
    "var": None,
    "interval": 60
}
```

## License

MIT License

## Credits

Developed for GuideOS - A user-friendly Linux distribution

## Contributing

Contributions are welcome! Please ensure any pull requests maintain compatibility with GTK4/Libadwaita and follow the existing code style.

## Support

[Linuxguides-Community](https://forum.linuxguides.de/index.php?board/47-guideos/)

