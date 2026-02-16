<%@ Page Title="Connexion" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="URP_AADL.Login" %>

<asp:Content ID="LoginPageContent" ContentPlaceHolderID="NoNavContent" runat="server">
 

    <div class="login-container">
        <div class="login-card">
            <div class="login-header">
                <div class="login-logo">
                    <asp:Image ID="imgDrapeau" runat="server" ImageUrl="~/Images/drapeau-algerie.png" AlternateText="Drapeau Algérie" />
                    <asp:Image ID="imgLOGOaaDL" runat="server" ImageUrl="~/Images/LOGOAADL.png" AlternateText="Logo AADL" />
                </div>
                <h1 class="login-title">ERP - SD/Contentieux</h1>
            </div>
            
            <div class="login-body">
                <div class="form-group">
                    <label for="txtUsername" class="form-label">Email</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="votre@email.com" />
                    <asp:Label ID="lblUserError" runat="server" CssClass="error-message" />
                </div>
                
                <div class="form-group">
                    <label for="txtPassword" class="form-label">Mot de passe</label>
                    <div class="password-wrapper">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="••••••••" />
                        <span class="toggle-password" onclick="togglePassword()">
                            <i class="fas fa-eye"></i>
                        </span>
                    </div>
                    <asp:Label ID="lblPasswordError" runat="server" CssClass="error-message" />
                </div>
                
                <div class="form-group" style="display: none;">
                    <asp:CheckBox ID="chkRemember" runat="server" Text=" Se souvenir de moi" />
                </div>
                
                <asp:Button ID="btnLogin" runat="server" Text="Connexion" CssClass="btn-login" OnClick="btnLogin_Click" />
            </div>
            
            <div class="login-footer">
                &copy; <%: DateTime.Now.Year %> AADL Algérie - Tous droits réservés
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.querySelector('.toggle-password i');

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                passwordField.type = "password";
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    </script>
</asp:Content>