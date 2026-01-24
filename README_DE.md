# GuideOS Conky Configurator

Ein GTK4/Libadwaita GUI-Tool zum Erstellen und Anpassen von Conky-Konfigurationen für GuideOS.

## Übersicht

Der GuideOS-Conky Konfigurator ist eine benutzerfreundliche grafische Anwendung, mit der du deinen Conky-Systemmonitor ganz einfach konfigurieren und anpassen kannst, ohne Konfigurationsdateien manuell bearbeiten zu müssen. Die Anwendung bietet eine intuitive Oberfläche zur Anpassung von Aussehen, Positionierung, Systeminformationsanzeige und Autostart-Einstellungen.

## Features

### Visuelle Anpassung
- **Schriftarten-Konfiguration**: Wähle aus installierten Nerd Fonts mit separaten Größen- und Stileinstellungen für kleine, mittlere und große Texte
- **Farbschemas**: Passe Textfarbe, Akzentfarbe und Hintergrundfarbe mit visuellen Farbwählern an
- **Hintergrund-Einstellungen**: Schalte Transparenz um und passe Alpha-Werte an
- **Logo-Anzeige**: Wähle und positioniere eigene Logos mit anpassbarer Größe und Abstand

### Systeminformations-Anzeige
- Konfiguriere, welche Systeminformationen angezeigt werden sollen:
  - Hostname und Kernel-Version
  - System-Laufzeit
  - Verfügbare Updates
  - CPU-, RAM-, GPU-Informationen
  - GPU-Treiber und Speicherdetails
  - Netzwerk-Statistiken
  - Festplatten-Nutzung
- Ordne Informationselemente mit Auf-/Ab-Buttons neu an
- Füge eigene Trennlinien zwischen Abschnitten hinzu
- Konfiguriere Update-Intervalle für dynamische Informationen

### Positionierung
- Wähle aus 9 Ausrichtungsoptionen (oben/mitte/unten × links/mitte/rechts)
- Passe Abstände zu Bildschirmrändern an
- Multi-Monitor-Unterstützung

### Erweiterte Optionen
- Live-Vorschau mit Testmodus
- Autostart-Konfiguration
- Anpassbare Zeilenabstände und Textversatz-Einstellungen
- Importiere existierende Konfigurationen

## Voraussetzungen

### Abhängigkeiten
- Python 3.x
- GTK 4.0
- Libadwaita 1
- Conky
- Python GObject Introspection (`python-gi` oder `python3-gi`)

### Systemanforderungen
- Linux-basiertes System (entwickelt für GuideOS)
- X11 oder Wayland Display-Server
- Nerd Fonts (empfohlen: UbuntuMono Nerd Font, FiraCode Nerd Font, JetBrainsMono Nerd Font)

## Installation

1. Stelle sicher, dass alle Abhängigkeiten installiert sind:
```bash
# Für Debian/Ubuntu-basierte Systeme
sudo apt install python3 gir1.2-gtk-4.0 gir1.2-adw-1 python3-gi conky-all


# Für Arch-basierte Systeme
sudo pacman -S python gtk4 libadwaita python-gobject conky
```

2. Installiere die erforderlichen Nerd Fonts (optional, aber empfohlen)

3. Platziere das Configurator-Skript an einem geeigneten Ort:
```bash
chmod +x guideos-conky-configurator.py
```

## Verwendung

### Anwendung starten

Starte den Configurator mit:
```bash
python guideos-conky-configurator.py
```

Oder:
```bash
./guideos-conky-configurator.py
```

### Konfigurations-Workflow

1. **Logo-Einstellungen**: Wähle dein bevorzugtes Logo und passe Größe und Position an
2. **Erscheinungsbild**: Wähle Schriftarten, Farben und Transparenz-Einstellungen
3. **Position**: Lege die Anzeigeposition auf deinem Bildschirm fest
4. **Systeminformationen**: Aktiviere/deaktiviere und ordne die anzuzeigenden Informationen
5. **Test**: Klicke auf "Test", um deine Konfiguration ohne Speichern in der Vorschau anzuzeigen
6. **Speichern**: Klicke auf "Speichern", um deine Konfiguration anzuwenden und zu sichern

### Konfigurationsdateien

- Hauptkonfiguration: `~/.conky/GuideOS.lua`
- Hilfsskripte: `~/.conky/hwinfo.py`, `~/.conky/check-update.py`
- Bilder: `~/.conky/images/`
- Autostart: `~/.config/autostart/guideos-conky-custom.desktop`

### Testmodus

Der Test-Button ermöglicht es dir, deine Konfiguration vor dem Speichern in der Vorschau anzuzeigen:
- Klicke auf "Test", um eine temporäre Conky-Instanz zu starten
- Klicke auf "Test beenden", um die Vorschau zu stoppen
- Test-Konfigurationen werden in `/tmp/guideos-conky-test/` gespeichert

