using System;
using System.Configuration;
using System.Data.SqlClient;

namespace ITCompanyProject.Repositories
{
    public static class DatabaseHelper
    {
        private static readonly string connectionString = ConfigurationManager
            .ConnectionStrings["DefaultConnection"]
            .ConnectionString;

        public static SqlConnection GetConnection()
        {
            SqlConnection conn = new SqlConnection(connectionString);
            conn.Open();
            return conn;
        }

        public static bool TestConnection()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
    }
}
