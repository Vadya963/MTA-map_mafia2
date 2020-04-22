for obj in selection do
(
 	convertToMesh obj
	meshop.deleteIsoVerts obj
	
 	f = #{}
	for i = 1 to obj.numfaces do
		if abs (meshop.getFaceArea obj i) < 0.001 then append f i
	
	if not f.isEmpty then
	(
		meshop.deleteFaces obj f
		format "%: % faces deleted\n" obj.name f.numberset
	)
	else format "% have no zero-area faces\n" obj.name
)