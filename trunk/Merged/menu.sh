#!/bin/bash -e
echo Starting menu ...
PS3='Please choose operation (press Enter to display options): '
options=("Compile" "Execute" "Clean All" "Tar" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Compile")
			sh Scripts/compile.sh
            ;;
        "Execute")
			sh Scripts/fast.sh
            ;;
		"Clean All")
			make clean
			;;
		"Tar")
			make tar
			;;
        "Quit")
			echo "Quitting menu."
            break
            ;;
        *) echo "Invalid option (press Enter for menu)";;
    esac
done
echo Menu terminated.