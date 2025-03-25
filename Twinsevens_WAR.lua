send_command('wait 6; input /lockstyleset 001')
send_command('wait 1; input //config frameratedivisor 1')
send_command('wait 8; input /echo Your Ukonvasara, forged by the memories of those you held most dear, fills you with determination.')

-- Additional local binds
send_command('bind F9` input /ja "Retaliation" <me>')
send_command('bind F10` input /ja "Hasso" <me>')
send_command('bind F11` input /ja "Seigan" <me>')
send_command('bind F12` input /ja "Third Eye" <me>')

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
        head="Boii mask +2",
        body="Boii lorica +2",
        hands="Sakpata's gauntlets",
        legs="Pumm. Cuisses +3",
        feet="Pumm. Calligae +3",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Boii earring +1",
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back="Null Shawl",
    }


    sets.melee.single = set_combine(sets.melee.normal, {
        body="Hjarrandi Breast.",
 
    })

    sets.melee.dt = set_combine(sets.melee.normal, {
        neck="Elite Royal Collar",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
        head="Boii mask +2",
        body="Boii lorica +2",
        hands="Sakpata's gauntlets",
        legs="Sakpata's cuisses",
        feet="Sakpata's leggings",
        left_ring="Sulevia's Ring",
        right_ring="Defending Ring",        
        ammo="Angha Gem",
 
    })

    sets.melee.cp = set_combine(sets.melee.normal, {
        back="Mecisto. Mantle",
    })

    sets.melee.th = set_combine(sets.melee.normal, {
        ammo="Perfect Lucky Egg",
        body={ name="Valorous Mail", augments={'INT+7','STR+15','"Treasure Hunter"+1',}},
    })




        -- Aftermath Level 3 Set
    sets.melee.am3 = set_combine(sets.melee.normal, {
        head="Boii mask +2",
        body="Boii lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Boii Calligae +2",
        right_ear="Boii Earring +1",
    })


    -- Weapon Skill Sets
    sets.ws.normal = {
        ammo="Yetshila",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }


    sets.ws["Ukko's Fury"] = {
        ammo="Yetshila",
        head="Boii mask +2",
        body="Hjarrandi Breast.",
        hands="Flamma manopolas +2",
        legs="Boii cuisses +2",
        feet="Boii calligae +2",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        right_ear="Boii earring +1",
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    
    }
    
    sets.ws["Upheaval"] = {
        ammo="Ginsen",
        head="Agoge mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Elite Royal Collar",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Armor Break"] = {
        ammo="Ginsen",
        head="Sakpata's helm",
        body="Sakpata's plate",
        hands="Sakpata's gauntlets",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Full Break"] = {
        ammo="Ginsen",
        head="Sakpata's helm",
        body="Sakpata's plate",
        hands="Sakpata's gauntlets",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Fell Cleave"] = {
        ammo="Ginsen",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Steel Cyclone"] = {
        ammo="Ginsen",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["King's Justice"] = {
        ammo="Ginsen",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Raging Rush"] = {
        ammo="Ginsen",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Sakpata's gauntlets",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    }
    
    sets.ws["Savage Blade"] = {
        ammo="Ginsen",
        head="Agoge mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck={ name="Warrior's Beads", augments={'Path: A',}},
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Rajas Ring",
        right_ring="Sroda Ring",
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
    }



    sets.ws.cp = {
        ammo="Yetshila",
        head="Boii mask +2",
        body="Pummeler's Lorica +2",
        hands="Boii mufflers +2",
        legs="Boii cuisses +2",
        feet="Pumm. Calligae +3",
        neck="Republican Platinum Medal",
        waist="Sailfi Belt +1",
        left_ear="Thrud Earring",
        right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
        left_ring="Petrov Ring",
        right_ring="Flamma Ring",
        back="Mecisto. Mantle",
    }



    -- CP and TH sets
    sets.CP = { back="Mecisto. Mantle" }
    sets.TH = { ammo="Perfect Lucky Egg", body={ name="Valorous Mail", augments={'INT+7','STR+15','"Treasure Hunter"+1',}} }

    -- Job Abilities Sets
    sets.ja = {
        ['Berserk'] = { body="Pummeler's Lorica +2", feet="Agoge Calligae", back="Cichol's Mantle" },
        ['Aggressor'] = { body="Agoge Lorica +2", head="Pummeler's Mask +2" },
        ['Retaliation'] = { feet="Boii Calligae +2", hands="Pummeler's Mufflers +1" },
        ['Warcry'] = { head="Agoge Mask +2" },
        ['Tomahawk'] = { ammo="Throwing Tomahawk" },
        ['Blood Rage'] = { body="Boii Lorica +2" },
        ['Restraint'] = { hands="Boii Mufflers +1" },
        ['Provoke'] = { body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}}, hands="Pummeler's Mufflers +1", head="Pummeler's Mask +2", left_ring="Apeile ring", right_ring="Apeile ring +1" }
    }

    -- Idle Sets
    sets.idle.normal = {
        ammo="Angha Gem",
        head="Sakpata's helm",
        body="Sakpata's plate",
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
        back={ name="Cichol's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Damage taken-5%',}},
    })

    sets.idle.cp = set_combine(sets.idle.normal, {
        back="Mecisto. Mantle",
    })

    -- Utsusemi Sets
    sets.utsusemi = {
        ring1 = "Prolix Ring",
        body  = "Sacro breastplate",
        head  = "Cizin Helm +1",
        hands = "Leyline Gloves",
        legs = "Founder's hose",
        feet = "Odyssean greaves",
        waist = "Audumbla sash",
    }
end

function precast(spell)
    -- Switch gear for Utsusemi spells.
    if spell.english == "Utsusemi: Ichi" or spell.english == "Utsusemi: Ni" then
        equip(sets.utsusemi)
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
        if buffactive['Aftermath: Lv.3'] then
            idleSet = sets.melee.am3  -- Equip the Aftermath Level 3 Set
        elseif useDTsets then
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
            idleSet = set_combine(idleSet, { left_ring = "Apeile Ring", right_ring = "Apeile Ring +1", neck = "Sanctity necklace" })
        elseif hpPercent <= 70 then
            idleSet = set_combine(idleSet, { left_ring = "Shneddick ring", right_ring = "Apeile Ring +1", neck = "Sanctity necklace" })
        else
            idleSet = set_combine(idleSet, { left_ring = "Shneddick Ring", right_ring = "Warp ring", neck = "Republican platinum medal" })  -- Adjust default ring if needed
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
