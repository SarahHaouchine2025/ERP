<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LISTE_AFFAIRE.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AFFAIRE.LISTE_AFFAIRE" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modern-container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-gavel"></i> Liste des affaires / <span class="arabic-title">قائمة القضايا</span></h2>
            <asp:Button ID="BTN_ADD_AFFAIRE" runat="server" Text="Ajouter affaire"
                CssClass="btn-add " OnClick="BTN_ADD_AFFAIRE_Click" />
        </div>

        <div class="search-panel">
    <div class="search-header">
        <h3><i class="fas fa-search"></i> Critères de recherche / <span class="arabic-title">معايير البحث</span></h3>
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
                                    <th runat="server" id="thimpact" visible="false">IMPACT FINANCIER</th>
                                    <th runat="server" id="thobjet" visible="false">OBJET</th>
                                    <th runat="server" id="thflagPaye" visible="false">FLAG PAYER</th>
                                    <th runat="server" id="th1" visible="false">FLAG REFERE</th>
                                    <th runat="server" id="th4" visible="false">ID_TRIBUNAL</th>
                                    <th runat="server" id="th5" visible="false">ID_TRIBUNAL_ADMIN</th>
                                    <th runat="server" id="th2" visible="false">ID_COURS</th>
                                    <th runat="server" id="th6" visible="false">ID_TRIBUNAL_APPEL</th>
                                    <th runat="server" id="th3" visible="false">ID_COURS_SUP</th>
                                    <th runat="server" id="th7" visible="false">ID_CONSIEL_ETAT</th>
                                    <th runat="server" id="th8" visible="false">ID_COURIER</th>
                                    <th runat="server" id="th11" visible="false">PATH_COURIER</th>
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
                        <td runat="server" id="td4" visible="false" ><%# Eval("IMPACT_FINACIER") %>'</td>
                        <td runat="server" id="td6" visible="false" ><%# Eval("OBJET") %>'</td>
                         <td runat="server" id="td7" visible="false" ><%# Eval("FLAG_PAYE") %>'</td>
                        <td runat="server" id="td11" visible="false" ><%# Eval("FLAG_REFERE") %>'</td>
                         <td runat="server" id="td3" visible="false" ><%# Eval("ID_TRIBUNAL") %>'</td>
                        <td runat="server" id="td13" visible="false" ><%# Eval("ID_TRIBUNAL_ADMIN") %>'</td>
                        <td runat="server" id="td12" visible="false" ><%# Eval("ID_COURS") %>'</td>
                        <td runat="server" id="td14" visible="false" ><%# Eval("ID_TRIBUNAL_APPEL") %>'</td>
                        <td runat="server" id="td10" visible="false" ><%# Eval("ID_COURS_SUP") %>'</td>
                        <td runat="server" id="td15" visible="false" ><%# Eval("ID_CONSIEL_ETAT") %>'</td>
                        <td runat="server" id="td16" visible="false" ><%# Eval("ID_COURIER") %>'</td>
                        <td runat="server" id="td19" visible="false" ><%# Eval("PATH_COURIER") %>'</td>
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
                                CommandName="PAYER" CommandArgument='<%# Eval("ID_AFFAIRE") %>'  >
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
                                                          + (Eval("DISPOSITIF") == DBNull.Value ? "" : Eval("DISPOSITIF")) + "\", \"" 
                                                     + (Eval("AVOCAT") == DBNull.Value ? "" : Eval("AVOCAT")) + "\", \"" 
                                                      + (Eval("NOM_JUGE") == DBNull.Value ? "" : Eval("NOM_JUGE")) + "\", \"" 
                                                         + (Eval("IMPACT_FINACIER") == DBNull.Value ? "" : HttpUtility.JavaScriptStringEncode(Eval("IMPACT_FINACIER").ToString())) + "\", \"" 
                                                          + (Eval("OBJET") == DBNull.Value ? "" : Eval("OBJET")) 
                                                         + "\"); return false;" %>'>
                                <i class="fas fa-eye"></i>
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
            <!-- Section : Parties -->
            <div class="modal-grid-2">
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

                <div class="form-group impact-financier">
                    <label>Impact Financier</label>
                    <asp:TextBox ID="TB_IMPACT" runat="server" CssClass="form-control"
                     TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                </div>
            </div>

            <!-- Section : Jugement -->
            <div class="modal-grid-3">
                <div class="form-group">
                    <label>Date Dispositif</label>
                    <asp:TextBox ID="TB_DATE_DIPOSITIF" runat="server" TextMode="Date" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Avocat</label>
                    <asp:TextBox ID="TB_AVOCAT" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Nom Juge</label>
                    <asp:TextBox ID="TB_NOM_JUGE" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                </div>
            </div>

            <!-- Section : Dispositifs -->
            <%--<div class="modal-grid-2">--%>
                <div class="form-group full-width">
                    <label>Dispositif</label>
                    <asp:TextBox ID="TB_DISPOSITIF" runat="server" TextMode="MultiLine" Rows="3" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
                </div>
               <%-- <div class="form-group">
                    <label>Dispositif Finance</label>
                    <asp:TextBox ID="TB_DISPOSITIF_FINANCE" runat="server" TextMode="MultiLine" Rows="3" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
                </div>--%>
            <%--</div>--%>

            <!-- Section : Objet -->
            <div class="form-group full-width">
                <label>Objet</label>
                <asp:TextBox ID="TB_OBJET" runat="server" TextMode="MultiLine" Rows="4" CssClass="wide-form-control" Enabled="false"></asp:TextBox>
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
        <div class="modal-body">
           
            <!-- Section : Jugement -->
            <div class="modal-grid-2">
                <div class="modal-grid-2">
                <div class="form-group">
                    <label>Date Payement</label>
                    <asp:TextBox ID="TB_DATE_PAYEMENT" runat="server" TextMode="Date" CssClass="form-control" ></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>N° Facturation</label>
                    <asp:TextBox ID="TB_NUM_FACTURATION" runat="server" CssClass="form-control" ></asp:TextBox>
                </div>
                    </div> 

                <div class="form-group">
                    <label>Scan Facturation</label>
                     <asp:FileUpload ID="FU_FAC_PAYEMENT" runat="server" CssClass="form-control form-control-sm w-75"  />
                </div>
            </div>

            
        <!-- Footer -->
        <div class="modal-footer">
            <asp:Button ID="btnPayerAffaire" runat="server" CssClass="btn btn-primary btn-sm" Text="Enregistrer"  OnClick="btnPayer_Click" />
            <button type="button" class="btn btn-cancel" onclick="closePAYAffaireModal()">Fermer</button>
            <asp:HiddenField ID="HiddenField2" runat="server" />
        </div>
    </div>
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

    function openDetailAFFAIREModalWithData(id, num_affaire, defendeur, miseencause, date_dispositif, dispo_morale,  avocat, non_juge, impact_finance, object) {
        // Remplir le formulaire avec les données existantes
        document.getElementById('<%= HF_ID_AFFAIRE.ClientID %>').value = id;
        document.getElementById('<%= TB_DEFENDEUR.ClientID %>').value = defendeur;
        document.getElementById('<%= TB_PARTIE_MISE_CAUSE.ClientID %>').value = miseencause;
        document.getElementById('<%= TB_DATE_DIPOSITIF.ClientID %>').value = date_dispositif;
        document.getElementById('<%= TB_DISPOSITIF.ClientID %>').value = dispo_morale;
        document.getElementById('<%= TB_AVOCAT.ClientID %>').value = avocat;
        document.getElementById('<%= TB_NOM_JUGE.ClientID %>').value = non_juge;
        document.getElementById('<%= TB_IMPACT.ClientID %>').value = impact_finance;
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
    }

</script>

</asp:Content>