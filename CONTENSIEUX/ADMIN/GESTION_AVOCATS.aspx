<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GESTION_AVOCATS.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.ADMIN.GESTION_AVOCATS" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i> Gestion des Avocats</h2>
            <button type="button" Class="btn-add"  onclick="openAvocatModal()">
    <i class="fas fa-plus"></i> Ajouter un avocat
</button>
        </div>
        
        
        <!-- Zone de recherche -->
        <div class="search-panel">
    <div class="search-filter-panel">
        <div class="search-header">
            <h3><i class="fas fa-search"></i> Rechercher avocats</h3>
            <button type="button" class="toggle-btn" onclick="toggleSearchPanel()">
                <i class="fas fa-chevron-down"></i>
            </button>
        </div>

        <div class="search-grid" id="searchGrid" style="display: none;">

            <!-- Ligne 1 : Observation -->
            

            <!-- Ligne 2 : Nom, Prénom, Active, Bouton -->
            <div class="wide-form-row">
                <div class="search-group">
                    <label for="TB_SEARCH_NOM">Nom et Prénom</label>
                    <asp:TextBox ID="TB_SEARCH_NOM" runat="server" CssClass="form-control"
                        placeholder="Rechercher par nom"></asp:TextBox>
                </div>
                <div class="search-group">
                    <label for="DDL_SEARCH_CNV">DR</label>
                    <asp:DropDownList ID="DDL_DR" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="search-group">
                    <label for="DDL_SEARCH_CNV">Active</label>
                    <asp:DropDownList ID="DDL_SEARCH_CNV" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                        <asp:ListItem Value="true">Oui</asp:ListItem>
                        <asp:ListItem Value="false">Non</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="search-group">
                    <div class="dual-label-container">
                         <label for="DDL_SEARCH_CNV">Date Convention</label>
                    </div>
                    <div class="input-with-add">
                        <asp:TextBox ID="TB_DATE_DEBUT_SEARCH" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                        <asp:TextBox ID="TB_DATE_FIN_SEARCH" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                
            </div>

            <div class="wide-form-row">
                <div class="search-group">
                    <label for="chkObservations">Observation :</label>
                    <asp:CheckBoxList ID="chkObservations" runat="server"
                        RepeatDirection="Horizontal"
                        RepeatLayout="Flow"
                        CssClass="checkbox-list checkbox-item">
                    </asp:CheckBoxList>
                </div>
                <div class="search-group">
                    <label>&nbsp;</label>
                    <asp:Button ID="BTN_SEARCH" runat="server" Text="Rechercher"
                        CssClass="btn btn-primary tb-small" OnClick="BTN_SEARCH_Click" />
                </div>

                
            </div>
        </div>
    </div>
