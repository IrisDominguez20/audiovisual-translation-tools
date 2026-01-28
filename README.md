# audiovisual-translation-tools
Automation scripts and macros to streamline translation and subtitling workflows.
# Productivity Tools for Audiovisual Translation

## Character Insertion Macro (AutoHotkey v2)

### The Problem
In fast-paced localization projects (video games/scripts), repeatedly typing character names creates two main issues:
1. **Mechanical Fatigue:** Typing complex names hundreds of times drains energy.
2. **Inconsistency:** High pressure leads to typos (e.g., typing "Jon" instead of "John"), which affects LQA scores.

### The Solution
I developed this **AutoHotkey v2** script to deploy a visual context menu for quick text insertion.

**Key Features:**
* **GUI Menu:** Triggered by `F8`, displaying a clickable list.
* **Scalability:** New characters can be added to the cast list without altering the logic.
* **Error Prevention:** Ensures names are always inserted using the client-approved spelling (Terminology Consistency).

### How to use
1. Install AutoHotkey v2.
2. Run the script `Character_Menu_Macro.ahk`.
3. Press `F8` in any text field (Word, Excel, Subtitling Software).
4. Select the desired character.
