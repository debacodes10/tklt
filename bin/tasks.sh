#!/bin/bash
# Main script

# Import core and helper functions
source ./../src/core/task.sh
source ./../src/core/task.sh
source ./../src/utils/helpers.sh
source ./../src/utils/logging.sh

main () {
	case "$1" in
		add) 
			shift 
			add_task "$@";;
		list) list_tasks "$@";;
		update) shift 
			update_task "$@";;
		delete) shift 
			delete_task "$@";;
		search) shift 
			search_tasks "$@";;
		filter) shift
			list_filtered_tasks "$@";;
		export) export_tasks "$@";;
		help) show_help;;
		*) echo "Invalid command. Use 'help' for available commands.";;
	esac
}

# Running the main script
main "$@"
