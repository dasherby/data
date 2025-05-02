function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD')
	state.PhysicalDefenseMode:options('PDT_HP','PDT')
	state.MagicalDefenseMode:options('MDT_HP','BDT_HP','MDT','BDT')
	state.ResistDefenseMode:options('MEVA_HP','MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Normal','Tank','KiteTank','Sphere')
	state.Weapons:options('None','Aettir','Montante +1','DualWeapons')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape",augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Damage taken-5%',}}
	gear.stp_jse_back = {name="Ogma's cape",augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.da_jse_back = {name="Ogma's cape",augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind !r gs c weapons Montante +1;gs c update')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
	     head="Fu. Bandeau +1",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Enchanter's earring +1",
	     body="Emet Harness +1",hands="Futhark Mitons",ring1="Supershear ring",ring2="Pernicious ring",
		 back="Ogma's cape",waist="Goading Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		 
    sets.Enmity.SIRD = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
		head="Nyame helm",neck="Loricate Torque +1",ear1="Friomisi Earring",ear2="Enchanter's earring +1",
		body="Emet Harness +1",hands="Futhark Mitons",ring1="Defending Ring",ring2="Moonbeam Ring",
		back="Ogma's cape",waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}
		
    sets.Enmity.SIRDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Audumbla Sash",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

    sets.Enmity.DT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +1",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +1", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Bottes +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Futhark Bandeau +1"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Bottes +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head="Nyame helm",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Crepuscular earring",
        body="Samnuha Coat",hands="Nyame gauntlets",ring1="Metamor. Ring +1",ring2="Kishar Ring",
        back="Toro Cape",waist="Eschan Stone",legs="Nyame flanchard",feet="Herculean boots"}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Kishar ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",ring1="Defending ring",ring2="Kishar ring",legs="Rune. Trousers +1"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit) - FILL THIS OUT LATER.
    sets.precast.Waltz = {ammo="Staunch tathlum",
        head="Dampening tam",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Ogma's cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
            head="Rune. Bandeau +1",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Ogma's cape",waist="Audumbla Sash",legs="Rawhide Trousers",feet="Herculean boots"}
			
	sets.precast.FC.DT = {ammo="Impatiens",
        head="Rune. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Leyline Gloves",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Audumbla Sash",legs="Eri. Leg Guards +1",feet="Herculean boots"}
		
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga Beads'})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
            head="Lilitu Headpiece",neck="Anu torque",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back="Null Shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.precast.WS.SomeAcc = {ammo="Knobkierrie",
            head="Adhemar Bonnet +1",neck="Anu torque",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back="Null Shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.precast.WS.Acc = {ammo="Knobkierrie",
            head="Dampening Tam",neck="Sanctity necklace",ear1="Moonshade Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back="Null Shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.precast.WS.HighAcc = {ammo="Knobkierrie",
            head="Nyame helm",neck="Sanctity necklace",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Regal Ring",
            back="Null Shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.precast.WS.FullAcc = {ammo="Knobkierrie",
            head="Dampening tam",neck="Sanctity necklace",ear1="Crepuscular Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu ring",ring2="Regal ring",
            back="Null shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{legs="Nyame flanchard",feet="Nyame sollerets"})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{head="Lilitu Headpiece",legs="Nyame flanchard",feet="Nyame sollerets"})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{legs="Nyame flanchard",feet="Nyame sollerets"})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Impatiens",
            head="Dampening tam",neck="Voltsurge Torque",ear1="Loquac. Earring",ear2="Enchntr. Earring +1",
            body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Ogma's cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Herculean boots"}
			
	sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{head="Erilaz Galea +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",hands="Runeist's Mitons +1",back="Merciful Cape",waist="Olympus Sash",legs="Futhark Trousers +1"})
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{head="Futhark Bandeau +1",body={ name="Herculean Vest", augments={'INT+10','Attack+8','Phalanx +2','Mag. Acc.+6 "Mag.Atk.Bns."+6',}},legs={ name="Herculean Trousers", augments={'"Dual Wield"+2','Sklchn.dmg.+2%','Phalanx +2',}},feet="Herculean boots"})
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'],{head="Rune. Bandeau +1",neck="Sacro Gorget"}) 
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {ear2="Earthcry Earring",waist="Siegel Sash"})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {ammo="Staunch Tathlum",
        head="Dampening tam",neck="Sacro Gorget",ear1="Mendi. Earring",ear2="Roundel Earring",
        body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.Phalanx_Received = {body={ name="Herculean Vest", augments={'INT+10','Attack+8','Phalanx +2','Mag. Acc.+6 "Mag.Atk.Bns."+6',}},legs={ name="Herculean Trousers", augments={'"Dual Wield"+2','Sklchn.dmg.+2%','Phalanx +2',}},feet="Herculean boots"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {main="Aettir",sub="Utu Grip",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +1",hands="Turms mittens",ring1="Shneddick ring",ring2="Warp ring",
		back="Ogma's cape",waist="Null belt",legs="Carmine cuisses +1",feet="Herculean boots"}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

	sets.idle.KiteTank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.idle.Weak = {main="Aettir",sub="Utu Grip",ammo="Homiliary",
		head="Rawhide Mask",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
		body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Moonbeam ring",
		back="Ogma's cape",waist="Flume Belt +1",legs="Carmine Cuisses +1",feet="Hippo. Socks +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {ear2="Ethereal Earring",body="Erilaz Surcoat +1",waist="Flume Belt +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Aettir = {main="Aettir",sub="Utu Grip"}
	sets.weapons["Montante +1"] = {main="Montante +1", sub="Utu Grip"}
	sets.weapons.DualWeapons = {main="Firangi",sub="Reikiko"}
	
	-- Defense Sets
	
	sets.defense.PDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Nyame helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
        body="Futhark Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Shadow Mantle",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.PDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.MDT = {main="Aettir",sub="Utu Grip",ammo="Yamarang",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Enchanter's earring +1",ear2="Erilaz earring",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.MDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.BDT = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.defense.BDT_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	sets.defense.MEVA_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Warden's ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Pernicious ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +1",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Pernicious ring",
        back="Ogma's cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Crepuscular Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {main="Montante +1",sub="Utu Grip",ammo="Coiste Bodhar",
            head="Dampening Tam",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back="Null shawl",waist="Sailfi belt +1",legs="Samnuha Tights",feet="Nyame sollerets"}
    sets.engaged.SomeAcc = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Dampening Tam",neck="Sanctity necklace",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back="Null shawl",waist="Sailfi belt +1",legs="Samnuha Tights",feet="Nyame sollerets"}
	sets.engaged.Acc = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Dampening Tam",neck="Sanctity necklace",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back="Null shawl",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.engaged.HighAcc = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Dampening Tam",neck="Sanctity necklace",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
            back="Null shawl",waist="Null belt",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.engaged.FullAcc = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Dampening tam",neck="Sanctity necklace",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Niqmaddu ring",ring2="Regal ring",
            back="Null shawl",waist="Null belt",legs="Carmine Cuisses +1",feet="Nyame sollerets"}
    sets.engaged.DTLite = {main="Montante +1",sub="Utu Grip",ammo="Coiste Bodhar",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Defending Ring",ring2="Ilabrat ring",
            back="Ogma's cape",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
    sets.engaged.SomeAcc.DTLite = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Defending Ring",ring2="Ilabrat ring",
            back="Ogma's cape",waist="Sailfi belt +1",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.engaged.Acc.DTLite = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Defending Ring",ring2="Ilabrat ring",
            back="Ogma's cape",waist="Null belt",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.engaged.HighAcc.DTLite = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Crepuscular Earring",ear2="Sherida Earring",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Defending Ring",ring2="Ilabrat ring",
            back="Ogma's cape",waist="Null belt",legs="Samnuha tights",feet="Nyame sollerets"}
	sets.engaged.FullAcc.DTLite = {main="Montante +1",sub="Utu Grip",ammo="Seething bomblet +1",
            head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Crepuscular Earring",ear2="Mache Earring +1",
            body="Ayanmo Corazza +2",hands="Herculean gloves",ring1="Defending Ring",ring2="Ilabrat ring",
            back="Ogma's cape",waist="Null belt",legs="Samnuha tights",feet="Nyame sollerets"}
    sets.engaged.Tank = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
            head="Nyame helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Ethereal Earring",
            body="Futhark Coat +1",hands="Nyame gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
            back="Shadow Mantle",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	sets.engaged.Tank_HP = {main="Aettir",sub="Utu Grip",ammo="Staunch Tathlum",
        head="Fu. Bandeau +1",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Enchanter's earring +1",
        body="Runeist's Coat +1",hands="Nyame gauntlets",ring1="Gelatinous Ring +1",ring2="Moonbeam Ring",
        back="Ogma's cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
    sets.engaged.SomeAcc.Tank = sets.engaged.Tank
	sets.engaged.Acc.Tank = sets.engaged.Tank
	sets.engaged.HighAcc.Tank = sets.engaged.Tank
	sets.engaged.FullAcc.Tank = sets.engaged.Tank
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {neck="Nicander's necklace"})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(4, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(5, 12)
	elseif player.sub_job == 'SCH' then
		set_macro_page(5, 12)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 12)
	elseif player.sub_job == 'WAR' then
		set_macro_page(7, 12)
	elseif player.sub_job == 'SAM' then
		set_macro_page(8, 12)
	elseif player.sub_job == 'DRK' then
		set_macro_page(9, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 12)
	else
		set_macro_page(5, 12)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not data.areas.cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Apururu") then
					windower.send_command('input /ma "Apururu (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end

function user_job_lockstyle()
	if state.Weapons.value == 'Lionheart' then
		windower.chat.input('/lockstyleset 034')
	else
		windower.chat.input('/lockstyleset 033')
	end
end