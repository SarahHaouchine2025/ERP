<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_COURIER.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_COURIER" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modern-container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i>Liste Couriers / <span class="arabic-title"> قائمة المراسلات الرسمية</span></h2>
           <div class="btn-group-inline">
                <asp:Button ID="BTN_ADD_COURIER" runat="server" Text="Envoyer courier"
                    CssClass="btn-add" OnClick="BTN_ADD_COURIER_Click" />
            </div>
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
        <div class="search-group" runat="server" id="div_numDossier" visible="false" >
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
                    <label for="DDL_DIRECTION_SEARCH">Direction</label>
                    <asp:DropDownList ID="DDL_DIRECTION_SEARCH" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
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
               
            <asp:ListView ID="LISTE_COURIER_" runat="server" 
                DataKeyNames="ID_SCAN_COURIER" 
                
                GroupPlaceholderID="groupPlaceHolder1"  
                ItemPlaceholderID="itemPlaceHolder1" 
                AllowPaging="True"  
                OnPagePropertiesChanging="LISTE_COURIER__PagePropertiesChanging">

                <LayoutTemplate>
                    <div class="table-responsive">
                        <table class="modern-data-table">
                            <thead>
                                <tr>
                                    <th>N° Dossier</th>
                                    <th>N° Affaire</th>
                                    <th>Direction</th>
                                    <th>Courier</th>
                                    <th>Réponse</th>
                                    
                                    <th>Action</th>
                                    <th runat="server" id="idAFF" visible="false" >affaire_id</th>
                                </tr>
                            </thead>
                            <tbody>
                                <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="pagination-container">
                        <asp:DataPager ID="DataPager1" runat="server"
                            PagedControlID="LISTE_COURIER_"
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
        <td><asp:Label ID="NUM_DOSSIER" runat="server" Text='<%# Eval("NUM_DOSSIER") %>' /></td>
        <td><asp:Label ID="NUMERO_AFFAIRE" runat="server" Text='<%# Eval("NUMERO_AFFAIRE") %>' /></td>
        <td><asp:Label ID="DIRECTION" runat="server" Text='<%# Eval("DIRECTION") %>' /></td>
        <td><asp:Label ID="DESCRIPTION_COURIER" runat="server" Text='<%# Eval("DESCRIPTION_COURIER") %>' /></td>
         <td><asp:Label ID="DESCRIPTION_REPONSE" runat="server" Text='<%# Eval("DESCRIPTION_REPONSE") %>' /></td>
        
        <td>
            <asp:LinkButton ID="BTN_DOC_COURIER"
                runat="server"
                CssClass="action-btn doc-btn"
                 OnClick="BTN_DOC_COURIER_Click"
                CommandArgument='<%# Eval("ID_SCAN_COURIER") %>'>
               <i class="fas fa-folder-open"></i>
            </asp:LinkButton>

            <asp:LinkButton ID="BTN_ENVOYER_REPONSE" runat="server" CssClass="action-btn courier-btn"
                                CommandName="Repondre" CommandArgument='<%# Eval("ID_SCAN_COURIER") + "|" + Eval("ID_AFFAIRE") + "|" + Eval("NUM_DOSSIER") %>' ToolTip="Envoyer un courier" OnClick="BTN_ENVOYER_REPONSE_Click"  
                                >
                                <i class="fas fa-envelope"></i>
                            </asp:LinkButton>
        </td>
        <td><asp:Label ID="ID_AFFAIRE" runat="server" Visible="false" Text='<%# Eval("ID_AFFAIRE") %>' /></td>
      
    </tr>
