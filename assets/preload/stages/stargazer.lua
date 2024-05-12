local xx = 0; --400
local yy = 1375; --1375
local xx2 = 325; --1500
local yy2 = 1375; --750
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;
local tp = false;
local tspeed = 0.5;
local screenshake = false;
local lockscreen = false;
local lockx = 0;
local locky = 0;
local lockzoom = 1;
local angleshit = 0.55;
local anglevar = 0.55;
local noboom = false;


function onCreatePost()
	
    setProperty('gf.alpha', 0);
	
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 1);
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('back','BG/stargazer/back', -650, -450)
	addLuaSprite('back')
	setScrollFactor('back', 0.5, 0.5);
	scaleObject('back', 1.7, 1.7);
	
	makeLuaSprite('backlight','BG/stargazer/backlight', -650, -450)
	addLuaSprite('backlight')
	setScrollFactor('backlight', 0.5, 0.5);
	scaleObject('backlight', 1.7, 1.7);
	setBlendMode('backlight', 'add')
	
	makeAnimatedLuaSprite('DJ2', 'BG/stargazer/DJC', 140, 870)
	addAnimationByPrefix('DJ2', 'idle', 'idle', 24, false)
	scaleObject('DJ2', 1, 1);
	setScrollFactor('DJ2', 0.95, 0.8);
	--addLuaSprite('DJ2')
	
	makeLuaSprite('DJ','BG/stargazer/DJ', -650, -150)
	--addLuaSprite('DJ')
	setScrollFactor('DJ', 0.95,0.95);
	scaleObject('DJ', 1.7, 1.7);
	
	makeLuaSprite('floor','BG/stargazer/floor', -1200, -750)
	scaleObject('floor', 2.1,2.1)
	addLuaSprite('floor')
	
	makeLuaSprite('light','BG/stargazer/light', -1200, -750)
	scaleObject('light', 2.1,2.1)
	addLuaSprite('light', true)
	setBlendMode('light', 'add')
	
	makeLuaSprite('ogstage','BG/stargazer/O2Background', -1400, 750)
	scaleObject('ogstage', 2.1,2.1)
	addLuaSprite('ogstage')
	
	makeLuaSprite('DS','DarkSC', 0, 0)
	addLuaSprite('DS')
	setObjectCamera('DS', 'other')
	setProperty('DS.alpha', 0);
	
	
	setProperty('DJ.visible', false);
	setProperty('DJ2.visible', false);
	setProperty('back.visible', false);
	setProperty('floor.visible', false);
	setProperty('light.visible', false);
	setProperty('backlight.visible', false);
	
	-----------------------------------------

	makeLuaSprite('darkflash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
	
	setProperty('darkflash.alpha', 0);
	setObjectCamera('darkflash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'hud');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'hud');
	
	addLuaSprite('darkflash')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')

	cutoff();
end

function onEvent(name, value1, value2)
	if name == 'Add Camera Zoom' then
	if noboom == false then
	setProperty('light.alpha', 1);
	doTweenAlpha('floorlightboom', 'light', 0.75, 0.1, 'linear');
	setProperty('backlight.alpha', 0.3);
	doTweenAlpha('floorlightboom2', 'backlight', 0.2, 0.1, 'linear');
	end
	if weakflash == true then
	setProperty('flashwhite.alpha', 0.25);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.2, 'linear');
	end
	end
end

function onBeatHit()
    if curBeat % 2 == 0 then
	playAnim('DJ2','idle', true);
		    if beating == true then
			triggerEvent('Add Camera Zoom',0.05,0.06)
			end
	end
    if curBeat > 9999 and curBeat < 9999 then

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*3)
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
end

function onStepHit()

    if curStep == 9999 or curStep == 9999 then
	cuton();
	end
	if curStep == 9999 or curStep == 9999 then
	cutoff();
	end
    if curStep == 240 or curStep == 246 or curStep == 254 or curStep == 516 or curStep == 646 or curStep == 1414 or curStep == 1024 or curStep == 1288 then
	flash();
	end
	if curStep == 1536 or curStep == 9999 then
	flashdark();
	end
	if curStep == 515 or curStep == 1288 then
	xx = 250;
    xx2 = 250; 
	yy = 1230;
    yy2 = 1230;
	cuton();
	end
	if curStep == 768 or curStep == 1520 then
	xx = 0
	xx2 = 525
	yy = 1275;
    yy2 = 1275;
	cutoff();
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	beating = true;
	end
	if curStep == 9999 or curStep == 9999 then
	beating = false;
	end
	if curStep == 256 or curStep == 9999 then
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	if curStep == 9999 or curStep == 9999 then
	triggerEvent('Camera Follow Pos',xx2,yy2)
	end
	----
	if curStep == 234 then
	doTweenAlpha('oochangedastageooo', 'ogstage', 0.3, 1.5, 'linear');
	xx2 = 625;
	end
	if curStep == 254 then
	setProperty('ogstage.alpha', 1);
	setProperty('DJ.visible', true);
	setProperty('DJ2.visible', true);
	setProperty('back.visible', true);
	setProperty('floor.visible', true);
	setProperty('light.visible', true);
	setProperty('backlight.visible', true);
	setProperty('ogstage.visible', false);
	xx2 = 525;
	yy = 1275;
    yy2 = 1275;
	setProperty('DS.alpha', 0.15);
	end
	if curStep == 1536 then
	setProperty('DJ.visible', false);
	setProperty('DJ2.visible', false);
	setProperty('back.visible', false);
	setProperty('floor.visible', false);
	setProperty('light.visible', false);
	setProperty('backlight.visible', false);
	setProperty('ogstage.visible', true);
	setProperty('DS.alpha', 0);
	xx2 = 325;
	yy = 1375;
    yy2 = 1375;
	end
	if curStep == 768 then
	noboom = true;
	setProperty('darkflash.alpha', 1);
	doTweenAlpha('flashdowndark', 'darkflash', 0.2, 3, 'linear');
	setProperty('DS.alpha', 0.3);
	end
	if curStep == 1024 then
	setProperty('darkflash.alpha', 0);
	setProperty('DS.alpha', 0.15);
	noboom = false;
	end
	if curStep == 1152 or curStep == 9999 then
	weakflash = true;
	end
	if curStep == 1264 or curStep == 9999 then
	weakflash = false;
	end
end

function onUpdate()
	
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	
	if lockscreen == true then
	setProperty('camFollowPos.x',lockx)
    setProperty('camFollowPos.y',locky)
	setProperty('camGame.zoom',lockzoom)
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
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
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
    setProperty('flashwhite.alpha', 0.75);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('darkflash.alpha', 1);
	doTweenAlpha('flashdowndark', 'darkflash', 0, 3, 'linear');
end

function introflash()
    setProperty('darkflash.alpha', 0);
	doTweenAlpha('beepflash', 'darkflash', 1, 0.1, 'linear');
end

function introflash2()
    setProperty('darkflash.alpha', 1);
	doTweenAlpha('beepflash2', 'darkflash', 0, 0.1, 'linear');
end

function cuton()
    doTweenY('CSUPY', 'csup', 0, 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', 0, 1, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', -100, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', 100, 1, 'CircInOut');
end

function opponentNoteHit()
    if screenshake == true then
        triggerEvent('Screen Shake','0.02, 0.01','0.1, 0.0075');
	end
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end