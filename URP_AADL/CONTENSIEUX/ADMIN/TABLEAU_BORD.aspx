<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TABLEAU_BORD.aspx.cs" Inherits="URP_AADL.CONTENSIEUX.ADMIN.TABLEAU_BORD" %>

<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">

    <div class="statistics-container">
        <header class="statistics-header">
            <h2>Tableau de bord</h2>
            <%--<p class="text-muted">Visualisation vos données </p>--%>
        </header>
        <div class="charts-grid">
            <!-- Bar Chart Card -->
            <div class="chart-card">
                <div class="chart-header">
                    <h3 class="chart-title">Bilan des Affaires par DG / DR</h3>
                    <div class="chart-controls">

                     <div class="filters-container">
                <!-- 🔹 Sélecteur de période -->
                <asp:DropDownList ID="DDL_PERIODE" runat="server" CssClass="filter-select" AutoPostBack="true" OnSelectedIndexChanged="DDL_PERIODE_SelectedIndexChanged">
                    <asp:ListItem Text="Mois courant" Value="CURRENT"></asp:ListItem>
                    <asp:ListItem Text="Mois précédent" Value="PREVIOUS"></asp:ListItem>
                    <asp:ListItem Text="Mois suivant" Value="NEXT"></asp:ListItem>
                    <asp:ListItem Text="Personnalisé" Value="CUSTOM"></asp:ListItem>
                </asp:DropDownList>

                <!-- 🔹 Sélection personnalisée de dates -->
                <asp:TextBox ID="TB_DATE_DEBUT" runat="server" CssClass="date-filter" TextMode="Date" Visible="false"></asp:TextBox>
                <asp:TextBox ID="TB_DATE_FIN" runat="server" CssClass="date-filter" TextMode="Date" Visible="false"></asp:TextBox>
                <asp:Button ID="BTN_APPLIQUER" runat="server" Text="Appliquer" CssClass="filter-btn" Visible="false" OnClick="BTN_APPLIQUER_Click" />
            </div>
                    <div class="wilaya-buttons">
                        <asp:Button ID="BTN_DG" runat="server" Text="DG" class="wilaya-btn active" OnClick="BTN_DG_Click" />
                        <asp:Button ID="BTN_ALGER_EST" runat="server" Text="DR Alger Est" class="wilaya-btn" OnClick="BTN_ALGER_EST_Click" />
                        <asp:Button ID="BTN_ALGER_OUEST" runat="server" Text="DR Alger Ouest" class="wilaya-btn" OnClick="BTN_ALGER_OUEST_Click" />
                        <asp:Button ID="BTN_ORAN" runat="server" Text="DR Oran" class="wilaya-btn" OnClick="BTN_ORAN_Click" />
                        <asp:Button ID="BTN_ANNABA" runat="server" Text="DR Annaba" class="wilaya-btn" OnClick="BTN_ANNABA_Click" />
                        <asp:Button ID="BTN_SETIF" runat="server" Text="DR Sétif" class="wilaya-btn" OnClick="BTN_SETIF_Click" />
                        <asp:Button ID="BTN_CONSTANTINE" runat="server" Text="DR Constantine" class="wilaya-btn" OnClick="BTN_CONSTANTINE_Click" />
                        <asp:Button ID="BTN_OURGLA" runat="server" Text="DR Ouargla" class="wilaya-btn" OnClick="BTN_OURGLA_Click" />
                        <asp:Button ID="BTN_TIARET" runat="server" Text="DR Tiaret" class="wilaya-btn" OnClick="BTN_TIARET_Click" />
                    </div>
                        </div> 
                </div>
                <div class="chart-wrapper">
                    <canvas id="barChart"></canvas>
                </div>
            </div>
        </div>
        <div class="charts-grid">
            <!-- Doughnut Chart Card -->
            <div class="chart-card">
                <div class="chart-wrapper">
                    <div class="chart-header">
                    <h3 class="chart-detail"><asp:Label runat="server" id="lb01" Text=""  ></asp:Label></h3>
                    
                        </div> 
                </div>
            </div>

            <!-- Doughnut Chart Card -->
            <div class="chart-card">
                <div class="chart-wrapper">
                    
                    <canvas id="doughnutChart"></canvas>
                </div>
            </div>

           
        </div>
        

        <!-- Hidden Fields pour les données -->
        <asp:HiddenField ID="AF_FAVORABLE" runat="server" />
        <asp:HiddenField ID="AF_DEFAVORABLE" runat="server" />
        <asp:HiddenField ID="AF_PENDANTE" runat="server" />
        <asp:HiddenField ID="AF_EXPERTISE" runat="server" />
        <asp:HiddenField ID="AF_TOTALE" runat="server" />
        <asp:HiddenField ID="hfDates" runat="server" />
        <asp:HiddenField ID="AF_FAVOR_DATE" runat="server" />
        <asp:HiddenField ID="AF_DEFAVOR_DATE" runat="server" />
        <asp:HiddenField ID="AF_PENDANTE_DATE" runat="server" />
        <asp:HiddenField ID="AF_EXPERTISE_DATE" runat="server" />
    </div>

   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        // ========================
        // 🔧 CONFIGURATION GLOBALE
        // ========================
        Chart.defaults.font.family = "'Segoe UI', system-ui, -apple-system, sans-serif";
        Chart.defaults.color = '#6c757d';
        Chart.defaults.borderColor = 'rgba(0, 0, 0, 0.05)';

        // ==============================
        // 📊 DOUGHNUT CHART (RÉPARTITION)
        // ==============================
        const favorable = parseInt('<%= AF_FAVORABLE.Value %>') || 0;
        const defavorable = parseInt('<%= AF_DEFAVORABLE.Value %>') || 0;
        const pendante = parseInt('<%= AF_PENDANTE.Value %>') || 0;
        const expertise = parseInt('<%= AF_EXPERTISE.Value %>') || 0;

        console.log("Valeurs Doughnut :", { favorable, defavorable, pendante, expertise });

        new Chart(document.getElementById('doughnutChart'), {
            type: 'doughnut',
            data: {
                labels: ['Favorable', 'Défavorable', 'Pendante', 'Expertise'],
                datasets: [{
                    data: [favorable, defavorable, pendante, expertise],
                    backgroundColor: ['#4CAF50', '#F44336', '#FF9800', '#2196F3'],
                    borderWidth: 0,
                    hoverOffset: 10
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '70%',
                plugins: {
                    title: {
                        display: true,
                        text: 'Nombre des affaires par Observation',
                        font: { size: 18, weight: 'bold' }
                    },
                    legend: {
                        position: 'bottom',
                        labels: {
                            padding: 20,
                            usePointStyle: true,
                            pointStyle: 'circle'
                        }
                    },
                    tooltip: {
                        backgroundColor: 'rgba(0,0,0,0.8)',
                        titleFont: { size: 14 },
                        bodyFont: { size: 12 },
                        padding: 12,
                        cornerRadius: 8
                    }
                },
                animation: {
                    animateScale: true,
                    animateRotate: true
                }
            }
        });

        // ===================================
        // 📅 BAR CHART (ÉVOLUTION PAR JOUR)
        // ===================================
        

        // =====================
        // 🔹 Chargement du graphique
        // =====================
        const labels = JSON.parse('<%= hfDates.Value %>');
    const AF_FAVOR_DATE = JSON.parse('<%= AF_FAVOR_DATE.Value %>');
    const AF_DEFAVOR_DATE = JSON.parse('<%= AF_DEFAVOR_DATE.Value %>');
    const AF_PENAL_DATE = JSON.parse('<%= AF_PENDANTE_DATE.Value %>');
    const AF_EXPERTISE_DATE = JSON.parse('<%= AF_EXPERTISE_DATE.Value %>');
    
    console.log("Labels et datasets Bar :", { labels, AF_FAVOR_DATE, AF_DEFAVOR_DATE, AF_PENAL_DATE, AF_EXPERTISE_DATE });

    new Chart(document.getElementById('barChart'), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'En Faveur',
                    data: AF_FAVOR_DATE,
                    backgroundColor: '#4CAF50',
                    borderRadius: 6,
                    borderSkipped: false
                },
                {
                    label: 'En Défaveur',
                    data: AF_DEFAVOR_DATE,
                    backgroundColor: '#F44336',
                    borderRadius: 6,
                    borderSkipped: false
                },
                {
                    label: 'Pendante',
                    data: AF_PENAL_DATE,
                    backgroundColor: '#FF9800',
                    borderRadius: 6,
                    borderSkipped: false
                },
                {
                    label: 'Expertise',
                    data: AF_EXPERTISE_DATE,
                    backgroundColor: '#2196F3',
                    borderRadius: 6,
                    borderSkipped: false
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                //title: {
                //    display: true,
                //    text: 'Bilan des Affaires par DG / DR',
                //    font: { size: 18, weight: 'bold' }
                //},
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 15,
                        usePointStyle: true,
                        pointStyle: 'circle',
                        font: { size: 13 }
                    }
                },
                tooltip: {
                    mode: 'index',
                    intersect: false,
                    backgroundColor: 'rgba(0,0,0,0.8)',
                    titleFont: { size: 14 },
                    bodyFont: { size: 12 },
                    padding: 12,
                    cornerRadius: 8
                }
            },
            scales: {
                x: {
                    grid: { display: false, drawBorder: false },
                    ticks: { maxRotation: 45, minRotation: 45, font: { size: 12 }, color: '#555' }
                },
                y: {
                    beginAtZero: true,
                    grid: { drawBorder: false, color: 'rgba(0, 0, 0, 0.05)' },
                    ticks: { stepSize: 1, font: { size: 12 }, color: '#555' }
                }
            },
            interaction: { mode: 'nearest', axis: 'x', intersect: false },
            animation: { duration: 1000, easing: 'easeOutQuart' }
        }
    });

        
    });

   
</script>

</asp:Content>

