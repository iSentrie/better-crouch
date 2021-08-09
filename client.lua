local crouched = false

RegisterCommand('crouch', function()
	if DoesEntityExist(PlayerPedId()) and not IsEntityDead(PlayerPedId()) and not IsPedInAnyVehicle(PlayerPedId(), 1) and not IsPauseMenuActive()  then 
		RequestAnimSet("move_ped_crouched")
		
		while not HasAnimSetLoaded("move_ped_crouched") do 
			Citizen.Wait(100)
		end 

		if crouched then 
			ResetPedMovementClipset(PlayerPedId(), 0.25)
			crouched = false 
		else
			SetPedMovementClipset(PlayerPedId(), "move_ped_crouched", 0.25 )
			crouched = true 
		end 

		RemoveAnimSet("move_ped_crouched")
	else
		crouched = false
	end
end, false)

RegisterKeyMapping('crouch', 'Crouch', 'keyboard', 'lcontrol')

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		DisableControlAction(0, 36, true)
	end
end)