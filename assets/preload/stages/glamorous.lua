local xx = -200; --750
local yy = 1375; --750
local xx2 = 150; --1500
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

function onCreatePost()
    
	
    setProperty('gf.alpha', 1);
	setProperty('boyfriend.alpha', 1);
	setProperty('camHUD.alpha', 1);
    triggerEvent('Camera Follow Pos',xx,yy)
	
	makeAnimatedLuaSprite('pixelback','BG/MTT/pixelBG', -1800, 150)
	addAnimationByPrefix('pixelback','loop','stand', 12, true)
	addLuaSprite('pixelback')
	scaleObject('pixelback', 4.2, 4.2);
	setProperty('pixelback.alpha', 1);
	addLuaSprite('pixelback')

	makeLuaSprite('main','BG/MTT/bg1', -1500, -350)
	scaleObject('main', 2.1,2.1)
	addLuaSprite('main')
	setProperty('main.alpha', 1);
	
	makeLuaSprite('main2','BG/MTT/bg1-undertale', -1500, -350)
	scaleObject('main2', 2.1,2.1)
	addLuaSprite('main2')
	setProperty('main2.alpha', 0);
	
	makeLuaSprite('light','BG/MTT/light', -1500, -150)
	scaleObject('light', 2.1,2.1)
	addLuaSprite('light', true)
	setProperty('light.alpha', 0.7);
	setBlendMode('light', 'add')
	
	makeLuaSprite('light2','BG/MTT/light2', -1500, -150)
	scaleObject('light2', 2.1,2.1)
	addLuaSprite('light2', true)
	setProperty('light2.alpha', 0);
	setBlendMode('light2', 'add')
	
	makeLuaSprite('core-watchers','BG/MTT/core-watchers', -1850, 2150)
	scaleObject('core-watchers', 2.1,2.1)
	addLuaSprite('core-watchers')
	setProperty('core-watchers.alpha', 0);
	setScrollFactor('core-watchers', 0.5, 0.5);
	
	makeLuaSprite('core-up1','BG/MTT/core-up', -1850, -350)
	scaleObject('core-up1', 2.1,2.1)
	addLuaSprite('core-up1')
	setProperty('core-up1.alpha', 0);
	setBlendMode('core-up1', 'add')
	
	makeLuaSprite('core-up2','BG/MTT/core-up', -1850, -2850)
	scaleObject('core-up2', 2.1,2.1)
	addLuaSprite('core-up2')
	setProperty('core-up2.alpha', 0);
	setBlendMode('core-up2', 'add')
	
	makeLuaSprite('core','BG/MTT/core', -2200, -420)
	scaleObject('core', 2.1,2.1)
	addLuaSprite('core')
	setProperty('core.alpha', 0);

	
	makeLuaSprite('core-light','BG/MTT/core-light', -1850, -350)
	scaleObject('core-light', 2.1,2.1)
	addLuaSprite('core-light', true)
	setProperty('core-light.alpha', 0);
	setBlendMode('core-light', 'add')
	
	doTweenY('tweencore1', 'core-up1', 2150, tspeed, 'linear');
	doTweenY('tweencore2', 'core-up2', -350, tspeed, 'linear');
	runTimer('tweencore', tspeed);
	
	


	
	
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
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	
	addLuaSprite('darkflash')
	addLuaSprite('flashwhite')
	addLuaSprite('csup')
	addLuaSprite('csdown')
	
	addCharacterToList('MTT-dark')
	addCharacterToList('MTT-bf-dark')
	addCharacterToList('MTT-gf-dark')
	addCharacterToList('MTT-EX')
	addCharacterToList('MTT-gf-core')
	
	precacheImage('main2')
	precacheImage('pixelback1')
	
	cutoff();
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'tweencore' then
	runTimer('tweencore', tspeed);
	setProperty('core-up1.y', -350);
	setProperty('core-up2.y', -2850);
 	doTweenY('tweencore1', 'core-up1', 2150, tspeed, 'linear');
	doTweenY('tweencore2', 'core-up2', -350, tspeed, 'linear');
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
		if beating == true then
		 triggerEvent('Add Camera Zoom', 0.025, 0.045)
		end
	end
end

function onStepHit()
    if curStep == 192 or curStep == 576 or curStep == 769 then
	cuton();
	setObjectCamera('csup', 'hud');
	setObjectCamera('csdown', 'hud');
	end
	if curStep == 448 or curStep == 640 then
	cutoff();
	end
    if curStep == 192 or curStep == 576 or curStep == 1088 then
	flash();
	end
	if curStep == 9999 or curStep == 9999 then
	flashdark();
	end
	if curStep == 448 or curStep == 640 or curStep == 896 then
	xx = -200;
    xx2 = 150; 
	end
	if curStep == 192 or curStep == 576 or curStep == 769 or curStep == 1088 then
	xx = 50;
    xx2 = 50; 
	triggerEvent('Camera Follow Pos',xx,yy)
	end
	----
	if curStep == 1 then
	cuton();
	doTweenAlpha('introhudfade', 'camHUD', 0, 1, 'linear');
	triggerEvent('Set Cam Zoom',0.8,3)
	end
	if curStep == 64 then
	cutoff();
	doTweenAlpha('introhudfade', 'camHUD', 1, 1, 'linear');
	triggerEvent('Set Cam Zoom',0.7,0.5)
	end
	if curStep == 448 then
	flash();
	setProperty('main.alpha', 0);
	setProperty('light.alpha', 0);
	setProperty('main2.alpha', 1);
	setProperty('pixelback.alpha', 1);
	triggerEvent('Change Character',1,'MTT-dark')
	triggerEvent('Change Character',0,'MTT-bf-dark')
	triggerEvent('Change Character',2,'MTT-gf-dark')
	triggerEvent('Set Cam Zoom',0.8,0.5)
	end
	if curStep == 640 then
	flashdark()
	setProperty('main2.alpha', 0);
	setProperty('pixelback.alpha', 0);
	triggerEvent('Change Character',1,'MTT')
	triggerEvent('Change Character',0,'MTT-bf')
	triggerEvent('Change Character',2,'MTT-gf-core')
	setProperty('main.alpha', 0);
	setProperty('pixelback.alpha', 0);
	setProperty('light.alpha', 0);
	
	setProperty('core.alpha', 1);
	setProperty('core-light.alpha', 1);
	setProperty('core-up1.alpha', 1);
	setProperty('core-up2.alpha', 1);
	setProperty('core-watchers.alpha', 1);
	end
	if curStep == 736 then
	doTweenAlpha('byespeed', 'core-up1', 0, 1.5, 'linear');
	doTweenAlpha('byespeed2', 'core-up2', 0, 1.5, 'linear');
	end
	if curStep == 752 then
	doTweenY('core-watchers', 'core-watchers', -950, 2, 'sineInOut');
	end
	if curStep == 768 then
	flash();
	triggerEvent('Change Character',1,'MTT-EX')
	setProperty('light2.alpha', 0.7);
	end
	if curStep == 1216 then
	flash()
	doTweenAlpha('introhudfade', 'camHUD', 0, 2, 'linear');
	end
	if curStep == 1248 then
	setProperty('darkflash.alpha', 1);
	end
end



function onUpdate()
	
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

function onTweenCompleted(name)

if name == 'camz' then


      	 setProperty("defaultCamZoom",getProperty('camGame.zoom')) 

end


end