using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

using System.Linq;
using System.Web;
using System.IO;
using DAL;
using URP_AADL.GLOBALE;


namespace URP_AADL.GLOBALE
{
    public static class fcts
    {
        public static string ConnectionStr = ConfigurationManager.ConnectionStrings["URP_AADLConnectionString"].ConnectionString;


        

        public static void Add_DDL_item(ref DropDownList DDL, string textfield, string valuefield)
        {
            try
            {
                ListItem item = new ListItem();
                item.Text = textfield;
                item.Value = valuefield;
                DDL.Items.Insert(0, item);
                DDL.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                // Cette procédure insère un item en premier
                // Le code commenté en VB.NET n'a pas été traduit car il était inactif
            }
        }

        public static void Add_DDL_item(ref DropDownList DDL, string textfield, string valuefield, int position)
        {
            try
            {
                ListItem item = new ListItem();
                item.Text = textfield;
                item.Value = valuefield;
                DDL.Items.Insert(position, item);
                DDL.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                // Gestion d'exception vide comme dans le code original
            }
        }

        public static void ShowErrorMessage(Page page, string message)
        {
            if (page == null)
                throw new ArgumentNullException(nameof(page));

            // Échapper les apostrophes pour JavaScript
            string escapedMessage = message.Replace("'", "\\'");

            // Enregistrer le script pour afficher l'alerte
            ScriptManager.RegisterStartupScript(
                page,
                page.GetType(),
                "showError",
                $"alert('{escapedMessage}');",
                true
            );
        }


        //public static void AutoComplete_F(TextBox TB_Recherche, string FonctionSQL, string colonne_label, string colonne_id = "")
        //{
        //    if (TB_Recherche == null || string.IsNullOrEmpty(FonctionSQL) || string.IsNullOrEmpty(colonne_label))
        //        return;

        //    try
        //    {
        //        colonne_id = string.IsNullOrEmpty(colonne_id) ? colonne_label : colonne_id;

        //        TB_Recherche.Attributes["autocomplete"] = "off";
        //        fcts.AddCssClass(TB_Recherche, "autocomplete-f");
        //        TB_Recherche.Attributes["ff"] = FonctionSQL;
        //        TB_Recherche.Attributes["cc"] = colonne_label;
        //        TB_Recherche.Attributes["dd"] = colonne_id;

        //        if (TB_Recherche.AutoPostBack || TB_Recherche.Attributes["postback"] != null)
        //        {
        //            TB_Recherche.Attributes["postback"] = "true";
        //            TB_Recherche.AutoPostBack = false;
        //        }
        //    }
        //    catch
        //    {
        //        // Log l'erreur si nécessaire
        //    }
        //}

        public static void AutoComplete_F(TextBox TB_Recherche, string FonctionSQL, string colonne_label, string colonne_id = "")
        {
            if (TB_Recherche == null || string.IsNullOrEmpty(FonctionSQL) || string.IsNullOrEmpty(colonne_label))
                return;

            try
            {
                colonne_id = string.IsNullOrEmpty(colonne_id) ? colonne_label : colonne_id;

                TB_Recherche.Attributes["autocomplete"] = "off";
                AddCssClass(TB_Recherche, "autocomplete-f");

                // Script pour initialiser l'autocomplétion
                string script = $@"
        $(function() {{
            $('#{TB_Recherche.ClientID}').autocomplete({{
                source: function(request, response) {{
                    $.ajax({{
                        url: 'VotrePageDeService.asmx/{FonctionSQL}',
                        data: {{ term: request.term }},
                        type: 'POST',
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function(data) {{
                            response($.map(data.d, function(item) {{
                                return {{
                                    label: item.{colonne_label},
                                    value: item.{colonne_id},
                                    id: item.{colonne_id}
                                }};
                            }}));
                        }},
                        error: function(xhr, status, error) {{
                            console.error(error);
                        }}
                    }});
                }},
                minLength: 2,
                select: function(event, ui) {{
                    $(this).val(ui.item.label);
                    // Stocker aussi l'ID dans un champ caché si nécessaire
                    $(this).data('selected-id', ui.item.id);
                    return false;
                }}
            }}).focus(function() {{
                $(this).autocomplete('search');
            }});
        }});";

                ScriptManager.RegisterStartupScript(TB_Recherche.Page, TB_Recherche.GetType(),
                    $"autocomplete_{TB_Recherche.ClientID}", script, true);
            }
            catch (Exception ex)
            {
                // Loguer l'erreur
                System.Diagnostics.Debug.WriteLine(ex.Message);
            }
        }

