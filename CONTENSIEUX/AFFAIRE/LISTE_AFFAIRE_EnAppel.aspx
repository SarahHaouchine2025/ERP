<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_AFFAIRE_EnAppel.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_AFFAIRE_EnAppel" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modern-container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i>Liste des affaires En Appel / <span class="arabic-title"> قائمة القضايا المستأنفة</span></h2>

        </div>

        <div class="search-panel">
            <div class="search-header">
                <h3><i class="fas fa-search"></i>Critères de recherche / <span class="arabic-title">معايير البحث</span></h3>
                <button type="button" class="toggle-btn" onclick="toggleSearchPanel()">
                    <i class="fas fa-chevron-down"></i>
</button>
    </div>

    <div class="search-grid" id="searchGrid" style="display: none;">
        <!-- Ligne 1 -->
        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">N° Dossier</span><span class="label-ar">رقم الملف</span>
            </div>
            <asp:TextBox ID="TB_NUM_DOSIIER" runat="server" CssClass="form-control tb-small"
                placeholder="N° dossier"></asp:TextBox>
        </div>

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">N° Affaire</span><span class="label-ar">رقم القضية</span>
            </div>
            <asp:TextBox ID="TB_NUM_AFFAIRE" runat="server" CssClass="form-control tb-small"
                placeholder="N° affaire"></asp:TextBox>
        </div>

        <div class="search-group" runat="server" visible="false" id="div_num_demandeur">
            <div class="dual-label-container">
                <span class="label-fr">N° Demandeur</span><span class="label-ar">رقم الطالب</span>
            </div>
            <asp:TextBox ID="TB_NUM_DEMANDEUR" runat="server" CssClass="form-control tb-small"
                placeholder="N° de la partie"></asp:TextBox>
        </div>

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Demandeur</span><span class="label-ar">الطالب</span>
            </div>
            <asp:TextBox ID="TB_PARTIE" runat="server" CssClass="form-control tb-medium"
                placeholder="Nom de la partie"></asp:TextBox>
        </div>

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Tribunal</span><span class="label-ar">المحكمة</span>
            </div>
            <asp:DropDownList ID="DDL_TRIBUNAL" runat="server" CssClass="form-control"
                onchange="handleTribunalChange()">
                <asp:ListItem Text="------" Value="" Selected="True" />
            </asp:DropDownList>
        </div>

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Section</span><span class="label-ar">قسم</span>
            </div>
            <asp:DropDownList ID="DDL_SECTION_TRIBUNAL" runat="server" CssClass="form-control" onchange="showCB_REFERE_Fields()">
                <asp:ListItem Text="------" Value="" Selected="True" />
            </asp:DropDownList>
        </div>

        <!-- Ligne 2 -->
        

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Avocat</span><span class="label-ar">المحامي</span>
            </div>
            <asp:DropDownList ID="DDL_AVOCAT" runat="server" CssClass="form-control">
                <asp:ListItem Text="------" Value="" Selected="True" />
                <asp:ListItem Text="Avocat 1" Value="1" />
                <asp:ListItem Text="Avocat 2" Value="2" />
            </asp:DropDownList>
        </div>

       
        

        
       

        
        <div class="search-group">
                    <label for="DDL_SEARCH_CNV">DR</label>
                    <asp:DropDownList ID="DDL_DR" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                    </asp:DropDownList>
                </div>
        <%--<div class="search-group">
    <label for="CBL_DR">DR</label>
    <asp:CheckBoxList ID="CBL_DR" runat="server" CssClass="form-check">
    </asp:CheckBoxList>
</div>--%>
    </div>

    <div class="modal-footer" id="FooterSearch" style="display: none;">
        <asp:Button ID="BTN_SEARCH" runat="server" Text="Rechercher"
            CssClass="btn-primary" OnClick="BTN_SEARCH_Click" />
        <asp:Button ID="BTN_RENISIALISER" runat="server" Text="Réinitialiser"
            CssClass="btn-secondary" OnClick="BTN_RENISIALISER_Click"/>
    </div>
