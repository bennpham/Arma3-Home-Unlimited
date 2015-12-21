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

		["Known Issues",
"You won't be able to see your weapon at the start if you play on dedicated servers. Simply press whatever your 
<font color = '#FF8000'>Next Weapon / Firemode</font> button is to pull out your weapon. Default is <font color = '#FF8000'>F</font>.<br/><br/>

Completely randomized spawns that are not handpicked may bug out and not spawn enemies. You'll get an instant mission complete if that 
happens. This is often the case if the random location happens to be a small island and the enemy spawn distance paramter lands in 
the water for every spots selected.<br/><br/>

You may have a small probability of dying on spawn with completely randomized spawns that are not handpicked. This also depends on the house. 
You may get stuck in smaller houses and end up dying if you're stuck in a wall.<br/><br/>

Sometimes, not all playable units are spawned at the objective location.<br/><br/>

Sometimes, units may not have a uniform, therefore, will be low on ammo."],

		["Credits",
"Mission by Phantom Six<br/><br/>
Thanks to Varanon and Alwarren for FHQ Task Tracker and FHQ SafeAddLoadout.<br/><br/>
Thanks to Outlawz7 for creating Cleansweep Infinity in which I used as a template/reference.<br/><br/>
Thanks to Sithis for creating CO 02 Home mission (2 FIA soldiers getting their house raided by CSAT)"]
    
] call FHQ_TT_addBriefing;