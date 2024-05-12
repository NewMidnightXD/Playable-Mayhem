function onCreate()
	--shiny boiiii
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'pixelnote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'PIXELNOTE_assets');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'PIXELnoteSplashes');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end

end