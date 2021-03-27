So you've decided to download my mod...welcome and thank you.

This readme file gives a quick rundown of the mod.  Most of the variables added to this mod have been turned off to start (just to reduce the overall footprint), so it up to you as an admin to turn certain things on.  See the variables_and_commands.txt file for more information about what this mod can offer you.

This mod was built using the 1.17 source code, so I expect is to be compatible with all quake engines up to 1.17, and maybe slightly beyond that (I haven't tested that out yet).  1.16n and 1.17 source codes are very similar and the few differences have not caused a problem.  And in case you are wondering, I used notepad on my Windows machine to code everything you see here.

If you find a bug (god forbid!) I would really really encourage you to report it to me.  I will try my hardest to have a quick turnaround with bugfixes.  Also, if you can't quite find a feature or you'd like to request it, please let me know.  This mod is what it is because of input from players.  Without a feedback loop, this mod would not exist (so pat yourself on the back as being a pseudo-co-author).  I would encourage everyone who runs this mod to check the bulletin board on my website quite frequently.  If you find a bug or want to request a feature, please do so there.  While some features of this mod are turned on no matter what, if you feel you'd like to see more granularity, please me know.

This mod has a few variables that identify it.  At the console, the mod will tell you the build number (mod_build), the author's name (mod_author), and the mod's website (mod_website).  I can't predict the future, but all I know is that newer mod builds will be distributed from the website, so if there is a more current version on the website, go ahead and give it a try, it might have newer features or bugfixes in it.

Before you start, if you have a current ban list of IP addresses on your server, I would recommend removing it first, then running this mod and adding them back in.  See the server commands section in the variables_and_commands.txt file as to why this is important.

This mod is named NoGhost, so when you start quake up, you need to tell the engine you want to run the mod.  To start, create a sibling folder to the baseq3 folder called NoGhost, and put the noghost.pk3 file into that newly created folder.  Next, on a Windows machine, the command like to load the mod would look something like this:

Quake3.exe +set fs_Game NoGhost <additional_options>

I've included a few common startup scripts, which are located in the scripts folder of the noghost zip file.  Put these scripts into your quake directory and double click the one want to use.

If you set no additional options, then you can play with the bots using the mod or manually create a server within the game.  If you use the "+set dedicated 2" option, then you will create a non-graphical quake server than you can play on with other people across the Internet.  For me, I use the following command line...

Quake3.exe +set com_hunkmegs 20 +set net_port 27960 +set dedicated 2 +set fs_Game NoGhost +exec freezetag.cfg

The above command line starts quake in dedicated mode, sets the hunk memory to 20MB, sets the quake port to 27960, and then executes my freezetag.cfg file.  If you plan on running a dedicated server to host games, setting the hunk to 20 will help you to conserve a little memory.  Usually the hunk is set to 64, which suits the game just fine, but if you are running the non-graphical version of quake, then you don't need it to allocate so much memory.  I've included a few cfg files that will help you set up a vanilla flavored freezetag TDM server (freezetag.cfg) or a lastmanstanding FFA server (lms.cfg) or a railgun-only 1v1 tournament server(1v1tourney.cfg), among other types.  They are located in the Configs direction in the NoGhost.zip file.  Those are cfg files I use on my own servers, so I know they are tried and true.  Put those cfg files in your baseq3 directory to use them.  If you find a variable in the cfg that you don't understand, then reference the variables_and_commands.txt file for more information.

If you still are having problems with setting up a server, check out this link: http://www.gameadmins.com/modules.php?name=Sections&op=listarticles&secid=1

Lastly, I'd like to encourage people to be creative with how they implement this mod on their servers.  I see many servers out on the internet that are very similar, and it saddens me to think that with all the options in this mod (and others) why there aren't more varieties of quake servers out there...

Have fun.

-Maverick
http://noghost.servequake.com