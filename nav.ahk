pagination(itr)
{
	ClipSaved := ClipboardAll
	
	clipboard =
	
	MouseGetPos, X, Y

	MouseClick, left, 800, 80

	Send ^c
	ClipWait

	currentURL := clipboard

	page := RegExReplace( currentURL , ".*?(\d+$)", "$1")
	
	if itr = 1
	{
		next := page + 1
		currentURL := RegExReplace( currentURL , "\d+$", next )

	}
	else if itr = -1
	{
		prev := page - 1

		currentURL := RegExReplace( currentURL , "\d+$", prev )
		
	}
	
	clipboard := currentURL

	Send ^v
	Send {Enter}
	
	MouseMove, X, Y
	
	clipboard = ClipSaved
	
	return	
}

#NumpadAdd::
	pagination(1)
return

#NumpadSub::
	pagination(-1)
return
