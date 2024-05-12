local xx = 475; --750
local yy = 1375; --750
local xx2 = -150; --1500
local yy2 = 1450; --750
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;
local tp = false;


function onCreatePost()
    setProperty('gf.alpha', 0);
	setProperty('boyfriend.alpha', 0);
	setProperty('camHUD.alpha', 0);
    triggerEvent('Camera Follow Pos',xx2,yy2)
	triggerEvent('Play Animation','fake','dad')
	
	
	--addCharacterToList('darkwar')
	
	makeAnimatedLuaSprite('cutyellow','yellow dialgues', -850, 1270)
	scaleObject('cutyellow', 2.1, 2.1)
	addAnimationByPrefix('cutyellow','loop','1_cut', 24, false)
	
	makeLuaSprite('main','BG/stebbedback/main', -1200, 400)
	scaleObject('main', 2.1, 2.1)
	addLuaSprite('main')
	makeLuaSprite('light','BG/stebbedback/light', -1200, 400)
	scaleObject('light', 2.1,2.1)
	addLuaSprite('light', true)
	makeLuaSprite('dark','BG/stebbedback/shade', -1200, 400)
	scaleObject('dark', 2.1, 2.1)
	addLuaSprite('dark', true)
	setProperty('dark.alpha', 0.6);
	
	makeLuaSprite('flashback1','BG/stebbedback/flashback1', -1550, 200)
	scaleObject('flashback1', 2.1,2.1)
	addLuaSprite('flashback1', true)
	setProperty('flashback1.alpha', 0);
	
	makeLuaSprite('flashback2','BG/stebbedback/flashback2', -1550, -50)
	scaleObject('flashback2', 2.1,2.1)
	addLuaSprite('flashback2', true)
	setProperty('flashback2.alpha', 0);
	
	
	setBlendMode('dark', 'MULTIPLY')
	setBlendMode('light', 'add')
	
	
	makeLuaSprite('darkflash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
	makeLuaSprite('end1','BG/stebbedback/end1', 0, 0)
	scaleObject('end1', 2.1,2.1)
	makeLuaSprite('end2','BG/stebbedback/end2', 0, 0)
	scaleObject('end2', 2.1,2.1)
	
	addLuaSprite('cutyellow', true)
	
	
	
	-----------------------------------------
	setProperty('darkflash.alpha', 1);
	setObjectCamera('darkflash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	setProperty('end1.alpha', 0);
	setObjectCamera('end1', 'other');
	setProperty('end2.alpha', 0);
	setObjectCamera('end2', 'other');
	
	addLuaSprite('darkflash')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	addLuaSprite('end1')
	addLuaSprite('end2')
	
	
	cuton();
end

function onBeatHit()
    if curBeat % 2 == 0 then
		if beating == true then
		 triggerEvent('Add Camera Zoom', 0.025, 0.045)
		 triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.01');
		end
	end
end

function onStepHit()
    middle = getPropertyFromClass('ClientPrefs', 'middleScroll')
	if middle == false then
	    if curStep == 415 then
		tp = true;
	        for i=0, 3 do
		   		noteTweenX('NoteX'..i, i, _G['defaultOpponentStrumX'..i] + 650, 1.25, 'sineInOut')
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
	        end
			for i=0, 3 do
		   		noteTweenX('NoteX'..i+4, i+4, _G['defaultOpponentStrumX'..i] + 0, 1.25, 'sineInOut')
				setPropertyFromGroup('strumLineNotes', i+4, 'alpha', 1)
	        end
	    end
	end
	-------------------
    if curStep == 1 or curStep == 9999 then
	cuton();
	end
	if curStep == 280 or curStep == 9999 then
	cutoff();
	end
    if curStep == 1 or curStep == 288 or curStep == 1184 then
	flash();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 256 or curStep == 800 then
	xx = 100
	xx2 = 100
	yy = 1350
	yy2 = 1350
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 288 or curStep == 1184 then
	xx = 475; 
    yy = 1375; 
    xx2 = -150; 
    yy2 = 1450; 
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	-----
	if curStep == 800 then
	flash()
	setProperty('main.alpha', 0);
	setProperty('light.alpha', 0);
	triggerEvent('Change Character',0,'yellow_bw')
	triggerEvent('Change Character',1,'grey_bw')
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	setProperty('darkflash.alpha', 1);
	setProperty('healthBar.alpha', tonumber(0))
    setProperty('iconP1.alpha', tonumber(0))
    setProperty('iconP2.alpha', tonumber(0))
	cuton();
	yy = 1450
	yy2 = 1450
	end
	if curStep == 892 then
	setProperty('flashwhite.alpha', 0);
	doTweenAlpha('waaaaaaaa', 'flashwhite', 1, 1.8, 'linear');
	end
	if curStep == 928 then
	setProperty('light.alpha', 0);
	setProperty('main.alpha', 0);
	setProperty('dark.alpha', 0);
	setProperty('flashwhite.alpha', 0);
	setProperty('darkflash.alpha', 0);
	
	
	setProperty('flashback1.alpha', 0.45);
	end
	if curStep == 1056 then
	setProperty('flashback1.alpha', 0);
	setProperty('flashback2.alpha', 0.45);
	end
	if curStep == 1184 then
	cutoff();
	setProperty('flashback1.alpha', 0);
	setProperty('flashback2.alpha', 0);
	
	setProperty('light.alpha', 1);
	setProperty('main.alpha', 1);
	setProperty('dark.alpha', 0.6);
	
	setProperty('healthBar.alpha', tonumber(1))
    setProperty('iconP1.alpha', tonumber(1))
    setProperty('iconP2.alpha', tonumber(1))
	
	triggerEvent('Change Character',0,'yellow')
	triggerEvent('Change Character',1,'grey')
	end
	if curStep == 1 then
	setProperty('darkflash.alpha', 0);
	objectPlayAnimation('cutyellow','loop',true);
	end
	if curStep == 256 then
	triggerEvent('Play Animation','start','dad')
	end
	if curStep == 280 then
	doTweenAlpha('imgonnakillyo', 'flashwhite', 1, 0.6, 'linear');
	end
	if curStep == 288 then
	setProperty('darkflash.alpha', 0);
	setProperty('camHUD.alpha', 1);
	setProperty('cutyellow.alpha', 0);
	setProperty('boyfriend.alpha', 1);
	end
	if curStep == 1744 then
	setProperty('darkflash.alpha', 1);
	end
	if curStep == 1760 then
	doTweenAlpha('end1', 'end1', 1, 5, 'linear');
	end
	if curStep == 1866 then
	doTweenAlpha('end1out', 'end1', 0, 1.5, 'linear');
	doTweenAlpha('end2', 'end2', 1, 1.5, 'linear');
	end
	if curStep == 1888 then
	setProperty('end1.alpha', 0);
	setProperty('end2.alpha', 0);
	end
end



function onUpdate()
    if tp == false then
	    for i=0, 3 do
	    setPropertyFromGroup('strumLineNotes', i, 'alpha', 0.3)
		end
	end
	
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
			end

        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('darkflash.alpha', 1);
	doTweenAlpha('flashdowndark', 'darkflash', 0, 3, 'linear');
end

function goodNoteHit()
    health = getProperty('health')
    setProperty('health', health- 0.01);
end

function opponentNoteHit()
    health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.0035);
		end
end

function noteMiss()
	health = getProperty('health')
    setProperty('health', health- 0.1);
end

function cuton()
    doTweenY('CSUPY', 'csup', 0, 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', 0, 1, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', -100, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', 100, 1, 'CircInOut');
end