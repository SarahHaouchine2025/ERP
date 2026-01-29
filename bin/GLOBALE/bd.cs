using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace URP_AADL.GLOBALE
{
    public static class bd
    {
        public static string ConnectionStr = ConfigurationManager.ConnectionStrings["URP_AADLConnectionString"].ConnectionString;

        public static DataTable Load_Query(string Query, string table_name = "Table")
        {
            SqlConnection sqlConn = null;
            try
            {
                sqlConn = new SqlConnection(ConnectionStr);
                SqlCommand SqlCom = new SqlCommand(Query, sqlConn);

                sqlConn.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter(SqlCom);
                DataTable dt = new DataTable(table_name);

                sqlda.Fill(dt);

                return dt;
            }
            catch (Exception)
            {
                return null;
            }
            finally
            {
                try
                {
                    if (sqlConn != null)
                        sqlConn.Close();
                }
                catch (Exception)
                {
                    // Ignorer l'exception
                }
            }
        }


        public static DataTable LoadPs(string psName, string[] paramsName = null, object[] paramsValue = null)
        {
            SqlConnection sqlConn = null;
            try
            {
                sqlConn = new SqlConnection(ConnectionStr);

                SqlCommand sqlCom = new SqlCommand(psName, sqlConn)
                {
                    CommandType = CommandType.StoredProcedure,
                    CommandTimeout = 6000
                };

                if (paramsName != null && paramsValue != null)
                {
                    for (int i = 0; i < paramsName.Length; i++)
                    {
                        sqlCom.Parameters.AddWithValue(paramsName[i], paramsValue[i]);
                    }
                }

                sqlConn.Open();

                SqlDataAdapter sqlda = new SqlDataAdapter(sqlCom);
                DataTable dt = new DataTable(psName);
                sqlda.Fill(dt);

                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                try
                {
                    if (sqlConn != null)
                        sqlConn.Close();
                }
                catch
                {
                    // Ignorer les erreurs de fermeture
                }
            }
        }

        public static String PATH_ARCHIVE = @"E:\ARCHIVE\";

        public static Guid ID_USER = Guid.Empty;

        //public static String PATH_ARCHIVE = @"C:\Users\Administrator\Desktop\ARCHIVE";
    }
}