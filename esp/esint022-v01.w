&ANALYZE-SUSPEND _VERSION-NUMBER UIB_v8r12 GUI ADM1
&ANALYZE-RESUME
/* Connected Databases 
          mgcam            PROGRESS
*/
&Scoped-define WINDOW-NAME CURRENT-WINDOW
&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _DEFINITIONS V-table-Win 
/*:T *******************************************************************************
** Copyright TOTVS S.A. (2009)
** Todos os Direitos Reservados.
**
** Este fonte e de propriedade exclusiva da TOTVS, sua reproducao
** parcial ou total por qualquer meio, so podera ser feita mediante
** autorizacao expressa.
*******************************************************************************/
{include/i-prgvrs.i V99XX999 9.99.99.999}

/* Chamada a include do gerenciador de licen�as. Necessario alterar os parametros */
/*                                                                                */
/* <programa>:  Informar qual o nome do programa.                                 */
/* <m�dulo>:  Informar qual o m�dulo a qual o programa pertence.                  */
/*                                                                                */
/* OBS: Para os smartobjects o parametro m�dulo dever� ser MUT                    */

&IF "{&EMSFND_VERSION}" >= "1.00" &THEN
    {include/i-license-manager.i <programa> MUT}
&ENDIF

/* Create an unnamed pool to store all the widgets created 
     by this procedure. This is a good default which assures
     that this procedure's triggers and internal procedures 
     will execute in this procedure's storage, and that proper
     cleanup will occur on deletion of the procedure. */

CREATE WIDGET-POOL.

/* ***************************  Definitions  ************************** */
&Scop adm-attribute-dlg support/viewerd.w

/* global variable definitions */

/* Parameters Definitions ---                                           */

/* Local Variable Definitions ---                                       */
def var v-row-parent as rowid no-undo.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-PREPROCESSOR-BLOCK 

/* ********************  Preprocessor Definitions  ******************** */

&Scoped-define PROCEDURE-TYPE SmartViewer
&Scoped-define DB-AWARE no

&Scoped-define ADM-SUPPORTED-LINKS Record-Source,Record-Target,TableIO-Target

/* Name of designated FRAME-NAME and/or first browse and/or first query */
&Scoped-define FRAME-NAME f-main

/* External Tables                                                      */
&Scoped-define EXTERNAL-TABLES es-ariba-b2e-param
&Scoped-define FIRST-EXTERNAL-TABLE es-ariba-b2e-param


/* Need to scope the external tables to this procedure                  */
DEFINE QUERY external_tables FOR es-ariba-b2e-param.
/* Standard List Definitions                                            */
&Scoped-Define ENABLED-FIELDS es-ariba-b2e-param.insitituicao-b2b-pj ~
es-ariba-b2e-param.insitituicao-b2b-pf es-ariba-b2e-param.cod-gr-cli ~
es-ariba-b2e-param.cod-gr-for es-ariba-b2e-param.cod-rep ~
es-ariba-b2e-param.portador es-ariba-b2e-param.tp-rec-padrao ~
es-ariba-b2e-param.tp-desp-padrao es-ariba-b2e-param.cod-cond-pag ~
es-ariba-b2e-param.ven-sabado es-ariba-b2e-param.ven-domingo ~
es-ariba-b2e-param.ven-feriado 
&Scoped-define ENABLED-TABLES es-ariba-b2e-param
&Scoped-define FIRST-ENABLED-TABLE es-ariba-b2e-param
&Scoped-Define ENABLED-OBJECTS rt-mold 
&Scoped-Define DISPLAYED-FIELDS es-ariba-b2e-param.insitituicao-b2b-pj ~
es-ariba-b2e-param.insitituicao-b2b-pf es-ariba-b2e-param.cod-gr-cli ~
es-ariba-b2e-param.cod-gr-for es-ariba-b2e-param.cod-rep ~
es-ariba-b2e-param.portador es-ariba-b2e-param.tp-rec-padrao ~
es-ariba-b2e-param.tp-desp-padrao es-ariba-b2e-param.cod-cond-pag ~
es-ariba-b2e-param.ven-sabado es-ariba-b2e-param.ven-domingo ~
es-ariba-b2e-param.ven-feriado 
&Scoped-define DISPLAYED-TABLES es-ariba-b2e-param
&Scoped-define FIRST-DISPLAYED-TABLE es-ariba-b2e-param
&Scoped-Define DISPLAYED-OBJECTS cb-modalidade 

