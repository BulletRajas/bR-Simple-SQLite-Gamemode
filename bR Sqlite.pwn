/*                           CREDITS
 *                       BulletRaja: Main
 *
 *
 *          Includes : To All
 *
 *BBBBBBBBBBBBBBBBB           RRRRRRRRRRRRRR
 *BB              BB          RR           RR
 *BB             BB           RR          RR
 *BB            BB            RR         RR
 *BB           BB             RR        RR
 *BBBBBBBBBBBBB               RRRRRRRRRR
 *BB           BB             RR        RR
 *BB            BB            RR         RR
 *BB             BB           RR          RR
 *BB              BB          RR           RR
 *BBBBBBBBBBBBBBBBB           RR            RR
 *BULLET RAJA               Presents bR Simple Sqlite Gamemode
 *
 *=================>>>> Change Log <<<<=================
 *>>>>>>>>>>>>>>> Version 1 <<<<<<<<<<<<<<<
 *>> Added SQLITE Login/Register System
 *>> Added New Style In Login/Register System
 *>>>>>>>>>>>>>>> Version 2 <<<<<<<<<<<<<<<
 *>> Added Admin System With Simple Cmds
 *>> Added Online Admins Cmd
 *>> Rleased
 */

//== Includes ==//
#include <a_samp>
#include <sscanf2>
#include <utils>
#include <zcmd>

//== Server Entities ==//
#define     SV_VER      "(0.3.7)"//here you can add your server version
#define     SV_GM       "bR Simple Sqlite Gamemode ["SCRIPT_V"]"//here add your gamemode text
#define     SV_LANG     "English"//here add your server language
#define     SV_RCON     "BulletR"//here add server rcon
#define     SV_SNAME    "Check /rules, /updates"//here add your server second name
#define     SV_NAME     "bR Simple Sqlite Gamemode "SV_VER""//here add server name
#define     SV_URL      "www.BulletRaja.Com"//here put server url
#define     SV_MAP      "San Andreas"//here server map name
#define     SCRIPT_V    "v2"

//== Max Defines ==//
#define MAX_INI_ENTRY_TEXT 80
#define MAX_CLIENT_MSG_LENGTH 144

//== Dialogs ==//
#define DIALOG_LOGIN        1
#define DIALOG_REGISTER     2

