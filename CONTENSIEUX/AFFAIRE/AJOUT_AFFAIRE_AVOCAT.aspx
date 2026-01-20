<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AJOUT_AFFAIRE_AVOCAT.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AJOUT_AFFAIRE_AVOCAT" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

     <div class="btn-group-inline">
                <asp:Button ID="BTN_RETOUR" runat="server" Text="Retour a la liste"
                    CssClass="btn-add" OnClick="BTN_RETOUR_Click" Visible="false" />

               
            </div>


   <%-- <div class="wide-form-container bilingual-form">--%>
        <h2 class="wide-form-title">Ajout Affaire <span class="arabic-title">إضافة قضية</span></h2>
            <div class="btn-group-inline">
                    <asp:Button ID="SCAN_REQ" runat="server" Text="Scan Requette"
                        CssClass="btn-add" OnClick="SCAN_REQ_Click" />
                </div>
        <div runat="server" id="PARTIE01">
        <!-- Première ligne - Informations de base -->
        <div class="wide-form-section">
            <div class="wide-form-row">
                <div class="search-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Wilaya </span>
                        <span class="label-ar">ولاية</span>
                    </div>
                    <asp:DropDownList ID="DDL_WILAYA" runat="server" CssClass="wide-form-control" OnSelectedIndexChanged="DDL_WILAYA_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                    </asp:DropDownList>
                </div>
               <%-- <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Tribunal</span><span class="label-ar">المحكمة</span>
            </div>
            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="wide-form-control"
                onchange="handleTribunalChange()">
                <asp:ListItem Text="------" Value="" Selected="True" />
            </asp:DropDownList>
        </div>--%>
                <div class="search-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Nature</span>
                        <span class="label-ar">طبيعة</span>
                    </div>

                    <asp:DropDownList ID="DDL_NATURE" runat="server"
                        CssClass="wide-form-control"
                        onchange="showNumSOUSCRI_Fields()">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                    </asp:DropDownList>
                </div>
                <div class="wide-form-group" id="precisionNatureGroup" >
                    <div class="dual-label-container">
                        <span class="label-fr">Précision nature</span>
                        <span class="label-ar">توضيح الطبيعة</span>
                    </div>
                    <asp:TextBox ID="TB_PRESISION_NATURE" runat="server" CssClass="wide-form-control"
                        placeholder="Précision / توضيح"></asp:TextBox>
                </div>
                
                </div>
            <div class="wide-form-row">
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">N° Dossier</span>
                        <span class="label-ar">رقم الملف</span>
                    </div>
                    <asp:TextBox ID="TB_NUM_DOSSIER" runat="server" CssClass="wide-form-control" OnTextChanged="TB_NUM_DOSSIER_TextChanged" AutoPostBack="true"  ></asp:TextBox>
                </div>
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">N° Affaire</span>
                        <span class="label-ar">رقم القضية</span>
                    </div>
                    <asp:TextBox ID="TB_NUM_AFFAIRE" runat="server" CssClass="wide-form-control" ClientIDMode="Static" onkeyup="genererNumeroJugement()" onchange="genererNumeroJugement()"></asp:TextBox>
                </div>
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Date audience</span>
                        <span class="label-ar">تاريخ الجلسة</span>
                    </div>
                    <asp:TextBox ID="TB_DATE_AUDIANCE" runat="server" TextMode="Date" CssClass="wide-form-control"></asp:TextBox>
                </div>
                
            </div>
        </div>

        <!-- Deuxième ligne - Parties -->
        <div class="wide-form-section">
            <h5 class="wide-section-title">
                <span class="title-fr"><asp:Label runat="server" ID="Label1" Text="Parties"></asp:Label> / <asp:Label runat="server" class="title-ar" ID="Label2" Text="الأطراف"></asp:Label></span>
            </h5>
            <div class="wide-form-row">
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Demandeur</span>
                        <span class="label-ar">المدعي</span>
                    </div>
                    <asp:TextBox ID="TB_PARTIE_DEMANDEUR" runat="server" CssClass="wide-form-control" OnTextChanged="TB_PARTIE_DEMANDEUR_TextChanged" AutoPostBack="true" ></asp:TextBox>
                </div>
                <div class="wide-form-group" id="SOUSCRIPTION_GROUP">
                    <div class="dual-label-container">
                        <span class="label-fr">N° Souscripteur</span>
                        <span class="label-ar">رقم المكتتب</span>
                    </div>
                    <asp:TextBox ID="TB_NUM_SOUS" runat="server" CssClass="wide-form-control"></asp:TextBox>
                </div>
            </div>
            <div class="wide-form-row">
                <!-- Défendeurs - Section dynamique -->
              
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Défendeur(s)</span>
                        <span class="label-ar">المدعى عليه(م)</span>
                    </div>
                    <div class="input-with-add">
                        <asp:TextBox ID="TB_PARTIE_DEFENDEUR_1" runat="server" CssClass="wide-form-control autocomplete-defendeur"></asp:TextBox>

                        <button type="button" class="btn-icon-add" onclick="addDefendeurField()">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                    <div id="defendeursContainer"></div>
                </div>

                <!-- Parties mises en cause - Section dynamique -->
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Partie(s) mise(s) en cause</span>
                        <span class="label-ar">مدخل في الخصام</span>
                    </div>
                    <div class="input-with-add">
                        <asp:TextBox ID="TB_PARTIE_MISE_CAUSE_1" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        <button type="button" class="btn-icon-add" onclick="addPartieMiseEnCauseField()">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                    <div id="partiesMiseEnCauseContainer"></div>
                </div>

                

                
            </div>


            <div class="DateRenvoie-group">
            <div class="wide-form-row">
                 <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Date renvoie</span>
                        <span class="label-ar">تاريخ الإرسال</span>
                    </div>
                    <div class="input-with-add" >
                    <asp:TextBox ID="TB_DATE_ENVOIE" runat="server" TextMode="Date" CssClass="wide-form-control"></asp:TextBox>
                        
                        </div> 
                    
                </div>
                <div class="wide-form-group"  >
                    <div class="dual-label-container">
                        <span class="label-fr">Motif Date Renvoie</span>
                        <span class="label-ar">سبب التأجيل</span>
                    </div>
                    <div class="input-with-add" >
                    <asp:TextBox ID="TB_MOTIF_DATE_RENVOI" runat="server"  CssClass="wide-form-control"
                        placeholder="Motif / سبب"></asp:TextBox>
                    <button type="button" class="btn-icon-add" onclick="addDateEnvoiField()">
                            <i class="fas fa-plus"></i>
                        </button>
                        </div>
                    
                </div>
                
                </div> 
            <div id="dateEnvoiContainer"></div>
                </div>
        </div>

        <!-- Troisième ligne - Juridiction -->
        <div class="wide-form-section">
            <%--<h5 class="wide-section-title">Juridiction</h5>--%>
            <h5 class="wide-section-title">
                <span class="title-fr">Juridiction</span>
                <span class="title-ar">الجهة القضائية</span>
            </h5>
            <div class="wide-form-row">
                
                <div class="search-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Juridiction </span>
                        <span class="label-ar">القضاء</span>
                    </div>
                    <asp:DropDownList ID="DDL_TYPE_JURIDICTION" runat="server" CssClass="wide-form-control" onchange="showJuridictionFields()">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                        <asp:ListItem Text="Normal/العادي" Value="Normal" />
                        <asp:ListItem Text="Administratif/الإداري" Value="Administratif" />
                    </asp:DropDownList>
                </div>
                
            </div>

            <!-- Section pour Tribunal ordinaire -->
            <div id="tribunalSection" class="juridiction-section" style="display: none;">
                <div class="wide-form-row" >
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Tribunal</span>
                            <span class="label-ar">المحكمة</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_TRIBUNAL" runat="server" CssClass="wide-form-control" onchange="handleTribunalChange()">
                            <asp:ListItem Text="------" Value="" Selected="True" />
                        </asp:DropDownList>
                            </div>
                    </div>
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Section</span>
                            <span class="label-ar">قسم</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_SECTION_TRIBUNAL" runat="server"
                                CssClass="wide-form-control"
                                onchange="showCB_REFERE_Fields()">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>

                            <asp:CheckBox ID="CB_REFERE" runat="server"
                                ToolTip="Référé/استعجالي"
                                CssClass="custom-checkbox" />
                        </div>

                    </div>

                </div>
                <div class="wide-form-row" >
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Cours</span>
                            <span class="label-ar">المجلس</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_COURS" runat="server" CssClass="wide-form-control" onchange="handleTribunalChange()">
                            <asp:ListItem Text="------" Value="" Selected="True" />
                            <asp:ListItem Text="COURS1/المجلس1" Value="COURS1" />
                            <asp:ListItem Text="COURS2/المجلس2" Value="COURS2" />
                        </asp:DropDownList>
                            </div> 
                    </div>

                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Chambre Cours</span>
                            <span class="label-ar">غرفةالمجلس</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_CHAMBRE_COURS" runat="server" CssClass="wide-form-control" onchange="showCB_REFERE_CHAMBRE_Fields()">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>
                            <asp:CheckBox ID="CB_REFERE_CHAMMBRE" runat="server"
                                ToolTip="Référé/استعجالي"
                                CssClass="custom-checkbox" />
                        </div>
                    </div>
                </div>
                <div class="wide-form-row" >
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Cours suprême</span>
                            <span class="label-ar">المحكمة العليا</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_COURS_SUP" runat="server" CssClass="wide-form-control" onchange="handleTribunalChange()">
                            <asp:ListItem Text="------" Value="" Selected="True" />
                            <asp:ListItem Text="CS1" Value="CS1" />
                            <asp:ListItem Text="CS2" Value="CS2" />
                        </asp:DropDownList>
                            </div>
                    </div>
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Chambre Cours suprême</span>
                            <span class="label-ar">غرفة المحكمة العليا</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_CHAMBRE_COUR_SUP" runat="server" CssClass="wide-form-control" onchange="showCB_REFERE_CHAMBRE_SUP_Fields()">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>
                            <asp:CheckBox ID="CB_REFERE_CHAMBRE_SUP" runat="server"
                                ToolTip="Référé/استعجالي"
                                CssClass="custom-checkbox" />
                        </div>
                    </div>
                </div>
            </div>

            <!-- Section pour Tribunal administratif -->
            <div id="adminSection" class="juridiction-section" style="display: none;">
                <div class="wide-form-row">
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Tribunal Admin.</span>
                            <span class="label-ar">المحكمة الإدارية</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_TRI_ADMIN" runat="server" CssClass="wide-form-control" onchange="handleTribunalAdminChange()" >
                            <asp:ListItem Text="------" Value="" Selected="True" />
                            <asp:ListItem Text="T Admin" Value="Admin" />
                        </asp:DropDownList>
                            </div>
                    </div>
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Section</span>
                            <span class="label-ar">قسم</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_SECTION_ADMIN" runat="server"
                                CssClass="wide-form-control">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="wide-form-row">
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Tribunal Admin. d'appel</span>
                            <span class="label-ar">محكمة الاستئناف الإدارية</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_TRI_ADMIN_APPEL" runat="server" CssClass="wide-form-control" onchange="handleTribunalAdminChange()">
                            <asp:ListItem Text="------" Value="" Selected="True" />
                            <asp:ListItem Text="T Admin Appel" Value="Appel" />
                        </asp:DropDownList>
                            </div>
                    </div>
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Chambre</span>
                            <span class="label-ar">غرفة</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_CHAMBRE_TRI_APPEL" runat="server"
                                CssClass="wide-form-control">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                <div class="wide-form-row">
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Conseil d'état</span>
                            <span class="label-ar">مجلس الدولة</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_CONSIEL_ETAT" runat="server" CssClass="wide-form-control" onchange="handleTribunalAdminChange()">
                            <asp:ListItem Text="------" Value="" Selected="True" />
                            <asp:ListItem Text="Conseil etat" Value="Conseil etat" />
                        </asp:DropDownList>
                            </div>
                    </div>
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Chambre</span>
                            <span class="label-ar">غرفة</span>
                        </div>
                        <div class="input-with-add">
                            <asp:DropDownList ID="DDL_CHAMBRE_CONSEIL_ETAT" runat="server"
                                CssClass="wide-form-control">
                                <asp:ListItem Text="------" Value="" Selected="True" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="wide-form-actions">
            <asp:Button ID="BTN_SUIVANT_01" runat="server" Text="Enregistrer" CssClass="wide-btn-submit" OnClick="BTN_SUIVANT_01_Click" />
        </div>

        </div>
        
    <%--</div>--%>

    <!-- Section Requete -->
        
    <div id="ScanRequetteModal" class="modal">
    <div class="modal-content-affaire">
        <!-- Header -->
        <div class="modal-header">
            <h3>
                <i class="fas fa-info-circle"></i> 
                Scan Requette de l'Affaire N° <asp:Label runat="server" ID="LB_NUM_AFFAIRE" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeScanRequetteModal()">&times;</span>
        </div>

        <!-- Body -->
        <div class="modal-body">
            <div class="wide-form-section" runat="server" id="Scanreq">
            <h5 class="wide-section-title">
                <span class="title-fr">Scan dossier contentieux</span>
                <span class="title-ar">مسح ملف النزاع</span>
            </h5>
            <div id="documentsContainer_requette">
                <div class="document-item">
                    <div class="wide-form-row   " runat="server" id="TRI">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Requête Introductif</span>
                                <span class="label-ar">العريضة الإفتتاحية</span>
                            </div>
                            <asp:TextBox ID="TB_REQUETE" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_REQUETE" runat="server" CssClass="wide-form-control" />
                        </div>
                    </div>
                    <div class="wide-form-row hidden" runat="server" id="CRS">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Requête d'appel</span>
                                <span class="label-ar">العريضة الاستئناف</span>
                            </div>
                            <asp:TextBox ID="TB_REQUETE_APPEL" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_REQUETE_APPEL" runat="server" CssClass="wide-form-control" />

                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Lettre de Constitution</span>
                                <span class="label-ar">رسالة التأسيس تكوين للاستئناف</span>
                            </div>
                            <asp:FileUpload ID="FU_CONSTITUTION_APPEL" runat="server" CssClass="wide-form-control" />
                            <%--<asp:CheckBox ID="Ck_CONSTITUTION_APPEL" runat="server" ToolTip="عريضة تكوين للاستئناف" CssClass="custom-checkbox" />--%>
                        </div>

                    </div>
                    <div class="wide-form-row hidden" runat="server" id="CRSSUP">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Requête pour voir en cassation</span>
                                <span class="label-ar">عريضة الطعن بالنقض</span>
                            </div>
                            <asp:TextBox ID="TB_REQ_VOIR_CASSATION" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_REQ_VOIR_CASSATION" runat="server" CssClass="wide-form-control" />

                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Lettre de Constitution</span>
                                <span class="label-ar">رسالة التأسيس للطعن بالنقض</span>
                            </div>
                            <asp:FileUpload ID="FU_CONSTITUTION_CASSATION" runat="server" CssClass="wide-form-control" />
                            <%--<asp:CheckBox ID="Ck_CONSTITUTION_CASSATION" runat="server" ToolTip="عريضة تكوين للطعن بالنقض" CssClass="custom-checkbox" />--%>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        </div>

        <!-- Footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-cancel" onclick="closeScanRequetteModal()">Fermer</button>
            <asp:HiddenField ID="HF_ID_AFFAIRE" runat="server" />
        </div>
    </div>
