# ═══════════════════════════════════════
# FISH — SHELL SHEIKAH (versión macOS)
# Basado en sheikah-slate-os/.config/fish/config.fish
# ═══════════════════════════════════════

# ── ENTORNO: Homebrew y Java 21 ────────
/opt/homebrew/bin/brew shellenv | source
if test -d /opt/homebrew/opt/openjdk@21
    set -gx JAVA_HOME /opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home
    fish_add_path -g /opt/homebrew/opt/openjdk@21/bin
end

if status is-interactive

    # ── INICIALIZAR STARSHIP ─────────────────
    starship init fish | source
    set fish_greeting ""

    # ── LIMPIAR Y MOSTRAR TELEMETRÍA ─────────
    clear
    fastfetch

    # ════════════════════════════════════════
    # SECUENCIA DE AUTENTICACIÓN SHEIKAH
    # ════════════════════════════════════════
    echo ""
    set_color 4b696d
    echo "  ┌─────────────────────────────────┐"
    echo "  │      SISTEMA SHEIKAH v0.55      │"
    echo "  └─────────────────────────────────┘"
    echo ""

    # Checks del sistema animados
    for check in "Protocolo de seguridad" "Cifrado ancestral" "Matriz de datos" "Firma biométrica"
        set_color 4b696d
        echo -n "  ├─ $check... "
        sleep 0.08
        set_color -o 2ecc71
        echo "OK"
        set_color normal
    end

    echo ""
    set_color 4b696d
    echo -n "  ╰─ "
    set_color -o green
    echo -n "ACCESO CONCEDIDO "
    set_color -o 00F0FF
    echo "— UNIDAD: JONATHAN"
    set_color normal
    echo ""

end