</ItemTemplate>

                <EditItemTemplate>
                    <!-- Add your edit template here if needed -->
                </EditItemTemplate>

                <EmptyDataTemplate>
                    <div class="empty-data-message">
                        <i class="fas fa-info-circle"></i> Aucune couriers trouvée avec ces critères de recherche.
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
                         <asp:ListItem Text="Jugement final" Value="Jugement" />
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

    <div id="CourierDirectionModal" class="modal">
    <div class="modal-content-affaire">
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Courier pour Direction <asp:Label runat="server" ID="LB_NUM_AFF_COUR" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeCourierDirectionModal()">&times;</span>
        </div>
        <div class="modal-body">
        <%--<h2 class="wide-form-title">Courier pour Direction <span class="arabic-title">رسالة إلى الإدارة</span></h2>--%>


        <!-- Espace Courier Direction  -->
        <div class="wide-form-section">
            <h5 class="wide-section-title">
                <span class="title-fr">Détails courier</span>
                <span class="title-ar">تفاصيل الرسالة</span>
            </h5>
            <div class="form-row">
                <div class="search-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Direction</span>
                        <span class="label-ar">الإدارة</span>
                    </div>
                    <div class="input-with-add">
                    <asp:DropDownList ID="DDL_DIRECTION" runat="server" CssClass="form-control ">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                        
                    </asp:DropDownList>
                    </div>
                </div>
                

                <div class="form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Numéro Affaire</span>
                        <span class="label-ar">تاريخ التأسيس</span>
                    </div>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control "></asp:TextBox>
                </div>

                

            </div>
            <div class="wide-form-row">
                <div class="form-group full-width">
                    <div class="dual-label-container">
                        <span class="label-fr">Courier</span>
                        <span class="label-ar">رسالة</span>
                    </div>
                    <asp:TextBox ID="TB_COURIER" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control "></asp:TextBox>
                </div>
            </div>

           <div id="documentsContainer">
    <div class="document-item">
                            <div class="wide-form-row">

                                <div class="form-group">
                                    <div class="dual-label-container">
                                        <span class="label-fr">Titre Document</span>
                                        <span class="label-ar">اسم الوثيقة</span>
                                    </div>
                                    <asp:TextBox ID="TB_NOM_DOCUMENT" runat="server" CssClass="form-control "></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <div class="dual-label-container">
                                        <span class="label-fr">Pièce jointe </span>
                                        <span class="label-ar">المرفق</span>
                                    </div>
                                    <asp:FileUpload ID="FU_AUTRE_DOC_" runat="server" CssClass="form-control " />
                                </div>

                                <div class="form-group" style="align-self: flex-end;" runat="server" visible="false" >
                                    <button type="button" class="btn-icon-add" onclick="addOtherDocField()">
                                        <i class="fas fa-plus"></i>
                                    </button>
                                </div>

                            </div>
                        </div>
</div>

            
        </div>
            </div>
        
        <!-- Boutons -->
        <div class="wide-form-actions">
            <asp:Button ID="Button1" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="btnSubmit_Click" />
            <asp:Label ID="Label2" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>
    </div>
</div>

    <div id="ReponseDirectionModal" class="modal">
    <div class="modal-content-affaire">
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Réponse Courier pour Direction <asp:Label runat="server" ID="LB_NUM_AFFAIRE_REP" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeReponseDirectionModal()">&times;</span>
        </div>
        <div class="modal-body">
        <%--<h2 class="wide-form-title">Courier pour Direction <span class="arabic-title">رسالة إلى الإدارة</span></h2>--%>


        <!-- Espace Courier Direction  -->
        <div class="wide-form-section">
            <h5 class="wide-section-title">
                <span class="title-fr">Détails Réponse</span>
                <span class="title-ar">تفاصيل الرسالة</span>
            </h5>
            <div class="wide-form-row">
                

            </div>
            <div class="form-row">
                <div class=form-group full-width">
                    <div class="dual-label-container">
                        <span class="label-fr">Réponse Courier</span>
                        <span class="label-ar">رسالة</span>
                    </div>
                    <asp:TextBox ID="TB_REPONSE_COURIER" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control "></asp:TextBox>
                </div>
            </div>

           <div id="documentsReponseContainer">
    <div class="document-item">
                            <div class="wide-form-row">

                                <div class="form-group">
                                    <div class="dual-label-container">
                                        <span class="label-fr">Titre Document</span>
                                        <span class="label-ar">اسم الوثيقة</span>
                                    </div>
                                    <asp:TextBox ID="TB_NOM_DOCUMENT_REP" runat="server" CssClass="form-control "></asp:TextBox>
                                </div>

                                <div class="form-group">
                                    <div class="dual-label-container">
                                        <span class="label-fr">Pièce jointe </span>
                                        <span class="label-ar">المرفق</span>
                                    </div>
                                    <asp:FileUpload ID="FU_AUTRE_DOC_REP" runat="server" CssClass="form-control " />
                                </div>

                                
                            </div>
                        </div>
