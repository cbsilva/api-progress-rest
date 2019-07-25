&ANALYZE-SUSPEND _VERSION-NUMBER AB_v10r12
&ANALYZE-RESUME
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS Procedure 
/*------------------------------------------------------------------------
    File        : ESAR009RP.p
    Purpose     : Exporta Faixa de Aprovadores MLA -  ARIBA

    Syntax      :

    Description :

    Author(s)   : TOTVS
    Created     : 07/2019
    Notes       :
  ----------------------------------------------------------------------*/
/*          This .W file was created with the Progress AppBuilder.      */
/*----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */
define temp-table tt-param no-undo
    field destino              as integer
    field arquivo              as char format "x(35)"
    field usuario              as char format "x(12)"
    field data-exec            as date
    field hora-exec            as integer
    FIELD diretorio            AS CHAR
    FIELD condicao-pagamento   AS LOG  
    FIELD centro-custo         AS LOG  
    FIELD conta-contabil       AS LOG  
    FIELD tipos-conta          AS LOG  
    FIELD combinacao-contabil  AS LOG  
    FIELD estabelec-endereco   AS LOG  
    FIELD unidade-negocio      AS LOG  
    FIELD metodo-pagamento     AS LOG  
    FIELD unidade-medida       AS LOG  
    FIELD fornecedor           AS LOG  
    FIELD usuarios             AS LOG
    FIELD ITEM                 AS LOG
    FIELD modelo-rtf           as char format "x(35)"
    FIELD l-habilitaRtf        as LOG.

DEFINE TEMP-TABLE tt-emitente NO-UNDO
    FIELD cod-emitente AS INT
    FIELD total-pedido AS DECIMAL FORMAT "->>>,>>>,>>>,>>>,>>9.99" decimals 8
    FIELD cont-pedido  AS INT.


DEFINE TEMP-TABLE ttErrosRet
    FIELD cod-erro  AS INTEGER 
    FIELD desc-erro AS CHARACTER FORMAT "X (256)"
    FIELD desc-arq  AS CHARACTER.


define temp-table tt-digita no-undo
    field ordem            as integer   format ">>>>9"
    field exemplo          as character format "x(30)"
    index id ordem.

def temp-table tt-raw-digita
   field raw-digita      as raw.

/* Defini��o de Vari�veis Globais ******************************************/ 
DEF NEW GLOBAL SHARED VAR c-seg-usuario                 AS CHAR NO-UNDO.

def input parameter raw-param as raw no-undo.
def input parameter TABLE for tt-raw-digita.


CREATE tt-param.
RAW-TRANSFER raw-param TO tt-param.

/* include padr�o para vari�veis para o log  */
/* {include/i-rpvar.i} */

DEF VAR h-prog              AS HANDLE                                  NO-UNDO.
    
DEF VAR c-dt-cotacao         AS CHAR  FORMAT "x(30)"    NO-UNDO.
DEF VAR i-num-mes            AS INT                     NO-UNDO.
DEF VAR i-cont               AS INT                     NO-UNDO.
DEF VAR c-siglas             AS CHAR                    NO-UNDO.
DEF VAR de-cotacao           AS DECIMAL                 NO-UNDO.

DEFINE VARIABLE lista-mes AS CHARACTER FORMAT "x(20)"
    INITIAL "Janeiro,Fevereiro,Mar�o,Abril,Maio,Junho,Julho,Agosto,Setembro,Outubro,Novembro,Dezembro".


DEF STREAM str-rp.

RUN utp/ut-acomp.p PERSISTENT SET h-prog.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE Procedure
&Scoped-define DB-AWARE no



/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME



/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: Procedure
   Allow: 
   Frames: 0
   Add Fields to: Neither
   Other Settings: CODE-ONLY COMPILE
 */
&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW Procedure ASSIGN
         HEIGHT             = 15.42
         WIDTH              = 60.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK Procedure 


/* ***************************  Main Block  *************************** */

RUN utp/ut-acomp.p PERSISTENT SET h-prog.

find first tt-param no-lock no-error.

RUN pi-inicializar IN h-prog (INPUT "Envia Faixa de Aprova��o MLA").




FIND FIRST es-api-param NO-LOCK WHERE es-api-param.ind-tipo-trans = 2 /*---- Saida ----*/
                                  AND es-api-param.cd-tipo-integr = 29 /*---- Integra��o MLA  ------*/ NO-ERROR.
IF AVAIL es-api-param THEN 
DO:
    IF CAN-FIND(FIRST es-exporta-mla NO-LOCK WHERE es-exporta-mla.ind-exportar) THEN                 
    DO:
        CREATE sfa-export-mla.
        ASSIGN sfa-export-mla.cd-tipo-integr = es-api-param.cd-tipo-integr
               sfa-export-mla.id-movto       = NEXT-VALUE(seq-export)
               sfa-export-mla.data-movto     = NOW
               sfa-export-mla.c-json         = ?.
    
        CREATE sfa-export.
        ASSIGN sfa-export.ind-tipo-trans = es-api-param.ind-tipo-trans
               sfa-export.id-movto       = sfa-export-mla.id-movto
               sfa-export.cd-tipo-integr = sfa-export-mla.cd-tipo-integr
               sfa-export.chave          = STRING(INT(TODAY) + TIME)           
               sfa-export.cod-status     = 0      /* ---- sem status ----*/
               sfa-export.data-fim       = ?
               sfa-export.data-inicio    = ?
               sfa-export.data-movto     = NOW
               sfa-export.ind-situacao   = 1      /*---- Pendente -----*/.

        RELEASE sfa-export-mla.
        RELEASE sfa-export.


        RUN integracao\api\ariba\aribalevelapprovalmla.p.



    END.
END.



RUN pi-finalizar IN h-prog.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

