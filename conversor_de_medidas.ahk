#Requires AutoHotkey v2.0

; Atajo: Ctrl + F8
^F8:: 
{
    ; 1. Pedir el número
    InputObj := InputBox("Ingresa la cantidad:", "Conversor LQA Multi")
    if (InputObj.Result = "Cancel" or InputObj.Value = "")
        return

    Valor := InputObj.Value
    
    ; Pequeña limpieza por si copiaste "5 lbs" o "100 km" (quita letras y espacios)
    Valor := RegExReplace(Valor, "[^\d\.-]", "") 

    if !IsNumber(Valor) {
        MsgBox "No detecté un número válido."
        return
    }

    ; --- CÁLCULOS ---
    
    ; 1. Temperatura
    C_to_F := Format("{:.1f}", (Valor * 9/5) + 32)
    F_to_C := Format("{:.1f}", (Valor - 32) * 5/9)
    
    ; 2. Millas <> Km
    Mi_to_Km := Format("{:.2f}", Valor * 1.60934)
    Km_to_Mi := Format("{:.2f}", Valor / 1.60934)

    ; 3. Pies <> Metros
    Ft_to_M := Format("{:.2f}", Valor * 0.3048)
    M_to_Ft := Format("{:.2f}", Valor / 0.3048)
    
    ; 4. Pulgadas <> Centímetros
    In_to_Cm := Format("{:.2f}", Valor * 2.54)
    Cm_to_In := Format("{:.2f}", Valor / 2.54)

    ; 5. Peso (Libras <> Kilos) [NUEVO]
    ; 1 lb = 0.453592 kg aprox
    Lb_to_Kg := Format("{:.2f}", Valor * 0.453592)
    Kg_to_Lb := Format("{:.2f}", Valor / 0.453592)

    ; --- MENÚ ---
    ConvertMenu := Menu()
    
    ; Grupo: Temperatura
    ConvertMenu.Add(Valor . "°C ➡ " . C_to_F . "°F", (*) => PasteText(C_to_F))
    ConvertMenu.Add(Valor . "°F ➡ " . F_to_C . "°C", (*) => PasteText(F_to_C))
    
    ConvertMenu.Add() ; Separador
    
    ; Grupo: Distancias Largas/Medias
    ConvertMenu.Add(Valor . " mi ➡ " . Mi_to_Km . " km", (*) => PasteText(Mi_to_Km . " km"))
    ConvertMenu.Add(Valor . " km ➡ " . Km_to_Mi . " mi", (*) => PasteText(Km_to_Mi . " mi"))
    ConvertMenu.Add(Valor . " ft ➡ " . Ft_to_M . " m", (*) => PasteText(Ft_to_M . " m"))
    ConvertMenu.Add(Valor . " m ➡ " . M_to_Ft . " ft", (*) => PasteText(M_to_Ft . " ft"))
    
    ConvertMenu.Add() ; Separador
    
    ; Grupo: Pequeñas (Pulgadas/Cm)
    ConvertMenu.Add(Valor . " in ➡ " . In_to_Cm . " cm", (*) => PasteText(In_to_Cm . " cm"))
    ConvertMenu.Add(Valor . " cm ➡ " . Cm_to_In . " in", (*) => PasteText(Cm_to_In . " in"))

    ConvertMenu.Add() ; Separador

    ; Grupo: Peso (Libras/Kilos) [NUEVO]
    ConvertMenu.Add(Valor . " lb ➡ " . Lb_to_Kg . " kg", (*) => PasteText(Lb_to_Kg . " kg"))
    ConvertMenu.Add(Valor . " kg ➡ " . Kg_to_Lb . " lb", (*) => PasteText(Kg_to_Lb . " lb"))

    ConvertMenu.Show()
}

PasteText(Text) {
    A_Clipboard := Text
    Send "^v"
}
