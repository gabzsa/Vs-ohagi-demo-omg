

function onCreatePost()

    -- Defult HUD visible --

    setProperty('scoreTxt.visible', false);
    setProperty('timeBarBG.visible', false);
    setProperty('timeBar.visible', false);
    setProperty('timeTxt.visible', false);

    -- Game Score --

    makeLuaText('Score', 'Score: 0', 0, 30, 40);
    setTextSize('Score', 21);
    setProperty('Score.alpha', 0);
    addLuaText('Score');

    makeLuaText('Miss', 'Misses: 0', 0, 30, 60);
    setTextSize('Miss', 21);
    setProperty('Miss.alpha', 0);
    addLuaText('Miss');

    makeLuaText('Accuracy', 'Accuracy: 0%', 0, 30, 80);
    setTextSize('Accuracy', 21);
    setProperty('Accuracy.alpha', 0);
    addLuaText('Accuracy');

    makeLuaText('Song', '', 0, 30, 10);
    setTextSize('Song', 21);
    setTextString('Song', songName);
    setProperty('Song.color', getColorFromHex('ffff00'));
    setProperty('Song.alpha', 0);
    addLuaText('Song');

    -- Evaluation --

    makeLuaText('Sick', 'Sick: 0', 0, 1100, 15);
	setTextSize('Sick', 21);
    setProperty('Sick.alpha', 0);
	addLuaText('Sick');

	makeLuaText('Good', 'Good: 0', 0, 1100, 35);
	setTextSize('Good', 21);
    setProperty('Good.alpha', 0);
	addLuaText('Good');

	makeLuaText('Bad', 'Bad: 0', 0, 1100, 55);
	setTextSize('Bad', 21);
    setProperty('Bad.alpha', 0);
	addLuaText('Bad');

	makeLuaText('Shit', 'Shit: 0', 0, 1100, 75);
	setTextSize('Shit', 21);
    setProperty('Shit.alpha', 0);
	addLuaText('Shit');

    -- UP Scroll Setting --

    if downscroll == false then
    
        setProperty('Score.y', 615);
        setProperty('Miss.y', 635);
        setProperty('Accuracy.y', 655);
        setProperty('Song.y', 685);
        setProperty('Sick.y', 620);
        setProperty('Good.y', 640);
        setProperty('Bad.y', 660);
        setProperty('Shit.y', 680);

    end

    if getPropertyFromClass("ClientPrefs", "globalAntialiasing") then
        setProperty('Score.antialiasing', true);
        setProperty('Miss.antialiasing', true);
        setProperty('Accuracy.antialiasing', true);
        setProperty('Song.antialiasing', true);
        setProperty('Sick.antialiasing', true);
        setProperty('Good.antialiasing', true);
        setProperty('Bad.antialiasing', true);
        setProperty('Shit.antialiasing', true);
        setProperty('botplayTxt.antialiasing', true);
    end

end

-- Add Score --

function onUpdate()
    
    RPC = getProperty('ratingPercent');

    setTextString('Score', 'Score: '..getProperty('songScore'));
    setTextString('Miss', 'Misses: '..getProperty('songMisses'));
    setTextString('Accuracy', 'Accuracy: '..math.floor((RPC*100)*100)/100 ..'%');
    setTextString('Sick', 'Sick: '..getProperty('sicks'));
    setTextString('Good', 'Good: '..getProperty('goods'));
	setTextString('Bad', 'Bad: '..getProperty('bads'));
	setTextString('Shit', 'Shit: '..getProperty('shits'));

end

-- Juke Box --

function onCreate()

    makeLuaSprite('JukeBox', '', 1400, 290);
    makeGraphic('JukeBox', 2000, 140, '000000');
    setObjectCamera('JukeBox', 'other');
    setProperty('JukeBox.alpha', 0.75);
    addLuaSprite('JukeBox', true);

    makeLuaText('JukeBoxTxt', '', 0, 450, 310);
    setObjectCamera('JukeBoxTxt', 'other');
    setTextSize('JukeBoxTxt', 60);
    setTextString('JukeBoxTxt', songName);
    setProperty('JukeBoxTxt.alpha', 0);
    addLuaText('JukeBoxTxt');

    makeLuaText('JukeBoxTxtSub', '- Sunny -', 0, 550, 380);
    setObjectCamera('JukeBoxTxtSub', 'other');
    setTextSize('JukeBoxTxtSub', 35);
    setProperty('JukeBoxTxtSub.alpha', 0);
    addLuaText('JukeBoxTxtSub');

end

-- Juke Box Motion --

function onSongStart()
 
    doTweenX('one', 'JukeBox', 0, 1.5, 'CircInOut');
    runTimer('TxtFadeIn', 1.5, 1);

end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'TxtFadeIn' then
        doTweenAlpha('MoveInOne', 'JukeBoxTxt', 1, 0.2);
        doTweenAlpha('MoveInTwo', 'JukeBoxTxtSub', 1, 0.2);
        runTimer('JukeBoxWait', 4, 1);
    end

    if tag == 'JukeBoxWait' then
        doTweenAlpha('MoveOutOne', 'JukeBoxTxt', 0, 0.2);
        doTweenAlpha('MoveOutTwo', 'JukeBoxTxtSub', 0, 0.2);
        doTweenX('MoveOutThree', 'JukeBox', -2000, 1, 'CircInOut');
        runTimer('ScoreWait', 1, 1);
    end

    if tag == 'ScoreWait' then
        doTweenAlpha('ScoreInOne', 'Score', 1, 0.2);
        doTweenAlpha('ScoreInTwo', 'Miss', 1, 0.2);
        doTweenAlpha('ScoreInThree', 'Accuracy', 1, 0.2);
        doTweenAlpha('ScoreInFour', 'Song', 1, 0.2);
        doTweenAlpha('ScoreInFive', 'Sick', 1, 0.2);
        doTweenAlpha('ScoreInSix', 'Good', 1, 0.2);
        doTweenAlpha('ScoreInSeven', 'Bad', 1, 0.2);
        doTweenAlpha('ScoreInEight', 'Shit', 1, 0.2);
    end

end