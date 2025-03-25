send_command('wait 6; input /lockstyleset 002')
send_command('wait 1; input //config frameratedivisor 1')
send_command('wait 8; input /echo One to be born from a dragon, hoisting the light and the dark, arises high up in the sky to the still land.')
send_command('wait 9; input /echo Veiling the moon with The Light of Eternity, it brings another promise to Mother Earth with a bounty and mercy.')

-- Additional local binds
send_command('bind F9` input /ja "Cover" <stpc>')
send_command('bind F10` input /ja "Sentinel" <me>')
send_command('bind F11` input /ja "Shield bash" <t>')
send_command('bind F12` input /ja "Rampart" <me>')

function get_sets()
    useDTsets = false
    CPmode = false
    THmode = false

    sets.idle = {}                  -- Leave this empty.
    sets.precast = {}               -- leave this empty
    sets.midcast = {}               -- leave this empty
    sets.aftercast = {}             -- leave this empty
    sets.melee = {}                 -- leave this empty
    sets.ws = {}                    -- leave this empty
    sets.ja = {}                    -- leave this empty

    -- Melee Sets
    sets.melee.normal = {
        ammo="Ginsen",
        head="Sakpata's helm",
        body="Sakpata's plate",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Sakpata's leggings",
        neck="Elite royal collar",
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Cessance earring",
        left_ring="Petrov Ring",
        right_ring="Sulevia's ring",
        back="Mecisto. Mantle",
    }

    sets.melee.dt = set_combine(sets.melee.normal, {
        neck="Elite Royal Collar",
        back="Null shawl",
        head="Boii mask +2",
        body="Sakpata's plate",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Sakpata's leggings",
        left_ring="Sulevia's Ring",
        right_ring="Defending ring",        
        ammo="Angha Gem",
 
    })

    sets.melee.cp = set_combine(sets.melee.normal, {
        back="Mecisto. Mantle",
    })

    sets.melee.th = set_combine(sets.melee.normal, {
        ammo="Perfect Lucky Egg",
        body={ name="Valorous Mail", augments={'INT+7','STR+15','"Treasure Hunter"+1',}},
    })

    -- Weapon Skill Sets
    sets.ws.normal = {
        ammo="Ginsen",
        head="Sakpata's helm",
        body="Sakpata's plate",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Sakpata's leggings",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Cessance earring",
        left_ring="Petrov Ring",
        right_ring="Sulevia's ring",
        back="Mecisto. Mantle",
    }



    
    sets.ws["Savage Blade"] = {
        ammo="Ginsen",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Pumm. Calligae +2",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Sulevia's ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }


    sets.ws["Sanguine Blade"] = {
        ammo="Ginsen",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Sibyl scarf",
        waist="Sailfi Belt +1",
        left_ear="Friomisi earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Sulevia's ring",
    }






    -- CP and TH sets
    sets.CP = { back="Mecisto. Mantle" }
    sets.TH = { ammo="Perfect Lucky Egg", body={ name="Valorous Mail", augments={'INT+7','STR+15','"Treasure Hunter"+1',}} }

    -- Job Abilities Sets
    sets.ja = {
        ['Invincible'] = { legs="Caballarious breeches" },
        ['Holy Circle'] = { feet="Reverence leggings" },
        ['Shield Bash'] = { hands="Caballarious gauntlets", left_ear="Knightly earring"},
        ['Sentinel'] = { feet="Caballarious leggings" },
        ['Cover'] = { head="Reverence coronet", body="Caballarious surcoat", back="Volitional mantle", },
        ['Rampart'] = { head="Caballarious coronet" },
        ['Majesty'] = { },
        ['Fealty'] = { body="Caballarious surcoat" },
        ['Chivalry'] = { hands="Caballarious gauntlets" },
        ['Divine Emblem'] = { feet="Chevalier's sabatons" },
        ['Sepulcher'] = { },
        ['Palisade'] = { },
        ['Intervene'] = { },
        ['Provoke'] = { body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, left_ring="Apeile ring", right_ring="Apeile ring +1" }
    }

    -- Idle Sets
    sets.idle.normal = {
        ammo="Angha Gem",
        head="Sakpata's helm",
        body="Sacro breastplate",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Sakpata's leggings",
        neck="Republican Platinum Medal",
        waist="Sailfi belt +1",
        left_ear="Cessance Earring",
        right_ear="Brutal Earring",
        left_ring="Shneddick Ring",
        right_ring="Warp Ring",
        back="Null Shawl",
    }

    sets.idle.dt = set_combine(sets.idle.normal, {
        back="Null Shawl",
    })

    sets.idle.cp = set_combine(sets.idle.normal, {
        back="Mecisto. Mantle",
    })

    -- Casting Sets


sets.casting = {
    ring1 = "Prolix Ring",
    body  = "Sacro breastplate",
    head  = "Cizin Helm +1",
    hands = "Leyline Gloves",
    legs = "Founder's hose",
    feet = "Odyssean greaves",
    waist = "Audumbla sash",
}

sets.cureCasting = {
    ring1 = "Prolix Ring",
    body  = "Jumalik Mail",
    head  = "Cizin Helm +1",
    hands = "Leyline Gloves",
    legs = "Founder's Hose",
    feet = "Odyssean Greaves",
    neck = "Sacro gorget",
    waist = "Audumbla sash",
}

end

function precast(spell)
    -- Check if the spell is a Cure spell
    if spell.action_type == 'Magic' then
        if spell.skill == "Healing Magic" and spell.english:find("Cure") then
            equip(sets.cureCasting) -- Equip Cure casting set
        else
            equip(sets.casting) -- Equip regular casting set
        end
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        else
            equip(sets.ws.normal)
        end
    elseif spell.english == "Apururu (UC)" then
        equip({ body = "Apururu Unity Shirt" })
    elseif spell.type == "JobAbility" then
        local ja_sets = sets.ja[spell.english]
        if ja_sets then
            equip(set_combine(sets.melee.normal, ja_sets))
        end
        
        -- **Echo message when using Invincible**
        if spell.english == "Invincible" then
            send_command('@input /echo BASED ON THE COMIC BOOK BY Robert Kirkman, Cory Walker, & Ryan Ottley')
        end
    end
end

function midcast(spell)
    -- This function is intentionally left blank for now
end

function aftercast(spell)
    idle()
end

function post_midcast(spell)
    -- This function is intentionally left blank for now
end

function idle()
    local idleSet

    -- Check if player is affected by Stun or Terror
    if buffactive["Terror"] or buffactive["Stun"] then
        idleSet = sets.idle.dt  -- Automatically equip DT set when affected
    elseif player.status == 'Engaged' then
        if useDTsets then
            idleSet = sets.melee.dt
        elseif CPmode then
            idleSet = sets.melee.cp
        elseif THmode then
            idleSet = sets.melee.th
        else
            idleSet = sets.melee.normal
        end
    else
        -- Player is idle, apply regen gear logic
        if useDTsets then
            idleSet = sets.idle.dt
        elseif CPmode then
            idleSet = sets.idle.cp
        else
            idleSet = sets.idle.normal
        end

        -- Always equip Sacro Breastplate when idle
        idleSet = set_combine(idleSet, { body = "Sacro Breastplate" })

        -- Check HP % and equip appropriate rings
        local hpPercent = (player.hp / player.max_hp) * 100

        if hpPercent <= 60 then
            idleSet = set_combine(idleSet, { left_ring = "Apeile Ring", right_ring = "Apeile Ring +1" })
        elseif hpPercent <= 70 then
            idleSet = set_combine(idleSet, { left_ring = "Shneddick ring", right_ring = "Apeile Ring +1" })
        else
            idleSet = set_combine(idleSet, { left_ring = "Shneddick Ring", right_ring = "Warp ring" })  -- Adjust default ring if needed
        end
    end

    equip(idleSet)
end

function status_change(new, old)
    idle()
end

function pretarget(spell, action)
    -- Auto Use Echo Drops If You Are Silenced --
    if spell.action_type == 'Magic' and buffactive.silence then
        cancel_spell()
        send_command('input /item "Echo Drops" <me>')
    -- Change Berserk To Aggressor If Berserk Is On --
    elseif spell.english == "Berserk" and buffactive.Berserk then
        cancel_spell()
        send_command('input /ja "Aggressor" <me>')
    -- Change Seigan To Third Eye If Seigan Is On --
    elseif spell.english == "Seigan" and buffactive.Seigan then
        cancel_spell()
        send_command('input /ja "Third Eye" <me>')
    -- Change Seigan To Third Eye If Seigan Is On --
    elseif spell.english == "Warcry" and buffactive.BloodRage then
        cancel_spell()
        send_command('/echo Blood Rage is up, canceling to avoid override.')
    elseif spell.english == "Blood Rage" and buffactive.Warcry then
        cancel_spell()
        send_command('/echo Warcry is up, canceling to avoid override.')
    end
end

function self_command(command)
    if command == 'toggleTH' then
        THmode = not THmode
        send_command('@input /echo TH Mode ' .. (THmode and 'ON. I prefer the term "Treasure Hunter!"' or 'OFF. Enjoy the extra inventory.'))
    elseif command == 'toggleCP' then
        CPmode = not CPmode
        send_command('@input /echo CP Mode ' .. (CPmode and 'ON. Training arc activated.' or 'OFF. Hit the showers, champ.'))
    elseif command == 'toggleDT' then
        useDTsets = not useDTsets
        send_command('@input /echo DT Mode ' .. (useDTsets and 'ON. The extra durability fills you with determination.' or 'OFF. Warning: Squishy.'))
    end
end
