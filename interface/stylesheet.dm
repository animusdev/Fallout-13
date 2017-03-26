/client/script = {"<style>
body					{font-family: Arial, Helvetica, sans-serif;}

h1, h2, h3, h4, h5, h6	{color: #3c4438;	font-family: Arial, Helvetica, sans-serif;}

em						{font-style: normal;	font-weight: bold;}

.motd					{color: #454943;	font-family: Arial, Helvetica, sans-serif;}
.motd h1, .motd h2, .motd h3, .motd h4, .motd h5, .motd h6
	{color: #3c4438;	text-decoration: underline;}
.motd a, .motd a:link, .motd a:visited, .motd a:active, .motd a:hover
	{color: #4c5b42;}

.italics				{					font-style: italic;}

.prefix					{					font-weight: bold;}

.ooc					{					font-weight: bold;}
.adminobserverooc		{color: #0b575e;	font-weight: bold;}
.adminooc				{color: #77ca00;	font-weight: bold;}

.adminobserver			{color: #19654b;	font-weight: bold;}
.admin					{color: #920034;	font-weight: bold;}

.name					{					font-weight: bold;}

.say					{}
.deadsay				{color: #3c1478;}
.radio					{color: #553800;}
.sciradio				{color: #001760;}
.comradio				{color: #193a7a;}
.secradio				{color: #425919;}
.medradio				{color: #0d5c89;}
.engradio				{color: #903612;}
.suppradio				{color: #6b4819;}
.servradio				{color: #6eaa2c;}
.syndradio				{color: #6d3f40;}
.centcomradio			{color: #603800;}
.aiprivradio			{color: #ad9658;}
.ncr					{color: #425919;}
.legion					{color: #6d3f40;}
.den					{color: #193a7a;}
.town					{color: #001760;}
.enclave				{color: #6eaa2c;}
.brotherhood			{color: #6b4819;}

.yell					{					font-weight: bold;}

.alert					{color: #7e0707;}
h1.alert, h2.alert		{color: #000000;}

.emote					{					font-style: italic;}
.selecteddna			{color: #ffffff; 	background-color: #001B1B}

.attack					{color: #990000;}
.disarm					{color: #7e0707;}
.passive				{color: #660000;}

.userdanger				{color: #7e0707;	font-weight: bold; font-size: 3;}
.danger					{color: #7e0707;}
.warning				{color: #7e0707;	font-style: italic;}
.boldwarning			{color: #7e0707;	font-style: italic;	font-weight: bold}
.announce 				{color: #20c920;	font-weight: bold;}
.boldannounce			{color: #77ca00;	font-weight: bold;}
.greenannounce			{color: #03ff03;	font-weight: bold;}
.rose					{color: #6d3f40;}
.info					{color: #2c2c56;}
.notice					{color: #00484b;}
.boldnotice				{color: #00484b;	font-weight: bold;}
.adminnotice			{color: #77ca00;}
.unconscious			{color: #6d3f40;	font-weight: bold;}
.suicide				{color: #ff5050;	font-style: italic;}
.green					{color: #03ff03;}
.shadowling				{color: #3b2769;}
.cult					{color: #812e00;}
.cultitalic				{color: #812e00;	font-style: italic;}
.cultlarge				{color: #812e00; font-weight: bold; font-size: 3;}
.narsie					{color: #812e00; font-weight: bold; font-size: 15;}
.narsiesmall			{color: #812e00; font-weight: bold; font-size: 6;}
.colossus				{color: #7F282A; font-size: 5;}
.hierophant				{color: #660099; font-weight: bold; font-style: italic;}
.hierophant_warning		{color: #660099; font-style: italic;}
.purple					{color: #5e2d79;}
.holoparasite			{color: #35333a;}
.holoparasitebold		{color: #35333a;	font-weight: bold;}

.revennotice			{color: #1d2953;}
.revenboldnotice		{color: #1d2953;	font-weight: bold;}
.revenbignotice			{color: #1d2953;	font-weight: bold; font-size: 3;}
.revenminor				{color: #3c1478}
.revenwarning			{color: #760fbb;	font-style: italic;}
.revendanger			{color: #760fbb;	font-weight: bold; font-size: 3;}
.umbra					{color: #5000A0;}
.umbra_bold				{color: #5000A0;	font-weight: bold;}
.umbra_italics			{color: #5000A0;	font-style: italic;}
.umbra_emphasis			{color: #5000A0;	font-weight: bold;	font-style: italic;}
.umbra_large			{color: #5000A0;	font-size: 3;}

.brass					{color: #BE8700;}
.heavy_brass			{color: #BE8700; font-weight: bold; font-style: italic;}
.large_brass			{color: #BE8700; font-size: 3;}
.big_brass				{color: #BE8700; font-size: 3; font-weight: bold; font-style: italic;}
.ratvar					{color: #BE8700; font-size: 6; font-weight: bold; font-style: italic;}
.alloy					{color: #42474D;}
.heavy_alloy			{color: #42474D; font-weight: bold; font-style: italic;}
.large_alloy			{color: #42474D; font-size: 3;}
.nezbere_large			{color: #42474D; font-size: 3; font-weight: bold; font-style: italic;}
.nezbere				{color: #42474D; font-weight: bold; font-style: italic;}
.nezbere_small			{color: #42474D;}
.sevtug_large			{color: #542554; font-size: 3; font-weight: bold; font-style: italic;}
.sevtug					{color: #542554; font-weight: bold; font-style: italic;}
.sevtug_small			{color: #542554;}
.inathneq_large			{color: #206499; font-size: 3; font-weight: bold; font-style: italic;}
.inathneq				{color: #206499; font-weight: bold; font-style: italic;}
.inathneq_small			{color: #206499;}
.nzcrentr_large			{color: #DAAA18; font-size: 3; font-weight: bold; font-style: italic;}
.nzcrentr				{color: #DAAA18; font-weight: bold; font-style: italic;}
.nzcrentr_small			{color: #DAAA18;}
.neovgre_large			{color: #6E001A; font-size: 3; font-weight: bold; font-style: italic;}
.neovgre				{color: #6E001A; font-weight: bold; font-style: italic;}
.neovgre_small			{color: #6E001A;}

.newscaster				{color: #193a7a;}
.ghostalert				{color: #5c00e6;	font-style: italic; font-weight: bold;}

.alien					{color: #543354;}
.noticealien			{color: #00c000;}
.alertalien				{color: #00c000;	font-weight: bold;}
.borer					{color: #543354;	font-style: italic;}
.changeling				{color: #800080;	font-style: italic;}

.interface				{color: #330033;}

.sans					{font-family: "Comic Sans MS", cursive, sans-serif;}
.papyrus				{font-family: "Papyrus", cursive, sans-serif;}
.robot					{font-family: "Courier New", cursive, sans-serif;}

.command_headset       {font-weight: bold; font-size: 3;}
.big					{font-size: 3;}
.reallybig				{font-size: 4;}
.greentext				{color: #00FF00;	font-size: 3;}
.redtext				{color: #772527;	font-size: 3;}
.clown					{color: #FF69Bf;	font-size: 3; font-family: "Comic Sans MS", cursive, sans-serif; font-weight: bold;}

BIG IMG.icon 			{width: 32px; height: 32px;}

.memo					{color: #19654b;	text-align: center;}
.memoedit				{text-align: center;	font-size: 2;}
.abductor				{color: #800080; font-style: italic;}

</style>"}