</div>

        <div class="data-section">
               <div class="dual-label-container">
                        <span class="label-fr" >Nombre d'affaire : <asp:label runat="server" id="NBR_AFFAIRE" Text=""></asp:label></span>
                    </div>
            <asp:ListView ID="LIST_AFFAIRE" runat="server" 
                DataKeyNames="ID_AFFAIRE" 
                OnSelectedIndexChanging="LIST_AFFAIRE_SelectedIndexChanging"
                OnItemEditing="LIST_AFFAIRE_ItemEditing" 
                
                OnItemUpdating="LIST_AFFAIRE_ItemUpdating" 
                OnItemCanceling="LIST_AFFAIRE_ItemCanceling" 
                OnItemDataBound="LV_AFFAIRES_ItemDataBound"
                GroupPlaceholderID="groupPlaceHolder1"  
                ItemPlaceholderID="itemPlaceHolder1" 
                AllowPaging="True"  
                OnPagePropertiesChanging="LIST_AFFAIRE_PagePropertiesChanging">

                <LayoutTemplate>
                    <div class="table-responsive">
                        <table class="modern-data-table">
                            <thead>
                                <tr>
                                    <th>N°Dossier</th>
                                    <th>Partie</th>
                                    <th>Juridiction</th>
                                    <th>Section</th>
                                    <th>N°Affaire</th>
                                    
                                    
                                    <th class="actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="pagination-container">
                        <asp:DataPager ID="DataPager1" runat="server"
                            PagedControlID="LIST_AFFAIRE"
                            PageSize="10"
                            QueryStringField="page">
                            <Fields>
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="True"
                                    FirstPageText="« Première"
                                    ShowPreviousPageButton="True"
                                    PreviousPageText="‹ Précédente"
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
                                    NextPageText="Suivante ›"
                                    ShowLastPageButton="True"
                                    LastPageText="Dernière »"
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
                    <tr id="trAffaire" runat="server">
                        
                        <td><span class="badge badge-primary"><%# Eval("NUM_DOSSIER") %></span></td>
                        <td><%# Eval("PARTIE") %></td>
                        <td><%# Eval("JURIDICTION") %></td>
                        <td><%# Eval("SECTION") %></td>
                        
                        <td><span class="badge badge-primary"><%# Eval("NUMERO_AFFAIRE") %></span></td>
                       

                        <td class="actions">
                            
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="action-btn edit-btn"
                                CommandName="Edit" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Modifier cette affaire" >  <%--OnClick="btnEdit_Click"--%>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                            

                            <asp:LinkButton ID="BTN_DOC_SCANER" runat="server" CssClass="action-btn doc-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Document Scanner" OnClick="BTN_DOC_SCANER_Click" 
                                >
                                <i class="fas fa-folder-open"></i>
                            </asp:LinkButton>
                            
                        </td>
                    </tr>
                </ItemTemplate>
                
                <EditItemTemplate>
                    <!-- Add your edit template here if needed -->
                </EditItemTemplate>

                <EmptyDataTemplate>
                    <div class="empty-data-message">
                        <i class="fas fa-info-circle"></i> Aucune affaire trouvée avec ces critères de recherche.
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

    </div>


    <div id="DOCAffaireModal" class="modal">
    <div class="modal-content-affaire">
        <!-- Header -->
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Documents Affaire N° <asp:Label runat="server" ID="LB_NUM_AFFAIRE_DOC" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeDOCAffaireModal()">&times;</span>
        </div>

        <!-- Body -->
        <div class="modal-body">
            <!-- Section : Parties -->
            <%--<h4 class="section-title"><i class="fas fa-users"></i> Parties</h4>--%>
            <div class="modal-grid-3">
                <div class="form-group">
                    <label>Catégorie</label>
                     <asp:DropDownList ID="DDL_CATEGORIE" runat="server" CssClass="form-control">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                        <asp:ListItem Text="Requette" Value="Requette" />
                        <asp:ListItem Text="Requette Appel" Value="Requette Appel" />
                         <asp:ListItem Text="Requette Cassation" Value="Requette Cassation" />
                         <asp:ListItem Text="Courier" Value="Courier" />
                         <asp:ListItem Text="Réponse" Value="Réponse" />
                        <asp:ListItem Text="Documents Adversaire" Value="Documents Adversaire" />
                         <asp:ListItem Text="Jugement" Value="Jugement" />
                         <asp:ListItem Text="Notification" Value="Notification" />
                         <asp:ListItem Text="Autres Documents" Value="Autres Documents" />
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Titre</label>
                    <asp:TextBox ID="TB_TITRE" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                
                    <div class="modal-footer">
                    <label>   </label>
                    <asp:Button ID="btn_recherche_doc" runat="server" Text="Recherche" OnClick="btn_recherche_doc_Click"
                        CssClass="btn-primary"  />
                    </div> 
                
                
               
            </div>
           
          <div class="data-section">
              
            <asp:ListView ID="LIST_DOC_AFFAIRE" runat="server" 
                DataKeyNames="ID_AFFAIRE" 
                
                GroupPlaceholderID="groupPlaceHolder1"  
                ItemPlaceholderID="itemPlaceHolder1" 
                AllowPaging="True"  
                OnPagePropertiesChanging="LIST_DOC_AFFAIRE_PagePropertiesChanging">

                <LayoutTemplate>
                    <div class="table-responsive">
                        <table class="modern-data-table">
                            <thead>
                                <tr>
                                    <th>Catégorie</th>
                                    <th>Titre</th>
                                    <th>Document</th>
                                    <th>Modifier</th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="pagination-container">
                        <asp:DataPager ID="DataPager1" runat="server"
                            PagedControlID="LIST_AFFAIRE"
                            PageSize="10"
                            QueryStringField="page">
                            <Fields>
                                <asp:NextPreviousPagerField 
                                    ButtonType="Link"
                                    ShowFirstPageButton="True"
                                    FirstPageText="« Première"
                                    ShowPreviousPageButton="True"
                                    PreviousPageText="‹ Précédente"
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
                                    NextPageText="Suivante ›"
                                    ShowLastPageButton="True"
                                    LastPageText="Dernière »"
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
    <tr>
        <td><asp:Label ID="lblCategorie" runat="server" Text='<%# Eval("CATEGORIE") %>' /></td>
        <td><asp:Label ID="lblTitre" runat="server" Text='<%# Eval("NOM_DOC") %>' /></td>
        <td>
            <asp:LinkButton ID="btnOpenDoc"
                runat="server"
                CssClass="btn btn-link btn-sm"
                OnClick="btnOpenDoc_Click"
                CommandArgument='<%# Eval("PATH_DOC") %>'>
                Consulter
            </asp:LinkButton>
        </td>
        <td>
            <div class="d-flex align-items-center gap-2">
                <!-- FileUpload avec largeur réduite et déclenchement JS -->
                <asp:FileUpload ID="FU_DOC" runat="server"
                    CssClass="form-control form-control-sm w-75"
                    onchange="enableSaveBtn(this)" />

                <!-- Bouton désactivé par défaut -->
                <asp:Button ID="btnSaveDoc"
                    runat="server"
                    CssClass="btn btn-primary btn-sm"
                    Text="Mettre à jour"
                    Enabled="false"
                    CommandArgument='<%# Eval("ID_AFFAIRE") %>'
                    OnClick="btnSaveDoc_Click" />
            </div>
        </td>
    </tr>
