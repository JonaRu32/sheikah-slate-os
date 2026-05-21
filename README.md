
# 📱 Sheikah Slate OS - Hyprland Dotfiles 🗡️

<img width="1920" height="1080" alt="capturaescritorio" src="https://github.com/user-attachments/assets/6b4bd99a-ba6a-4303-8e2d-92493d0ae5ec" />

<img width="1920" height="1080" alt="capturaterminal" src="https://github.com/user-attachments/assets/03a5b3c3-f8ac-4478-9c81-a86ca325460e" />



This is my custom-built desktop environment from scratch on **CachyOS** (Arch Linux). It is carefully designed to emulate the mystical, touch-based interface of a **Sheikah Slate**.

---

### 📦 Core Components (The Arsenal)

To ensure a flawless boot on any machine, install these dependencies via your package manager (`pacman`/`yay`) before deploying:

* **Window Compositor:** `Hyprland` (Wayland)
* **Terminal Emulator:** `Kitty` 🐈
* **Status Bar:** `Waybar` (Custom modules)
* **App Launcher & Menus:** `Rofi` (Wayland fork)
* **Notification Daemon:** `Dunst`
* **Command Shell:** `Fish Shell`
* **Prompt:** `Starship` 🚀
* **GTK Theme Manager:** `nwg-look`
* **System Fetch:** `Fastfetch`

---

### 🎨 Visual Assets (The Chrome)

* **Cursor Theme:** `[Bibata-Modern-Ice]`
* **Fonts:** `[JetBrainsMono Nerd Font]`
* **Window Styling:** Handled via the provided GTK 3.0/4.0 configuration files.

---

### 🚀 Deployment Protocol (Installation)

1. **Authenticate:** Setup your SSH keys on the target machine and link them to GitHub.
2. **Download Blueprints:** Clone this bare repository into your home directory:
   ```bash
   git clone git@github.com:JonaRU32/sheikah-slate-os.git
