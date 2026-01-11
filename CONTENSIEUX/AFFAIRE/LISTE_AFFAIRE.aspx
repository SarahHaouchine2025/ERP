<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_AFFAIRE.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_AFFAIRE" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modern-container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i>Liste des affaires / <span class="arabic-title">قائمة القضايا</span></h2>

            <div class="btn-group-inline">
                <asp:Button ID="BTN_ADD_AFFAIRE" runat="server" Text="Ajouter affaire"
                    CssClass="btn-add" OnClick="BTN_ADD_AFFAIRE_Click" />

                <asp:Button ID="BTN_ADD_AFFAIRE_DR" runat="server" Text="Ajouter affaire DR"
                    CssClass="btn-add" OnClick="BTN_ADD_AFFAIRE_DR_Click" Visible="false" />
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

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Nature</span><span class="label-ar">طبيعة</span>
            </div>
            <asp:DropDownList ID="DDL_NATURE" runat="server" CssClass="form-control">
                <asp:ListItem Text="------" Value="" Selected="True" />
            </asp:DropDownList>
        </div>

         

        <!-- Ligne 2 -->
        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Observation</span><span class="label-ar">ملاحظة</span>
            </div>
            <asp:DropDownList ID="DDL_OBSERVATION" runat="server" CssClass="form-control">
                <asp:ListItem Text="------" Value="" Selected="True" />
                <asp:ListItem Text="En faveur" Value="En faveur" />
                <asp:ListItem Text="En défaveur" Value="En défaveur" />
                <asp:ListItem Text="Pendante" Value="Pendante" />
            </asp:DropDownList>
        </div>

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
            <div class="dual-label-container">
                <span class="label-fr">Jugement</span><span class="label-ar">الحكم</span>
            </div>
            <asp:DropDownList ID="DDL_JUGEMENT" runat="server" CssClass="form-control">
                <asp:ListItem Text="------" Value="" Selected="True" />
                <asp:ListItem Text="Oui" Value="true" />
                <asp:ListItem Text="Non" Value="false" />
            </asp:DropDownList>
        </div>
        

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Notification</span><span class="label-ar">تنبيه</span>
            </div>
            <asp:DropDownList ID="DLL_NOTIFICATION" runat="server" CssClass="form-control tb-small">
                <asp:ListItem Text="------" Value="" Selected="True" />
                <asp:ListItem Text="Oui" Value="true" />
                <asp:ListItem Text="Non" Value="false" />
            </asp:DropDownList>
        </div>
       <div class="search-group" >
            <div class="dual-label-container">
                <span class="label-fr">Audience : Du</span>
            </div>
            <div class="input-with-add">
                <asp:TextBox ID="TB_DATE_AUDIANCE_DEB" runat="server" TextMode="Date" CssClass="form-control tb-small"></asp:TextBox>
                <%--<asp:TextBox ID="TB_DATE_AUDIANCE_FIN" runat="server" TextMode="Date" CssClass="form-control tb-small"></asp:TextBox>--%>
            </div>
        </div>
        <div class="search-group" >
            <div class="dual-label-container">
                <span class="label-fr">Au</span><span class="label-ar">تاريخ الجلسة</span>
            </div>
                <asp:TextBox ID="TB_DATE_AUDIANCE_FIN" runat="server" TextMode="Date" CssClass="form-control tb-small"></asp:TextBox>
           
        </div>

        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Constitution : Du</span>
            </div>
            <div class="input-with-add">
                <asp:TextBox ID="TB_DATE_D_CONSTI" runat="server" TextMode="Date" CssClass="form-control tb-small"></asp:TextBox>
                
            </div>
        </div>
        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Au</span><span class="label-ar">تاريخ التأسيس</span>
            </div>
            <div class="input-with-add">
                <asp:TextBox ID="TB_DATE_F_CONSTI" runat="server" TextMode="Date" CssClass="form-control tb-small"></asp:TextBox>
            </div>
        </div>
        <div class="search-group">
            <div class="dual-label-container">
                <span class="label-fr">Impact </span><span class="label-ar">الأثر المالي</span>
            </div>
            <asp:DropDownList ID="DDL_IMPACT_FINANCIER" runat="server" CssClass="form-control tb-small">
                <asp:ListItem Text="------" Value="" Selected="True" />
               <%-- <asp:ListItem Text="Dommages et intérêts" Value="Dommage et intérèt" />
                <asp:ListItem Text="Astreinte journalière" Value="Astreinte journalière" />
                <asp:ListItem Text="Liquidation d'astreinte" Value="Liquidation d'astreinte" />
                <asp:ListItem Text="Paiement des situations" Value="Paiement des situations" />--%>
            </asp:DropDownList>
        </div>
        <div class="search-group">
                    <div class="dual-label-container">
                <span class="label-fr">D.Régionale </span><span class="label-ar">مديرية جهوية</span>
            </div>
            <div class="dropdown-checkbox">

                                    <!-- Bouton dropdown -->
                                    <asp:LinkButton ID="btnDr" runat="server"
                                        CssClass="ddl-checkbox-btn"
                                        OnClientClick="toggleObsDDL(); return false;">
                                        ---/---
                                    </asp:LinkButton>

                                    <!-- Contenu dropdown -->
                                    <asp:Panel ID="pnlDR" runat="server"
                                        CssClass="ddl-checkbox-panel">

                                        <asp:CheckBoxList ID="chkDr" runat="server"
                                            CssClass="ddl-checkbox-list"
                                            RepeatDirection="Vertical"
                                            onchange="updateObsText()">
                                        </asp:CheckBoxList>

                                    </asp:Panel>
                                </div>
                    <%--<asp:DropDownList ID="DDL_DR" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                    </asp:DropDownList>--%>
                </div>


        <div class="search-group" runat="server" visible="false" id="div_User">
                    <div class="dual-label-container">
                <span class="label-fr">Utilisateur </span><span class="label-ar">مستخدم</span>
            </div>
                    <asp:DropDownList ID="DDL_USER" runat="server" CssClass="form-control">
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
                                    <th>Date Audience</th>
                                    <th>Date Constitution</th>
                                    <th>Nature</th>
                                    <th>Observation</th>
                                    <th runat="server" id="thdefendeur" visible="false">DEFENDEUR</th>
                                    <th runat="server" id="thmise" visible="false">MISE EN CAUSE</th>
                                    <th runat="server" id="thdatedispo" visible="false">DATE DISPOSOTIF</th>
                                    <th runat="server" id="thmoral" visible="false">DISPOSITIF</th>
                                    <th runat="server" id="thavocat" visible="false">AVOCAT</th>
                                    <th runat="server" id="thjuge" visible="false">NOM JUGE</th>
                                    <th runat="server" id="th13" visible="false">AVOCAT ADVERSAIRE</th>
                                    <th runat="server" id="th12" visible="false">IMPACT FINANCIER Demander</th>
                                    <th runat="server" id="thimpact" visible="false">IMPACT FINANCIER Juger</th>
                                    <th runat="server" id="thobjet" visible="false">OBJET</th>
                                    <th runat="server" id="thflagPaye" visible="false">FLAG PAYER</th>
                                    <th runat="server" id="th1" visible="false">FLAG REFERE</th>
                                    <th runat="server" id="th4" visible="false">ID_TRIBUNAL</th>
                                    <th runat="server" id="th5" visible="false">ID_TRIBUNAL_ADMIN</th>
                                    <th runat="server" id="th2" visible="false">ID_COURS</th>
                                    <th runat="server" id="th6" visible="false">ID_TRIBUNAL_APPEL</th>
                                    <th runat="server" id="th3" visible="false">ID_COURS_SUP</th>
                                    <th runat="server" id="th7" visible="false">ID_CONSIEL_ETAT</th>
                                    <%--<th runat="server" id="th8" visible="false">ID_COURIER</th>
                                    <th runat="server" id="th11" visible="false">PATH_COURIER</th>--%>
                                    <th runat="server" id="th9" visible="false">ID_JUGEMENT</th>
                                    <th runat="server" id="th10" visible="false">PATH_JUGEMENT</th>
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
                                    ShowFirstPageButton="false"
                                    FirstPageText=""
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
                                    ShowLastPageButton="False"
                                    LastPageText=""
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
                        <td><%# Eval("DATE_AUDIANCE", "{0:d}") %></td>
                        <td><%# Eval("DATE_CONSTITUTION", "{0:d}") %></td>
                        <td><%# Eval("NATURE") %></td>
                        <td><%# Eval("OBSERVATION") %></td>

                        <td runat="server" id="tddefendeeur" visible="false" ><%# Eval("PARTIE_DEFENDEUR") %>'</td>
                        <td runat="server" id="td1" visible="false" ><%# Eval("PARTIE_MISE_EN_CAUSE") %>'</td>
                        <td runat="server" id="td_datedispo" visible="false"><%# Eval("DATE_DISPOSITIF", "{0:d}") %></td>
                        <td runat="server" id="td2" visible="false" ><%# Eval("DISPOSITIF") %>'</td>
                        <td runat="server" id="tdAvocat" visible="false"><%# Eval("AVOCAT") %></td>
                        <td runat="server" id="td5" visible="false" ><%# Eval("NOM_JUGE") %>'</td>
                        <td runat="server" id="td21" visible="false" ><%# Eval("AVOCAT_ADVERSAIRE") %>'</td>
                        <td runat="server" id="td20" visible="false" ><%# Eval("IMPACT_FINACIER_DEMANDER") %>'</td>
                        <td runat="server" id="td4" visible="false" ><%# Eval("IMPACT_FINACIER_JUGER") %>'</td>
                        <td runat="server" id="td6" visible="false" ><%# Eval("OBJET") %>'</td>
                         <td runat="server" id="td7" visible="false" ><%# Eval("FLAG_PAYE") %>'</td>
                        <td runat="server" id="td11" visible="false" ><%# Eval("FLAG_REFERE") %>'</td>
                         <td runat="server" id="td3" visible="false" ><%# Eval("ID_TRIBUNAL") %>'</td>
                        <td runat="server" id="td13" visible="false" ><%# Eval("ID_TRIBUNAL_ADMIN") %>'</td>
                        <td runat="server" id="td12" visible="false" ><%# Eval("ID_COURS") %>'</td>
                        <td runat="server" id="td14" visible="false" ><%# Eval("ID_TRIBUNAL_APPEL") %>'</td>
                        <td runat="server" id="td10" visible="false" ><%# Eval("ID_COURS_SUP") %>'</td>
                        <td runat="server" id="td15" visible="false" ><%# Eval("ID_CONSIEL_ETAT") %>'</td>
                        <%--<td runat="server" id="td16" visible="false" ><%# Eval("ID_COURIER") %>'</td>
                        <td runat="server" id="td19" visible="false" ><%# Eval("PATH_COURIER") %>'</td>--%>
                        <td runat="server" id="td17" visible="false" ><%# Eval("ID_JUGEMENT") %>'</td>
                        <td runat="server" id="td18" visible="false" ><%# Eval("PATH_JUGEMENT") %>'</td>
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
                            <asp:LinkButton ID="btnPayer" runat="server" CssClass="action-btn payy-btn"
                                CommandName="PAYER" CommandArgument='<%# Eval("ID_AFFAIRE") %>' OnClick="btnPayer_Click1">
                                <i class="fas fa-dollar-sign"  ></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnEdit" runat="server" CssClass="action-btn edit-btn"
                                CommandName="Edit" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Modifier cette affaire" >  <%--OnClick="btnEdit_Click"--%>
                                <i class="fas fa-edit"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDetails" runat="server" CssClass="action-btn view-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Voir détails" 
                                OnClientClick='<%# "openDetailAFFAIREModalWithData(\"" 
                                                    + (Eval("ID_AFFAIRE") == DBNull.Value ? "" : Eval("ID_AFFAIRE")) + "\", \"" 
                                                     + (Eval("NUMERO_AFFAIRE") == DBNull.Value ? "" : Eval("NUMERO_AFFAIRE")) + "\", \"" 
                                                     + (Eval("PARTIE_DEFENDEUR") == DBNull.Value ? "" : Eval("PARTIE_DEFENDEUR")) + "\", \"" 
                                                     + (Eval("PARTIE_MISE_EN_CAUSE") == DBNull.Value ? "" : Eval("PARTIE_MISE_EN_CAUSE")) + "\", \"" 
                                                       + (Eval("DATE_DISPOSITIF") == DBNull.Value ? "" : String.Format("{0:yyyy-MM-dd}", Eval("DATE_DISPOSITIF"))) + "\", \"" 
                                                        + (Eval("DATE_ENVOI") == DBNull.Value ? "" : String.Format("{0:yyyy-MM-dd}", Eval("DATE_ENVOI"))) + "\", \"" 
                                                          + (Eval("DISPOSITIF") == DBNull.Value ? "" : Eval("DISPOSITIF")) + "\", \"" 
                                                     + (Eval("AVOCAT") == DBNull.Value ? "" : Eval("AVOCAT")) + "\", \"" 
                                                      + (Eval("NOM_JUGE") == DBNull.Value ? "" : Eval("NOM_JUGE")) + "\", \"" 
                                                      + (Eval("AVOCAT_ADVERSAIRE") == DBNull.Value ? "" : Eval("AVOCAT_ADVERSAIRE")) + "\", \"" 
                                                      + (Eval("IMPACT_FINACIER_DEMANDER") == DBNull.Value ? "" : HttpUtility.JavaScriptStringEncode(Eval("IMPACT_FINACIER_DEMANDER").ToString())) + "\", \""
                                                         + (Eval("IMPACT_FINACIER_JUGER") == DBNull.Value ? "" : HttpUtility.JavaScriptStringEncode(Eval("IMPACT_FINACIER_JUGER").ToString())) + "\", \"" 
                                                         + (Eval("FRAIS_EXECUTION") == DBNull.Value ? "" : HttpUtility.JavaScriptStringEncode(Eval("FRAIS_EXECUTION").ToString())) + "\", \"" 
                                                          + (Eval("OBJET") == DBNull.Value ? "" : Eval("OBJET")) 
                                                         + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="BTN_DOC_SCANER" runat="server" CssClass="action-btn doc-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Document Scanner" OnClick="BTN_DOC_SCANER_Click" 
                                >
                                <i class="fas fa-folder-open"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="BTN_ENVOYER_COURIER" runat="server" CssClass="action-btn courier-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Envoyer un courier" OnClick="BTN_ENVOYER_COURIER_Click" 
                                >
                                <i class="fas fa-envelope"></i>
                            </asp:LinkButton>

                            <asp:LinkButton ID="BTN_CR_AFFAIRE" runat="server" CssClass="action-btn rapport-btn"
                                CommandName="Select" CommandArgument='<%# Eval("ID_AFFAIRE") %>' ToolTip="Rapport d'affaire" OnClick="BTN_CR_AFFAIRE_Click"
                                >
                                <i class="fas fa-file-contract"></i>
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


        <div class="modal-footer">
               <div class="search-actions">
                   <asp:Button ID="BTN_RECAP_LISTE_AFFAIRE" runat="server" Text="Liste Affaire" OnClick="BTN_RECAP_LISTE_AFFAIRE_Click" 
                        CssClass="btn-secondary"  />
                    <asp:Button ID="BTN_RECAP_BILAN" runat="server" Text="Récap Bilan"  OnClick="BTN_RECAP_BILAN_Click"
                        CssClass="btn-secondary"  />
                    <asp:Button ID="BTN_IMPACT_FINANCIER" runat="server" Text="Impact Financier" OnClick="BTN_IMPACT_FINANCIER_Click" 
                        CssClass="btn-secondary" />
                   <asp:Button ID="BTN_BILAN_DGDR" runat="server" Text="Bilan DG + REG" OnClick="BTN_BILAN_DGDR_Click"
                        CssClass="btn-secondary" />
                   <asp:Button ID="BTN_BILAN_PAR_NATURE" runat="server" Text="Bilan Par Nature" OnClick="BTN_BILAN_PAR_NATURE_Click" 
                        CssClass="btn-secondary" />
                </div>
                
            </div>
    </div>   

    <div id="DetailAffaireModal" class="modal">
    <div class="modal-content-affaire">
        <!-- Header -->
        <div class="modal-header">
            <h3>
                <i class="fas fa-info-circle"></i> 
                Détail Affaire N° <asp:Label runat="server" ID="LB_NUM_AFFAIRE" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closeDetailAffaireModal()">&times;</span>
        </div>

        <!-- Body -->
        <div class="modal-body">

    <!-- Ligne 1 : Défendeur / Partie mise en cause / Avocat / Impact Financier Demandé -->
    <div class="modal-grid-2">
        <div class="form-group">
            <label>Défendeur</label>
            <asp:TextBox ID="TB_DEFENDEUR" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Partie mise en cause</label>
            <asp:TextBox ID="TB_PARTIE_MISE_CAUSE" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>
        </div>
            <div class="modal-grid-2">
        <div class="form-group">
            <label>Avocat</label>
            <asp:TextBox ID="TB_AVOCAT" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>

        <div class="form-group impact-financier">
            <label>Impact Financier Demandé</label>
            <asp:TextBox ID="TB_IMPACT_DEMANDER" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>
    </div>

    <!-- Ligne 2 : Objet -->
    <div class="form-group full-width">
        <label>Demandes de fond</label>
        <asp:TextBox ID="TB_OBJET" runat="server" TextMode="MultiLine" Rows="4"
            CssClass="wide-form-control" Enabled="false"></asp:TextBox>
    </div>

    <!-- Ligne 3 : Date dispositif / Nom juge -->
    <div class="modal-grid-2">
        <div class="form-group">
            <label>Date Dispositif</label>
            <asp:TextBox ID="TB_DATE_DIPOSITIF" runat="server" TextMode="Date"
                CssClass="form-control" Enabled="false"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Nom Juge</label>
            <asp:TextBox ID="TB_NOM_JUGE" runat="server" CssClass="form-control"
                Enabled="false"></asp:TextBox>
        </div>
    </div>
            <div class="form-group full-width">
        <label>Date Renvoi</label>
        <asp:TextBox ID="TB_DATE_RENVOIE" runat="server" TextMode="MultiLine"
            Rows="2" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
    </div>

    <!-- Ligne 4 : Avocat adversaire / Impact Financier Jugé -->
    <div class="modal-grid-2">
        <div class="form-group">
            <label>Avocat Adversaire</label>
            <asp:TextBox ID="TB_AVOCAT_ADVERSAIRE" runat="server"
                CssClass="form-control" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>

        <div class="form-group impact-financier">
            <label>Impact Financier Jugé</label>
            <asp:TextBox ID="TB_IMPACT_JUGER" runat="server" CssClass="form-control"
                TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
        </div>
    </div>

    <!-- Ligne 5 : Dispositif (full width) -->
    <div class="form-group full-width">
        <label>Dispositif</label>
        <asp:TextBox ID="TB_DISPOSITIF" runat="server" TextMode="MultiLine"
            Rows="3" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
    </div>
            <div class="form-group full-width">
        <label>Frais Execution</label>
        <asp:TextBox ID="TB_FRAIS_EXECUTION" runat="server" TextMode="MultiLine"
            Rows="2" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
    </div>

