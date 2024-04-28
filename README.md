# SRDisplayUtilities

Módulo de display de menú de opciones para PowerShell 4.0 o superior

# Funciones:
- Get-SRChoiceBinary
- Get-SRChoiceMultiple

# Get-SRChoiceBinary
- Input:
  - [String] Prompt: Mensaje a mostrar
  - [Switch] ClearScreen: Limpia la consola antes de mostrar el menú
  - [ConsoleColor] PromptColor: Color del mensaje
- Output:
  -[Bool] True para Y, False para N

# Get-SRChoiceMultiple
- Input:
  - [[]String] Choices:Array de opciones
  - [String] Prompt: Texto a mostrar en el título
  - [String] ErrorPrompt: Texto a mostrar cuando no se selecciona una opción válida
  - [Switch] CanQuit: Muestra u oculta la opción “Q: Salir”
  - [Switch] ClearScreen: Limpia la consola antes de mostrar el menú
  - [Switch] AutoChoice: Si el array de opciones dispone de sólo un ítem, se retornará ese ítem
  - [ConsoleColor] ChoicesColor: Color en el cuál se mostrarán los ítems del menú
  - [ConsoleColor] PromptColor: Color del título
  - [ConsoleColor] ErrorPromptColor: Color del mensaje de error
- Output:
  - [String] Opción seleccionada
  - [Bool] False si se selecciona “Q: Salir”
