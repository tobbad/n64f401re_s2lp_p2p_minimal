#!/usr/bin/bash
SRC_DIR="."
FILES_TO_COPY=(
    "Core/Src/payload.c"
    "Core/Inc/payload.h"
    "Core/Inc/AppliFrame.h"
    "Core/Src/AppliFrame.c"
    "Core/Src/radio.c"
    "Core/Inc/radio.h"
    "Core/Src/persistence.c"
    "Core/Inc/persistence.h"
)
#    "X-CUBE-SUBG2/App/p2p_demo_settings.h" different frequencies/bus
#    "X-CUBE-SUBG2/App/app_x-cube-subg2.h"
#    "X-CUBE-SUBG2/App/app_x-cube-subg2.c"
#    "X-CUBE-SUBG2/Target/s2lp_management.c"
#    "Drivers/BSP/S2868A2/s2868a2.c"
#    "Drivers/BSP/S2868A2/s2868a2.h"
#    "Drivers/BSP/Components/S2LP/s2lp.c"
#    "Drivers/BSP/Components/S2LP/s2lp.h"
#    "Drivers/BSP/Components/S2LP/S2LP_CORE_SPI.h"

# --- Funktion zum Kopieren der Dateien ---
copy_files() {
    local src="$1"
    local dst="$2"
    shift 2
    local files=("$@")

    echo "Kopiere Dateien von $src nach $dst ..."

    for file in "${files[@]}"; do
        if [[ -f "$src/$file" ]]; then
            echo "Kopiere: $file"
            echo cp "$src/$file" "$dst/"
        else
            echo " Datei nicht gefunden: $file"
        fi
    done

    echo "Fertig!"
}

DST_DIR="../n64l476rg_s2lp_p2p/"
copy_files "$SRC_DIR" "$DST_DIR" "${FILES_TO_COPY[@]}"

DST_DIR="../n64f401re_s2lp_p2p/"
copy_files "$SRC_DIR" "$DST_DIR" "${FILES_TO_COPY[@]}"

DST_DIR="../n64l476rg_radio_bell/"
copy_files "$SRC_DIR" "$DST_DIR" "${FILES_TO_COPY[@]}"
