function onCreate()
	--shiny boiiii
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'MTTheal' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'UndertaleHeal');
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			end
		end
	end

end