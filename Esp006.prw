
#INCLUDE "TOTVS.CH"
#INCLUDE "RWMAKE.CH"

/*--------------------------------------------------------
Função de Cadastro de Movimentos
Autor: João  Henchs
Data: 16/09/2022
Projeto: Estacionamento
--------------------------------------------------------*/

User Function ESP006()

Local cTitulo    := "Cadastro de Movimentos"

IF FVerVagas()
    AxCadastro("Z05",cTitulo)
ELSE
    Alert("Não há mais vagas")
ENDIF

RETURN

Static  Function  FVerVagas()

Local  lRet        :=.F.
Local  nContCar       := 0
LOCAL nContMoto := 0
Local nValMoto   := SUPERGETMV("ES_VAGAMOT"  ,.T.,"60" )
Local nValCar    := SUPERGETMV("ES_VAGACAR"  ,.T.,"30")



DbSelectArea("Z05")  //Abro  a  tabela  Z05
Z05-> (dbSetOrder(1))  // Seto  o Indice  1 para  ordenação  da  Z05
Z05-> (dbGoTop())       //Pede  para  posicionar  no  topo  da  tabela


while Z05->(!EOF())  // Enquanto  não  for fim  de  Arquivo  !EOF()
    IF Z05->Z05_AUTOMO == "1"
        nContCar++
    ELSE
        nContMoto++
    ENDIF
        Z05->(dbSKIP())

ENDDO




If  nValCar > nContCar .or. nValMoto > nContMoto
    lRet := .T.
ENDIF



RETURN lRet