</div>

        <!-- Footer -->
        <div class="modal-footer">
            <button type="button" class="btn btn-cancel" onclick="closeDetailAffaireModal()">Fermer</button>
            <asp:HiddenField ID="HF_ID_AFFAIRE" runat="server" />
        </div>
    </div>
</div>


    <div id="PAyementModal" class="modal">
    <div class="modal-content-affaire">
        <!-- Header -->
        <div class="modal-header">
            <h3>
                <i class="fas fa-credit-card"></i> 
                Payement Affaire N° <asp:Label runat="server" ID="LB_NUM_AFFAIRE_PAY" Text=""></asp:Label>
            </h3>
            <span class="close" onclick="closePAYAffaireModal()">&times;</span>
        </div>

        <!-- Body -->
         <div class="tab-container">

            <!-- Onglets -->
            <div class="tabs">
                <div id="tab_1" class="tab active" onclick="openTab(1)">Paiement Avocat</div>
                <div id="tab_2" class="tab" onclick="openTab(2)">Paiement Affaire</div>
            </div>
             <div id="content_1" class="tab-content active">
                 <div class="modal-body">

                     <%--<div class="modal-grid-3" runat="server" id="PAYEMENT_EFFACTUER">
                         <h2>
                            
                             <asp:Label runat="server" ID="LB_PAYEMENT_EFFACTUER" Text=""></asp:Label>
                         </h2>
                     </div>--%>
                     <div class="modal-grid-3" runat="server" id="partiePaiement">
                         <div class="form-group">
                             <label>Cause d'absence de paiement</label>
                             <asp:DropDownList ID="DDL_CND_NON_PAYER" runat="server" CssClass="form-control" ClientIDMode="Static">
                                 <asp:ListItem Value="">Aucun / لا شيء</asp:ListItem>
                                 <asp:ListItem Value="Radier">Radier / الشطب</asp:ListItem>
                                     <asp:ListItem Value="Gratuit">Gratuit / مجانية</asp:ListItem>
                                     <asp:ListItem Value="Non Suivie">Non Suivie / غير متابَعة</asp:ListItem>
                                </asp:DropDownList>
                             </div>
                         <div class="modal-grid-2">
                             <div class="form-group">
                                 <label>Date Payement</label>
                                 <asp:TextBox ID="TB_DATE_PAYEMENT" runat="server" TextMode="Date" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                             </div>
                             <div class="form-group">
                                 <label>N° Facturation</label>
                                 <asp:TextBox ID="TB_NUM_FACTURATION" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                             </div>
                         </div>

                         <div class="form-group">
                             <label>Scan Facturation</label>
                             <asp:FileUpload ID="FU_FAC_PAYEMENT" runat="server" CssClass="form-control form-control-sm w-75" ClientIDMode="Static" />
                         </div>
                     </div>


                     <!-- Footer -->
                     <div class="modal-footer">
                         <asp:Button ID="btnPayerAffaire" runat="server" CssClass="btn btn-primary btn-sm" Text="Enregistrer" OnClick="btnPayer_Click" />
                         <button type="button" class="btn btn-cancel" onclick="closePAYAffaireModal()">Fermer</button>
                         <asp:HiddenField ID="HiddenField2" runat="server" />
                     </div>
                 </div>
             </div>
             <div id="content_2" class="tab-content">
                 <div class="data-section">
                <asp:ListView ID="LV_MNT" runat="server"
                            DataKeyNames="ID_AFFAIRE"
                            GroupPlaceholderID="groupPlaceHolder1"
                            ItemPlaceholderID="itemPlaceHolder1"
                            AllowPaging="True"
                            OnPagePropertiesChanging="LV_MNT_PagePropertiesChanging">
                    <LayoutTemplate>
                        <div class="table-responsive">
                            <table class="modern-data-table">
                                <thead>
                                    <tr>
                                        <th>Type Paiement</th>
                                        <th>Nature Montant</th>
                                        <th>Montant</th>
                                        <th>Précision</th>
                                        <th runat="server" id="th14" visible="false">NUM_AFFAIRE</th>
                                        <th runat="server" id="th1" visible="false">ID</th>
                                        <%--<th width="120">Actions</th>--%>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:PlaceHolder runat="server" ID="groupPlaceHolder1" />
                                </tbody>
                            </table>
                        </div>

                        <div class="pagination-container">
                            <asp:DataPager ID="DataPager1" runat="server"
                                PagedControlID="LV_MNT"
                                PageSize="5"
                                QueryStringField="page">
                                <Fields>
                                    <asp:NextPreviousPagerField
                                        ButtonType="Link"
                                        
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
                                        NextPreviousButtonCssClass="pager-button" />

                                    <asp:NextPreviousPagerField
                                        ButtonType="Link"
                                        ShowFirstPageButton="False"
                                        ShowPreviousPageButton="False"
                                        ShowNextPageButton="True"
                                        NextPageText=" ›"
                                       
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
                            <td>
                                <asp:Label ID="NOM_AVOCAT" runat="server" Text='<%# Eval("TYPE_PAIEMENT") %> ' CssClass="table-data" /></td>
                            <td>
                                <asp:Label ID="PRENOM_AVOCAT" runat="server" Text='<%# Eval("NATURE_MNT") %>' CssClass="table-data" /></td>
                            <td>
                                <asp:Label ID="NOM_DR" runat="server" Text='<%# Eval("MONTANT") %> ' CssClass="table-data" /></td>
                            
                            <td>
                                <asp:Label ID="Label8" runat="server" Text='<%# Eval("PRECISION_MNT") %>' CssClass="table-data" /></td>
                            
                            <td runat="server" id="td22" visible="false">
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("ID_AFFAIRE") %>' CssClass="table-data" /></td>
                            <td runat="server" id="td23" visible="false">
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("NUMERO_AFFAIRE") %>' CssClass="table-data" /></td>
                            
                           
                        </tr>
                    </ItemTemplate>

                    <EmptyDataTemplate>
                        <div class="empty-message">
                            Aucune donnée disponible.
                        </div>
                    </EmptyDataTemplate>
                </asp:ListView>
                
                <div class="modal-grid-3" runat="server" id="Div1">
                         
                         <div class="modal-grid-2">
                             <div class="form-group">
                                 <label>Date Payement</label>
                                 <asp:TextBox ID="DATE_PAIEMENT_AFF" runat="server" TextMode="Date" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                             </div>
                             <div class="form-group">
                                 <label>N° Facturation</label>
                                 <asp:TextBox ID="NUM_FACTURATION_AFF" runat="server" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                             </div>
                         </div>

                         <div class="form-group">
                             <label>Scan Facturation</label>
                             <asp:FileUpload ID="FU_PAIEMENT_AFF" runat="server" CssClass="form-control form-control-sm w-75" ClientIDMode="Static" />
                         </div>
                     </div>


                     <!-- Footer -->
                     <div class="modal-footer">
                         <asp:Button ID="BTN_PAYER_AFF" runat="server" CssClass="btn btn-primary btn-sm" Text="Payer" OnClick="BTN_PAYER_AFF_Click" />
                         <button type="button" class="btn btn-cancel" onclick="closePAYAffaireModal()">Fermer</button>
                         <asp:HiddenField ID="HiddenField3" runat="server" />
                     </div>
            </div>
             </div>

         </div>
        <asp:HiddenField ID="HF_ACTIVE_TAB" runat="server" />

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
                    Courier Direction pour l'affaire : 
                    <asp:Label runat="server" ID="LB_AFFAIRE_COURIER" Text=""></asp:Label>
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
                                    <asp:TextBox ID="TB_NOM_DOCUMENT" runat="server" CssClass="wide-form-control"></asp:TextBox>
                                </div>

                                <div class="wide-form-group">
                                    <div class="dual-label-container">
                                        <span class="label-fr">Pièce jointe </span>
                                        <span class="label-ar">المرفق</span>
                                    </div>
                                    <asp:FileUpload ID="FU_AUTRE_DOC_" runat="server" CssClass="wide-form-control" />
                                </div>

                                <div class="wide-form-group" style="align-self: flex-end;" runat="server" visible="false" >
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
                <asp:Button ID="BTN_ENREG_COURIER" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="BTN_ENREG_COURIER_Click" />
                <asp:Label ID="Label2" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
            </div>
        </div>
    </div>

    <div id="CRAffaireModal" class="modal">
        <div class="modal-content-affaire">
            <div class="modal-header">
                <h3>
                    <i class="fas fa-file-alt"></i>
                    Rapport de l'affaire : 
                    <asp:Label runat="server" ID="LB_AFFAIRE_CR" Text=""></asp:Label>
                </h3>
                <span class="close" onclick="closeCRAffaireModal()">&times;</span>
            </div>
            <div class="modal-body">
                <%--<h2 class="wide-form-title">Courier pour Direction <span class="arabic-title">رسالة إلى الإدارة</span></h2>--%>


                <!-- Espace Courier Direction  -->
                <div class="wide-form-section">
                    <h5 class="wide-section-title">
                        <span class="title-fr">Critères du Rapport</span>
                        <span class="title-ar">تفاصيل التقرير</span>
                    </h5>
                    <div class="wide-form-row">
    <div class="criteria-card">


        <div class="criteria-grid-fixed">

            <!-- Colonne 1 -->
            <div class="criteria-group">
                <h5>Affaire</h5>
                <asp:CheckBox ID="CB_NUM_DOSSIER" runat="server" Text=" Numéro dossier" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CB_NUM_AFFAIRE" runat="server" Text=" Numéro affaire" CssClass="criteria-checkbox" />
            </div>

            <!-- Colonne 2 -->
            <div class="criteria-group">
                <h5>Parties</h5>
                <asp:CheckBox ID="CR_PARTIE" runat="server" Text=" Demandeur" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_PARTIE_DEFENDEUR" runat="server" Text=" Défendeur" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_PARTIE_MISE_EN_CAUSE" runat="server" Text=" Mise en cause" CssClass="criteria-checkbox" />
            </div>

            <!-- Colonne 3 -->
            <div class="criteria-group">
                <h5>Juridique</h5>
                <asp:CheckBox ID="CR_JURIDICTION" runat="server" Text=" Juridiction" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_SECTION" runat="server" Text=" Section" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_REFERE_" runat="server" Text=" Référé" CssClass="criteria-checkbox" />
            </div>

            <!-- Ligne suivante -->
            <div class="criteria-group">
                <h5>Dates</h5>
                <asp:CheckBox ID="CR_DATE_AUDIANCE" runat="server" Text=" Date audience" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_DATE_CONSTITUTION" runat="server" Text=" Date constitution" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_DATE_RENVOIE" runat="server" Text=" Date Renvoi" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_DATE_NOTIFICATION" runat="server" Text=" Date Notification" CssClass="criteria-checkbox" />
            </div>

            <div class="criteria-group">
                <h5>Détail Affaires</h5>
                <asp:CheckBox ID="CR_NATURE" runat="server" Text=" Nature" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_OBS" runat="server" Text=" Observation" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_MOTIF_DATE_RENVOIE" runat="server" Text=" Motif date renvoie" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_DEMANDE_AFFAIRE" runat="server" Text=" Demandes de fond" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_MNT_DEMANDER" runat="server" Text=" Montant demandé" CssClass="criteria-checkbox" />
            </div>

            <div class="criteria-group">
                <h5>Jugement</h5>
                <asp:CheckBox ID="CR_AVOCAT" runat="server" Text=" Avocat" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_AVOCAT_AD" runat="server" Text=" Avocat Adversaire" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_JUGMENT" runat="server" Text=" Jugement" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_JUGMENT_FINAL" runat="server" Text=" Jugement Final" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_MONTANT_JUGER" runat="server" Text=" Montan jugé" CssClass="criteria-checkbox" />
                <asp:CheckBox ID="CR_FAIRS_EXC" runat="server" Text=" Frais d'execution" CssClass="criteria-checkbox" />
            </div>

        </div>
    </div>
