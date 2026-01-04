<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ESPACE_COURIER_DIRECTION.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.ESPACE_COURIER_DIRECTION" %>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">



    <div class="wide-form-container bilingual-form">
        <h2 class="wide-form-title">Courier pour Direction <span class="arabic-title">رسالة إلى الإدارة</span></h2>


        


        <!-- Espace Courier Direction  -->
        <div class="wide-form-section">
            <h5 class="wide-section-title">
                <span class="title-fr">Détails courier</span>
                <span class="title-ar">تفاصيل الصفقة</span>
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
                

                <%--<div class="wide-form-group">
                    <div class="dual-label-container">
                        <span class="label-fr">Date de reception</span>
                        <span class="label-ar">تاريخ التأسيس</span>
                    </div>
                    <asp:TextBox ID="TB_DATE_CONSTITUTION" runat="server" TextMode="Date" CssClass="wide-form-control"></asp:TextBox>
                </div>--%>

                

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

           <%--<div id="documentsContainer">
                <div class="document-item">--%>
                    <div class="wide-form-row">
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Titre Document</span>
                                <span class="label-ar">اسم الوتيقة</span>
                            </div>
                            <asp:TextBox ID="TB_NOM_DOCUMENT_1" runat="server" CssClass="wide-form-control"></asp:TextBox>
                        </div>
                        <div class="wide-form-group">
                            <div class="dual-label-container">
                                <span class="label-fr">Pièce jointe</span>
                                <span class="label-ar">المرفق </span>
                            </div>
                            <asp:FileUpload ID="FU_AUTRE_DOC" runat="server" CssClass="wide-form-control" />

                        </div>
                        <div class="wide-form-group" style="align-self: flex-end;">
                            <button type="button" class="btn-icon-add" onclick="addOtherDocField()">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                <%--</div>
            </div>--%>
            
        </div>

        
        <!-- Boutons -->
        <div class="wide-form-actions">
            <asp:Button ID="btnSubmit" runat="server" Text="Envoyer" CssClass="wide-btn-submit" OnClick="btnSubmit_Click" />
            <asp:Label ID="lblStatus" runat="server" Visible="false" CssClass="wide-status-message"></asp:Label>
        </div>
    </div>

    <script>
        function addOtherDocField() {
            otherDocCount++;
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
                <input type="text" id="TB_NOM_DOCUMENT_${otherDocCount}" 
                       name="TB_NOM_DOCUMENT_${otherDocCount}" 
                       class="wide-form-control" />
            </div>
            <div class="wide-form-group">
                <div class="dual-label-container">
                    <span class="label-fr">Pièce jointe (Max 5 Mo)</span>
                    <span class="label-ar">المرفق</span>
                </div>
                <input type="file" id="fileUpload_${otherDocCount}" 
                       name="fileUpload_${otherDocCount}" 
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