</div>


        <div class="data-section">
            <asp:ListView ID="LIST_OV" runat="server" DataKeyNames="ID_AVOCAT" OnItemDataBound="LIST_OV_ItemDataBound" OnItemEditing="LIST_OV_ItemEditing" OnItemUpdating="LIST_OV_ItemUpdating" OnItemCanceling="LIST_OV_ItemCanceling" GroupPlaceholderID="groupPlaceHolder1"  ItemPlaceholderID="itemPlaceHolder1" AllowPaging="True"  OnPagePropertiesChanging="LIST_OV_PagePropertiesChanging">

                <LayoutTemplate>
                    <div class="table-responsive">
                        <table class="modern-data-table">
                            <thead>
                                <tr>
                                    <th>Nom</th>
                                    <th>Prénom</th>
                                    <th>Active</th>
                                    <th>Date Début</th>
                                    <th>Date Fin</th>
                                    <th>A. Tribunal</th>
                                    <th>A. Cours</th>
                                    <th>A. Cours Sup.</th>
                                    <th>A. Référé</th>
                                    <th>Mnt Globale</th>
                                    <th>Mnt Reste a payé</th>
                                    <th>Mnt Payé</th>
                                    <th runat="server" id="th2" visible="false" >num_cnv</th>
                                    <th runat="server" id="th3" visible="false" >DR</th>
                                    <th runat="server" id="thMntTribunal" visible="false" >mnt tribunal</th>
                                    <th runat="server" id="thMntCours" visible="false">mnt cours</th>
                                    <th runat="server" id="thMntCousSup" visible="false">mnt cours sup</th>
                                    <th runat="server" id="thMntrefere" visible="false">mnt refere</th>
                                    <th runat="server" id="th1" visible="false">ID</th>
                                    <th width="120">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                            </tbody>
                        </table>
                    </div>
        
                    <div class="pagination-container">
                        <asp:DataPager ID="DataPager1" runat="server"
                            PagedControlID="LIST_OV"
                            PageSize="5"
                            QueryStringField="page">
                            <Fields>
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="True"
                                    FirstPageText="« "
                                    ShowPreviousPageButton="True"
                                    PreviousPageText="‹ "
                                    ShowNextPageButton="False"
                                    ShowLastPageButton="False"
                                    RenderDisabledButtonsAsLabels="true"
                                    ButtonCssClass="pager-button" />
                        
                                <asp:NumericPagerField 
                                    ButtonCount="5" 
                                    ButtonType="Link"
                                    CurrentPageLabelCssClass="current-page"
                                    NumericButtonCssClass="page-number" 
                                    NextPreviousButtonCssClass="pager-button"/>
                        
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="False"
                                    ShowPreviousPageButton="False"
                                    ShowNextPageButton="True"
                                    NextPageText=" ›"
                                    ShowLastPageButton="True"
                                    LastPageText=" »"
                                    RenderDisabledButtonsAsLabels="true"
                                    ButtonCssClass="pager-button" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
    
                <GroupTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1" />
                </GroupTemplate>
    
                <ItemTemplate>
                    <tr class="table-row" id="trAffaire" runat="server">
                        <td><asp:Label ID="NOM_AVOCAT" runat="server" Text='<%# Eval("NOM_AVOCAT") %> ' CssClass="table-data" /></td>
                        <td><asp:Label ID="PRENOM_AVOCAT" runat="server" Text='<%# Eval("PRENOM_AVOCAT") %>' CssClass="table-data" /></td>
                        <td><span class="status-badge <%# GetStatusClass((bool)Eval("FLAG_ACTIVE")) %>">
                            <asp:Label ID="FLAG_CONVENTION" runat="server" Text='<%# (bool)Eval("FLAG_ACTIVE") ? "Oui" : "Non" %>'  /></span></td>
                        <td><asp:Label ID="USER_DDN" runat="server" Text='<%# Eval("DATE_DEBUT", "{0:d}") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("DATE_FIN", "{0:d}") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("NBR_AFFAIRE_TRIBUNAL") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("NBR_AFFAIRE_COURS") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("NBR_AFFAIRE_COURS_SUP") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label5" runat="server" Text='<%# Eval("NBR_AFFAIRE_REFERE") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label6" runat="server" Text='<%# Eval("MONTANT_GLOBAL") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label7" runat="server" Text='<%# Eval("MONTANT_REST_A_PAYER") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label12" runat="server" Text='<%# Eval("MONTANT_PAYER") %>' CssClass="table-data" /></td>
                        <td runat="server" id="tdMntTribunal" visible="false" ><asp:Label ID="Label8" runat="server" Text='<%# Eval("MNT_AFF_TRIBUNAL") %>' CssClass="table-data"  /></td>
                        <td runat="server" id="tdMntCours" visible="false"><asp:Label ID="Label9" runat="server" Text='<%# Eval("MNT_AFF_COURS") %>' CssClass="table-data"   /></td>
                        <td runat="server" id="tdMntCousSup" visible="false"><asp:Label ID="Label10" runat="server" Text='<%# Eval("MNT_AFF_COURS_SUP") %>' CssClass="table-data"   /></td>
                        <td runat="server" id="tdMntrefere" visible="false"><asp:Label ID="Label11" runat="server" Text='<%# Eval("MNT_AFF_REFERE") %>' CssClass="table-data"   /></td>
                        <td runat="server" id="td1" visible="false" ><asp:Label ID="Label13" runat="server" Text='<%# Eval("ID_AVOCAT") %>' CssClass="table-data"  /></td>
                        <td runat="server" id="td2" visible="false" ><asp:Label ID="Label14" runat="server" Text='<%# Eval("NOM_DR") %>' CssClass="table-data"  /></td>
                        <td runat="server" id="td3" visible="false" ><asp:Label ID="Label15" runat="server" Text='<%# Eval("NUM_CONVENTION") %>' CssClass="table-data"  /></td>
                        <td class="action-cell">
                            
                            <asp:LinkButton ID="btnList" runat="server" CssClass="action-btn doc-btn"
                                CommandName="List" CommandArgument='<%# Eval("ID_AVOCAT") %>' ToolTip="Liste affaire" OnClick="btnList_Click"  >  <%--OnClick="btnEdit_Click"--%>
                                <i class="fas fa-list"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="action-btn edit-btn"
                                CommandName="Edit" CommandArgument='<%# Eval("ID_AVOCAT")  %>' 

                                OnClientClick='<%# 
    "openAvocatModalWithData(\""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("ID_AVOCAT"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("NOM_AVOCAT"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("PRENOM_AVOCAT"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("FLAG_ACTIVE"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("NUM_CONVENTION"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Convert.ToString(Eval("NOM_DR"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Eval("DATE_DEBUT") == DBNull.Value ? "" : String.Format("{0:yyyy-MM-dd}", Eval("DATE_DEBUT"))) + "\", \""
    + System.Web.HttpUtility.JavaScriptStringEncode(Eval("DATE_FIN") == DBNull.Value ? "" : String.Format("{0:yyyy-MM-dd}", Eval("DATE_FIN"))) + "\", "
    + (Eval("MNT_AFF_TRIBUNAL") == DBNull.Value ? "0" : String.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:0.##}", Eval("MNT_AFF_TRIBUNAL"))) + ", "
    + (Eval("MNT_AFF_COURS") == DBNull.Value ? "0" : String.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:0.##}", Eval("MNT_AFF_COURS"))) + ", "
    + (Eval("MNT_AFF_COURS_SUP") == DBNull.Value ? "0" : String.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:0.##}", Eval("MNT_AFF_COURS_SUP"))) + ", "
    + (Eval("MNT_AFF_REFERE") == DBNull.Value ? "0" : String.Format(System.Globalization.CultureInfo.InvariantCulture, "{0:0.##}", Eval("MNT_AFF_REFERE")))
    + "); return false;" 
%>'



                                ToolTip="Modifier cet utilisateur">
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>

                        </td>
                    </tr>
                </ItemTemplate>

                <EmptyDataTemplate>
                    <div class="empty-message">
                        Aucune donnée disponible.
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
        <div class="modal-footer" >
                    <label>&nbsp;</label>
                    <asp:Button ID="BTN_ETAT_AVOCAT" runat="server" Text="Etat Avocats" OnClick="BTN_ETAT_AVOCAT_Click" 
                        CssClass="btn-secondary" />
                    <%--<asp:Button ID="BTN_RESET_SEARCH" runat="server" Text="Réinitialiser" 
                        CssClass="btn-secondary" OnClick="BTN_RESET_SEARCH_Click" />--%>
                </div>
    </div>


<!-- Popup Modal -->
<div id="avocatModal" class="modal">
    <div class="modal-content">
        <div class="modal-header">
            <h3><i class="fas fa-user-plus"></i> Ajouter un avocat</h3>
            <span class="close" onclick="closeAvocatModal()">&times;</span>
        </div>
        
        <div class="modal-body">
            <div class="modal-grid">
                <!-- Row 1 -->
                <div class="form-group">
                    <label for="TB_NOM">Nom</label>
                    <asp:TextBox ID="TB_NOM" runat="server" CssClass="form-control"
                        placeholder="Saisir le nom"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TB_PRENOM">Prénom</label>
                    <asp:TextBox ID="TB_PRENOM" runat="server" CssClass="form-control"
                        placeholder="Saisir le prénom"></asp:TextBox>
                </div>

                <div class="search-group">
                    <label for="DDL_SEARCH_CNV">DR</label>
                    <asp:DropDownList ID="DDL_DR_AJOUT" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!-- Row 2 -->
                <div class="form-group">
                    <label for="TB_NUM_CNV">N° Convention</label>
                    <asp:TextBox ID="TB_NUM_CNV" runat="server" CssClass="form-control"
                        placeholder="Saisir le grade"></asp:TextBox>
                </div>
                <!-- Row 3 -->
                <div class="form-group">
                    <label for="TB_DATE_DEBUT">Date début</label>
                    <asp:TextBox ID="TB_DATE_DEBUT" runat="server" TextMode="Date"  
                        CssClass="form-control"></asp:TextBox>
                </div>

                <div class="form-group">
                    <label for="TB_DATE_FIN">Date fin</label>
                    <asp:TextBox ID="TB_DATE_FIN" runat="server" TextMode="Date"  
                        CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TB_MNT_TRIBUNAL">Montant Affaire Tribunal</label>
                    <asp:TextBox ID="TB_MNT_TRIBUNAL" runat="server" CssClass="form-control" TextMode="Number"
                        placeholder="Saisir le Montant"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TB_MNT_COURS">Montant Affaire Cours</label>
                    <asp:TextBox ID="TB_MNT_COURS" runat="server" CssClass="form-control" TextMode="Number"
                        placeholder="Saisir le Montant"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TB_MNT_COURS_SUP">Montant Affaire Cours Sup.</label>
                    <asp:TextBox ID="TB_MNT_COURS_SUP" runat="server" CssClass="form-control" TextMode="Number"
                        placeholder="Saisir le Montant"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="TB_MNT_refere">Montant Affaire Référé</label>
                    <asp:TextBox ID="TB_MNT_refere" runat="server" CssClass="form-control" TextMode="Number"
                        placeholder="Saisir le Montant"></asp:TextBox>
                </div>

                <div class="form-group checkbox-group">
                    <label>Avocat Active</label>
                    <div class="checkbox-container">
                        <asp:CheckBox ID="Ck_ACTIVE" runat="server" CssClass="custom-checkbox" />
                        <span class="checkmark"></span>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal-footer">
            <asp:Button ID="BTN_AJOUTER" runat="server" Text="Ajouter"
                CssClass="btn btn-primary" OnClick="BTN_AJOUTER_Click" 
                OnClientClick="return validateLoginForm();" />
            <asp:Button ID="BTN_MODIFIER" runat="server" Text="Modifier" CssClass="btn btn-primary" 
    style="display:none;" OnClick="BTN_MODIFIER_Click" />
            <asp:Button ID="BTN_RENISIALISER" runat="server" Text="Réinitialiser"
                CssClass="btn btn-secondary" OnClick="BTN_RENISIALISER_Click" Visible="false"  />
            <button type="button" class="btn btn-cancel" onclick="closeAvocatModal()">Annuler</button>
            <asp:HiddenField ID="HF_ID_AVOCAT" runat="server" />

        </div>
    </div>
</div>


<div id="AffaireavocatModal" class="modal">
    <div class="modal-content-affaire">
        <div class="modal-header">
            <h3><i class="fas fa-list"></i> Liste affaire de l'avocat : <asp:Label runat="server" ID="LB_AVOCAT" Text=""></asp:Label> </h3>
            <span class="close" onclick="closeAffaireAvocatModal()">&times;</span>
        </div>
        
        <div class="modal-body">
            <div class="data-section">
            <asp:ListView ID="LV_AFFAIRE_AVOCATS" runat="server" DataKeyNames="ID_AVOCAT" 
                OnItemEditing="LV_AFFAIRE_AVOCATS_ItemEditing" 
                OnItemUpdating="LV_AFFAIRE_AVOCATS_ItemUpdating" 
                OnItemCanceling="LV_AFFAIRE_AVOCATS_ItemCanceling" 
                
                GroupPlaceholderID="groupPlaceHolder1"  
                ItemPlaceholderID="itemPlaceHolder1" 
                AllowPaging="True"  
                OnPagePropertiesChanging="LV_AFFAIRE_AVOCATS_PagePropertiesChanging">

                <LayoutTemplate>
                    <div class="table-responsive">
                        <table class="modern-data-table">
                            <thead>
                                <tr>
                                    <th>N° Dossier</th>
                                    <th>Partie</th>
                                    <th>N° Affaire</th>
                                    <th>Date Audiance</th>
                                    <th>Observation</th>
                                    <th>Payement</th>
                                    <th>Montant Affaire</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                            </tbody>
                        </table>
                    </div>
        
                    <div class="pagination-container">
                        <asp:DataPager ID="DataPager1" runat="server"
                            PagedControlID="LIST_OV"
                            PageSize="5"
                            QueryStringField="page">
                            <Fields>
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="True"
                                    FirstPageText="« "
                                    ShowPreviousPageButton="True"
                                    PreviousPageText="‹ "
                                    ShowNextPageButton="False"
                                    ShowLastPageButton="False"
                                    RenderDisabledButtonsAsLabels="true"
                                    ButtonCssClass="pager-button" />
                        
                                <asp:NumericPagerField 
                                    ButtonCount="5" 
                                    ButtonType="Link"
                                    CurrentPageLabelCssClass="current-page"
                                    NumericButtonCssClass="page-number" 
                                    NextPreviousButtonCssClass="pager-button"/>
                        
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="False"
                                    ShowPreviousPageButton="False"
                                    ShowNextPageButton="True"
                                    NextPageText=" ›"
                                    ShowLastPageButton="True"
                                    LastPageText=" »"
                                    RenderDisabledButtonsAsLabels="true"
                                    ButtonCssClass="pager-button" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
    
                <GroupTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1" />
                </GroupTemplate>
    
                <ItemTemplate>
                    <tr class="table-row">
                        <td><asp:Label ID="NUM_DOSSIER" runat="server" Text='<%# Eval("NUM_DOSSIER") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="PARTIE" runat="server" Text='<%# Eval("PARTIE") %>' CssClass="table-data" /></td>
                         <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("NUM_AFFAIRE") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="USER_DDN" runat="server" Text='<%# Eval("DATE_AUDIANCE", "{0:d}") %>' CssClass="table-data" /></td>
                        <td><asp:Label ID="Label3" runat="server" Text='<%# Eval("OBSERVATION") %>' CssClass="table-data" /></td>
                        <td><span class="status-badge <%# GetStatusClass((bool)Eval("FLAG_PAYER")) %>">
                            <asp:Label ID="FLAG_CONVENTION" runat="server" Text='<%# (bool)Eval("FLAG_PAYER") ? "Oui" : "Non" %>'  /></span></td>
                        <td><asp:Label ID="Label4" runat="server" Text='<%# Eval("MNT_AFF_") %>' CssClass="table-data" /></td>
                        
                        
                    </tr>
                </ItemTemplate>

                <EmptyDataTemplate>
                    <div class="empty-message">
                        Aucune donnée disponible.
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
        </div>
        
        <div class="modal-footer">
            
            <button type="button" class="btn btn-cancel" onclick="closeAffaireAvocatModal()">Annuler</button>
            <asp:HiddenField ID="HiddenField1" runat="server" />

        </div>
    </div>
</div>

<script>
    function toggleSearchPanel() {
        const grid = document.getElementById("searchGrid");
        const footer = document.getElementById("FooterSearch");
        const icon = document.querySelector(".toggle-btn i");

        // Vérifier l'état réel
        const isVisible = window.getComputedStyle(grid).display !== "none";

        // Bascule l'affichage du panneau et du footer
        grid.style.display = isVisible ? "none" : "grid";
        footer.style.display = isVisible ? "none" : "flex";

        // Mise à jour de l'icône (supprime l'autre classe avant d'ajouter)
        if (isVisible) {
            icon.classList.remove("fa-chevron-up");
            icon.classList.add("fa-chevron-down");
        } else {
            icon.classList.remove("fa-chevron-down");
            icon.classList.add("fa-chevron-up");
        }
    }

    function openAffaireAvocatModal() {
    // Ouvrir le modal
        document.getElementById('AffaireavocatModal').style.display = 'block';
    return false;
    }

    function openAvocatModal() {
        // Réinitialiser le formulaire pour une nouvelle entrée
        document.getElementById('<%= HF_ID_AVOCAT.ClientID %>').value = '';
    document.getElementById('<%= TB_NOM.ClientID %>').value = '';
    document.getElementById('<%= TB_PRENOM.ClientID %>').value = '';
    document.getElementById('<%= Ck_ACTIVE.ClientID %>').checked = false;
    document.getElementById('<%= TB_DATE_DEBUT.ClientID %>').value = '';
    document.getElementById('<%= TB_DATE_FIN.ClientID %>').value = '';

    // Afficher le bouton Ajouter et cacher Modifier
    document.getElementById('<%= BTN_AJOUTER.ClientID %>').style.display = 'inline-block';
    document.getElementById('<%= BTN_MODIFIER.ClientID %>').style.display = 'none';

    // Ouvrir le modal
    document.getElementById('avocatModal').style.display = 'block';
    return false;
    }

    function setDDLByText(ddlId, text) {
        var ddl = document.getElementById(ddlId);
        for (var i = 0; i < ddl.options.length; i++) {
            if (ddl.options[i].text.trim() === text.trim()) {
                ddl.selectedIndex = i;
                break;
            }
        }
    }

    function openAvocatModalWithData(id, nom, prenom,  convention,cnv, dr, dateDebut, dateFin, mnt_tribunal, mnt_cours, mnt_cours_sup, mnt_refere) {
        // Remplir le formulaire avec les données existantes
        document.getElementById('<%= HF_ID_AVOCAT.ClientID %>').value = id;
    document.getElementById('<%= TB_NOM.ClientID %>').value = nom;
    document.getElementById('<%= TB_PRENOM.ClientID %>').value = prenom;
    document.getElementById('<%= Ck_ACTIVE.ClientID %>').checked = (convention === 'True');
    document.getElementById('<%= TB_NUM_CNV.ClientID %>').value = cnv;
    setDDLByText('<%= DDL_DR_AJOUT.ClientID %>', dr);
    document.getElementById('<%= TB_DATE_DEBUT.ClientID %>').value = dateDebut;
    document.getElementById('<%= TB_DATE_FIN.ClientID %>').value = dateFin;
    document.getElementById('<%= TB_MNT_TRIBUNAL.ClientID %>').value = mnt_tribunal;
    document.getElementById('<%= TB_MNT_COURS.ClientID %>').value = mnt_cours;
    document.getElementById('<%= TB_MNT_COURS_SUP.ClientID %>').value = mnt_cours_sup;
    document.getElementById('<%= TB_MNT_refere.ClientID %>').value = mnt_refere;

    // Cacher le bouton Ajouter et afficher Modifier
    document.getElementById('<%= BTN_AJOUTER.ClientID %>').style.display = 'none';
    document.getElementById('<%= BTN_MODIFIER.ClientID %>').style.display = 'inline-block';

    // Ouvrir le modal
    document.getElementById('avocatModal').style.display = 'block';
    return false;
    }

    function closeAvocatModal() {
        document.getElementById('avocatModal').style.display = 'none';
    }

    function closeAffaireAvocatModal() {
        document.getElementById('AffaireavocatModal').style.display = 'none';
    }

    // Fermer la modal en cliquant en dehors
    window.onclick = function (event) {
        const modal = document.getElementById('avocatModal');
        if (event.target == modal) {
            closeAvocatModal();
        }
    }
</script>

</asp:Content>