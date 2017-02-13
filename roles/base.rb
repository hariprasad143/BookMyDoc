name "base"
description "Base Server Role"
run_list "recipe[msg]", "recipe[pci]"