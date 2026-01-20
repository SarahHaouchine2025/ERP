<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_AFFAIRE_AVOCAT.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_AFFAIRE_AVOCAT" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modern-container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i>Liste des affaires / <span class="arabic-title"> قائمة القضايا</span></h2>

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
        

        <div class="search-group" runat="server" id="divAvocat" visible="false" >
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
                  OnSelectedIndexChanging ="LIST_AFFAIRE_SelectedIndexChanging"
                
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
                                   <%-- <th>N°Dossier</th>--%>
                                    <th>Partie</th>
                                    <th>Juridiction</th>
                                    <th>Section</th>
                                    <th>N°Affaire</th>
                                    <th>Date Audience</th>
                                    <th runat="server" id="thdefendeur" visible="false">DEFENDEUR</th>
                                    <th runat="server" id="thmise" visible="false">MISE EN CAUSE</th>
                                    <th runat="server" id="thdatedispo" visible="false">DATE DISPOSOTIF</th>
                                    <th runat="server" id="th9" visible="false">PATH_JUGEMENT</th>
                                    <th runat="server" id="thavocat" visible="false">AVOCAT</th>
                                    <th runat="server" id="thjuge" visible="false">NOM JUGE</th>
                                    <th runat="server" id="th13" visible="false">AVOCAT ADVERSAIRE</th>
                               
                                    <th runat="server" id="th1" visible="false">FLAG REFERE</th>
                                    <th runat="server" id="th4" visible="false">ID_TRIBUNAL</th>
                                    <th runat="server" id="th5" visible="false">ID_TRIBUNAL_ADMIN</th>
                                    <th runat="server" id="th2" visible="false">ID_COURS</th>
                                    <th runat="server" id="th6" visible="false">ID_TRIBUNAL_APPEL</th>
                                    <th runat="server" id="th3" visible="false">ID_COURS_SUP</th>
                                    <th runat="server" id="th7" visible="false">ID_CONSIEL_ETAT</th>
                                    <th runat="server" id="th8" visible="false">ID_COURIER</th>
                                    <th runat="server" id="thflagNOTIF" visible="false">FLAG NOTIF</th>
                                    <th runat="server" id="thdatenotif" visible="false">DATE NOTIF</th>
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
                                    ShowFirstPageButton="False"
                                    FirstPageText="« Première"
                                    ShowPreviousPageButton="True"
                                    PreviousPageText="‹"
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
                                    NextPageText="›"
                                    ShowLastPageButton="false"
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
                        
                        <%--<td><span class="badge badge-primary"><%# Eval("NUM_DOSSIER") %></span></td>--%>
                        <td><%# Eval("PARTIE") %></td>
                        <td><%# Eval("JURIDICTION") %></td>
                        <td><%# Eval("SECTION") %></td>
                        
                        <td><span class="badge badge-primary"><%# Eval("NUMERO_AFFAIRE") %></span></td>
                        <td><%# Eval("DATE_AUDIANCE", "{0:d}") %></td>

                        <td runat="server" id="tddefendeeur" visible="false" ><%# Eval("PARTIE_DEFENDEUR") %>'</td>
                        <td runat="server" id="td1" visible="false" ><%# Eval("PARTIE_MISE_EN_CAUSE") %>'</td>
                        <td runat="server" id="td_datedispo" visible="false"><%# Eval("DATE_DISPOSITIF", "{0:d}") %></td>
                         <td runat="server" id="td2" visible="false"><%# Eval("PATH_JUGEMENT") %></td>
                        <td runat="server" id="tdAvocat" visible="false"><%# Eval("AVOCAT") %></td>
                        <td runat="server" id="td21" visible="false" ><%# Eval("AVOCAT_ADVERSAIRE") %>'</td>
                        <td runat="server" id="td11" visible="false" ><%# Eval("FLAG_REFERE") %>'</td>
                         <td runat="server" id="td3" visible="false" ><%# Eval("ID_TRIBUNAL") %>'</td>
                        <td runat="server" id="td13" visible="false" ><%# Eval("ID_TRIBUNAL_ADMIN") %>'</td>
                        <td runat="server" id="td12" visible="false" ><%# Eval("ID_COURS") %>'</td>
                        <td runat="server" id="td14" visible="false" ><%# Eval("ID_TRIBUNAL_APPEL") %>'</td>
                        <td runat="server" id="td10" visible="false" ><%# Eval("ID_COURS_SUP") %>'</td>
                        <td runat="server" id="td15" visible="false" ><%# Eval("ID_CONSIEL_ETAT") %>'</td>
                        <td runat="server" id="td16" visible="false" ><%# Eval("ID_COURIER") %>'</td>
                        <td runat="server" id="td8" visible="false" ><%# Eval("FLAG_NOTIFICATION") %>'</td>
                        <td runat="server" id="td9" visible="false" ><%# Eval("DATE_NOTIFICATION", "{0:d}") %>'</td>

                        <td class="actions">
                            
                            
                            <%--<asp:LinkButton ID="btnNotifCourier" runat="server" CssClass="action-btn notif-jug-btn" Visible="false" 
                                CommandName="NotifCourier" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Aucuns couriers" OnClick="btnNotifCourier_Click" >
                                <i class="fas fa-question"  ></i>
                            </asp:LinkButton>--%>
                             <asp:LinkButton ID="btnNotifPath" runat="server" CssClass="action-btn notif-jug-btn" Visible="false" 
                                CommandName="NotifJug" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Docs non scanner" OnClick="btnNotifPathJugement_Click" >
                                <i class="fas fa-question"  ></i>
                            </asp:LinkButton>
                            
                            <asp:LinkButton ID="btnNotif" runat="server" CssClass="action-btn notif-btn" Visible="false"
                                CommandName="Notif" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Notification jugement non déclacher" OnClick="btnNotif_Click" >
                                <i class="fas fa-bell"  ></i>
                            </asp:LinkButton>

                            

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
                                    <%--<th>Modifier</th>--%>
                                    
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
        <%--<td>
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
            </div>--%>
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

    <div id="JugementAvocatModal" class="modal">
    <div class="modal-content-affaire">
        <div class="modal-header">
            <h3>
                <i class="fas fa-file-alt"></i> 
                Jugement / الحكم <asp:Label runat="server" ID="Label1" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeJugementAvocatModal()">&times;</span>
        </div>
        <div class="modal-body">
        <%--<h2 class="wide-form-title">Courier pour Direction <span class="arabic-title">رسالة إلى الإدارة</span></h2>--%>


        <!-- Espace Courier Direction  -->
        <div class="wide-form-section">
            <h5 class="wide-section-title">
                <span class="title-fr">Jugement</span>
                <span class="title-ar">الحكم</span>
            </h5>
             <div class="wide-form-row">
                
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Date Jugement</span>
                        <span class="label-ar">تاريخ الحكم</span>
                    </div>
                    <asp:TextBox ID="TB_DATE_JUGEMENT" runat="server" TextMode="Date" CssClass="wide-form-control"></asp:TextBox>
                </div>
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Nom Juge</span>
                        <span class="label-ar">اسم القاضي</span>
                    </div>
                    <asp:TextBox ID="TB_NOM_JUGE" runat="server" CssClass="wide-form-control"></asp:TextBox>
                </div>
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Avocats Adversaire</span>
                        <span class="label-ar">محامي الخصم</span>
                    </div>
                    <div class="input-with-add">
                        <asp:TextBox ID="TB_AVOCAT_ADVERSAIRE" runat="server" CssClass="wide-form-control"></asp:TextBox>
                            <button type="button" class="btn-icon-add" onclick="addAvocatAdversaire_Field()">
                            <i class="fas fa-plus"></i>
                        </button>
                            </div>
                    <div id="AvocatAdversaireContainer"></div>
                </div>
               <%-- <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Notification</span>
                    </div>
                    <div class="input-with-add">
                        <asp:CheckBox ID="Ck_NOTIFICATION" runat="server" ToolTip="Notification/إشعار"
                            CssClass="custom-checkbox" onchange="showDateNotif()" />
                        <asp:TextBox ID="TB_DATE_NOTIFICATION" runat="server" TextMode="Date"
                            CssClass="wide-form-control" Style="display: none;"></asp:TextBox>
                    </div>
                </div>--%>

            </div>
            <div class="wide-form-row">
                <div class="wide-form-group full-width">
                    <div class="dual-label-container">
                        <span class="label-fr">Dispositif</span>
                        <span class="label-ar">منطوق الحكم</span>
                    </div>
                    <asp:TextBox ID="TB_DISPOSITIF" runat="server" TextMode="MultiLine" Rows="4" CssClass="wide-form-control"></asp:TextBox>
                </div>
                
            </div>

            <div class="impact-financier-group">
                <div class="wide-form-row">
                    <!-- Colonne 1 : Impact -->
                    <div class="search-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Nature du Montant jugé</span>
                            <span class="label-ar">طبيعة المبلغ</span>
                        </div>
                        <div class="input-with-add">
                        <asp:DropDownList ID="DDL_IMPACT_FINANCIER" runat="server" CssClass="wide-form-control"></asp:DropDownList>
                            </div> 
                    </div>
                    <div class="wide-form-group" id="precisionImpactGroup" >
                    <div class="dual-label-container">
                        <span class="label-fr">Précision</span>
                        <span class="label-ar">توضيح </span>
                    </div>
                    <asp:TextBox ID="TB_PRECISION_IMPACT" runat="server" CssClass="wide-form-control"
                        placeholder="Précision / توضيح"></asp:TextBox>
                </div>

                    <!-- Colonne 2 : Montant -->
                    <div class="wide-form-group">
                        <div class="dual-label-container">
                            <span class="label-fr">Montant (DZD)</span>
                            <span class="label-ar">المبلغ</span>
                        </div>
                        <div class="input-with-add">
                        <asp:TextBox ID="TB_MONTANT_IMPACT" runat="server" CssClass="wide-form-control" TextMode="Number"></asp:TextBox>
                            <button type="button" class="btn-icon-add" onclick="addIMPACT_FINANCIER_Field()">
                            <i class="fas fa-plus"></i>
                        </button>
                            </div>
                    </div>

                    
                </div>

                <!-- Conteneur des champs dynamiques -->
                <div id="IMPACT_FINANCIER_Container"></div>
            </div>

           <div id="documentsJugementContainer">
                <div class="document-item">
                    <div class="wide-form-row" runat="server" id="RowScanJugement">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Titre jugement</span>
                                <span class="label-ar">العنوان</span>
                            </div>
                            <asp:TextBox ID="TB_TITRE_JUGEMENT" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_JUGEMENT" runat="server" CssClass="wide-form-control" />

                        </div>
                    </div>
                     <div class="wide-form-row" runat="server" id="RowScanNotification">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Titre notification</span>
                                <span class="label-ar">العنوان</span>
                            </div>
                            <asp:TextBox ID="TB_NOTIFICATION" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_NOTIFICATION" runat="server" CssClass="wide-form-control" />

                        </div>
                    </div>
                </div>
            </div>

            
        </div>
            </div>
        
        <!-- Boutons -->
        <div class="wide-form-actions">
            <asp:Button ID="BTN_ENREG_JUGEMENT" runat="server" Text="Envoyer" CssClass="wide-btn-submit"  />
            <asp:Label ID="Label2" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>
    </div>
</div>

<script>

   

    function openJugementAvocatModal() {
        // Ouvrir le modal
        document.getElementById('JugementAvocatModal').style.display = 'block';
        return false;
    }

    function closeJugementAvocatModal() {
        document.getElementById('JugementAvocatModal').style.display = 'none';
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