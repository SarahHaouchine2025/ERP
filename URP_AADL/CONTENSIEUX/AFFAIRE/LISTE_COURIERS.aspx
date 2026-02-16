<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_COURIERS.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_COURIERS" %>
<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

     <div class="modern-container">
        
    <div class="wide-form-container bilingual-form">
        <h2 class="wide-form-title">Liste Couriers  <span class="arabic-title">قائمة المراسلات الرسمية </span></h2>

         <div class="btn-group-inline">
                <asp:Button ID="BTN_ADD_COURIER" runat="server" Text="Envoyer courier"
                    CssClass="btn-add" OnClick="BTN_ADD_COURIER_Click" />
            </div>
        <!-- Espace Courier Direction  -->
        <div class="data-section">
              
       <%--     <asp:ListView ID="LIST_CORRIER"
    runat="server"
    DataKeyNames="ID_COURIER"
    ItemPlaceholderID="ItemPlaceHolder"
    AllowPaging="True"
    OnPagePropertiesChanging="LIST_CORRIER_PagePropertiesChanging">

    <LayoutTemplate>
        <div class="table-responsive">
            <table class="modern-data-table">
                <thead>
                    <tr>
                        <th>Numéro Affaire</th>
                        <th>Direction</th>
                        <th>Titre</th>
                        <th>Courier</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:PlaceHolder runat="server" ID="ItemPlaceHolder" />
                </tbody>
            </table>
        </div>

        <div class="pagination-container">
            <asp:DataPager ID="DataPager1" runat="server" PageSize="10">
                <Fields>
                    <asp:NumericPagerField ButtonCount="5" />
                </Fields>
            </asp:DataPager>
        </div>
    </LayoutTemplate>

    <ItemTemplate>
        <tr>
            <td><%# Eval("NUMERO_AFFAIRE") %></td>
            <td><%# Eval("DIRECTION") %></td>
            <td><%# Eval("TITRE_COURIER") %></td>
            <td><%# Eval("DESCRIPTION_COURIER") %></td>
            <td>
                <asp:Button ID="BTN_REPONDRE"
                    runat="server"
                    Text="Répondre"
                    CommandArgument='<%# Eval("ID_COURIER") %>'
                    OnClick="BTN_REPONDRE_Click" />
            </td>
        </tr>
    </ItemTemplate>

    <EmptyDataTemplate>
        <tr>
            <td colspan="5" style="text-align:center;">
                Aucune donnée.
            </td>
        </tr>
    </EmptyDataTemplate>

</asp:ListView>--%>

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
                                   <th>Numéro Affaire</th>
                        <th>Direction</th>
                        <th>Titre</th>
                        <th>Courier</th>
                                    
                                    
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
                        
                        <td><span class="badge badge-primary"><%# Eval("NUMERO_AFFAIRE") %></span></td>
                        <td><%# Eval("DIRECTION") %></td>
                        <td><%# Eval("TITRE_COURIER") %></td>
                        <td><%# Eval("DESCRIPTION_COURIER") %></td>
                        
                        

                        <td class="actions">
                            
                            <asp:LinkButton ID="BTN_REPONDRE" runat="server" CssClass="action-btn edit-btn"
                                CommandName="Edit" CommandArgument='<%# Eval("ID_COURIER") %>' ToolTip="Modifier cette affaire"  OnClick="BTN_REPONDRE_Click" >  <%--OnClick="btnEdit_Click"--%>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                           

                            <asp:LinkButton ID="BTN_DOC_SCANER" runat="server" CssClass="action-btn doc-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_COURIER") %>' ToolTip="Document Scanner" 
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
                        <i class="fas fa-info-circle"></i> Aucune d trouvée avec ces critères de recherche.
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
            



        </div>

        
        <!-- Boutons -->
        <%--<div class="wide-form-actions">
            <asp:Button ID="btnSubmit" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>--%>
    </div>
         </div>
    <div id="CourierDirectionModal" class="modal">
    <div class="modal-content-affaire">
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Courier pour Direction <asp:Label runat="server" ID="LB_NUM_AFFAIRE_DOC" Text=""></asp:Label>
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
            <div class="wide-form-row">
                <div class="search-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Direction</span>
                        <span class="label-ar">الإدارة</span>
                    </div>
                    <div class="input-with-add">
                    <asp:DropDownList ID="DDL_DIRECTION" runat="server" CssClass="wide-form-control">
                        <asp:ListItem Text="------" Value="" Selected="True" />
                        
                    </asp:DropDownList>
                    </div>
                </div>
                

                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Numéro Affaire</span>
                        <span class="label-ar">تاريخ التأسيس</span>
                    </div>
                    <asp:TextBox ID="TB_NUM_AFFAIRE" runat="server" CssClass="wide-form-control"></asp:TextBox>
                </div>

                

            </div>
            <div class="wide-form-row">
                <div class="wide-form-group full-width">
                    <div class="dual-label-container">
                        <span class="label-fr">Courier</span>
                        <span class="label-ar">رسالة</span>
                    </div>
                    <asp:TextBox ID="TB_COURIER" runat="server" TextMode="MultiLine" Rows="3" CssClass="wide-form-control"></asp:TextBox>
                </div>
            </div>

           <div id="documentsContainer">
    <div class="document-item">
        <div class="wide-form-row">

            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Titre Document</span>
                    <span class="label-ar">اسم الوثيقة</span>
                </div>
                <input type="text" name="TB_NOM_DOCUMENT" class="wide-form-control" />
            </div>

            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Pièce jointe </span>
                    <span class="label-ar">المرفق</span>
                </div>
                <input type="file" name="FU_AUTRE_DOC_" class="wide-form-control" />
            </div>

            <div class="wide-form-group" style="align-self:flex-end;">
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

    <div id="DOCAffaireModal" class="modal">
    <div class="modal-content-affaire">
        <!-- Header -->
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Documents Affaire N° <asp:Label runat="server" ID="Label1" Text=""></asp:Label>
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

    <script>
        function openDOCAFFAIREModal(num_affaire) {

            document.getElementById('<%= LB_NUM_AFFAIRE_DOC.ClientID %>').innerText = num_affaire;
            // Ouvrir le modal
            document.getElementById('DOCAffaireModal').style.display = 'block';
            return false;
        }
        function closeDOCAffaireModal() {
            document.getElementById('DOCAffaireModal').style.display = 'none';
        }

        function openCourierDirectionModal() {
            // Ouvrir le modal
            document.getElementById('CourierDirectionModal').style.display = 'block';
            return false;
        }

        function closeCourierDirectionModal() {
            document.getElementById('CourierDirectionModal').style.display = 'none';
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

    </script>
    
</asp:Content>