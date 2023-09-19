#!/bin/sh

current_workspace()
{

    current_workspace=$(hyprctl activeworkspace | sed '/)/'q)
    last=$current_workspace

    while [ true ]
    do
        
        workspace_number=$(hyprctl workspaces | sed "/$current_workspace/q" | grep -c "workspace ID")
        echo "$workspace_number"

        while [ "$current_workspace" == "$last" ]
        do
            sleep .3s
            current_workspace=$(hyprctl activeworkspace | sed '/)/'q)
        done
        last=$current_workspace

    done
}

workspace_count() {
    workspace_count=$(hyprctl workspaces | grep -c "workspace ID")
	echo "$workspace_count"
}

[ "$1" = "current_workspace" ] && current_workspace
[ "$1" = "workspace_count" ] && workspace_count && exit