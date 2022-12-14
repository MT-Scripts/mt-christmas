# MT Christmas
Simple christmas script for QBCore

# Preview:
<a target="_blank" href="https://streamable.com/6iiofk">Click to see preview<a>

# Features:
- Pick gifts that are on different places in map (can be added or change locations at config)
- Open the gifts and get prizes
- 3 types of prizes (Normal, Rare and RealRare)
- Pressing E open an menu with option to make an snow man or pick snow balls

# Dependicies:
- qb-core
- qb-target
- qb-menu

# Installation:
Add to qb-core/shared/items.lua
```
	['christmas_gift'] 			 = {['name'] = 'christmas_gift', 				['label'] = 'Christmas Gift', 				['weight'] = 500, 		['type'] = 'item', 		['image'] = 'christmas_gift.png', 		['unique'] = true, 		['useable'] = false, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'What about give it to someone?'},

```

# Credits:
Gift prop used from: https://github.com/vames-dev/vms_christmasevent
