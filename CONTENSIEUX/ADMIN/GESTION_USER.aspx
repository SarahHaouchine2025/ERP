<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GESTION_USER.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.ADMIN.GESTION_USER" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="page-header">
            <h2 class="page-title"><i class="fas fa-users-cog"></i> Gestion des utilisateurs</h2>
            <button type="button" Class="btn-add"  onclick="openUserModal()">
    <i class="fas fa-user-plus"></i> Ajouter utilisateur
</button>
        </div>

              <!-- Zone de recherche -->
        <div class="search-panel">
        <div class="search-filter-panel">
            <div class="search-header">
                <h3><i class="fas fa-search"></i> Rechercher utilisateurs</h3>
            </div>
            <div class="search-grid">
                <div class="search-group">
                    <label for="TB_SEARCH_NOM">Nom et Prénom</label>
                    <asp:TextBox ID="TB_SEARCH_NOM" runat="server" CssClass="form-control"
                        placeholder="Rechercher par nom"></asp:TextBox>
                </div>
                
                <%--<div class="search-group">
                    <label for="TB_SEARCH_PRENOM">Prénom</label>
                    <asp:TextBox ID="TB_SEARCH_PRENOM" runat="server" CssClass="form-control"
                        placeholder="Rechercher par prénom"></asp:TextBox>
                </div>--%>

                <%--<div class="search-group">
                    <label for="TB_DDN">Date de naissance</label>
                    <asp:TextBox ID="TB_SEARCHE_DDN" runat="server" CssClass="form-control"
                        placeholder="Rechercher par date de naissance"></asp:TextBox>
                </div>--%>

                <div class="search-group"  >
                    <label for="DDL_DR">DR</label>
                    <asp:DropDownList ID="DDL_DR" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                        
                    </asp:DropDownList>
                </div>

                <div class="search-group">
                    <label for="DDL_SEARCH_CNV">Profil</label>
                    <asp:DropDownList ID="DDL_PROFIL" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="Directeur">Directeur</asp:ListItem>
                        <asp:ListItem Value="Sous Directeur">Sous Directeur</asp:ListItem>
                        <asp:ListItem Value="Juriste">Juriste</asp:ListItem>
                        <asp:ListItem Value="Agent de saisie">Agent de saisie</asp:ListItem>
                    </asp:DropDownList>
                </div>
                
                <div class="search-group">
                    <label for="DDL_SEARCH_CNV">Active</label>
                    <asp:DropDownList ID="DDL_SEARCH_CNV" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                        <asp:ListItem Value="true">Activer</asp:ListItem>
                        <asp:ListItem Value="false">Désactiver</asp:ListItem>
                    </asp:DropDownList>
                </div>


                
                <div class="search-group">
                    <label>&nbsp;</label>
                    <asp:Button ID="BTN_SEARCH" runat="server" Text="Rechercher" 
                        CssClass="btn-primary" OnClick="BTN_SEARCH_Click" />
                    <%--<asp:Button ID="BTN_RESET_SEARCH" runat="server" Text="Réinitialiser" 
                        CssClass="btn-secondary" OnClick="BTN_RESET_SEARCH_Click" />--%>
                </div>
            </div>
        </div>

        
         
        </div>

        


        


         <div class="data-section">
            <asp:ListView ID="LIST_OV" runat="server" DataKeyNames="ID_USER" OnItemEditing="LIST_OV_ItemEditing" OnItemUpdating="LIST_OV_ItemUpdating" OnItemCanceling="LIST_OV_ItemCanceling" GroupPlaceholderID="groupPlaceHolder1"  ItemPlaceholderID="itemPlaceHolder1" AllowPaging="True"  OnPagePropertiesChanging="LIST_OV_PagePropertiesChanging">

    <LayoutTemplate>
        <div class="table-responsive">
                        <table class="modern-data-table">
                <thead>
                    <tr>
                        <th class="status-filter-header" style="text-align: left; padding-left: 5px;">
                            <label class="switch-container" >
                                <asp:CheckBox ID="chkToggle" runat="server"
                                    CssClass="status-switch"
                                    AutoPostBack="true"
                                    OnCheckedChanged="StatusFilter_Changed" ToolTip="Conecter" />
                                <span class="slider round"></span>
                            </label>
                        </th>
                        <th>DR</th>
                        <th>Nom</th>
                        <th>Prénom</th>
                        <th>Date de naissance</th>
                        <th>Email</th>
                        <th>Mot de passe</th>
                        <th>Profil</th>
                        <th>Active</th>
                        
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
             <td><span class="status-dot <%# GetStatusClass_CONNECTER((bool)Eval("FLAG_CONNECTER")) %>">
                <asp:Label ID="FLAG_CONNECTER" runat="server"  /></span></td>
            <td><asp:Label ID="DR" runat="server" Text='<%# Eval("DR") %>' CssClass="table-data" /></td>
            <td><asp:Label ID="USER_NOM" runat="server" Text='<%# Eval("USER_NOM") %>' CssClass="table-data" /></td>
            <td><asp:Label ID="USER_PRENOM" runat="server" Text='<%# Eval("USER_PRENOM") %>' CssClass="table-data" /></td>
            <td><asp:Label ID="USER_DDN" runat="server" Text='<%# Eval("USER_DDN", "{0:d}") %>' CssClass="table-data" /></td>
            <td>
                <asp:Label ID="USER_NAME" runat="server" Text='<%# Eval("USER_NAME") %>' CssClass="table-data email" /></td>
            <%--<td>
                <asp:Label ID="PASSWORD" runat="server" Text='<%# Eval("PASSWORD") %>' CssClass="table-data password" /></td>--%>
            <td>
                            <div class="password-field">
                                <span class="password-dots">••••••••</span>
                                <button class="show-password-btn" type="button" onclick="togglePassword(this)">
                                    <i class="fas fa-eye"></i>
                                </button>
                                <span class="actual-password" style="display:none;"><%# Eval("PASSWORD") %></span>
                            </div>
                        </td>
            <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("PROFIL") %>' CssClass="table-data" /></td>

             <td><span class="status-badge <%# GetStatusClass((bool)Eval("FLAG_ACTIVE")) %>">
                <asp:Label ID="FLAG_ACTIVE" runat="server" Text='<%# Eval("FLAG_ACTIVE") %>'  /></span></td>

           
            <td class="action-cell">
                <asp:LinkButton ID="btnEdit" runat="server" CssClass="action-btn edit-btn"
                    CommandName="Update" CommandArgument='<%# Eval("ID_USER") %>' OnClientClick='<%# "openUserModalWithData(\"" + Eval("ID_USER") + "\", \"" + Eval("USER_NOM") + "\", \"" + Eval("USER_PRENOM") + "\", \"" + Eval("USER_NAME") + "\", \"" + Eval("PROFIL") + "\", \"" + Eval("PASSWORD") + "\", \"" + Eval("FLAG_ACTIVE") + "\", \"" + Eval("DR") + "\", \"" + Eval("USER_DDN", "{0:yyyy-MM-dd}") + "\"); return false;"%>'
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

        
    </div>

 
