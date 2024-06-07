# Hobbs_Hogtie

- Script Description in English

- This script manages a player's ability to break free when they are hogtied in RedM. It performs the following functions:

    Hogtie Detection: Continuously checks if the player is hogtied using the IS_PED_HOGTIED native function.
    Nearby Player Check: Determines if there are any other players within a 20-meter radius.
    Control Restriction: Disables the control action for breaking free if other players are nearby. If no players are within range, the player can break free.
    Optimized Execution: Runs the main loop with high frequency when the player is hogtied and less frequently when not hogtied, ensuring efficient CPU usage.

- Script Description in German

- Dieses Skript verwaltet die Fähigkeit eines Spielers, sich zu befreien, wenn er in RedM gefesselt ist. Es führt die folgenden Funktionen aus:

    Fesselungserkennung: Überprüft kontinuierlich, ob der Spieler gefesselt ist, mithilfe der IS_PED_HOGTIED-Native-Funktion.
    Überprüfung auf nahegelegene Spieler: Bestimmt, ob sich andere Spieler im Umkreis von 20 Metern befinden.
    Steuerungsbeschränkung: Deaktiviert die Steueraktion zum Befreien, wenn sich andere Spieler in der Nähe befinden. Wenn sich keine Spieler in der Nähe befinden, kann sich der Spieler befreien.
    Optimierte Ausführung: Führt die Hauptschleife mit hoher Frequenz aus, wenn der Spieler gefesselt ist, und seltener, wenn er nicht gefesselt ist, um eine effiziente CPU-Nutzung zu gewährleisten.
