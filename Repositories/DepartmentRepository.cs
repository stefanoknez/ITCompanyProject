using ITCompanyProject.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace ITCompanyProject.Repositories
{
    public class DepartmentRepository
    {
        public static DataTable GetAllDepartments(SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Departments", conn);
            SqlDataReader reader = cmd.ExecuteReader();
            DataTable dt = new DataTable();
            dt.Load(reader);
            return dt;
        }

        public static Department GetDepartmentByID(int id, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM Departments WHERE DepartmentID = @id", conn);
            cmd.Parameters.AddWithValue("id", id);
            SqlDataReader reader = cmd.ExecuteReader();

            if (!reader.Read())
                return null;

            Department dept = new Department()
            {
                DepartmentID = reader.GetInt32(0),
                Name = reader.GetString(1)
            };

            reader.Close();
            return dept;
        }

        public static bool InsertDepartment(Department dept, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("INSERT INTO Departments(Name) VALUES(@name)", conn);
            cmd.Parameters.AddWithValue("name", dept.Name);
            int rows = cmd.ExecuteNonQuery();
            return rows > 0;
        }

        public static bool UpdateDepartment(Department dept, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Departments SET Name = @name WHERE DepartmentID = @id", conn);
            cmd.Parameters.AddWithValue("name", dept.Name);
            cmd.Parameters.AddWithValue("id", dept.DepartmentID);
            int rows = cmd.ExecuteNonQuery();
            return rows > 0;
        }

        public static bool DeleteDepartment(int id, SqlConnection conn)
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM Departments WHERE DepartmentID = @id", conn);
            cmd.Parameters.AddWithValue("id", id);
            int rows = cmd.ExecuteNonQuery();
            return rows > 0;
        }
    }
}
