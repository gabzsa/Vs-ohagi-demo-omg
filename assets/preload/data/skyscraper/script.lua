
local angles = 10;
local tweenmode = true;
local tweenname = 'quartOut';

-- Camera Follow Pos --

function onUpdate()

    if curStep > 240 and curStep < 304 or curStep > 400 and curStep < 816 then

        xx = 390;
        yy = 350;
        xx2 = 785;
        yy2 = 560;
        ofs = 30;
        followchars = true;

        if followchars == true then
            if mustHitSection == false then
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos', xx-ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos', xx+ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos', xx, yy-ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos', xx, yy+ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos', xx-ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos', xx+ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy-ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy+ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos', xx, yy);
                end
            else
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos', xx2-ofs, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos', xx2+ofs, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos', xx2, yy2-ofs);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos', xx2, yy2+ofs);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos', xx2, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos', xx2, yy2);
                end
            end
        else
            triggerEvent('Camera Follow Pos','','');
        end

    else

        xx = 540;
        yy = 410;
        xx2 = 750;
        yy2 = 480;
        ofs = 20;
        followchars = true;

        if followchars == true then
            if mustHitSection == false then
                if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos', xx-ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos', xx+ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos', xx, yy-ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos', xx, yy+ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                    triggerEvent('Camera Follow Pos', xx-ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                    triggerEvent('Camera Follow Pos', xx+ofs, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy-ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy+ofs);
                end
                if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos', xx, yy);
                end
                if getProperty('dad.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos', xx, yy);
                end
            else
                if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos', xx2-ofs, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos', xx2+ofs, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos', xx2, yy2-ofs);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos', xx2, yy2+ofs);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                    triggerEvent('Camera Follow Pos', xx2, yy2);
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                    triggerEvent('Camera Follow Pos', xx2, yy2);
                end
            end
        else
            triggerEvent('Camera Follow Pos','','');
        end

    end

end

-- Bounce Screen & Icon --

function onBeatHit()

    if curStep > 140 and curStep < 240 or curStep > 368 and curStep < 400 then
        triggerEvent('Add Camera Zoom', 0, 0.05);
    end
    
    if curStep > 432 and curStep < 816 then

        triggerEvent('Add Camera Zoom', 0.04,0.05);

        if tweenmode then
            cancelTween('iconP1tween');
            cancelTween('iconP2tween');
        end

        if curBeat%2 == 0 then
            setProperty("iconP1.angle",angles);
            setProperty("iconP2.angle",angles);
        else
            setProperty("iconP1.angle",-angles);
            setProperty("iconP2.angle",-angles);
        end

        if tweenmode then
            doTweenAngle('iconP1tween', 'iconP1', 0, crochet/1000, tweenname);
            doTweenAngle('iconP2tween', 'iconP2', 0, crochet/1000, tweenname);
        end

    end

end