<!-- Modal -->
<%--<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">--%>
    <div id="addUserModal" class="modal">
      
    <%--<div class="modal-dialog modal-lg" role="document">--%>
        <div class="modal-content">
           <%-- <div class="modal-header">
                <h5 class="modal-title" id="addUserModalLabel"><i class="fas fa-user-plus"></i> Ajouter un utilisateur</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>--%>
            <div class="modal-header">
            <h3><i class="fas fa-user-plus"></i> Ajouter un utilisateur</h3>
            <span class="close" onclick="closeUserModal()">&times;</span>
        </div>
            
            <div class="modal-body">
                <div class="search-grid">
                    <!-- Row 1 -->
                    <div class="search-group">
                        <label for="TB_NOM">Nom</label>
                        <asp:TextBox ID="TB_NOM" runat="server" CssClass="form-control"
                            placeholder="Saisir le nom"></asp:TextBox>
                    </div>

                    <div class="search-group">
                        <label for="TB_PRENOM">Prénom</label>
                        <asp:TextBox ID="TB_PRENOM" runat="server" CssClass="form-control"
                            placeholder="Saisir le prénom"></asp:TextBox>
                    </div>

                    <div class="search-group">
                        <label for="TB_DDN">Date de naissance</label>
                        <asp:TextBox ID="TB_DDN" runat="server" TextMode="Date"  
                            CssClass="form-control"></asp:TextBox>
                    </div>
                    
                    <!-- Row 2 -->
                    <div class="search-group">
                        <label for="TB_EMAIL">Email</label>
                        <asp:TextBox ID="TB_EMAIL" runat="server" CssClass="form-control" 
                            placeholder="email@exemple.com"></asp:TextBox>
                        <small id="emailError" class="error-message"></small>
                    </div>
                    
                    <div class="search-group">
                        <label for="TB_MOT_PASS">Mot de passe</label>
                        <asp:TextBox ID="TB_MOT_PASS" runat="server" CssClass="form-control"
                            placeholder="Mot de passe" TextMode="Password"></asp:TextBox>
                        <small id="passwordError" class="error-message"></small>
                    </div>
                    <div class="search-group checkbox-group">
                        <label for="Ck_ACTIVE">Profil</label>
                        <asp:DropDownList ID="DDL_PROFIL_AJOUT" runat="server" CssClass="form-control">
                            <asp:ListItem Value="">Tous</asp:ListItem>
                        <asp:ListItem Value="Admin">Admin</asp:ListItem>
                        <asp:ListItem Value="Directeur">Directeur</asp:ListItem>
                        <asp:ListItem Value="Sous Directeur">Sous Directeur</asp:ListItem>
                        <asp:ListItem Value="Juriste">Juriste</asp:ListItem>
                        <asp:ListItem Value="Agent de saisie">Agent de saisie</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="search-group"  >
                    <label for="DDL_DR">DR</label>
                    <asp:DropDownList ID="DDL_DR_INSERT" runat="server" CssClass="form-control">
                        <asp:ListItem Value="">Tous</asp:ListItem>
                        
                    </asp:DropDownList>
                </div>

                    <div class="search-group checkbox-group">
                        <label for="Ck_ACTIVE">Actif</label>
                        <div class="checkbox-container">
                            <asp:CheckBox ID="Ck_ACTIVE" runat="server" CssClass="custom-checkbox" />
                            <span class="checkmark"></span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="modal-footer">
                <asp:Button ID="BTN_AJOUTER" runat="server" Text="Ajouter utilisateur"
                    CssClass="btn btn-primary" OnClick="BTN_AJOUTER_Click" OnClientClick="return validateLoginForm();" />
                <asp:Button ID="BTN_MODIFIER" runat="server" Text="Modifier" CssClass="btn btn-primary" 
    style="display:none;" OnClick="BTN_MODIFIER_Click" />
                <asp:Button ID="BTN_RENISIALISER" runat="server" Text="Réinitialiser"
                    CssClass="btn btn-secondary" OnClick="BTN_RENISIALISER_Click" />
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                <asp:HiddenField ID="HF_ID_USER" runat="server" />
            </div>
        </div>
   <%-- </div>--%>