//== Colours ==//
#define COLOR_WHITE 		0xFFFFFFFF
#define COLOR_WHITEP 		0xFFE4C4FF
#define COLOR_ORANGE   		0xDB881AFF
#define COLOR_ORANGE2		0xFF5000FF
#define COLOR_IVORY 		0xFFFF82FF
#define COLOR_LIME 			0xD2D2ABFF
#define COLOR_BLUE			0x004BFFFF
#define COLOR_SBLUE			0x56A4E4FF
#define COLOR_RCONBLUE      0x0080FF99
#define COLOR_PURPLE 		0x5A00FFFF
#define COLOR_RED 			0xFF0000FF
#define COLOR_LRED 			0xE65555FF
#define COLOR_LIGHTGREEN 	0x00FF00FF
#define COLOR_YELLOW 		0xFFFF00FF
#define COLOR_YELLOW2 		0xF5DEB3FF
#define COLOR_LB 			0x15D4EDFF
#define COLOR_PINK			0xEE82EEFF
#define COLOR_GOLD			0xFFD700FF
#define COLOR_FIREBRICK 	0xB22222FF
#define COLOR_GREEN 		0x3BBD44FF
#define COLOR_GREY2 		0x778899FF
#define COLOR_GREY3			0xC8C8C8FF
#define COLOR_DARK 			0x7A7A7AFF
#define COLOR_BROWN 		0x8B4513FF
#define COLOR_SYSTEM 		0xEFEFF7FF
#define COLOR_PURPLE2 0xC2A2DAFF
#define COLOR_DARKRED 0xAA3333FF
#define COLOR_GREY 0xAFAFAFFF
#define COLOR_ASAY 0xFF0000FF
#define COLOR_OSAY 0x007700FF
#define COLOR_HSAY 0x1684CAFF
#define COLOR_MSAY 0x1684CAFF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_DARKMAUVE 0x623778FF
#define COLOR_MAUVE 0x845F96FF
#define COLOR_GREENYELLOW 0xADFF2FAA
#define COLOR_LBLUE 0x99FFFFFF
#define COLOR_LIGHTBLUE 0x99FFFFFF
#define COLOR_PEACH 0xFFCC66FF
#define COLOR_SILVER 0xDDDDDDFF
#define COLOR_WANTEDBLUE 0x0055CCFF
#define COLOR_DARK_VIOLET 0x9400D3FF
#define COLOR_VIP1 0x9400D3FF
#define COLOR_HELP 0x00E5EEFF
#define COLOR_ADMIN 0x0066FFFF
#define COLOR_ADMIN2 0x008FD6FF
#define COLOR_PLAYER 0xFFCC33FF
#define COLOR_RP 0xFFFFFFFF
#define COLOR_ULTRAADMIN 0x993300FF
#define COLOR_EVENT 0x00CC66FF
#define COLOR_VIP2 0xFF33CCFF
#define COLOR_VIPCHAT 0xCC66CCFF
#define 	COL_WHITE       "{FFFFFF}"
#define 	COL_BLACK       "{0E0101}"
#define 	COL_GREY        "{C3C3C3}"
#define 	COL_GREEN       "{6EF83C}"
#define 	COL_RED         "{F81414}"
#define 	COL_YELLOW      "{F3FF02}"
#define 	COL_ORANGE      "{FFAF00}"
#define 	COL_LIME        "{B7FF00}"
#define 	COL_CYAN        "{00FFEE}"
#define 	COL_BLUE        "{0049FF}"
#define 	COL_MAGENTA     "{F300FF}"
#define 	COL_VIOLET      "{B700FF}"
#define 	COL_PINK        "{FF00EA}"
#define 	COL_MARONE      "{A90202}"
#define RED_E 		"{FF0000}"
#define BLUE_E 		"{004BFF}"
#define SBLUE_E 	"{56A4E4}"
#define PINK_E 		"{FFB6C1}"
#define YELLOW_E 	"{FFFF00}"
#define LG_E 		"{00FF00}"
#define LB_E 		"{15D4ED}"
#define LB2_E 		"{87CEFA}"
#define GREY_E 		"{BABABA}"
#define GREY2_E 	"{778899}"
#define GREY3_E 	"{C8C8C8}"
#define DARK_E 		"{7A7A7A}"
#define WHITE_E 	"{FFFFFF}"
#define WHITEP_E 	"{FFE4C4}"
#define IVORY_E 	"{FFFF82}"
#define ORANGE_E 	"{DB881A}"
#define GREEN_E 	"{3BBD44}"
#define PURPLE_E 	"{5A00FF}"
#define LIME_E 		"{D2D2AB}"
#define LRED_E		"{E65555}"

//== Class Selection Defines ==//
#define CLASS_X 1088.1422
#define CLASS_Y 1074.0307
#define CLASS_Z 10.8382

//== Natives ==//
native WP_Hash(buffer[], len, const str[]);

//== Enumerators ==//
enum USER_DATA
{
    PlayerID,
    UserName[MAX_PLAYER_NAME],
    Password[129],
    UserLevel,
    UserVip,
    UserMoney,
    UserScore,
    UserKills,
    UserDeaths,
    UserK,

    bool: Logged
};
new User[PLAYERS][USER_DATA];
new DB: Database;
new pldialog[PLAYERS];
new isconnected[PLAYERS];

