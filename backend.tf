terraform { 
  cloud { 
    
    organization = "newtglobalRTF" 

    workspaces { 
      name = "alloydb" 
    } 
  } 
}