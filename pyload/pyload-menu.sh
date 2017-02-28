#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage pyLoad" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Exit" $LINES $COLUMNS $NETLINES \
"Install" "Install pyLoad" \
"Uninstall" "Uninstall pyLoad" \
"Backup" "Backup pyLoad settings" \
"Restore" "Restore pyLoad settings from a previous backup" \
"Manual Update" "Manually update pyLoad" \
"Reset Password" "Reset pyLoad WebUI password" \
"Access Details" "View pyLoad access details" \
"Access Switch" "Toggle pyLoad UI network accessibility" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    source $SCRIPTPATH/pyload/pyload-constants.sh
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/pyload/pyload-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/pyload/pyload-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/inc/app-backup-controller.sh ;;
		"Restore" ) source $SCRIPTPATH/inc/app-restore-controller.sh ;;
		"Manual Update" ) source $SCRIPTPATH/pyload/pyload-update.sh ;;
        "Reset Password" ) source $SCRIPTPATH/inc/app-password-reset-controller.sh ;;
        "Access Details" ) source $SCRIPTPATH/inc/app-access-details.sh ;;
        "Access Switch" ) source $SCRIPTPATH/inc/app-access-switch.sh ;;
        "Go Back" ) source $SCRIPTPATH/menus/menu-pvrs.sh ;;
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/thankyou.sh
    echo
    sleep 1
fi
