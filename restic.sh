#!/bin/bash
clear
echo
echo "###############################################################"
echo "Bienvenido al Sistema de Copias de Seguridad de Ministra Server"
echo "###############################################################"
while true; do
echo
echo "1. Realizar copia de seguridad"
echo "2. Listar copias de seguridad realizadas"
echo "3. Restaurar una copia de seguridad"
echo "4. Salir"
echo
read -p "Selecciona una opción:" opcion
echo
case $opcion in
    1)
        # Realizar copia de seguridad
        restic -r rclone:gdrive_bk:/ministra_backup -v backup /opt/docker/ministra/ --password-file .passrestic
        ;;
    2)
        # Listar copias de seguridad realizadas
        restic -r rclone:gdrive_bk:/ministra_backup snapshots --password-file .passrestic
        ;;
    3)
        # Restaurar una copia de seguridad
        read -p "Ingresa el número de copia que deseas restaurar: " num_copia
        read -p "Ingresa la ruta donde deseas restaurar la copia: " ruta_copia
        restic -r rclone:gdrive_bk:/ministra_backup restore $num_copia --target $ruta_copia --password-file .passrestic
        ;;
    4)
        echo "Saliendo ..."
        exit 0
        ;;
    *)
        echo "Opción inválida. Intentalo de nuevo."
        ;;
esac

done