</div>

            
        </div>
            </div>
        
        <!-- Boutons -->
        <div class="wide-form-actions">
            <asp:Button ID="Button2" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="btnSubmit_Click" />
            <asp:Label ID="Label4" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>
    </div>
</div>

<script>

   

    function openReponseDirectionModal() {
        // Ouvrir le modal
        document.getElementById('ReponseDirectionModal').style.display = 'block';
        return false;
    }

    function closeReponseDirectionModal() {
        document.getElementById('ReponseDirectionModal').style.display = 'none';
    }

    function openCourierDirectionModal() {
        // Ouvrir le modal
        document.getElementById('CourierDirectionModal').style.display = 'block';
        return false;
    }

    function closeCourierDirectionModal() {
        document.getElementById('CourierDirectionModal').style.display = 'none';
    }

    
    function enableSaveBtn(fileInput) {
        // On trouve le bouton dans la même cellule
        var parentDiv = fileInput.closest("div");
        var btn = parentDiv.querySelector("input[type='submit'], button");
        if (btn) {
            btn.disabled = fileInput.files.length === 0;
        }
    }

    function addOtherDocField() {

        var container = document.getElementById('documentsContainer');
        var newItem = document.createElement('div');
        newItem.className = 'document-item';

        newItem.innerHTML = `
        <div class="wide-form-row">

            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Nom Document</span>
                    <span class="label-ar">اسم الوثيقة</span>
                </div>
                <input type="text" name="TB_NOM_DOCUMENT[]" class="wide-form-control" />
            </div>

            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Pièce jointe</span>
                    <span class="label-ar">المرفق</span>
                </div>
                <input type="file" name="FU_AUTRE_DOC[]" class="wide-form-control" />
            </div>

            <div class="wide-form-group" style="align-self:flex-end;">
                <button type="button" class="btn-icon-remove"
                        onclick="this.closest('.document-item').remove()">
                    <i class="fas fa-times"></i>
                </button>
            </div>

        </div>
    `;

        container.appendChild(newItem);
    }


    function addOtherDocFieldM(valueNomDoc = "") {
        otherDocCountM++;
        var container = document.getElementById('documentsContainer');
        var newItem = document.createElement('div');
        newItem.className = 'document-item';
        newItem.innerHTML = `
        <div class="wide-form-row">
            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Nom Document</span>
                    <span class="label-ar">اسم الوتيقة</span>
                </div>
                <input type="text" id="TB_NOM_DOCUMENT_${otherDocCountM}" 
                       name="TB_NOM_DOCUMENT_${otherDocCountM}" 
                       class="wide-form-control"
                       value="${valueNomDoc}" />
            </div>
            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Pièce jointe (Max 5 Mo)</span>
                    <span class="label-ar">المرفق</span>
                </div>
                <input type="file" id="fileUpload_${otherDocCountM}" 
                       name="fileUpload_${otherDocCountM}" 
                       class="wide-form-control" />
            </div>
            <div class="wide-form-group" style="align-self: flex-end;">
                <button type="button" class="btn-icon-remove" onclick="this.closest('.document-item').remove()">
                    <i class="fas fa-times"></i>
                </button>
            </div>
        </div>
    `;
        container.appendChild(newItem);
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