### Autostart

Aktiviere die Option "Autostart aktivieren", um deine benutzerdefinierte Conky-Konfiguration beim Systemstart automatisch zu laden. Dies wird:
- Einen Autostart-Eintrag für deine benutzerdefinierte Konfiguration erstellen
- Das Standard-System-Conky deaktivieren (falls vorhanden)
- Eine 5-Sekunden-Verzögerung hinzufügen, um eine ordnungsgemäße Initialisierung sicherzustellen

## Systeminformations-Module

Der Konfigurator enthält die folgenden Informationsmodule:

| Modul | Beschreibung | Update-Typ |
|-------|--------------|------------|
| Hostname | System-Hostname und GuideOS-Version | Statisch |
| Kernel | Linux-Kernel-Version | Statisch |
| Laufzeit | System-Laufzeit | Statisch |
| Updates | Verfügbare System-Updates | Dynamisch (15 Min.) |
| CPU | CPU-Modell und Auslastung | Dynamisch (6 Std. Info, Echtzeit-Auslastung) |
| RAM | RAM-Informationen und Auslastung | Dynamisch (10 Sek.) |
| GPU | GPU-Modell | Dynamisch (6 Std.) |
| GPU Treiber | Grafiktreiber-Version | Dynamisch (6 Std.) |
| GPU Speicher | GPU-Speicherinformationen | Dynamisch (6 Std.) |
| Netzwerk | Netzwerkadapter-Details | Dynamisch (10 Sek.) |
| Disk | Festplatten-Nutzungsstatistiken | Dynamisch (10 Sek.) |

## Anpassungs-Tipps

### Eigene Logos
Platziere eigene Logo-Dateien in einem dieser Verzeichnisse:
- `./image/` (relativ zum Configurator)
- `~/.conky/images/`
- System-Standard: `/usr/lib/guideos-conky/images/`

Unterstützte Formate: PNG, JPG, JPEG, SVG

### Schriftstile
Der Configurator unterstützt mehrere Schriftstile:
- Regular, Bold, Italic, Bold Italic
- Light, Medium, SemiBold
- ExtraBold, Black

### Trennlinien
Füge horizontale Trennlinien zwischen Informationsabschnitten für eine bessere visuelle Organisation hinzu. Verwende den Button "Trennlinie einfügen" und ordne sie nach Bedarf neu an.

## Problembehandlung

### Conky startet nicht
- Stelle sicher, dass Conky installiert ist: `which conky`
- Überprüfe die generierte Konfiguration: `~/.conky/GuideOS.lua`
- Manueller Test: `conky -c ~/.conky/GuideOS.lua`

### Schriftarten werden nicht korrekt angezeigt
- Überprüfe, ob Nerd Fonts installiert sind: `fc-list | grep "Nerd Font"`
- Installiere bei Bedarf zusätzliche Nerd Fonts

### Informationen werden nicht aktualisiert
- Überprüfe, ob Hilfsskripte ausführbar sind: `chmod +x ~/.conky/*.py`
- Stelle sicher, dass Python 3 verfügbar ist: `python3 --version`

### Autostart funktioniert nicht
- Überprüfe die Autostart-Datei: `~/.config/autostart/guideos-conky-custom.desktop`
- Überprüfe Dateiberechtigungen
- Prüfe System-Logs auf Startfehler

## Entwicklung

### Projektstruktur
- `SystemInfo`: Definiert verfügbare Systeminformations-Module
- `ConkyConfig`: Verwaltet Konfigurationsdaten und Lua-Generierung
- `InfoRow`/`SeparatorRow`: UI-Komponenten für Informationselemente
- `ConkyConfiguratorWindow`: Hauptanwendungsfenster
- `ConkyConfiguratorApp`: GTK-Anwendungs-Wrapper

### Eigene Informationsmodule hinzufügen

Um ein neues Informationsmodul hinzuzufügen, erweitere die `AVAILABLE_INFOS`-Liste in der `SystemInfo`-Klasse:

```python
{
    "id": "custom_info",
    "label": "Eigene Info",
    "icon": "guideos-conky.svg",
    "script": "custom-script.py",
    "var": None,
    "interval": 60
}
```

## Lizenz

MIT Lizenz

## Credits

Entwickelt für GuideOS - Eine benutzerfreundliche Linux-Distribution

## Mitwirken

Beiträge sind willkommen! Bitte stelle sicher, dass Pull Requests die Kompatibilität mit GTK4/Libadwaita beibehalten und dem bestehenden Code-Stil folgen.

## Support

[LinuxGuides-Comunity](https://forum.linuxguides.de/index.php?board/47-guideos/)
