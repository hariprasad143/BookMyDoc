force_default["apache"]["indexfile"] = "index1.html"
default["apache"]["sites"]["clowns"] = { "port" => 80 }
automatic["apache"]["sites"]["bears"] = { "port" => 81 }
default["apache"]["sites"]["cat"] = { "port" => 82 }
default["apache"]["sites"]["dog"] = { "port" => 83 }