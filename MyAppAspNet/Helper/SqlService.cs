using System;
using System.Data;
using System.Data.SqlClient;

namespace MyAppAspNet.Helper
{
    class SqlService
    {
        static string stringcon = "";
        static DataSet ds = new DataSet();
        public static void SetConnection( String strcon)
        {
            stringcon = strcon;
        }

        public static SqlDataAdapter GetDataAdapter(String query)
        {
            try
            {
                var con = new SqlConnection(stringcon);
                con.Open();
                var sda = new SqlDataAdapter(query, con);
                con.Close();
                return sda;
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
                return null;
            }
        }
        public static DataSet GetDataSet(String query,String tableName ="Table")
        {
            var con = new SqlConnection(stringcon);
            con.Open();
            try
            {
                var adapter = new SqlDataAdapter(query, con);
                if (ds.Tables.Contains(tableName))
                    ds.Tables.Remove(tableName);
                adapter.Fill(ds, tableName);
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            con.Close();
            return ds;
        }
        public static DataTable GetDataTable(String query, String tableName = "Table")
        {
            var con = new SqlConnection(stringcon);
            con.Open();
            try
            {
                var adapter = new SqlDataAdapter(query, con);
                if (ds.Tables.Contains(tableName))
                    ds.Tables.Remove(tableName);
                adapter.Fill(ds, tableName);

            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
            return ds.Tables[tableName];
        }
        public static ModSqlCommand GetCommand(String query)
        {
            try
            {
                var con = new SqlConnection(stringcon);
                con.Open();
                return new ModSqlCommand(new SqlCommand(query, con), con);
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
                return null;
            }
        }
        public static void ExecuteQuery(String query)
        {
            try
            {
                var con = new SqlConnection(stringcon);
                con.Open();
                var sqlcom = new SqlCommand(query, con);
                sqlcom.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
            }
        }
        public static ModSqlDataReader GetDataReader(String query)
        {
            try
            {
                var con = new SqlConnection(stringcon);
                con.Open();
                var sqlcom = new SqlCommand(query, con);
                return new ModSqlDataReader(sqlcom.ExecuteReader(), con);
            }
            catch (Exception e) 
            {
                Console.Write(e.Message);
                return null;
            }
        }
    }

    class ModSqlCommand
    {
        public SqlCommand sqlCommand;
        public SqlConnection sqlConnection;
        public ModSqlCommand(SqlCommand sqlCommand,SqlConnection sqlConnection)
        {
            this.sqlCommand = sqlCommand;
            this.sqlConnection = sqlConnection;
        }
    }
    class ModSqlDataReader
    {
        public SqlDataReader sqlDataReader;
        public SqlConnection sqlConnection;
        public ModSqlDataReader(SqlDataReader sqlDataReader,SqlConnection sqlConnection)
        {
            this.sqlDataReader = sqlDataReader;
            this.sqlConnection = sqlConnection;
        }
    }


}
