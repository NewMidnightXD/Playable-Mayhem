local xx = 100; --400
local yy = 1375; --1375
local xx2 = 555; --1500
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


function onCreatePost()
	
    setProperty('gf.alpha', 0);
	
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 0);
	doTweenColor('boyfriend', 'boyfriend', '000000', 0.1, 'linear')
	
	triggerEvent('Camera Follow Pos',xx,yy)
	setProperty('camFollowPos.x',xx)
    setProperty('camFollowPos.y',yy)
	
	makeLuaSprite('back','BG/susmogs/what the actual fuck is this', -600, 0)
	addLuaSprite('back')
	setScrollFactor('back', 0.35, 0.35);
	scaleObject('back', 1.8, 1.8);
	
	makeLuaSprite('omgtoobrightbg','flashwhite', -1800, -450)
	addLuaSprite('omgtoobrightbg')
	scaleObject('omgtoobrightbg', 5, 5);
	setProperty('omgtoobrightbg.alpha', 1);
	
	makeAnimatedLuaSprite('mitorispin', 'BG/susmogs/mitorispin', 140, 870)
	addAnimationByPrefix('mitorispin', 'idle', 'idle', 36, true)
	scaleObject('mitorispin', 1.9, 1.9);
    addLuaSprite('mitorispin')


    makeAnimatedLuaSprite('pinkdemon', 'BG/susmogs/the creature', -740, 1070)
	addAnimationByPrefix('pinkdemon', 'idle', 'idle', 24, true)
	scaleObject('pinkdemon', 1.9, 1.9);
    addLuaSprite('pinkdemon')
	
	makeLuaSprite('DS','DarkSC', 0, 0)
	addLuaSprite('DS')
	setObjectCamera('DS', 'other')
	setProperty('DS.alpha', 0.15);
	
	makeLuaSprite('sans','BG/susmogs/SANS', 1500, 1070)
	addLuaSprite('sans')
	scaleObject('sans', 1.5, 1.5);
	
	makeLuaSprite('SHIRO','BG/susmogs/SHIROS', -1500, 1070)
	addLuaSprite('SHIRO')
	scaleObject('SHIRO', 1.5, 1.5);
	
	makeLuaSprite('ugly','BG/susmogs/ugly', 1500, 1070)
	addLuaSprite('ugly')
	scaleObject('ugly', 1.5, 1.5);
	
	makeLuaSprite('MMIR','BG/susmogs/MMIR', -1500, 1070)
	addLuaSprite('MMIR')
	scaleObject('MMIR', 1.5, 1.5);
	
	makeLuaSprite('GRANDPINK','BG/susmogs/GRANDPINK', 1500, 1070)
	addLuaSprite('GRANDPINK')
	scaleObject('GRANDPINK', 1.5, 1.5);
	
	
	
	setProperty('mitorispin.visible', false);
	setProperty('pinkdemon.visible', false);
	
	-----------------------------------------

	makeLuaSprite('darkflash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
	
	setProperty('darkflash.alpha', 1);
	setObjectCamera('darkflash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	
	addLuaSprite('darkflash')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	
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
	if curStep == 376 or curStep == 9999 then
	cutoff();
	end
    if curStep == 1 or curStep == 9999 then
	flash();
	end
	if curStep == 128 or curStep == 9999 then
	flashdark();
	end
	if curStep == 9999 or curStep == 9999 then
	xx = 250;
    xx2 = 250; 
	yy = 1230;
    yy2 = 1230;
	cuton();
	end
	if curStep == 9999 or curStep == 9999 then
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
	if curStep == 1 then
	doTweenAlpha('beepflash', 'darkflash', 0, 10, 'linear');
	end
	if curStep == 112 then
	doTweenAlpha('hudfade', 'camHUD', 1, 2, 'linear');
	end
	if curStep == 376 then
	doTweenAlpha('beepflash', 'darkflash', 1, 0.5, 'linear');
	end
	if curStep == 384 then
	setProperty('darkflash.alpha', 0);
	triggerEvent('Change Character',1,'realred')
	triggerEvent('Change Character',0,'suckbf')
	ofs = 0;
	setProperty('mitorispin.visible', true);
	setProperty('pinkdemon.visible', true);
	setProperty('omgtoobrightbg.visible', false);
	doTweenColor('boyfriend', 'boyfriend', 'FFFFFF', 0.1, 'linear')
	end
	if curStep == 1968 then
	doTweenAlpha('endendend', 'darkflash', 1, 5, 'linear');
	end
	if curStep == 535 then
	doTweenX('sansmove', 'sans', -1500, 10, 'linear')
	end
	if curStep == 743 then
	doTweenX('SHIROISMOVING', 'SHIRO', 2000, 10, 'linear')
	end
	if curStep == 1056 then
	doTweenX('uglymove', 'ugly', -1500, 10, 'linear')
	end
	if curStep == 1296 then
	doTweenX('MMIR', 'MMIR', 2000, 10, 'linear')
	end
	if curStep == 1626 then
	doTweenX('GRANDPINK', 'GRANDPINK', -1500, 10, 'linear')
	end
end

function onUpdate()
    
	setProperty('health', 1);
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