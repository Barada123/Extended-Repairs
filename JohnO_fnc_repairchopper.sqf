/**
 * ExileClient_object_vehicle_repair
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines"];
_vehicle = _this select 0;
/*if (ExileClientPlayerIsInCombat) exitWith
{
	["RepairFailedWarning", ["You are in combat!"]] call ExileClient_gui_notification_event_addNotification;
};*/
if (vehicle player isEqualTo _vehicle) exitWith 
{
	["RepairFailedWarning", ["Are you serious?"]] call ExileClient_gui_notification_event_addNotification;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

if (isNil "_fixable") exitWith 
{
	["RepairFailedWarning", ["This vehicle already looks fine."]] call ExileClient_gui_notification_event_addNotification;
}; 
if (!local _vehicle) then
{
	["RepairFailedWarning", ["Please get in as driver/pilot first."]] call ExileClient_gui_notification_event_addNotification;
}
else 
{
	_equippedMagazines = magazines player;
	if ("Exile_Item_Foolbox" in _equippedMagazines) then
	{	
		if ("Exile_Item_Wrench" in _equippedMagazines) then
		{
			if ("Exile_Item_DuctTape" in _equippedMagazines) then
			{
				if ("Exile_Item_JunkMetal" in _equippedMagazines) then
				{
					if ("Exile_Item_MetalPole" in _equippedMagazines) then
					{
						if ("Exile_Item_MetalScrews" in _equippedMagazines) then
						{
							if ("Exile_Item_MetalWire" in _equippedMagazines) then
							{	
								if ("Exile_Item_OilCanister" in _equippedMagazines) then
								{
				
									player playMove "AinvPknlMstpSnonWnonDr_medic3";	
									player playMove "AinvPknlMstpSnonWnonDr_medic3";	
									sleep 20;
									if (_vehicle isKindOf "car")  then
									{	
										{
											_vehicle setHitPointDamage [_x,0];
										}	forEach _repairable;
									}						
									else
									{
										_vehicle setDamage 0;
									};	
									player removeItem "Exile_Item_DuctTape";
									player removeItem "Exile_Item_JunkMetal";
									player removeItem "Exile_Item_MetalPole";
									player removeItem "Exile_Item_DuctTape";
									player removeItem "Exile_Item_MetalScrews";
									player removeItem "Exile_Item_MetalWire";
									player removeItem "Exile_Item_OilCanister";
									["Success",["Vehicle repaired"]] call ExileClient_gui_notification_event_addNotification;
								}
								else
								{
									["Whoops",["You need a Oil Canister to do that"]] call ExileClient_gui_notification_event_addNotification;
								};	
							}
							else
							{
								["Whoops",["You need Metal wire to do that"]] call ExileClient_gui_notification_event_addNotification;
							};		
						}
						else
						{
							["Whoops",["You need Metal Screws to do that"]] call ExileClient_gui_notification_event_addNotification;
						};	
					}
					else
					{
						["Whoops",["You need Metal Pole to do that"]] call ExileClient_gui_notification_event_addNotification;
					};		
								
				}
				else
				{
					["Whoops",["You need Junkmetal to do that"]] call ExileClient_gui_notification_event_addNotification;
				};
			}
			else 
			{
				["RepairFailedWarning", ["You need duct tape to do that"]] call ExileClient_gui_notification_event_addNotification;
			};
		}
		else
		{
			["RepairFailedWarning", ["You need a wrench"]] call ExileClient_gui_notification_event_addNotification;
		};	
	}
	else
	{
		["RepairFailedWarning", ["You need a toolbox"]] call ExileClient_gui_notification_event_addNotification;
	};
	
};
true

/*
_availableHitpoints = (getAllHitPointsDamage bob) select 0;

_repairable = [];
if (_vehicle isKindOf "car") then
{	
	_wheels = ["HitLF2Wheel","HitLFWheel","HitRFWheel","HitRF2Wheel"];
	_repairable = _availableHitpoints - _wheels;
};
{
bob setHitPointDamage 0;
}	forEach _repairable;


					if (_vehicle isKindOf "air") then
					{	
						{
							_vehicle setHitPointDamage [_x,0];
						}	forEach _repairable;
					}