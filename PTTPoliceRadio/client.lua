function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

skins = {
	-- Police --
	GetHashKey("s_m_y_cop_01"),
	GetHashKey("s_f_y_cop_01"),
	-- Highway --
	GetHashKey("s_m_y_hwaycop_01"),
	-- Sheriff --
	GetHashKey("s_m_y_sheriff_01"),
	GetHashKey("s_f_y_sheriff_01"),
	-- SECURITY --
	GetHashKey("s_m_m_security_01"),
	-- Ranger --
	GetHashKey("s_m_y_ranger_01"),
	GetHashKey("s_f_y_ranger_01"),
}

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 0 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) and not IsPedInAnyVehicle(PlayerPedId(), true) and checkskin() then 
            DisableControlAction( 0, 19, true ) -- INPUT_CHARACTER_WHEEL (LEFTALT)  

            if ( not IsPauseMenuActive() ) then 
                    loadAnimDict( "random@arrests" )

                    while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                        Citizen.Wait( 100 )
                    end 
                        if ( IsDisabledControlJustReleased( 0, 19 ) ) then
                        ClearPedSecondaryTask(ped)
                        SetEnableHandcuffs(ped, false)
                    else
                        if ( IsDisabledControlJustPressed( 0, 19 ) ) and checkskin() then
                        ClearPedSecondaryTask(ped)
                        TaskPlayAnim(ped, "random@arrests", "generic_radio_enter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                        SetEnableHandcuffs(ped, true)
                    end 
                       if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "generic_radio_enter", 3) then
                       DisableControlAction(1, 140, true)
                       DisableControlAction(1, 141, true)
                       DisableControlAction(1, 142, true)
                    end
                end
            end 
        end 
    end
end )

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 0 )
    end
end

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 0 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) and not IsPedInAnyVehicle(PlayerPedId(), true) and checkskin() then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK (LEFTCTRL)  

            if ( not IsPauseMenuActive() ) then 
                    loadAnimDict( "random@arrests" )

                    while ( not HasAnimDictLoaded( "random@arrests" ) ) do 
                        Citizen.Wait( 100 )
                    end 
                        if ( IsDisabledControlJustReleased( 0, 36 ) ) then
                        ClearPedSecondaryTask(ped)
                    else
                        if ( IsDisabledControlJustPressed( 0, 36 ) ) then
                        ClearPedSecondaryTask(ped)
                        TaskPlayAnim(ped, "random@arrests", "radio_chatter", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
                    end 
                       if IsEntityPlayingAnim(GetPlayerPed(PlayerId()), "random@arrests", "radio_chatter", 3) then
                       DisableControlAction(1, 140, true)
                       DisableControlAction(1, 141, true)
                       DisableControlAction(1, 142, true)
                    end
                end
            end 
        end 
    end
end )

function checkskin()
    for i = 1, #skins do
        if skins[i] == GetEntityModel(PlayerPedId()) then
            return true
        end
    end
    return false
end
