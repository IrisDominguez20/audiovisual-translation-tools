#Requires AutoHotkey v2.0

; ==============================================================================
; Tool: Character Macro / Quick Glossary Menu
; Author: Iris Domínguez (N. de la T.)
; License: MIT
; ==============================================================================

; --- CONFIGURATION SECTION (REPLACE NAMES HERE) ---
; Use the format: "&Number NAME"
; The "&" symbol allows you to select the name using your keyboard's number row.

MyMenu := Menu()
MyMenu.Add("&1 CENA", InsertCharacterName)
MyMenu.Add("&2 CHARLOTTE FLAIR", InsertCharacterName)
MyMenu.Add("&3 TARA", InsertCharacterName)
MyMenu.Add("&4 SAWEETIE", InsertCharacterName)
; You can add as many lines as needed following the same pattern.

; ------------------------------------------------------------------------------

; Hotkey: Press F8 to show the menu at your cursor position.
F8::MyMenu.Show()

; Script Logic (No need to edit below this line)
InsertCharacterName(Item, *) {
    ; SubStr(Item, 4) removes the "&1 " prefix to output only the name.
    SendInput SubStr(Item, 4)
}
