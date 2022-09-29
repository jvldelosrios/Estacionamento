#INCLUDE "TOTVS.CH"

 

User Function TstCalc()

 
Local dDtEnt    := cToD("11/09/2022")
Local dDtSai    := Date()
Local cHrEnt   := "10:37:00"
Local cHrSai   := "10:42:00"

u_EstCalc(dDtEnt,cHrEnt,dDtSai,cHrSai)

Return NIL

/* ---------------------------------------

Função que calcula Valor a ser cobrado pelo cliente
Autor: João
Data: 14/09/2022
Projeto: Estacionamento
--------------------------------------- */
User Function ESTCALC(dDtEnt,cHrEnt,dDtSai,cHrSai)

Local cQtdHor   := ""
Local aHoras    := {}
Local nHoras    := 0
Local nMinutos  := 0
Local nValor    := 0
Local nCount    := 1
Local nDias     := 0
Local cMinCor   := SUPERGETMV("ES_MINCORT"  ,.T.,"20" )
Local nV1aHr    := SUPERGETMV("ES_VL1AHOR"  ,.T.,"20")
Local nVDemHr   := SUPERGETMV("ES_VLDHOR"   ,.T.,"5")
Local nVDiar    := SUPERGETMV("ES_VLDIA"    ,.T.,"50")
// ----------------------------
// Mesmo dia
    If dDtEnt == dDtSai

            //Tratamento variaveis de hora
            iF Len(cHrEnt) .and. Len(cHrSai) == 5
                cHrEnt := (cHrEnt+":00")
                cHrSai := (cHrSai+":00")
            ENDIF

    // Uso funcao elaptime que me da o retorno de soma de dois horaris
    cQtdHor := ELAPTIME( cHrEnt, cHrSai )

    // Uso a funcao separa para me retornar um Array com as horas, minutos e segundos / poderia usar tbm, substr()
    aHoras := Separa(cQtdHor,":")

 

    // Jogo para uma variavel as informacoes ja transformando em numero, através da funcao VAL()

    nHoras      := Val(aHoras[1])
    nMinutos   := Val(aHoras[2])

    // Tratamento para Diaria
    If nHoras >= 12
        nValor := nVDiar
    Else       
        If (nHoras==0) .AND. (nMinutos>0)
 
            // Trata cortesia
            If !(nMinutos <= Val(cMinCor)) // só cobro uma primeira hora se não for uma cortesia.
                nValor := nV1aHr
            Endif
        Else
             While ( (nHoras>0) .AND. (nCount<=nHoras) )
                // Verifico se é primeira hora - pelo meu contador
                If nCount == 1
                    nValor := nValor + nV1aHr
                else
                    nValor := nValor + nVDemHr
                EndIf
                nCount++
            End Do

            // Basta que eu tenha 1 minuto que eu cobro uma hora a mais
            If nMinutos > 0
                nValor += nVDemHr
            EndIf
        EndIf
    EndIf

Else

    nDias   := (dDtSai-dDtEnt)
    nValor  := nVDiar*nDias

EndIf

 

// Alert("O valor a ser cobrado será de: " + cValToChar(nValor) )

//Alert("O valor a ser cobrado será de: R$ " + TRANSFORM(nValor, "@R 999" ) )

 

Return nValor
