#INCLUDE "TOTVS.CH"
#INCLUDE "RWMAKE.CH"

/*--------------------------------------------------------
Fun��o de Cadastro de Cores
Autor: Jo�o  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/

User Function ESP003()

Local cTitulo    := "Cadastro de Cores"


AxCadastro("Z03",cTitulo)


RETURN 


/*--------------------------------------------------------
Fun��o de validar de Cores
Autor: Jo�o  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/
USER FUNCTION  FVNomcor()

Local lRetorno := .T.
Local cCampo   := ReadVar()
LOCAL cInfo := &(cCampo)
Local cEspaco := AllTrim(cInfo)

IF ("DS2U" $ cEspaco)
    Alert ("N�o pode Utilizar o nome da empresa DS2U")
    lRETORNO := .F.
ENDIF 

RETURN


