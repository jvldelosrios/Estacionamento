#INCLUDE "TOTVS.CH"
#INCLUDE "RWMAKE.CH"

/*--------------------------------------------------------
Fun��o de Cadastro de Marcas
Autor: Jo�o  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/

User Function ESP001()

Local cTitulo    := "Cadastro de Marcas"


AxCadastro("Z01",cTitulo)

RETURN 

/*--------------------------------------------------------
Fun��o de validar de Marcas
Autor: Jo�o  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/
USER FUNCTION  FVNomeMar()

Local lRetorno := .T.
Local cCampo   := ReadVar()
LOCAL cInfo := &(cCampo)
Local cEspaco := AllTrim(cInfo)

IF ("DS2U" $ cEspaco)
    Alert ("N�o pode Utilizar o nome da empresa DS2U")
    lRETORNO := .F.
ENDIF 

RETURN