</div>

    

    

    <script type="text/javascript">
        function openScanRequetteModal() {
            // Ouvrir le modal
            document.getElementById('ScanRequetteModal').style.display = 'block';
            return false;
        }

        function closeScanRequetteModal() {
            document.getElementById('ScanRequetteModal').style.display = 'none';
        }

        

       

        // Compteurs pour les nouveaux champs
        var defendeurCount = 1;
        var partieMiseEnCauseCount = 1;
        var DateEnvoi = 1;
        var AvocatAdversaire = 1;
        var Avocat = 1;

        var defendeurCountM = 1;
        var miseEnCauseCountM = 1;
        var DateEnvoiM = 1;
        // Compteurs pour chaque section de documents
        var courierDocCount = 1;
        var courierDocCountM = 1; // 1 car le premier courrier existe déjà dans le design
        var avocatDocCount = 1;
        var avocatDocCountM = 1; // 1 si le premier champ existe déjà dans le design
        var otherDocCount = 1;
        var otherDocCountM = 1; // 1 si le premier champ existe déjà dans le design



        var impactCount = 1;

      

        function addDateEnvoiField() {
            DateEnvoi++;
            var container = document.getElementById('dateEnvoiContainer');
            var newField = document.createElement('div');
            newField.className = 'DateRenvoie-group';
            newField.innerHTML = `
            <div class="wide-form-row">
                 <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Date renvoie</span>
                        <span class="label-ar">تاريخ الإرسال</span>
                    </div>
                    <div class="input-with-add" >
                    <input type="date" class="wide-form-control" name="TB_DATE_ENVOI_DYNAMIC[]" />
                        </div> 
                    
                </div>
                <div class="wide-form-group"  >
                    <div class="dual-label-container">
                        <span class="label-fr">Motif Date Renvoie</span>
                        <span class="label-ar">سبب التأجيل</span>
                    </div>
                    <div class="input-with-add" >
                    <input type="text" class="wide-form-control" name="TB_MOTIF_DATE_RENVOI_DYNAMIC[]" />
                    
                    <button type="button" class="btn-icon-remove" onclick="this.closest('.DateRenvoie-group').remove()">
                <i class="fas fa-times"></i>
            </button>
                        </div>
                    
                </div>
                </div> `;
            container.appendChild(newField);
        }

        function addDateEnvoiFieldM(value = "", Motif = "") {
            DateEnvoiM++;
            var container = document.getElementById('dateEnvoiContainer');
            var newField = document.createElement('div');

            newField.className = 'DateRenvoie-group';
            newField.innerHTML = `
                <div class="wide-form-row">
                    <div class="wide-form-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Date renvoie</span>
                            <span class="label-ar">تاريخ الإرسال</span>
                        </div>
                        <div class="input-with-add" >
                            <input type="date" class="wide-form-control" name="TB_DATE_ENVOI_DYNAMIC[]" value="${value}" />
                        </div>

                    </div>
                    <div class="wide-form-group"  >
                        <div class="dual-label-container">
                            <span class="label-fr">Motif Date Renvoie</span>
                            <span class="label-ar">سبب التأجيل</span>
                        </div>
                        <div class="input-with-add" >
                            <input type="text" class="wide-form-control" name="TB_MOTIF_DATE_RENVOI_DYNAMIC[]" value="${Motif}" />

                            <button type="button" class="btn-icon-remove" onclick="this.closest('.DateRenvoie-group').remove()">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>

                    </div>
                </div >
`;
            container.appendChild(newField);

        }


        function addPartieMiseEnCauseField() {
            partieMiseEnCauseCount++;
            var container = document.getElementById('partiesMiseEnCauseContainer');
            var newField = document.createElement('div');
            newField.className = 'input-with-add';
            newField.innerHTML = `
            <input type="text" class="wide-form-control" name="TB_PARTIE_MISE_CAUSE_${partieMiseEnCauseCount}" />
            <button type="button" class="btn-icon-remove" onclick="this.parentNode.remove()">
                <i class="fas fa-times"></i>
            </button>
        `;
            container.appendChild(newField);
        }

        function addPartieMiseEnCauseFieldM(value = "") {
            miseEnCauseCountM++;
            var container = document.getElementById('partiesMiseEnCauseContainer');
            var newField = document.createElement('div');
            newField.className = 'input-with-add';
            newField.innerHTML = `
            <input type="text" class="wide-form-control"
                   name="TB_PARTIE_MISE_CAUSE_${miseEnCauseCountM}"
                   value="${value}" />
            <button type="button" class="btn-icon-remove" onclick="this.parentNode.remove()">
                <i class="fas fa-times"></i>
            </button>
        `;
            container.appendChild(newField);
        }

        function addDefendeurField() {
            defendeurCount++;
            var container = document.getElementById('defendeursContainer');
            var newField = document.createElement('div');
            newField.className = 'input-with-add';
            newField.innerHTML = `
        <input type="text" class="wide-form-control" name="TB_PARTIE_DEFENDEUR_${defendeurCount}"   />
        <button type="button" class="btn-icon-remove" onclick="this.parentNode.remove()">
            <i class="fas fa-times"></i>
        </button>
    `;
            container.appendChild(newField);
        }

        function addDefendeurFieldM(value = "") {
            defendeurCountM++;
            var container = document.getElementById('defendeursContainer');
            var newField = document.createElement('div');
            newField.className = 'input-with-add';
            newField.innerHTML = `
            <input type="text" class="wide-form-control" 
                   name="TB_PARTIE_DEFENDEUR_${defendeurCountM}" 
                   value="${value}" />
            <button type="button" class="btn-icon-remove" onclick="this.parentNode.remove()">
                <i class="fas fa-times"></i>
            </button>
        `;
            container.appendChild(newField);
        }

        

        
        



        

        function showJuridictionFields() {
            // Masquer toutes les sections d'abord
            document.querySelectorAll('.juridiction-section').forEach(function (section) {
                section.style.display = 'none';
            });

            // Afficher la section correspondante au type sélectionné
            var selectedType = document.getElementById('<%= DDL_TYPE_JURIDICTION.ClientID %>').value;

            if (selectedType === 'Normal') {
                document.getElementById('tribunalSection').style.display = 'block';
            }
            else if (selectedType === 'Administratif') {
                document.getElementById('adminSection').style.display = 'block';
            }

        }

        function showCB_REFERE_Fields() {
            var ddl = document.getElementById('<%= DDL_SECTION_TRIBUNAL.ClientID %>');
            var cbRefere = document.getElementById('<%= CB_REFERE.ClientID %>');

            var selectedText = ddl.options[ddl.selectedIndex].text; // texte affiché (DataTextField)

            if (selectedText === 'Référés / إستعجالي') {
                cbRefere.style.display = 'none'; // masquer
            } else {
                cbRefere.style.display = 'inline-block'; // afficher
            }
        }

        function showNumSOUSCRI_Fields() {

            var ddl = document.getElementById('<%= DDL_NATURE.ClientID %>');
            var groupSouscri = document.getElementById('SOUSCRIPTION_GROUP');

            var selectedText = ddl.options[ddl.selectedIndex].text.trim();

            if (selectedText === 'Souscription / الإكتتاب') {
                groupSouscri.style.display = 'block';   // afficher tout le bloc
            } else {
                groupSouscri.style.display = 'none';    // masquer tout le bloc
            }
        }

       

        window.onload = function () {
            showDateNotif();
        };

        function showCB_REFERE_CHAMBRE_Fields() {
            var ddl = document.getElementById('<%= DDL_CHAMBRE_COURS.ClientID %>');
            var cbRefere = document.getElementById('<%= CB_REFERE_CHAMMBRE.ClientID %>');

            var selectedText = ddl.options[ddl.selectedIndex].text; // texte affiché (DataTextField)

            if (selectedText === 'Référés / إستعجالي') {
                cbRefere.style.display = 'none'; // masquer
            } else {
                cbRefere.style.display = 'inline-block'; // afficher
            }
        }

        function showCB_REFERE_CHAMBRE_SUP_Fields() {
            var ddl = document.getElementById('<%= DDL_CHAMBRE_COUR_SUP.ClientID %>');
            var cbRefere = document.getElementById('<%= CB_REFERE_CHAMBRE_SUP.ClientID %>');

            var selectedText = ddl.options[ddl.selectedIndex].text; // texte affiché (DataTextField)

            if (selectedText === 'Référés / إستعجالي') {
                cbRefere.style.display = 'none'; // masquer
            } else {
                cbRefere.style.display = 'inline-block'; // afficher
            }
        }

     

      
        // Exécuter au chargement pour l'état initial
        document.addEventListener('DOMContentLoaded', function () {
            //togglePrecisionImpact();
            showJuridictionFields();
        });
        var documentCount = 1;

        
        function switchLanguage(lang) {
            document.querySelector('body').setAttribute('dir', lang === 'ar' ? 'rtl' : 'ltr');

            // Mettre à jour les textes
            document.querySelectorAll('[data-fr], [data-ar]').forEach(element => {
                if (element.tagName === 'LABEL') {
                    element.textContent = element.getAttribute('data-' + lang);
                }
                if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA') {
                    const placeholder = element.getAttribute('placeholder-' + lang);
                    if (placeholder) element.setAttribute('placeholder', placeholder);
                }
            });

            // Mettre à jour les boutons de langue
            document.querySelectorAll('.lang-btn').forEach(btn => {
                btn.classList.toggle('active', btn.getAttribute('data-lang') === lang);
            });
        }

        // Écouteurs pour les boutons de langue
        document.querySelectorAll('.lang-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                switchLanguage(this.getAttribute('data-lang'));
            });
        });

        // Initialiser avec le français
        switchLanguage('fr');
        
        function handleTribunalChange() {
            // Récupérer les DropDownLists côté client
            var ddlTribunal = document.getElementById('<%= DDL_TRIBUNAL.ClientID %>');
             var ddlCour = document.getElementById('<%= DDL_COURS.ClientID %>');
             var ddlCourSup = document.getElementById('<%= DDL_COURS_SUP.ClientID %>');
             var ddlChambreCourSup = document.getElementById('<%= DDL_CHAMBRE_COUR_SUP.ClientID %>');
             var ddlChambreCour = document.getElementById('<%= DDL_CHAMBRE_COURS.ClientID %>');
             var ddlSection = document.getElementById('<%= DDL_SECTION_TRIBUNAL.ClientID %>');
             var CBRefereSection = document.getElementById('<%= CB_REFERE .ClientID %>');
             var CBRefereCours = document.getElementById('<%= CB_REFERE_CHAMMBRE.ClientID %>');
             var CBRefereCoursSup = document.getElementById('<%= CB_REFERE_CHAMBRE_SUP.ClientID %>');
             var sectionTRI = document.getElementById('<%= TRI.ClientID %>');
             var sectionCRS = document.getElementById('<%= CRS.ClientID %>');
             var sectionCRSSUP = document.getElementById('<%= CRSSUP.ClientID %>');
             

        if (!ddlTribunal || !ddlCour || !ddlCourSup) return;

        // Si un tribunal est sélectionné (valeur ≠ vide), on désactive les autres
        if (ddlTribunal.value !== "") {
            ddlCour.disabled = true;
            ddlCourSup.disabled = true;
            ddlChambreCourSup.disabled = true;
            ddlChambreCour.disabled = true;
            CBRefereCours.disabled = true;
            CBRefereCoursSup.disabled = true;
            sectionTRI.classList.remove('hidden');
            sectionCRS.classList.add('hidden');
            sectionCRSSUP.classList.add('hidden');
            
        }
        else if (ddlCour.value !== "") {
            ddlCourSup.disabled = true;
            ddlChambreCourSup.disabled = true;
            ddlTribunal.disabled = true;
            ddlSection.disabled = true;
            CBRefereSection.disabled = true;
            CBRefereCoursSup.disabled = true;
            sectionTRI.classList.add('hidden');
            sectionCRS.classList.remove('hidden');
            sectionCRSSUP.classList.add('hidden');
            
        }
        else if (ddlCourSup.value !== "") {
            ddlCour.disabled = true;
            ddlChambreCour.disabled = true;
            ddlTribunal.disabled = true;
            ddlSection.disabled = true;
            CBRefereSection.disabled = true;
            CBRefereCours.disabled = true;
            sectionTRI.classList.add('hidden');
            sectionCRS.classList.add('hidden');
            sectionCRSSUP.classList.remove('hidden');
            
        }
        else {
            ddlCour.disabled = false;
            ddlChambreCour.disabled = false;
            ddlTribunal.disabled = false;
            ddlSection.disabled = false;
            CBRefereSection.disabled = false;
            CBRefereCours.disabled = false;
            ddlCourSup.disabled = false;
            ddlChambreCourSup.disabled = false;
            CBRefereCoursSup.disabled = false;
            sectionTRI.classList.remove('hidden');
            sectionCRS.classList.remove('hidden');
            sectionCRSSUP.classList.remove('hidden');
            
        }
        }


        function handleTribunalAdminChange() {
            // Récupérer les DropDownLists côté client
            var ddlTribunal = document.getElementById('<%= DDL_TRI_ADMIN.ClientID %>');
            var ddlCour = document.getElementById('<%= DDL_TRI_ADMIN_APPEL.ClientID %>');
            var ddlCourSup = document.getElementById('<%= DDL_CONSIEL_ETAT.ClientID %>');
             var ddlChambreCourSup = document.getElementById('<%= DDL_CHAMBRE_CONSEIL_ETAT.ClientID %>');
             var ddlChambreCour = document.getElementById('<%= DDL_CHAMBRE_TRI_APPEL.ClientID %>');
             var ddlSection = document.getElementById('<%= DDL_SECTION_ADMIN.ClientID %>');
             var sectionTRI = document.getElementById('<%= TRI.ClientID %>');
             var sectionCRS = document.getElementById('<%= CRS.ClientID %>');
             var sectionCRSSUP = document.getElementById('<%= CRSSUP.ClientID %>');
             

             if (!ddlTribunal || !ddlCour || !ddlCourSup) return;

             // Si un tribunal est sélectionné (valeur ≠ vide), on désactive les autres
             if (ddlTribunal.value !== "") {
                 ddlCour.disabled = true;
                 ddlCourSup.disabled = true;
                 ddlChambreCourSup.disabled = true;
                 ddlChambreCour.disabled = true;
                 sectionTRI.classList.remove('hidden');
                 sectionCRS.classList.add('hidden');
                 sectionCRSSUP.classList.add('hidden');
                 
                 
             }
             else if (ddlCour.value !== "") {
                 ddlCourSup.disabled = true;
                 ddlChambreCourSup.disabled = true;
                 ddlTribunal.disabled = true;
                 ddlSection.disabled = true;
                 sectionTRI.classList.add('hidden');
                 sectionCRS.classList.remove('hidden');
                 sectionCRSSUP.classList.add('hidden');
                 
                 
             }
             else if (ddlCourSup.value !== "") {
                 ddlCour.disabled = true;
                 ddlChambreCour.disabled = true;
                 ddlTribunal.disabled = true;
                 ddlSection.disabled = true;
                 sectionTRI.classList.add('hidden');
                 sectionCRS.classList.add('hidden');
                 sectionCRSSUP.classList.remove('hidden');
                 
                 
             }
             else {
                 ddlCour.disabled = false;
                 ddlChambreCour.disabled = false;
                 ddlTribunal.disabled = false;
                 ddlSection.disabled = false;
                 ddlCourSup.disabled = false;
                 ddlChambreCourSup.disabled = false;
                 sectionTRI.classList.remove('hidden');
                 sectionCRS.classList.remove('hidden');
                 sectionCRSSUP.classList.remove('hidden');
                 
                 
             }
        }

    </script>
</asp:Content>
