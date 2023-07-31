/////////////////////////////////////////////
// User Input
/////////////////////////////////////////////

// prefix used for play area markers in Eden
private _mkrPrefix = "AO_mkr_";

/////////////////////////////////////////////
// Functions
/////////////////////////////////////////////

// draw lines to visualize triangle (debug), red if _c true, black if _c false 
JST_fnc_showTri = 
{ 
	params ["_tri"]; 
	_tri params ["_p", "_q", "_r"]; 
	{ 
		_p1 = _x select 0;
		_p2 = _x select 1;
		// find midpoint to center edge marker on 
		private _dir = _p1 getDir _p2; 
		private _dis = (_p1 distance2D _p2) / 2; 
		private _midPnt = _p1 getPos [_dis, _dir]; 
		// create marker 
		private _markerVar = "mkr_" + str _midPnt; 
		private _marker = createMarker [_markerVar, _midPnt]; 
		_marker setMarkerShape "RECTANGLE"; 
		_marker setMarkerSize [5, _dis]; 
		_marker setMarkerDir _dir; 
		_marker setMarkerColor "ColorBLACK"; 
		JST_markers pushBack _marker; 
	} forEach [[_p, _q], [_q, _r], [_r, _p]]; 
};

// check if test point A is inside circumCenter of triangle PQR, uses existing data
JST_fnc_checkCircum =
{
	params ["_t", "_tri"];
	// pull points PQR, circumcenter, and radius
	_tri params ["_p", "_q", "_r", "_c", "_rad"];
	// do radius check from test point to circumcenter to see if inside circumcircle
	if ((_c distance2D _t) <= _rad) then {true} else {false};
};

// test if two tris are conterminous
JST_fnc_testIfSame =
{
	params ["_triA", "_triB"];
	if
	(
		((_triA select 0) in _triB) and
		{(_triA select 1) in _triB} and
		{(_triA select 2) in _triB}
	)
	then {true} else {false};
};

// find circumcenter and circumcircle's radius of triangle of points P, Q, and R
JST_fnc_circumCenter =
{
	params ["_tri"];
	_tri params ["_p", "_q", "_r"];
	// find lines from PQ and QR
	private _abc = [_p, _q] call JST_fnc_findLine;
	_abc params ["_a", "_b", "_c"];
	private _def = [_q, _r] call JST_fnc_findLine;
	_def params ["_d", "_e", "_f"];
	// convert to perpendicular bisectors
	_abc = [_p, _q, _a, _b, _c] call JST_fnc_perpBisect;
	_abc params ["_a", "_b", "_c"];
	_def = [_q, _r, _d, _e, _f] call JST_fnc_perpBisect;
	_def params ["_d", "_e", "_f"];
	// find intersection of bisectors (which is the circumcenter)
	private _circumCenter = [_a, _b, _c, _d, _e, _f] call JST_fnc_findIntersect;
	if (_circumCenter isEqualTo 0) then
	{
		// wasn't a tri, return 0
		0
	}
	else
	{
		// was a tri, return data
		[_circumCenter, (_p distance2D _circumCenter)];
	};
};

// check if test edge point A, point B is shared among any of given list of triangles, returns true or false, ignores given triangle
JST_fnc_sharedEdge =
{
	params ["_edge", "_tri", "_tris"];
	_edge params ["_p1", "_p2"];
	{
		if (!([_x, _tri] call JST_fnc_testIfSame) and {(_p1 in _x) and {_p2 in _x}}) then
		{
			breakWith true;
		};
		false
	} forEach _tris;
};

// find line from two points P and Q, input P, Q
JST_fnc_findLine =
{
	params ["_p", "_q"];
	_p params ["_x1", "_y1"];
	_q params ["_x2", "_y2"];
	private _a = _y2 - _y1;
	private _b = _x1 - _x2;
	private _c = (_a * _x1) + (_b * _y1);
	[_a, _b, _c]
};

