<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AJOUT_AFFAIRE_AVOCAT_JUGEMENT.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.AJOUT_AFFAIRE_AVOCAT_JUGEMENT" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

     <div class="btn-group-inline">
                <asp:Button ID="BTN_RETOUR" runat="server" Text="Retour a la liste"
                    CssClass="btn-add" OnClick="BTN_RETOUR_Click"/>

               
            </div>

   <%-- <div class="wide-form-container bilingual-form">--%>
        <h2 class="wide-form-title">Ajout Jugement <span class="arabic-title">إضافة الحكم</span></h2>

        
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
                <div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Notification</span>
                    </div>
                    <div class="input-with-add">
                        <asp:CheckBox ID="Ck_NOTIFICATION" runat="server" ToolTip="Notification/إشعار"
                            CssClass="custom-checkbox" onchange="showDateNotif()" />
                        <asp:TextBox ID="TB_DATE_NOTIFICATION" runat="server" TextMode="Date"
                            CssClass="wide-form-control" Style="display: none;"></asp:TextBox>
                    </div>
                </div>

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
                     <%--<div class="wide-form-row" runat="server" id="RowScanNotification">
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
                    </div>--%>
                </div>
            </div>

            
        </div>
           
        
        <!-- Boutons -->
        <div class="wide-form-actions">
            <asp:Button ID="BTN_ENREG_JUGEMENT" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="BTN_ENREG_JUGEMENT_Click" />
            <asp:Label ID="Label2" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>
        
    

    

    

    <script type="text/javascript">
        
      
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
        
       



    </script>
</asp:Content>
