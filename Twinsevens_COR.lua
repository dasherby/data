send_command('wait 6; input /lockstyleset 003')
send_command('wait 1; input //config frameratedivisor 1')
send_command('wait 8; input /echo Wealth. Fame. Power.')

-- Additional local binds
send_command('bind F9` input /ra <t>')
send_command('bind F10` input /ja "Double Up" <me>')
send_command('bind F11` input /ja "Snake Eye" <me>')
send_command('bind F12` input /ja "Triple Shot" <me>')

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
        ammo="Voluspa bullet",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Samnuha tights",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Eabani earring",
        left_ring="Petrov Ring",
        right_ring="Epona's ring",
        back="Null Shawl",
        range="Doomsday",
    }

    sets.melee.dt = set_combine(sets.melee.normal, {
        ammo="Voluspa bullet", 
        neck="Elite Royal Collar",
        back="Null Shawl",
        left_ring="Sulevia's Ring",

 
    })

    sets.melee.cp = set_combine(sets.melee.normal, {
        back="Mecisto. Mantle",
    })

    sets.melee.th = set_combine(sets.melee.normal, {
        ammo="Voluspa bullet",
    })

    -- Weapon Skill Sets
    sets.ws.normal = {
        ammo="Voluspa bullet", 
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Samnuha tights",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Moonshade earring",
        right_ear="Chasseur's earring",
        left_ring="Petrov Ring",
        right_ring="Epona's ring",
        back="Camulus's mantle",
    }


    sets.ws["Leaden Salute"] = {
        ammo="Voluspa bullet",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Nyame flanchard",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Moonshade earring",
        right_ear="Friomisi earring",
        left_ring="Petrov Ring",
        right_ring="Epona's ring",
        back="Camulus's mantle",
        ammo="Animikii bullet",
    }
    
    sets.ws["Savage Blade"] = {
        ammo="Voluspa bullet", 
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Samnuha tights",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Chasseur's earring",
        left_ring="Petrov Ring",
        right_ring="Epona's ring",
        back="Camulus's mantle",
    }
    
    

        sets.ws["Aeolian Edge"] = {
        ammo="Orichalc. bullet",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Samnuha tights",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Moonshade earring",
        right_ear="Friomisi earring",
        left_ring="Petrov Ring",
        right_ring="Epona's ring",
        back="Camulus's mantle",
    }








    -- CP and TH sets
    sets.CP = { back="Mecisto. Mantle" }
    sets.TH = { ammo="Perfect Lucky Egg", body={ name="Valorous Mail", augments={'INT+7','STR+15','"Treasure Hunter"+1',}} }

    -- Job Abilities Sets
    sets.ja = {
        ['Wild Card'] = { feet="Lanun bottes" },
        phantomroll = { main="Rostam", range="Compensator", head="Commodore tricorne", left_ring="Barataria ring", right_ring="Luzaf's ring", hands="Chasseur's gants +1", back="Camulus's mantle", neck="Regal necklace",},
        ['Double-Up'] = { },
        ['Quick Draw'] = { head="Laksamana's tricorn +1", body="Nyame mail", hands="Nyame gauntlets", legs="Nyame flanchard", feet="Chasseur's bottes +1", neck="Commodore charm +2", left_ear="Hecate's earring", right_ear="Friomisi earring", back="Camulus's mantle", ammo="Voluspa bullet"},
        ['Random Deal'] = { body="Commodore frac" },
        ['Snake Eye'] = { legs="Lanun trews" },
        ['Fold'] = { hands="Lanun gants" },
        ['Triple Shot'] = { body="Chasseur's frac +1" },
        ['Crooked Cards'] = { },
        ['Cutting Cards'] = { },
    }

    -- Idle Sets
    sets.idle.normal = {
        ammo="Voluspa bullet",
        head="Nyame helm",
        body="Nyame mail",
        hands="Nyame gauntlets",
        legs="Samnuha tights",
        feet="Nyame sollerets",
        neck="Commodore charm +2",
        waist="Sailfi Belt +1",
        left_ear="Brutal earring",
        right_ear="Eabani earring",
        left_ring="Shneddick Ring",
        right_ring="Warp Ring",
        back="Null Shawl",


    }

    sets.idle.dt = set_combine(sets.idle.normal, {
 
     })

    sets.idle.cp = set_combine(sets.idle.normal, {
        back="Mecisto. Mantle",
    })

    -- Utsusemi Sets
    sets.utsusemi = {
        ring1 = "Prolix Ring",
        waist = "Audumbla sash",
    }
end

function precast(spell)
    -- Handle Utsusemi casting
    if spell.english == "Utsusemi: Ichi" or spell.english == "Utsusemi: Ni" then
        equip(sets.utsusemi)

    -- Handle Weapon Skills
    elseif spell.type == 'WeaponSkill' then
        if sets.ws[spell.english] then
            equip(sets.ws[spell.english])
        else
            equip(sets.ws.normal)
        end

    -- Handle Phantom Roll (prioritized)
    elseif spell.english:find("Roll") then
        equip(sets.ja.phantomroll)

    -- Handle ALL Other Job Abilities
    elseif spell.type == "JobAbility" then
        local ja_set = sets.ja[spell.english] -- Convert to lowercase for indexing

        if ja_set then
            equip(ja_set)
        else
            send_command('@input /echo [Warning] No specific JA set found for ' .. spell.english)
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
    local idleSet = sets.idle.normal

    if useDTsets then
        idleSet = sets.idle.dt
    elseif CPmode then
        idleSet = sets.idle.cp
    end

    -- If engaged in melee
    if player.status == 'Engaged' then
        if useDTsets then
            idleSet = sets.melee.dt
        elseif CPmode then
            idleSet = sets.melee.cp
        elseif THmode then
            idleSet = sets.melee.th
        else
            idleSet = sets.melee.normal
        end
    end

    -- Equip Triple Shot gear if active
    if buffactive["Triple Shot"] then
        idleSet = set_combine(idleSet, sets.ja.tripleshot)
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
    
    -- Prevent Recasting Triple Shot if it's already active
    elseif spell.english == "Triple Shot" and buffactive["Triple Shot"] then
        cancel_spell()
        send_command('@input /echo [Notice] Triple Shot is already active.')
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