</ItemTemplate>

                <EditItemTemplate>
                    <!-- Add your edit template here if needed -->
                </EditItemTemplate>

                <EmptyDataTemplate>
                    <div class="empty-data-message">
                        <i class="fas fa-info-circle"></i> Aucune affaire trouvée avec ces critères de recherche.
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>

        </div>

        <!-- Footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-cancel" onclick="closeDOCAffaireModal()">Fermer</button>
            <asp:HiddenField ID="HiddenField1" runat="server" />
        </div>
    </div>
</div>

<script>

    function togglePayementFields() {
        var ddl = document.getElementById("DDL_CND_NON_PAYER");
        var datePay = document.getElementById("TB_DATE_PAYEMENT");
        var numFact = document.getElementById("TB_NUM_FACTURATION");
        var filePay = document.getElementById("FU_FAC_PAYEMENT");

        if (ddl.value === "") {
            datePay.disabled = false;
            numFact.disabled = false;
            filePay.disabled = false;
        } else {
            datePay.disabled = true;
            numFact.disabled = true;
            filePay.disabled = true;
        }
    }

    
    function enableSaveBtn(fileInput) {
        // On trouve le bouton dans la même cellule
        var parentDiv = fileInput.closest("div");
        var btn = parentDiv.querySelector("input[type='submit'], button");
        if (btn) {
            btn.disabled = fileInput.files.length === 0;
        }
    }

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

    function openDOCAFFAIREModal(num_affaire) {

        document.getElementById('<%= LB_NUM_AFFAIRE_DOC.ClientID %>').innerText = num_affaire;
        // Ouvrir le modal
        document.getElementById('DOCAffaireModal').style.display = 'block';
        return false;
    }
    function closeDOCAffaireModal() {
        document.getElementById('DOCAffaireModal').style.display = 'none';
    }
   


</script>

</asp:Content>