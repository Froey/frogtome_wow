# Frogtome (WoW)

### Froey's Game Tools for Organization, Management, and Efficiency

v1.0.1 (BETA)

## Description

Frogtome is a collection of in-game tools/displays for seeing the characters on your account, organizing information about/regarding those characters, and understanding general productivity as you play those characters day-to-day.

Divided into different "pages", Frogtome offers the following:

- Characters: See all of your characters, their levels, rested experience, professions (and skill points), bag sizes, money, and other general info - all in one table that updates itself automatically as you play.
- Farming: Get useful real-time metrics on how much XP or gold you're earning as you play, including pausing or resetting the tracking of these metrics. Also shows how much XP/gold you stand to gain from turning in quests within your quest log.
- Questing: Shows the current zones/dungeons appropriate for your character's level, and your progress in completing quests (and in the case of dungeons, prerequisite quests) for them.
- Notes: Leave yourself account-wide and character-specific notes.
- Settings: Customize many aspects of Frogtome exactly to your liking - how the Frogtome window is interacted with, what pages you wish to see or not, how certain metrics display, and more.

> [!WARNING]
> The Questing page is a Work in Progress and requires information current inaccessible until after WoW Forever releases in order to be complete, and as such is disabled by default but can be enabled via the settings.

Frogtome comes in two different views: The **Expanded** (normal) view and the **Condensed** view. The Expanded view allows you to see all of the information that Frogtome has to offer in the full-sized window. The Condensed view shrinks Frogtome down to a very short window that can act as a top-of-screen banner, etc., that allows you to see a more limited but concise view of the information you likely want to see at a quick glance for each page.

Frogtome's intent is to solve many recurring points of frustration or needs for separate data tracking, including but certainly not limited to:
- Knowing which characters have how much rested experience, for planning on who to level next.
- Knowing which characters are what professions, and their skills in those professions, to know who to send materials to or what you might be able to craft on which character.
- Knowing which characters have what sizes for bags, in case you have extra bags (or can make bags) and need to know who to send what to.
- Knowing which characters have how much gold, in case funds need to be collected to buy that sweet, sweet epic riding.
- Understanding your pace of leveling / gold farming, for when multiple options are on the table and you don't want to guess at which one is better.
- Seeing what your current quest log (or, as a configurable setting, your current tracked quests) will do for you, giving you expectations of the level/money you'll have afterwards.
- Having a quick reference to certain gold-related goals and your progress on achieving them.
- Seeing what zones (still) have a lot to offer quest-wise, especially if you're less familiar with the zones of Classic WoW.
- Seeing your progress with each dungeon quest-wise, given that WoW Forever has larger focus on dungeon quests than other versions of Classic WoW.
- Keeping notes to yourself, like crafting material lists, together and accessible across every character, limiting side-monitor note-taking insanity.
- Keeping notes for each character, like BiS lists or talent plans, on each individual character and accessible as relevant when you're on each character, limiting side-monitor note-taking insanity.

## Installation and Upgrades

Frogtome can be installed (and updated) automatically via the addon manager **CurseForge**, or can otherwise be installed manually with the most up-to-date release version's `.ZIP` file.

## Automatic Installation/Upgrade

To automatically install Frogtome:

### 1: Install CurseForge's Desktop Client

Follow the instructions on [CurseForge's website](https://www.curseforge.com/download/app) to download CurseForge for your desktop.

### 2: Add World of Warcraft to CurseForge

On the CurseForge desktop application, add World of Warcraft as a game you wish to install mods for. After doing so and clicking on World of Warcraft, use the flavor dropdown to choose the flavor for which you'd like to install Frogtome. You will likely need to install the desired flavor of World of Warcraft in order for the flavor to appear in CurseForge.

> [!NOTE]
> The current supported flavors of World of Warcraft for Frogtome are:
> - WoW Forever ("Forever")

### 3: Find and Install Frogtome

Once selected, click "Browse" and use the search bar to look for Frogtome by typing "Frogtome". You should see Frogtome as a search result, authored by FroeyFerelos. Click "Install" to install the addon directly to your installed World of Warcraft flavor's addon folder. Upon going back to "My Addons", you should see Frogtome listed.

### 4: Check for Updates

Finally, as updates to Frogtome are released, you can either configure CurseForge to automatically install updates for addons or you can instead manually install updates for addons you want to update. In the latter case, when an update is available, you should see "Update" as a clickable option for Frogtome - simply click that button to update Frogtome.

## Manual Installation/Upgrade

To manually install Frogtome:

### 1: Download Latest Release `.ZIP`

By navigating to either this project's [CurseForge page](https://www.curseforge.com/wow/addons/frogtome) or [GitHub repository's release list](https://github.com/Froey/frogtome_wow/releases), the most recent version's `.ZIP` file can be located and downloaded. The downloaded file should be something akin to `frogtome_vX.Y.Z.zip`, where `vX.Y.Z` is the most up-to-date version.

### 2: Extract `.ZIP` Contents

With the appropriate `.ZIP` file downloaded, unzip/extract its contents and find the enclosed addon folder `frogtome_wow`. This is the top-level folder that, with all of its contents, needs to be put in your game's addon folder in order for the addon to be installed.

### 3: Copy/Move `frogtome_wow` into `AddOns` Folder.

Find your game's `AddOns` folder - this is where all installed addons reside. Depending on your version/flavor of World of Warcraft, this should look something like `Program Files (x86)/World of Warcraft/_FLAVOR_/Interface/AddOns/`, where `_FLAVOR_` is the specific flavor installation for World of Warcraft (`_retail_` for Retail WoW, `_forever_` for WoW Forever, etc.).

> [!NOTE]
> The current supported flavors of World of Warcraft for Frogtome are:
> - WoW Forever (`_forever_`)

Copy or move the `frogtome_wow` folder you unzipped into this `AddOns` folder, so that the full path looks something like `Program Files (x86)/World of Warcraft/_FLAVOR_/Interface/AddOns/frogtome_wow`.

With that - after reloading the game's interface (`/reload`) if you're already logged in - Frogtome should now be installed!

## User Guide

A copy of Frogtome's User Guide is included in downloaded copies of the addon. Frogtome's User Guide is also available as a [Google Doc](https://docs.google.com/document/d/1Tan5-wzCs-qpqMR5u4s_J9Vv8x2-C_mjzuoTBqFhcaU/edit?usp=sharing).

Please refer to this user guide for details on Frogtome, what it offers, and how it can be used and interacted with.

## Author's Notes

The goal of this addon is to offer a quick view of helpful information, including info for characters you're not currently logged in on, while staying as lightweight, unintrusive, and unobstuctive as possible. Developed by Froey - a long-time player of World of Warcraft and Final Fantasy XIV, a player who would use spreadsheets galore to keep track of many characters in both games, and a player who prefers very minimalistic use of any addons/plugins - this addon was made to replace the need for constantly checking/updating info on a separate monitor while minimally taking away from a "pure" feel within the game.

This addon was made for the love of sanity while playing the game we love, and **this addon was made without the use of AI to generate code**. I hope you get great use out of it, and feel free to leave feedback, suggestions, requests, issues, or otherwise!
