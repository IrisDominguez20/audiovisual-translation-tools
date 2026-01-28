#Requires AutoHotkey v2.0

; Create the popup menu by adding some items to it.
MyMenu := Menu()
MyMenu.Add("&1 CENA", InsertCharacterName)
MyMenu.Add("&2 CHARLOTTE FLAIR", InsertCharacterName)
MyMenu.Add("&3 TARA", InsertCharacterName)
MyMenu.Add("&4 SAWEETIE", InsertCharacterName)

; Define shortcut to show menu (F8)
F8::MyMenu.Show()  ; Press F8 to show the menu.

; Function called from each menu item
InsertCharacterName(Item, *) {
    ; Use SendInput to simulate typing the selected item at the active input field
    ; SubStr(Item, 4) removes the prefix (e.g., "&1 ") to output just the name
    SendInput SubStr(Item, 4)
}
