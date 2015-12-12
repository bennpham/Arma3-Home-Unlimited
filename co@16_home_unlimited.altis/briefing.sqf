/* Briefing
 * The briefing can be defined by calling FHQ_TT_addBriefing.
 * The array is built like this.
 * The first element should be a filter (side, group, faction, or a piece of script). All units matching the 
 * filter will see the briefing
 * This is followed by pairs of strings, a head line, and an actual text.
 * Briefings are added in the order in which they appear for any unit that matches
 * the last filter.
 */
[
	{true}, 
		["Situation",
"A group of crazy murderers are attacking your home and want to kill you, your family, and your friends. 
Luckily for you, your household is armed with guns. It is time for you to defend yourselves against these 
murderers and kill them all before they kill you.<br/><br/>

Note: These murderers can be whoever you want them to be whether it is ISIS, some cult, the government, crazy 
gangsters, Christian fundamentalists, PETA, straight out psychos, anti-choicers, etc. Just use your imagination 
for whoever these guys are trying to kill you are."],

		["Note",
"Enemies wear masks.<br/>
Friendlies do NOT wear masks.<br/><br/>

Click <font color = '#FF8000'>F</font> or whatever you mapped your <font color = '#FF8000'>Next Weapon / Firemode</font> button to in order to pull out your weapon at the start."],

		["Credits",
"Mission by Phantom Six<br/><br/>
Thanks to Varanon and Alwarren for FHQ Task Tracker and FHQ SafeAddLoadout.<br/><br/>
Thanks to Outlawz7 for creating Cleansweep Infinity in which I used as a template/reference.<br/><br/>
Thanks to Sithis for creating CO 02 Home mission (2 FIA soldiers getting their house raided by CSAT)"]
    
] call FHQ_TT_addBriefing;