</div>
   <script type="text/javascript">

       function openUserModal() {
           // Réinitialiser le formulaire pour une nouvelle entrée
           document.getElementById('<%= HF_ID_USER.ClientID %>').value = '';
            document.getElementById('<%= TB_NOM.ClientID %>').value = '';
        document.getElementById('<%= TB_PRENOM.ClientID %>').value = '';
        document.getElementById('<%= TB_EMAIL.ClientID %>').value = '';
        document.getElementById('<%= TB_MOT_PASS.ClientID %>').value = '';
       document.getElementById('<%= Ck_ACTIVE.ClientID %>').checked = false;
       document.getElementById('<%= TB_DDN.ClientID %>').value = '';

       // Afficher le bouton Ajouter et cacher Modifier
       document.getElementById('<%= BTN_AJOUTER.ClientID %>').style.display = 'inline-block';
       document.getElementById('<%= BTN_MODIFIER.ClientID %>').style.display = 'none';

       // Ouvrir le modal
       document.getElementById('addUserModal').style.display = 'block';
       return false;
       }

       function openUserModalWithData(id, nom, prenom, email, profil, pwd, active,dr, ddn) {
           // Remplir le formulaire avec les données existantes
           document.getElementById('<%= HF_ID_USER.ClientID %>').value = id;
        document.getElementById('<%= TB_NOM.ClientID %>').value = nom;
        document.getElementById('<%= TB_PRENOM.ClientID %>').value = prenom;
        document.getElementById('<%= TB_EMAIL.ClientID %>').value = email;
        document.getElementById('<%= TB_MOT_PASS.ClientID %>').value = pwd;
       document.getElementById('<%= Ck_ACTIVE.ClientID %>').checked = (active === 'True');
       document.getElementById('<%= TB_DDN.ClientID %>').value = ddn;
       setDDLByText('<%= DDL_DR_INSERT.ClientID %>', dr);
       setDDLByText('<%= DDL_PROFIL_AJOUT.ClientID %>', profil);

       // Cacher le bouton Ajouter et afficher Modifier
       document.getElementById('<%= BTN_AJOUTER.ClientID %>').style.display = 'none';
       document.getElementById('<%= BTN_MODIFIER.ClientID %>').style.display = 'inline-block';

       // Ouvrir le modal
       document.getElementById('addUserModal').style.display = 'block';
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

       function closeUserModal() {
           document.getElementById('addUserModal').style.display = 'none';
       }

       // Fermer la modal en cliquant en dehors
       window.onclick = function (event) {
           const modal = document.getElementById('addUserModal');
           if (event.target == modal) {
               closeUserModal();
           }
       }


    // Fonction de validation
    function validateLoginForm() {
        // Code de la fonction ci-dessus
    }

    // Optionnel : Validation en temps réel
    document.getElementById('<%= TB_EMAIL.ClientID %>').addEventListener('blur', function() {
        validateEmail(this.value);
    });

    document.getElementById('<%= TB_MOT_PASS.ClientID %>').addEventListener('blur', function() {
        validatePassword(this.value);
    });
       // Password visibility toggle
       function togglePassword(button) {
           var container = button.parentElement;
           var dots = container.querySelector('.password-dots');
           var actualPassword = container.querySelector('.actual-password');

           if (dots.style.display === 'none') {
               dots.style.display = 'inline';
               actualPassword.style.display = 'none';
               button.innerHTML = '<i class="fas fa-eye"></i>';
           } else {
               dots.style.display = 'none';
               actualPassword.style.display = 'inline';
               button.innerHTML = '<i class="fas fa-eye-slash"></i>';
           }
       }
    function validateEmail(email) {
        var errorElement = document.getElementById('emailError');
        if (email === '') {
            errorElement.textContent = '';
        } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
            errorElement.textContent = 'Email invalide';
        } else {
            errorElement.textContent = '';
        }
    }

    function validatePassword(password) {
        var errorElement = document.getElementById('passwordError');
        if (password === '') {
            errorElement.textContent = '';
        } else if (password.length < 8) {
            errorElement.textContent = 'Trop court (min 8 caractères)';
        } else {
            errorElement.textContent = '';
        }
    }
</script>
</asp:Content>