// find perpendicular bisector from line PQ, input P, Q, a, b, c
JST_fnc_perpBisect =
{
	params ["_p", "_q", "_a", "_b", "_c"];
	_p params ["_x1", "_y1"];
	_q params ["_x2", "_y2"];
	// find midpoing of line PQ
	private _midPnt = _p getPos [(_p distance2D _q)/2, (_p getDir _q)];
	// derive bisector line's equation
	private _c = -(_b * (_midPnt select 0)) + (_a * (_midPnt select 1));
	private _tmp = _a;
	_a = (_b * -1);
	_b = _tmp;
	[_a, _b, _c]
};

// find intersection point of two lines, input a1, b1, c1, a2, b2, c2
JST_fnc_findIntersect =
{
	params ["_a1", "_b1", "_c1", "_a2", "_b2", "_c2"];
	private _ret = nil;
	private _pX = nil;
	private _pY = nil;
	private _det = (_a1 * _b2) - (_a2 * _b1);
	if (_det isEqualTo 0) then // lines are parallel
	{
		0
	}
	else
	{
		_pX = ((_b2 * _c1) - (_b1 * _c2)) / _det;
		_pY = ((_a1 * _c2) - (_a2 * _c1)) / _det;
		[_pX, _pY]
	};
};

// draw lines to show poly
JST_fnc_showPoly =
{
	params ["_poly"];
	for "_i" from 0 to ((count _poly) - 2) step 1 do
	{
		private _pnt1 = _poly select _i;
		private _pnt2 = _poly select (_i + 1);
		private _dis = (_pnt1 distance2D _pnt2)/2;
		private _dir = _pnt1 getDir _pnt2;
		private _midPnt = _pnt1 getPos [_dis, _dir];
		private _mkrStr = "AO_mkr_line_" + str _i;
		private _mkr = createMarkerLocal [_mkrStr, _midPnt];
		_mkrStr setMarkerShape "RECTANGLE";
		_mkrStr setMarkerDirLocal _dir;
		_mkrStr setMarkerSizeLocal [5, _dis];
		_mkrStr setMarkerAlphaLocal 1;
		_mkrStr setMarkerColor "COLORBLACK";	
	};
};

/////////////////////////////////////////////
// Bowyer-Watson Delaunay Triangulation Function
/////////////////////////////////////////////

JST_fnc_triangulate =
{
	// triangle arrays will be formatted: [point1, point2, point3, circumcenter point, circumcircle radius]
	params ["_newPnts"];
	
	// sort points left to right
	_newPnts sort true;

	// create super triangle
	private _stp1 = [(0 - (worldSize/3)), (0 - (worldSize/3))];
	private _stp2 = [(worldSize * 3), (0 - (worldSize/3))];
	private _stp3 = [(0 - (worldSize/3)), (worldSize * 3)];
	private _st = [_stp1, _stp2, _stp3, [], 0];
	private _testTris = [_st];

	// init triangulation storage array
	private _doneTris = [];
	
	// iterate through new points
	{
		private _pnt = _x;
		// reset vars
		private _badTris = [];
		private _poly = [];
		// iterate through known triangles, using while so I can delete while moving forwards
		private _i = 0;
		while {_i < (count _testTris)} do
		{
			private _tri = _testTris select _i;
			_i = _i + 1;
			// if triangle's circumcircle already computed...
			if ((_tri select 4) > 0) then
			{
				// check if new point makes it an illegal triangle
				if ([_pnt, _tri] call JST_fnc_checkCircum) then
				{
					_badTris pushBack _tri;
				};
				// if discovered to be permanently legal, remove from test tris, add to done tris
				if (((_tri select 3 select 0) + (_tri select 4)) < (_pnt select 0)) then
				{
					_testTris deleteAt (_testTris findIf {[_x, _tri] call JST_fnc_testIfSame});
					_doneTris pushBack _tri;
					_i = _i - 1;
				};
			}
			// if not already computed...
			else
			{
				// compute it
				private _a = [_tri] call JST_fnc_circumCenter;
				_a params ["_c", "_rad"];
				_tri set [3, _c];
				_tri set [4, _rad];
				// check if new point makes it an illegal triangle
				if ([_pnt, _tri] call JST_fnc_checkCircum) then
				{
					_badTris pushBack _tri;
				};
			};
		};
		// iterate through bad triangles
		{
			private _tri = _x;
			// add edges not shared by other bad triangles to poly list (these edges are the outside of the new hole)
			private _e1 = [_tri select 0, _tri select 1];
			private _e2 = [_tri select 1, _tri select 2];
			private _e3 = [_tri select 2, _tri select 0];
			{
				private _edge = _x;
				if !([_edge, _tri, _badTris] call JST_fnc_sharedEdge) then
				{
					_poly pushBack _edge;
				};
			} forEach [_e1, _e2, _e3];
		} forEach _badTris;
		// remove all bad triangles from triangulation
		{
			private _badTri = _x;
			_testTris deleteAt (_testTris findIf {[_x, _badTri] call JST_fnc_testIfSame});
		} forEach _badTris;
		// create new triangles from each outside edge of hole joined to new point in center of hole
		{
			private _p = _x select 0;
			private _q = _x select 1;
			private _r = _pnt;
			private _tri = [_p, _q, _r, [], 0];
			// compute the tri
			private _a = [_tri] call JST_fnc_circumCenter;
			_a params ["_c", "_rad"];
			_tri set [3, _c];
			_tri set [4, _rad];
			_testTris pushBack _tri;
		} forEach _poly;
	} forEach _newPnts;
	// finalize array of triangles
	_doneTris append _testTris;
	[_doneTris, _st]
};

