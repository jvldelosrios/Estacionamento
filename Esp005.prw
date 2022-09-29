
#INCLUDE "TOTVS.CH"
#INCLUDE "RWMAKE.CH"

/*--------------------------------------------------------
Função de Cadastro de Operadores
Autor: João  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/

User Function ESP005()

Local cTitulo    := "Cadastro de Operadores"


AxCadastro("Z04",cTitulo)

RETURN 

User function  FVvalidCpf()
Local cCampo  := FVvalidCpf()
Local cCpf    := & (cCampo)


If CGC(cCpf) ==.T.
    Alerta("CPF VALIDO")
    lRet := .T.
ELSE
    Alert ("CPF INVALIDO")

ENDIF


RETURN

/*--------------------------------------------------------
Função de validar de Operadores
Autor: João  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/
USER FUNCTION  FVOperador()

Local lRetorno := .T.
Local cCampo   := ReadVar()
LOCAL cInfo := &(cCampo)
Local cEspaco := AllTrim(cInfo)

IF ("DS2U" $ cEspaco)
    Alert ("Não pode Utilizar o nome da empresa DS2U")
    lRETORNO := .F.
ENDIF 

RETURN