        public static void AddCssClass(WebControl c, string className)
        {
            if (string.IsNullOrEmpty(className)) return;

            try
            {
                if (string.IsNullOrEmpty(c.CssClass))
                {
                    c.CssClass = className;
                }
                else if (!c.CssClass.Contains(className))
                {
                    c.CssClass += " " + className;
                }
            }
            catch
            {
                // Gestion silencieuse
            }
        }

        public static void OpenWindowPDF(string report_name, object ds,
                                 string[] nom_params, object[] val_params,
                                 bool download_window = false)
        {
            try
            {
                System.Web.UI.Page p = (System.Web.UI.Page)System.Web.HttpContext.Current.Handler;

               

                string filenameOut = ImprimerPDF_Export_To_Disk(p,
                                    report_name,
                                    ds,
                                    nom_params,
                                    val_params,
                                    download_window);

                string url = p.Server.MapPath("/URP_AADL/PDF/DOC/" + filenameOut);
                string url2 = "~/../../../PDF/DOC/" + filenameOut;

                string relativeUrl = "~/PDF/DOC/" + filenameOut;
                string absoluteUrl = p.ResolveClientUrl(relativeUrl);
                Open_Window_Popup(ref p, absoluteUrl);  
                //Open_Window_Popup(ref p, "~/../../../PDF/DOC/" + filenameOut);

                // Thread.Sleep(11);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        public static string ImprimerPDF_Export_To_Disk(Page pago, string report_name, object ds,
                                                    string[] nom_params, object[] val_params,
                                                    bool download_window = false)
        {
            try
            {
                ReportDocument report = new ReportDocument();
                string fullPath = pago.Server.MapPath("~/REPORTS/" + report_name);
                report.Load(pago.Server.MapPath("~/REPORTS/" + report_name));
                report.SetDataSource(ds);

                // ----------------------------------------------------------------------------------------------
                if (nom_params != null && val_params != null)
                {
                    for (int i = 0; i < nom_params.Length; i++)
                    {
                        try
                        {
                            report.SetParameterValue(nom_params[i], val_params[i]);
                        }
                        catch (Exception ex)
                        {
                            throw;
                        }
                    }
                }
                // ----------------------------------------------------------------------------------------------
                Guid id = Guid.NewGuid();
                string fileOutPdf = id.ToString().Replace("-", "") + DateTime.Now.Ticks + ".pdf";
                string myExportFile = pago.Server.MapPath("~/PDF/DOC/") + fileOutPdf;

                report.ExportToDisk(ExportFormatType.PortableDocFormat, myExportFile);

                // Nettoyage
                report.Close();
                report.Dispose();

                return fileOutPdf;
            }
            catch (Exception)
            {
                throw;
            }
        }

        public static void Open_Window_Popup(ref Page MyPage, string MyURL)
        {
            try
            {
                // Exemple d'appel : Utils.Open_Window_Popup(this, "page.aspx");

                ScriptManager.RegisterStartupScript(
                    MyPage,
                    MyPage.GetType(),
                    Guid.NewGuid().ToString(),
                    "var WindowPopupID = window.open('" + MyURL +
                    "', '_blank', 'width=800,height=600'); WindowPopupID.focus();",
                    true
                );
            }
            catch (Exception)
            {
                // Ne rien faire ou journaliser l'erreur si nécessaire
            }
        }


    }
}