</div>



                    </div>
                
                <div class="wide-form-actions">
                <asp:Button ID="BTN_RAPPORT" runat="server" Text="Télécharger" CssClass="wide-btn-submit"  OnClick="BTN_RAPPORT_Click"  />
                <asp:Label ID="Label4" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
            </div>
                    

                </div>
            </div>

            <!-- Boutons -->
            
        </div>



<script>
    function toggleObsDDL() {
        const panel = document.getElementById('<%= pnlDR.ClientID %>');
        panel.style.display = panel.style.display === 'block' ? 'none' : 'block';
    }

    function updateObsText() {
        const checks = document.querySelectorAll(
        '#<%= chkDr.ClientID %> input:checked'
        );

        const btn = document.getElementById('<%= btnDr.ClientID %>');

        if (checks.length === 0) {
            btn.innerText = "--- / ----";
        } else if (checks.length <= 2) {
            let txt = [];
            checks.forEach(c => txt.push(c.nextSibling.textContent.trim()));
            btn.innerText = txt.join(", ");
        } else {
            btn.innerText = checks.length + " observations sélectionnées";
        }
    }

    // Fermer si clic extérieur
    document.addEventListener("click", function (e) {
        if (!e.target.closest(".dropdown-checkbox")) {
            document.getElementById('<%= pnlDR.ClientID %>').style.display = "none";
        }
    });


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



    function openCRAffaireModal() {
        // Ouvrir le modal
        document.getElementById('CRAffaireModal').style.display = 'block';
        return false;
    }

    function closeCRAffaireModal() {
        document.getElementById('CRAffaireModal').style.display = 'none';
    }

    function openCourierDirectionModal() {
        // Ouvrir le modal
        document.getElementById('CourierDirectionModal').style.display = 'block';
        return false;
    }

    function closeCourierDirectionModal() {
        document.getElementById('CourierDirectionModal').style.display = 'none';
    }

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

    function openTab(tabId) {

        // mémoriser l'onglet actif
        document.getElementById('<%= HF_ACTIVE_TAB.ClientID %>').value = tabId;

        var tabs = document.getElementsByClassName("tab");
        var contents = document.getElementsByClassName("tab-content");

        for (var i = 0; i < tabs.length; i++) {
            tabs[i].classList.remove("active");
            contents[i].classList.remove("active");
        }

        document.getElementById("tab_" + tabId).classList.add("active");
        document.getElementById("content_" + tabId).classList.add("active");
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

    function openDetailAFFAIREModalWithData(id, num_affaire, defendeur, miseencause, date_dispositif, date_envoi, dispo_morale, avocat, non_juge, avocat_adversaire, impact_finance_demander, impact_finance_juger, frais_execution, object) {
        // Remplir le formulaire avec les données existantes
        document.getElementById('<%= HF_ID_AFFAIRE.ClientID %>').value = id;
        document.getElementById('<%= TB_DEFENDEUR.ClientID %>').value = defendeur;
        document.getElementById('<%= TB_PARTIE_MISE_CAUSE.ClientID %>').value = miseencause;
        document.getElementById('<%= TB_DATE_DIPOSITIF.ClientID %>').value = date_dispositif;
        document.getElementById('<%= TB_DISPOSITIF.ClientID %>').value = dispo_morale;
        document.getElementById('<%= TB_DATE_RENVOIE.ClientID %>').value = date_envoi;
        document.getElementById('<%= TB_AVOCAT.ClientID %>').value = avocat;
        document.getElementById('<%= TB_NOM_JUGE.ClientID %>').value = non_juge;
        document.getElementById('<%= TB_AVOCAT_ADVERSAIRE.ClientID %>').value = avocat_adversaire;
        document.getElementById('<%= TB_IMPACT_DEMANDER.ClientID %>').value = impact_finance_demander;
        document.getElementById('<%= TB_IMPACT_JUGER.ClientID %>').value = impact_finance_juger;
        document.getElementById('<%= TB_FRAIS_EXECUTION.ClientID %>').value = frais_execution;
        document.getElementById('<%= TB_OBJET.ClientID %>').value = object;
        document.getElementById('<%= LB_NUM_AFFAIRE.ClientID %>').innerText = num_affaire;

    // Ouvrir le modal
        document.getElementById('DetailAffaireModal').style.display = 'block';
    return false;
    }

    function openDetailAFFAIREModal() {
    // Ouvrir le modal
        document.getElementById('DetailAffaireModal').style.display = 'block';
    return false;
    }

    function openDOCAFFAIREModal(num_affaire) {

        document.getElementById('<%= LB_NUM_AFFAIRE_DOC.ClientID %>').innerText = num_affaire;
        // Ouvrir le modal
        document.getElementById('DOCAffaireModal').style.display = 'block';
        return false;
    }

    function closeDetailAffaireModal() {
        document.getElementById('DetailAffaireModal').style.display = 'none';
    }

    function openPAYAFFAIREModal() {
        // Ouvrir le modal
        document.getElementById('PAyementModal').style.display = 'block';
        return false;
    }

    function closePAYAffaireModal() {
        document.getElementById('PAyementModal').style.display = 'none';
    }

    // Fermer la modal en cliquant en dehors
    window.onclick = function (event) {
        const modal = document.getElementById('DetailAffaireModal');
        if (event.target == modal) {
            closeDetailAffaireModal();
        }
    }

    function closeDOCAffaireModal() {
        document.getElementById('DOCAffaireModal').style.display = 'none';
    }

    // Fermer la modal en cliquant en dehors
    window.onclick = function (event) {
        const modal = document.getElementById('DOCAffaireModal');
        if (event.target == modal) {
            closeDOCAffaireModal();
        }

        var ddl = document.getElementById("DDL_CND_NON_PAYER");
        ddl.addEventListener("change", togglePayementFields);

        // Initialiser l'état au chargement
        togglePayementFields();
    }

</script>

</asp:Content>