//== Stocks ==//
stock RPN(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, sizeof(name));
	return name;
}
stock DB_Escape(text[])
{
    new ret[ 80 * 2 ], ch, i, j;
    while((ch = text[i++]) && j < sizeof(ret))
    {
        if(ch == '\'')
        {
            if(j < sizeof(ret) - 2)
            {
                ret[j++] = '\'';
                ret[j++] = '\'';
            }
        }
        else if(j < sizeof(ret))
        {
            ret[j++] = ch;
        }
        else
        {
            j++;
        }
    }
    ret[sizeof(ret) - 1] = '\0';
    return ret;
}
SendMessageToAdmins(color, message[])
{
	for (new i = 0; i < PLAYERS; i++)
	{
		if (IsPlayerConnected2(i) && User[i][UserLevel] != 0) SendClientMessage2(i, color, message);
	}
}
SendClientMessage2(playerid, color, message[])
{
	if (strlen(message) <= MAX_CLIENT_MSG_LENGTH)
	{
		SendClientMessage(playerid, color, message);
	}
	else
	{
		new string[MAX_CLIENT_MSG_LENGTH + 1];
		strmid(string, message, 0, MAX_CLIENT_MSG_LENGTH);
		SendClientMessage(playerid, color, string);
	}
	return 1;
}

SendClientMessageToAll2(color, message[])
{
	for (new i = 0; i < PLAYERS; i++)
	{
		if (IsPlayerConnected2(i)) SendClientMessage2(i, color, message);
	}
	return 1;
}
IsPlayerConnected2(playerid)
{
	return IsPlayerNPC(playerid) == 0 && playerid < sizeof(isconnected) ? isconnected[playerid] : 0;
}
ShowPlayerDialog2(playerid, dialogid, style, caption[], info[], button1[], button2[])
{
	ShowPlayerDialog(playerid, dialogid, style, caption, info, button1, button2);
	pldialog[playerid] = dialogid;
}
SendPlayerFormattedText(playerid, color, str[], define1[], define2[])
{
	new tstr[256];
	format(tstr, 256, str, define1, define2);
	SendClientMessage2(playerid, color, tstr);
	return 1;
}

SendAllFormattedText(color, str[], define1[], define2[])
{
	new tstr[256];
	format(tstr, 256, str, define1, define2);
	SendClientMessageToAll2(color, tstr);
	return 1;
}
//== Main ==//
main()
{
	print("//=============Credits=============\\");
	print("|=========== BulletRaja ===========|");
	print("|=========== Includes ===========|");
	print("|=========== Thanks All ===========|");
	print("//=============Credits=============\\");
}

public OnGameModeInit()
{
    Database = db_open("SDataBase.db");
    db_query(Database, "CREATE TABLE IF NOT EXISTS users (UserLevel INTEGER PRIMARY KEY AUTOINCREMENT, username VARCHAR(24) COLLATE NOCASE, password VARCHAR(129), admin INTEGER DEFAULT 0 NOT NULL, vip INTEGER DEFAULT 0 NOT NULL, money INTEGER DEFAULT 0 NOT NULL, score INTEGER DEFAULT 0 NOT NULL, kills INTEGER DEFAULT 0 NOT NULL, deaths INTEGER DEFAULT 0 NOT NULL, kd INTEGER DEFAULT 0 NOT NULL)");
    SetGameModeText(""SV_GM""SCRIPT_V"");
	SendRconCommand("language "SV_LANG"");
	SendRconCommand("rcon_password "SV_RCON"");
	SendRconCommand("hostname "SV_NAME"");
	SendRconCommand("weburl "SV_URL"");
    SendRconCommand("mapname "SV_MAP"");
    
    for (new c = 1; c < 300; c++)
	{
		if (c == 74) continue;
		AddPlayerClass(c, CLASS_X, CLASS_Y, CLASS_Z, 0.0, 0, 0, 0, 0, 0, 0);
	}
    return 1;
}

