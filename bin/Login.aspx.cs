using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using DAL;

namespace URP_AADL
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblError.Text = "";
        }

       

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string user_name = txtUsername.Text.Trim();
            string pass = txtPassword.Text.Trim();

            DAL.USERS utilisateur = null;
            bool utilisateur_active = false;

            using (var ctx = new URP_AADLEntities())
            {
                try
                {
                    utilisateur = ctx.USERS
                                    .FirstOrDefault(u => u.USER_NAME == user_name && u.PASSWORD == pass );
                }
                catch (Exception)
                {
                    utilisateur = null;
                }
                if (utilisateur == null)
                {
                    lblUserError.Text = "Nom d'utilisateur ou mot de passe est incorrecte!";
                    return;
                }
                else
                {
                    if (utilisateur.FLAG_ACTIVE == true)
                    {
                            // Met le flag connecter en true 
                            utilisateur.FLAG_CONNECTER = true;
                            ctx.SaveChanges();
                            
                        var DR = ctx.DIRECTION_REGIONAL.FirstOrDefault(u => u.ID_DR == utilisateur.ID_DR ) ;

                        Session["User"] = user_name;
                            Session["ID_User"] = utilisateur.ID_USER;
                        Session["DR"] = DR.DR;
                        if (Session["DR"].ToString() == "DG")
                        {
                            Session["ID_DR"] = null;
                        }
                        else
                        {
                            Session["ID_DR"] = DR.ID_DR;
                        }

                        Session["Profil"] = utilisateur.PROFIL;
                        if (utilisateur.PROFIL == "Avocat")
                        {
                            Response.Redirect("~/CONTENSIEUX/AFFAIRE/LISTE_AFFAIRE_AVOCAT.aspx");
                        }
                        else if (utilisateur.PROFIL == "Direction")
                        {
                            Response.Redirect("~/CONTENSIEUX/AFFAIRE/LISTE_COURIERS.aspx");
                        }
                        else
                        {
                            Response.Redirect("~/CONTENSIEUX/AFFAIRE/LISTE_AFFAIRE.aspx");
                        }
                            

                        
                        
                        
                    }
                        else
                        {
                            lblUserError.Text = "L'accès à ce compte a été désactivé. Veuillez contacter l'administrateur.";
                            return;
                        }
                }
            }
        }

        protected void chkRemember_CheckedChanged(object sender, EventArgs e)
        {
            this.rememberMe = chkRemember.Checked;
        }


        /*  Variables Globale */
        public bool rememberMe = false;
        // Créer le ticket d'authentification
    //    DateTime issueDate = DateTime.Now;
    //    DateTime expireDate = rememberMe ? issueDate.AddDays(30) : issueDate.AddHours(10); // Exemple : 30 jours si coché

    //    FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(
    //        1,
    //        utilisateur.ID_USER.ToString(),
    //        issueDate,
    //        expireDate,
    //        rememberMe, // ← le booléen ici
    //        utilisateur.ID_USER.ToString()
    //    );

    //    string encryptedTicket = FormsAuthentication.Encrypt(authTicket);
    //    HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket)
    //    {
    //        HttpOnly = true
    //    };

    //                        if (rememberMe)
    //                        {
    //                            authCookie.Expires = expireDate; // Expire dans 30 jours
    //                        }

    //Response.Cookies.Add(authCookie);
    }
}