/////////////////////////////////////////////
// Operations
/////////////////////////////////////////////

// find up to 100 markers and add positions into array
JST_AOpoly = [];
for "_i" from 0 to 100 do
{
	private _num = _i;
	private _mkr = (_mkrPrefix + (str _num));
	private _mkrType = getMarkerType _mkr;
	if !(_mkrType isEqualTo "") then
	{
		private _pos = [markerPos _mkr select 0, markerPos _mkr select 1, 0];
		_mkr setMarkerAlphaLocal 0;
		JST_AOpoly pushBack _pos;
	};
};

// add world corners into array
JST_worldCorners = [[0,0,0], [0,worldSize,0], [worldSize,worldSize,0], [worldSize,0,0]]; 
JST_AOpolyWorld = +JST_AOPoly;
JST_AOpolyWorld append JST_worldCorners;

// triangulate array
JST_triangulation = [JST_AOPolyWorld] call JST_fnc_triangulate;
JST_triAll = JST_triangulation select 0;
JST_st = JST_triangulation select 1;

// copy to new array that will be reduced to just AO shading triangles
JST_trisAO = +JST_triAll;

// discard triangles whose circumcenter is inside the AO poly
for "_i" from ((count JST_trisAO) - 1) to 0 step -1 do
{
	private _tri = JST_trisAO select _i;
	private _circumCenter = [_tri select 3 select 0, _tri select 3 select 1, 0];
	if (((count _circumCenter) > 0) and (_circumCenter inPolygon JST_AOPoly)) then
	{
		JST_trisAO deleteAt _i;
	};
} forEach JST_trisAO;
/*
// discard triangles that have a point in the supertriangle
for "_i" from ((count JST_trisAO) - 1) to 0 step -1 do
{
	private _tri = JST_trisAO select _i;
	private _inST = false;
	{
		if (_x in JST_st) exitWith {_inST = true};
	} forEach [_tri select 0, _tri select 1, _tri select 2];
	if (_inST) then {JST_trisAO deleteAt _i};
};
*/
// flatten triangles array
JST_trianglesFlat = [];
{
	_x params ["_p1", "_p2", "_p3"];
	JST_trianglesFlat append [_p1, _p2, _p3];
} forEach JST_trisAO;

// draw lines along edge
JST_AOpoly pushBack (JST_AOpoly select 0);
[JST_AOpoly] call JST_fnc_showPoly;

// remove existing ctrlEventHandlers
//findDisplay 12 displayCtrl 51 ctrlRemoveAllEventHandlers "Draw";

// add eventHandler to shade AO area
findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", 
{
	_this select 0 drawTriangle 
	[
		JST_trianglesFlat,
		[0,0,0,0.5],
		"#(rgb,1,1,1)color(1,1,1,1)"		
	];
}];