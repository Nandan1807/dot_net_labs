using FormAdmin.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace FormAdmin.Controllers
{
    public class UserController : Controller
    {
        public IActionResult UserList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_User_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        private IConfiguration configuration;

        public UserController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult UserAddEdit(int UserID)
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            
            SqlConnection connection2 = new SqlConnection(connectionString);
            connection2.Open();
            SqlCommand command2 = connection2.CreateCommand();
            command2.CommandType = System.Data.CommandType.StoredProcedure;
            command2.CommandText = "PR_Product_SelectByPK";
            command2.Parameters.Add("@ProductID", SqlDbType.Int).Value = UserID;
            SqlDataReader read = command2.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(read);

            UserModel userModel = new UserModel();
            foreach (DataRow row in dataTable.Rows)
            {
                userModel.UserID = Convert.ToInt32(@row["UserID"]);
                userModel.UserName = @row["UserName"].ToString();
                userModel.Email = @row["Email"].ToString();
                userModel.Password = @row["Password"].ToString();
                userModel.MobileNo = Convert.ToInt64(@row["MobileNo"]);
                userModel.Address = @row["Address"].ToString();
                userModel.IsActive = Convert.ToBoolean(@row["IsActive"]);
            }
            return View("UserAddEdit",userModel);
        }
        [HttpPost]
        public IActionResult SaveUser(UserModel userModel)
        {
            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                if (userModel.UserID == null)
                {
                    command.CommandText = "PR_User_Insert";
                    command.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userModel.UserName;
                    command.Parameters.Add("@Email", SqlDbType.VarChar).Value = userModel.Email;
                    command.Parameters.Add("@Password", SqlDbType.VarChar).Value = userModel.Password;
                    command.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = userModel.MobileNo;
                    command.Parameters.Add("@Address", SqlDbType.VarChar).Value = userModel.Address;
                    command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = userModel.IsActive;
                }
                else
                {
                    command.CommandText = "PR_User_Update";
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = userModel.UserID;
                    command.Parameters.Add("@UserName", SqlDbType.VarChar).Value = userModel.UserName;
                    command.Parameters.Add("@Email", SqlDbType.VarChar).Value = userModel.Email;
                    command.Parameters.Add("@Password", SqlDbType.VarChar).Value = userModel.Password;
                    command.Parameters.Add("@MobileNo", SqlDbType.VarChar).Value = userModel.MobileNo;
                    command.Parameters.Add("@Address", SqlDbType.VarChar).Value = userModel.Address;
                    command.Parameters.Add("@IsActive", SqlDbType.Bit).Value = userModel.IsActive;
                }

                command.ExecuteNonQuery();
                return RedirectToAction("UserList");
            }
            return View("UserAddEdit", userModel);
        }
        public IActionResult DeleteUser(int UserID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_User_Delete";
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = UserID;
                command.ExecuteNonQuery();
                return RedirectToAction("UserList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());
                return RedirectToAction("UserList");
            }
        }
    }
}