public OnGameModeExit()
{
    db_close(Database);
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
    new playername[MAX_PLAYER_NAME], str[270];
    GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
    if (isconnected[playerid] == 0)
	{
		isconnected[playerid] = 1;
		SetPlayerColor(playerid, COLOR_PLAYER);
		TogglePlayerSpectating(playerid, 1);
		SetPlayerVirtualWorld(playerid, 1);

		for(new i; i < _: USER_DATA; ++i) User[playerid][USER_DATA: i] = 0;

        GetPlayerName(playerid, User[playerid][UserName], MAX_PLAYER_NAME);
        new Query[71], DBResult: Result;
        format(Query, sizeof(Query), "SELECT password FROM users WHERE username = '%s' LIMIT 0, 1", DB_Escape(User[playerid][UserName]));
        Result = db_query(Database, Query);
        if(db_num_rows(Result))
        {
         db_get_field_assoc(Result, "password", User[playerid][Password], 129);
         format(str, sizeof(str), "Welcome to {00FFF3}%s.\n\n"COL_RED"Account:{FFFFFF} %s\n\nPlease enter your password below:", SV_SNAME, RPN(playerid));
         ShowPlayerDialog2(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to your account", str, "Login", "Cancel");
         SendPlayerFormattedText(playerid, COLOR_LBLUE, "Welcome back %s to {FF33CC}"SV_SNAME"{FFFFFF}.", playername, "");
        }
        else
        {
		    format(str, sizeof(str), "Welcome to {FFB900}%s.\n\n"COL_RED"Account:{FFFFFF} %s\n\nRegister an account to play.\n\nPlease put the password below:", SV_SNAME, RPN(playerid));
			ShowPlayerDialog2(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register an account", str, "Continue", "Cancel");
			SendPlayerFormattedText(playerid, COLOR_WHITE, "Welcome %s to {FF33CC}"SV_SNAME"{FFFFFF}.", playername, "");
        }
        db_free_result(Result);
		return 0;
	}
    return 1;
}

public OnPlayerConnect(playerid)
{
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    if(User[playerid][Logged] == true)
    {
        new Query[128];
        format(Query, sizeof(Query), "UPDATE users SET aLevel = %d, vLevel = %d, money = %d, score = %d, kills = %d, deaths = %d, kd = %d WHERE username = '%s'", User[playerid][UserLevel], User[playerid][UserVip], GetPlayerMoney(playerid), GetPlayerScore(playerid), User[playerid][UserKills], User[playerid][UserDeaths], User[playerid][UserK], DB_Escape(User[playerid][UserName]));
		db_query(Database, Query);
    }
    for(new i; i < _: USER_DATA; ++i) User[playerid][USER_DATA: i] = 0;
    return 1;
}

public OnPlayerSpawn(playerid)
{
    return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	User[killerid][UserKills]++;
	User[playerid][UserDeaths]++;
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
    new name[MAX_PLAYER_NAME], playername[25], temp1, tmp2[256], tmp[256], str[270];
    GetPlayerName(playerid, name, sizeof(name));
    GetPlayerName(playerid, playername, sizeof(playername));
    if(dialogid == DIALOG_LOGIN)
    {
        if(response)
        {
            if(!inputtext[0])
            {
             format(str, sizeof(str), "Welcome to {00FFF3}%s.\n\n"COL_RED"Account:{FFFFFF} %s\n\nPlease enter your password below:", SV_SNAME, RPN(playerid));
             ShowPlayerDialog2(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, "Login to your account", str, "Login", "Cancel");
             SendPlayerFormattedText(playerid, COLOR_LBLUE, "Welcome back %s to {FF33CC}"SV_SNAME"{FFFFFF}.", playername, "");
			 return 1;
            }
            new buf[129];
            WP_Hash(buf, 129, inputtext);
            if(!strcmp(buf, User[playerid][Password], false))
            {
                new Query[75], DBResult: Result;
                format(Query, sizeof(Query), "SELECT * FROM users WHERE username = '%s' LIMIT 0, 1", DB_Escape(User[playerid][UserName]));
                Result = db_query(Database, Query);
                if(db_num_rows(Result))
                {
                    db_get_field_assoc(Result, "UserID", Query, 7);
                    User[playerid][PlayerID] = strval(Query);

                    db_get_field_assoc(Result, "aLevel", Query, 3);
                    User[playerid][UserLevel] = strval(Query);

                    db_get_field_assoc(Result, "vLevel", Query, 3);
                    User[playerid][UserVip] = strval(Query);

                    db_get_field_assoc(Result, "money", Query, 10);
                    User[playerid][UserMoney] = strval(Query);

                    db_get_field_assoc(Result, "score", Query, 7);
                    User[playerid][UserScore] = strval(Query);

					db_get_field_assoc(Result, "kills", Query, 10);
                    User[playerid][UserKills] = strval(Query);

                    db_get_field_assoc(Result, "deaths", Query, 10);
                    User[playerid][UserDeaths] = strval(Query);

                    db_get_field_assoc(Result, "kd", Query, 10);
                    User[playerid][UserK] = strval(Query);

                    User[playerid][Logged] = true;
                    TogglePlayerSpectating(playerid, 0);

                    GivePlayerMoney(playerid, User[playerid][UserMoney]);
                    SetPlayerScore(playerid, User[playerid][UserScore]);

                    SendClientMessage2(playerid, COLOR_WHITE, "Login successful, your status has been restored!");
			        printf("[logged] %s (Id%d) has logged in.", playername, playerid);
                }
                db_free_result(Result);
            }
            else
            {
				temp1 = GetPVarInt(playerid, "loginattempts")+1;
				if (temp1 == 3)
				{
					SendClientMessage2(playerid, COLOR_RED, "Bad password threshold reached. You have been kicked!");
					SetTimerEx("KickBanTimer", 50, 0, "dd", playerid, 1);
				}
				else
				{
				    if (temp1 == 1)
					{
						SendClientMessage2(playerid, COLOR_HELP, "If you need support please say what help you need in chat, and our admins will be informed.");
					}
					SetPVarInt(playerid, "loginattempts", temp1);
					format(tmp, 32, "Login to your account (%d/3)", temp1);
					format(tmp2, 280, "Type your password below to login to your account.\n\n"COL_RED"Account:{FFFFFF} %s\n\n{E60026}Password incorrect. Attempts remaining - %d.",RPN(playerid), 3 - temp1);
					ShowPlayerDialog2(playerid, DIALOG_LOGIN, DIALOG_STYLE_PASSWORD, tmp, tmp2, "Login", "Cancel");
					format(tmp2, 280, "Password incorrect. Attempts remaining - %d.", 3 - temp1);
					SendClientMessage2(playerid, COLOR_RED, tmp2);
			 }
			 }
        }
        //else Kick(playerid);
        return 1;
    }
	if(dialogid == DIALOG_REGISTER)
	{
	    if(response)
	    {
	        if(strlen(inputtext) < 3 || strlen(inputtext) > 24)
	        {
	            format(str, sizeof(str), "Welcome to {FFB900}%s.\n\n"COL_RED"Account:{FFFFFF} %s\n\nRegister an account to play.\nThe password is invalid, Its lenght should be 3-24 characters\n\nPlease put the password below:", SV_SNAME, RPN(playerid));
			    ShowPlayerDialog2(playerid, DIALOG_REGISTER, DIALOG_STYLE_PASSWORD, "Register an account", str, "Continue", "Cancel");
	            return 1;
	        }
	        new Query[208];
            WP_Hash(User[playerid][Password], 129, inputtext);
	        format(Query, sizeof(Query), "INSERT INTO users (username, password) VALUES ('%s', '%s')", DB_Escape(User[playerid][UserName]), DB_Escape(User[playerid][Password]));
	        db_query(Database, Query);

	        User[playerid][Logged] = true;
	        TogglePlayerSpectating(playerid, 0);
	        SendPlayerFormattedText(playerid, COLOR_YELLOW, "Account '%s' created, you have been logged in automatically!", playername, "");
		    SendAllFormattedText(COLOR_GREEN, "%s has registered a new account. Welcome to our server!", playername, "");
		    printf("[registered] %s (Id%d) has registered a new account.", playername, playerid);
	    }
		return 1;
	}
	return 1;
}
/** Commands **/
CMD:setadmin(playerid, params[])
{
	new giveplayerid, moneys1, giveplayer[25], playername[25], string[256];
	if (User[playerid][UserLevel] < 6 && !IsPlayerAdmin(playerid)) return 0;
	if (sscanf(params, "ud", giveplayerid, moneys1)) return SendClientMessage2(playerid, COLOR_WHITE, "Usage: /setadmin [playerid] [level 1-6]");
	if (!IsPlayerConnected2(giveplayerid)) return SendClientMessage2(playerid, COLOR_RED, "Error: Inactive player id!");
	if (moneys1 < 0 || moneys1 > 6) return SendClientMessage2(playerid, COLOR_RED, "Error: Invalid admin level.");
	GetPlayerName(giveplayerid, giveplayer, MAX_PLAYER_NAME);
	if (User[playerid][UserLevel] >= User[playerid][UserLevel] && User[playerid][UserLevel] < 6 && !IsPlayerAdmin(playerid)) return SendPlayerFormattedText(playerid, COLOR_RED, "Error: You cannot Make admin %s", giveplayer, "");
	GetPlayerName(giveplayerid, giveplayer, MAX_PLAYER_NAME);
	if (moneys1 == User[playerid][UserLevel])
	{
		format(string, 64, "%s is already admin level %d.", giveplayer, moneys1);
		SendClientMessage2(playerid, COLOR_WHITE, string);
		return 1;
	}
	GetPlayerName(playerid, playername, MAX_PLAYER_NAME);
	User[playerid][UserLevel] = moneys1;
	format(string, 64, "You have been set as admin level %d.", moneys1);
	SendClientMessage2(giveplayerid, COLOR_YELLOW, string);
	format(string, 64, "You have set %s as admin level %d.", giveplayer, moneys1);
	SendClientMessage2(playerid, COLOR_YELLOW, string);
	return 1;
}

CMD:ac(playerid, params[])
{
	new string[172];
	if(User[playerid][UserLevel] < 1) return 0;
	if(isnull(params)) return SendClientMessage(playerid, -1, "Please use /ac [Message]");
	new PName[MAX_PLAYER_NAME+1];
    GetPlayerName(playerid, PName, sizeof(PName));
	format(string, sizeof(string), "[Admin Chat][%s] %s: %s", PName, params);
	SendMessageToAdmins(COLOR_RED, string);
	return 1;
}

CMD:asay(playerid, params[])
  {
  if(User[playerid][UserLevel] < 1) return 0;
  new text[128];
  if(sscanf(params, "s[128]",text)) return SendClientMessage(playerid, 0xFFFFFFFF, "Usage: /asay [text]");
  new string[128];
  new pName[128];
  GetPlayerName(playerid,pName,128);
  format(string,sizeof string,"[%s]%s: %s",pName,text);
  SendClientMessageToAll(COLOR_GREEN,string);
  return 1;
}
CMD:admins(playerid, params[])
{
  new admins, strings[270];
  if(User[playerid][UserScore] < 100) return SendClientMessage(playerid, COLOR_WHITE,"[Server]: You must have 100 Scores to see online admins");
  SendClientMessage(playerid, COLOR_BLUE, "Online Admins");
  for(new i = 0; i < PLAYERS; i++)
  {
   if (IsPlayerConnected(i))
   {
    if(User[i][UserLevel] >= 1)
    {
       new string[128], pname[24];
       GetPlayerName(i, pname, sizeof(pname));
       admins++;
       format(string, sizeof(string), "%s {00FF00} Admin Level: {FF0000}%d", pname, User[i][UserLevel]);
       SendClientMessage(playerid, COLOR_RED, string);
    }
  }
  }
  if (admins == 0)
  {
   SendClientMessage(playerid, COLOR_RED, "[Server]: Their are no admins online.");
  }
  else
  {
   format(strings, sizeof(strings), "[Server]: There are currently %d Admins online.", admins);
   SendClientMessage(playerid, COLOR_GREEN, strings);
  }
  return 1;
}
