-- Setting --

blackH = 80

function onCreate()

	-- Background Shit --

	makeLuaSprite('back', 'stages/City_B', -900, -650);
	setScrollFactor('back', 0.8, 0.8);
	scaleObject('back', 1.0, 1.0);

	makeLuaSprite('medium', 'stages/City_M', -900, -650);
	setScrollFactor('medium', 1.0, 1.0);
	scaleObject('medium', 1.0, 1.0);

	makeLuaSprite('light', 'stages/Light', -900, -650);
	setScrollFactor('light', 1.0, 1.0);
	scaleObject('light', 1.0, 1.0);
	setBlendMode('light', 'screen');

	makeLuaSprite('front', 'stages/City_F', -900, -650);
	setScrollFactor('front', 0.8, 1.0);
	scaleObject('front', 1.0, 1.0);

	makeLuaSprite('frame', 'stages/Frame', -900, -650);
	setScrollFactor('frame', 1.0, 1.0);
	scaleObject('frame', 1.0, 1.0);

	addLuaSprite('back', false);
	addLuaSprite('medium', false);
	addLuaSprite('light', false);
	addLuaSprite('front', true);
	addLuaSprite('frame', true);

	-- Black Bar --

	makeLuaSprite('upBlack', '', 0, 0);
    makeGraphic('upBlack', screenWidth, blackH, '000000');
    setObjectCamera('upBlack', 'camHUD');
    addLuaSprite('upBlack', false);

    makeLuaSprite('downBlack', '', 0, screenHeight - blackH);
    makeGraphic('downBlack', screenWidth, blackH, '000000');
    setObjectCamera('downBlack', 'camHUD');
    addLuaSprite('downBlack', false);

    setObjectOrder('upBlack', 0);
    setObjectOrder('downBlack', 0);

end