/* Custom List Definitions                                              */
/* ADM-CREATE-FIELDS,ADM-ASSIGN-FIELDS,ADM-MODIFY-FIELDS,List-4,List-5,List-6 */

/* _UIB-PREPROCESSOR-BLOCK-END */
&ANALYZE-RESUME


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _XFTR "Foreign Keys" V-table-Win _INLINE
/* Actions: ? adm/support/keyedit.w ? ? ? */
/* STRUCTURED-DATA
<KEY-OBJECT>
THIS-PROCEDURE
</KEY-OBJECT>
<FOREIGN-KEYS>
cod-rep||y|mgcam.es-ariba-b2e-param.cod-rep
</FOREIGN-KEYS> 
<EXECUTING-CODE>
**************************
* Set attributes related to FOREIGN KEYS
*/
RUN set-attribute-list (
    'Keys-Accepted = ,
     Keys-Supplied = "cod-rep"':U).
/**************************
</EXECUTING-CODE> */
/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* ***********************  Control Definitions  ********************** */


/* Definitions of the field level widgets                               */
DEFINE VARIABLE cb-modalidade AS INTEGER FORMAT "->,>>>,>>9":U INITIAL 0 
     VIEW-AS COMBO-BOX INNER-LINES 9
     LIST-ITEM-PAIRS "Item 1",0
     DROP-DOWN-LIST
     SIZE 16 BY 1 NO-UNDO.

DEFINE RECTANGLE rt-mold
     EDGE-PIXELS 2 GRAPHIC-EDGE  NO-FILL   
     SIZE 88.57 BY 13.


/* ************************  Frame Definitions  *********************** */

DEFINE FRAME f-main
     es-ariba-b2e-param.insitituicao-b2b-pj AT ROW 1.13 COL 18.29 COLON-ALIGNED WIDGET-ID 10
          VIEW-AS FILL-IN 
          SIZE 51.14 BY 1
     es-ariba-b2e-param.insitituicao-b2b-pf AT ROW 2.08 COL 18.29 COLON-ALIGNED WIDGET-ID 8
          VIEW-AS FILL-IN 
          SIZE 51.14 BY 1
     es-ariba-b2e-param.cod-gr-cli AT ROW 3.13 COL 18.29 COLON-ALIGNED WIDGET-ID 2
          VIEW-AS FILL-IN 
          SIZE 5.72 BY 1
     es-ariba-b2e-param.cod-gr-for AT ROW 4.13 COL 18.29 COLON-ALIGNED WIDGET-ID 4
          VIEW-AS FILL-IN 
          SIZE 5.72 BY 1
     es-ariba-b2e-param.cod-rep AT ROW 5.13 COL 18.29 COLON-ALIGNED WIDGET-ID 6
          VIEW-AS FILL-IN 
          SIZE 6.86 BY 1
     es-ariba-b2e-param.portador AT ROW 6.13 COL 18.29 COLON-ALIGNED WIDGET-ID 22
          VIEW-AS FILL-IN 
          SIZE 6.86 BY 1
     cb-modalidade AT ROW 6.13 COL 25.86 COLON-ALIGNED NO-LABEL WIDGET-ID 46
     es-ariba-b2e-param.tp-rec-padrao AT ROW 7.21 COL 18.29 COLON-ALIGNED WIDGET-ID 26
          VIEW-AS FILL-IN 
          SIZE 4.57 BY 1
     es-ariba-b2e-param.tp-desp-padrao AT ROW 8.29 COL 18.29 COLON-ALIGNED WIDGET-ID 24
          VIEW-AS FILL-IN 
          SIZE 4.57 BY 1
     es-ariba-b2e-param.cod-cond-pag AT ROW 9.38 COL 18.29 COLON-ALIGNED WIDGET-ID 48
          VIEW-AS FILL-IN 
          SIZE 4 BY 1
     es-ariba-b2e-param.ven-sabado AT ROW 11.25 COL 17 NO-LABEL WIDGET-ID 36
          VIEW-AS RADIO-SET VERTICAL
          RADIO-BUTTONS 
                    "Prorroga", 1,
"Antecipa", 2,
"Mant�m", 3
          SIZE 11.57 BY 2.5
     es-ariba-b2e-param.ven-domingo AT ROW 11.25 COL 44.29 NO-LABEL WIDGET-ID 28
          VIEW-AS RADIO-SET VERTICAL
          RADIO-BUTTONS 
                    "Prorroga", 1,
"Antecipa", 2,
"Mant�m", 3
          SIZE 11.57 BY 2.5
     es-ariba-b2e-param.ven-feriado AT ROW 11.25 COL 72 NO-LABEL WIDGET-ID 32
          VIEW-AS RADIO-SET VERTICAL
          RADIO-BUTTONS 
                    "Prorroga", 1,
"Antecipa", 2,
"Mant�m", 3
          SIZE 11.57 BY 2.5
     "Vencimento em Feriados" VIEW-AS TEXT
          SIZE 18.43 BY .54 AT ROW 10.63 COL 67 WIDGET-ID 44
     "Vencimento no Domingo" VIEW-AS TEXT
          SIZE 18.43 BY .54 AT ROW 10.63 COL 36.57 WIDGET-ID 42
     "Vencimento no S�bado" VIEW-AS TEXT
          SIZE 17.43 BY .54 AT ROW 10.63 COL 6.57 WIDGET-ID 40
     rt-mold AT ROW 1 COL 1
    WITH 1 DOWN NO-BOX KEEP-TAB-ORDER OVERLAY 
         SIDE-LABELS NO-UNDERLINE THREE-D 
         AT COL 1 ROW 1 SCROLLABLE 
         FONT 1 WIDGET-ID 100.


/* *********************** Procedure Settings ************************ */

&ANALYZE-SUSPEND _PROCEDURE-SETTINGS
/* Settings for THIS-PROCEDURE
   Type: SmartViewer
   External Tables: mgcam.es-ariba-b2e-param
   Allow: Basic,DB-Fields
   Frames: 1
   Add Fields to: EXTERNAL-TABLES
   Other Settings: PERSISTENT-ONLY COMPILE
 */

/* This procedure should always be RUN PERSISTENT.  Report the error,  */
/* then cleanup and return.                                            */
IF NOT THIS-PROCEDURE:PERSISTENT THEN DO:
  MESSAGE "{&FILE-NAME} should only be RUN PERSISTENT.":U
          VIEW-AS ALERT-BOX ERROR BUTTONS OK.
  RETURN.
END.

&ANALYZE-RESUME _END-PROCEDURE-SETTINGS

/* *************************  Create Window  ************************** */

&ANALYZE-SUSPEND _CREATE-WINDOW
/* DESIGN Window definition (used by the UIB) 
  CREATE WINDOW V-table-Win ASSIGN
         HEIGHT             = 13
         WIDTH              = 88.57.
/* END WINDOW DEFINITION */
                                                                        */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _INCLUDED-LIB V-table-Win 
/* ************************* Included-Libraries *********************** */

{src/adm/method/viewer.i}
{include/c-viewer.i}
{utp/ut-glob.i}
{include/i_dbtype.i}

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME




/* ***********  Runtime Attributes and AppBuilder Settings  *********** */

&ANALYZE-SUSPEND _RUN-TIME-ATTRIBUTES
/* SETTINGS FOR WINDOW V-table-Win
  VISIBLE,,RUN-PERSISTENT                                               */
/* SETTINGS FOR FRAME f-main
   NOT-VISIBLE FRAME-NAME Size-to-Fit                                   */
ASSIGN 
       FRAME f-main:SCROLLABLE       = FALSE
       FRAME f-main:HIDDEN           = TRUE.

/* SETTINGS FOR COMBO-BOX cb-modalidade IN FRAME f-main
   NO-ENABLE                                                            */
/* _RUN-TIME-ATTRIBUTES-END */
&ANALYZE-RESUME


/* Setting information for Queries and Browse Widgets fields            */

&ANALYZE-SUSPEND _QUERY-BLOCK FRAME f-main
/* Query rebuild information for FRAME f-main
     _Options          = "NO-LOCK"
     _Query            is NOT OPENED
*/  /* FRAME f-main */
&ANALYZE-RESUME

 


&ANALYZE-SUSPEND _UIB-CODE-BLOCK _CUSTOM _MAIN-BLOCK V-table-Win 


/* ***************************  Main Block  *************************** */

  &IF DEFINED(UIB_IS_RUNNING) <> 0 &THEN          
    RUN dispatch IN THIS-PROCEDURE ('initialize':U).        
  &ENDIF         
  
  /************************ INTERNAL PROCEDURES ********************/

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME


/* **********************  Internal Procedures  *********************** */

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE adm-find-using-key V-table-Win  adm/support/_key-fnd.p
PROCEDURE adm-find-using-key :
/*------------------------------------------------------------------------------
  Purpose:     Finds the current record using the contents of
               the 'Key-Name' and 'Key-Value' attributes.
  Parameters:  <none>
------------------------------------------------------------------------------*/

  /* No Foreign keys are accepted by this SmartObject. */

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE adm-row-available V-table-Win  _ADM-ROW-AVAILABLE
PROCEDURE adm-row-available :
/*------------------------------------------------------------------------------
  Purpose:     Dispatched to this procedure when the Record-
               Source has a new row available.  This procedure
               tries to get the new row (or foriegn keys) from
               the Record-Source and process it.
  Parameters:  <none>
------------------------------------------------------------------------------*/

  /* Define variables needed by this internal procedure.             */
  {src/adm/template/row-head.i}

  /* Create a list of all the tables that we need to get.            */
  {src/adm/template/row-list.i "es-ariba-b2e-param"}

  /* Get the record ROWID's from the RECORD-SOURCE.                  */
  {src/adm/template/row-get.i}

  /* FIND each record specified by the RECORD-SOURCE.                */
  {src/adm/template/row-find.i "es-ariba-b2e-param"}

  /* Process the newly available records (i.e. display fields,
     open queries, and/or pass records on to any RECORD-TARGETS).    */
  {src/adm/template/row-end.i}

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE disable_UI V-table-Win  _DEFAULT-DISABLE
PROCEDURE disable_UI :
/*------------------------------------------------------------------------------
  Purpose:     DISABLE the User Interface
  Parameters:  <none>
  Notes:       Here we clean-up the user-interface by deleting
               dynamic widgets we have created and/or hide 
               frames.  This procedure is usually called when
               we are ready to "clean-up" after running.
------------------------------------------------------------------------------*/
  /* Hide all frames. */
  HIDE FRAME f-main.
  IF THIS-PROCEDURE:PERSISTENT THEN DELETE PROCEDURE THIS-PROCEDURE.
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE local-assign-record V-table-Win 
PROCEDURE local-assign-record :
/*------------------------------------------------------------------------------
  Purpose:     Override standard ADM method
  Notes:       
------------------------------------------------------------------------------*/

    /* Code placed here will execute PRIOR to standard behavior. */
    {include/i-valid.i}
    
    IF es-ariba-b2e-param.insitituicao-b2b-pj:INPUT-VALUE IN FRAME {&FRAME-NAME} = ""
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"C�digo n�o preenchido").
       APPLY "ENTRY" TO es-ariba-b2e-param.insitituicao-b2b-pj IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    IF es-ariba-b2e-param.insitituicao-b2b-pf:INPUT-VALUE IN FRAME {&FRAME-NAME} = ""
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"C�digo n�o preenchido").
       APPLY "ENTRY" TO es-ariba-b2e-param.insitituicao-b2b-pf IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    FIND FIRST gr-cli NO-LOCK
         WHERE gr-cli.cod-gr-cli = es-ariba-b2e-param.cod-gr-cli:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL gr-cli
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Grupo n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.cod-gr-cli IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    FIND FIRST grupo-fornec NO-LOCK
         WHERE grupo-fornec.cod-gr-for = es-ariba-b2e-param.cod-gr-for:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL grupo-fornec
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Grupo n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.cod-gr-for IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    FIND FIRST repres NO-LOCK
         WHERE repres.cod-rep = es-ariba-b2e-param.cod-rep:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL repres
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Representante n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.cod-rep IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    FIND FIRST mgadm.portador NO-LOCK
         WHERE portador.ep-codigo  = "1"
           AND portador.cod-port   = es-ariba-b2e-param.portador:INPUT-VALUE IN FRAME {&FRAME-NAME}
           AND portador.modalidade = cb-modalidade:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL portador
    THEN DO:
       MESSAGE 
           VIEW-AS ALERT-BOX INFO BUTTONS OK.
       RUN utp/ut-msgs.p ("show",17006,"Portador n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.portador IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.
    FIND FIRST tipo-rec-desp NO-LOCK
         WHERE tipo-rec-desp.tp-codigo = es-ariba-b2e-param.tp-desp-padrao:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL tipo-rec-desp
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Tipo n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.tp-desp-padrao IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.       

    FIND FIRST tipo-rec-desp NO-LOCK
         WHERE tipo-rec-desp.tp-codigo = es-ariba-b2e-param.tp-rec-padrao:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL tipo-rec-desp
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Tipo n�o encontrado").
       APPLY "ENTRY" TO es-ariba-b2e-param.tp-desp-padrao IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.       

    FIND FIRST cond-pagto NO-LOCK
         WHERE cond-pagto.cod-cond-pag = es-ariba-b2e-param.cod-cond-pag:INPUT-VALUE IN FRAME {&FRAME-NAME}
         NO-ERROR.
    IF NOT AVAIL cond-pagto
    THEN DO:
       RUN utp/ut-msgs.p ("show",17006,"Condi��o de pagamento n�o encontrada").
       APPLY "ENTRY" TO es-ariba-b2e-param.cod-cond-pag IN FRAME {&FRAME-NAME}.
       RETURN 'ADM-ERROR':U.
    END.       


    RUN dispatch IN THIS-PROCEDURE ( INPUT 'assign-record':U ) .
    if RETURN-VALUE = 'ADM-ERROR':U 
    then return 'ADM-ERROR':U.

    es-ariba-b2e-param.modalidade = cb-modalidade:INPUT-VALUE IN FRAME {&FRAME-NAME}.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE local-disable-fields V-table-Win 
PROCEDURE local-disable-fields :
/*------------------------------------------------------------------------------
  Purpose:     Override standard ADM method
  Notes:       
------------------------------------------------------------------------------*/
    
    /* Code placed here will execute PRIOR to standard behavior. */
    
    /* Dispatch standard ADM method.                             */
    RUN dispatch IN THIS-PROCEDURE ( INPUT 'disable-fields':U ) .
    
    /* Code placed here will execute AFTER standard behavior.    */
    &if  defined(ADM-MODIFY-FIELDS) &then
    disable {&ADM-MODIFY-FIELDS} with frame {&frame-name}.
    &endif
    
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE local-display-fields V-table-Win 
PROCEDURE local-display-fields :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    DEF VAR c-modalidade AS c NO-UNDO.
    DEF VAR i AS i NO-UNDO.

    RUN adm-display-fields.

    DO i = 1 TO {adinc/i03ad209.i 05}:
       IF c-modalidade > "" 
       THEN c-modalidade = c-modalidade + ",".
       c-modalidade = c-modalidade 
                    + {adinc/i03ad209.i 04 i}
                    + ","
                    + STRING(i).
    END.

    cb-modalidade:LIST-ITEM-PAIRS IN FRAME {&FRAME-NAME} = c-modalidade.

    IF AVAIL es-ariba-b2e-param
    THEN cb-modalidade:SCREEN-VALUE IN FRAME {&FRAME-NAME} = STRING(es-ariba-b2e-param.modalidade).
    ELSE cb-modalidade:SCREEN-VALUE IN FRAME {&FRAME-NAME} = STRING(6).


END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE local-enable-fields V-table-Win 
PROCEDURE local-enable-fields :
/*------------------------------------------------------------------------------
  Purpose:     Override standard ADM method
  Notes:       
------------------------------------------------------------------------------*/
    
    /* Code placed here will execute PRIOR to standard behavior. */
    
    /* Dispatch standard ADM method.                             */
    RUN dispatch IN THIS-PROCEDURE ( INPUT 'enable-fields':U ) .
    
    /* Code placed here will execute AFTER standard behavior.    */
    &if  defined(ADM-MODIFY-FIELDS) &then
    if adm-new-record = yes then
        enable {&ADM-MODIFY-FIELDS} with frame {&frame-name}.
    &endif
    
    ENABLE cb-modalidade with frame {&frame-name}.

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE pi-atualiza-parent V-table-Win 
PROCEDURE pi-atualiza-parent :
/*------------------------------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
------------------------------------------------------------------------------*/
    define input parameter v-row-parent-externo as rowid no-undo.
    
    assign v-row-parent = v-row-parent-externo.
    
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE Pi-validate V-table-Win 
PROCEDURE Pi-validate :
/*:T------------------------------------------------------------------------------
  Purpose:Validar a viewer     
  Parameters:  <none>
  Notes: N�o fazer assign aqui. Nesta procedure
  devem ser colocadas apenas valida��es, pois neste ponto do programa o registro 
  ainda n�o foi criado.       
------------------------------------------------------------------------------*/
    {include/i-vldfrm.i} /*:T Valida��o de dicion�rio */
    
/*:T    Segue um exemplo de valida��o de programa */
/*       find tabela where tabela.campo1 = c-variavel and               */
/*                         tabela.campo2 > i-variavel no-lock no-error. */
      
      /*:T Este include deve ser colocado sempre antes do ut-msgs.p */
/*       {include/i-vldprg.i}                                             */
/*       run utp/ut-msgs.p (input "show":U, input 7, input return-value). */
/*       return 'ADM-ERROR':U.                                            */

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE send-key V-table-Win  adm/support/_key-snd.p
PROCEDURE send-key :
/*------------------------------------------------------------------------------
  Purpose:     Sends a requested KEY value back to the calling
               SmartObject.
  Parameters:  <see adm/template/sndkytop.i>
------------------------------------------------------------------------------*/

  /* Define variables needed by this internal procedure.             */
  {src/adm/template/sndkytop.i}

  /* Return the key value associated with each key case.             */
  {src/adm/template/sndkycas.i "cod-rep" "es-ariba-b2e-param" "cod-rep"}

  /* Close the CASE statement and end the procedure.                 */
  {src/adm/template/sndkyend.i}

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE send-records V-table-Win  _ADM-SEND-RECORDS
PROCEDURE send-records :
/*------------------------------------------------------------------------------
  Purpose:     Send record ROWID's for all tables used by
               this file.
  Parameters:  see template/snd-head.i
------------------------------------------------------------------------------*/

  /* Define variables needed by this internal procedure.               */
  {src/adm/template/snd-head.i}

  /* For each requested table, put it's ROWID in the output list.      */
  {src/adm/template/snd-list.i "es-ariba-b2e-param"}

  /* Deal with any unexpected table requests before closing.           */
  {src/adm/template/snd-end.i}

END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME

&ANALYZE-SUSPEND _UIB-CODE-BLOCK _PROCEDURE state-changed V-table-Win 
PROCEDURE state-changed :
/* -----------------------------------------------------------
  Purpose:     
  Parameters:  <none>
  Notes:       
-------------------------------------------------------------*/
  DEFINE INPUT PARAMETER p-issuer-hdl AS HANDLE    NO-UNDO.
  DEFINE INPUT PARAMETER p-state      AS CHARACTER NO-UNDO.

  CASE p-state:
      /* Object instance CASEs can go here to replace standard behavior
         or add new cases. */
      {src/adm/template/vstates.i}
  END CASE.
  run pi-trata-state (p-issuer-hdl, p-state).
END PROCEDURE.

/* _UIB-CODE-BLOCK-END */
&ANALYZE-RESUME
