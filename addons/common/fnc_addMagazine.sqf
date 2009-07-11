/* ----------------------------------------------------------------------------
Function: CBA_fnc_addMagazine

Description:
	Add magazine to a vehicle/unit.
	
	Function which verifies existence of _item and _unit, returns false in case
	of trouble, or when able to add _item to _unit true in case of success.

Parameters:

Returns:

Examples:
	(begin example)

	(end)

Author:

---------------------------------------------------------------------------- */

#include "script_component.hpp"
SCRIPT(addMagazine);

#define __scriptname fAddMagazine

#define __cfg (configFile >> "CfgMagazines")
#define __action addMagazine

private ["_unit", "_item"];
PARAMS_1(_unit);
if (typeName _unit != "OBJECT") exitWith
{
	#ifdef DEBUG_MODE_FULL
	[format["Unit: %1 - Item: %2 - Unit not Object", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
	#endif
	false
};
_item = _this select 1;
if (typeName _item != "STRING") exitWith
{
	#ifdef DEBUG_MODE_FULL
	[format["Unit: %1 - Item: %2 - Item not String", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
	#endif
	false
};
if (isNull _unit) exitWith
{
	#ifdef DEBUG_MODE_FULL
	[format["Unit: %1 - Item: %2 - Unit isNull", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
	#endif
	false
};
if (_item == "") exitWith
{
	#ifdef DEBUG_MODE_FULL
	[format["Unit: %1 - Item: %2 - Empty Item", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
	#endif
	false
};
if !(isClass (__cfg >> _item)) exitWith
{
	#ifdef DEBUG_MODE_FULL
	[format["Unit: %1 - Item: %2 - Item not exist in Config", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
	#endif
	false
};
_unit __action _item;
#ifdef DEBUG_MODE_FULL
[format["Unit: %1 - Item: %2 - Success", _unit, _item], QUOTE(GVAR(__scriptname)), DEBUG_SETTINGS] call CBA_fnc_debug;
#endif
true
