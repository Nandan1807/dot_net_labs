using FormAdmin.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace FormAdmin.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult ProductList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Product_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        private IConfiguration configuration;

        public ProductController(IConfiguration _configuration)
        {
            configuration = _configuration;

        }
        public IActionResult ProductAddEdit(int ProductID)
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            
            SqlConnection connection2 = new SqlConnection(connectionString);
            connection2.Open();
            SqlCommand command2 = connection2.CreateCommand();
            command2.CommandType = System.Data.CommandType.StoredProcedure;
            
            #region dropdown region
            command2.CommandText = "PR_User_DropDown";
            SqlDataReader reader2 = command2.ExecuteReader();
            DataTable dataTable2 = new DataTable();
            dataTable2.Load(reader2);
            List<UserDropDownModel> userList = new List<UserDropDownModel>();
            foreach (DataRow data in dataTable2.Rows)
            {
                UserDropDownModel userDropDownModel = new UserDropDownModel();
                userDropDownModel.UserID = Convert.ToInt32(data["UserID"]);
                userDropDownModel.UserName = data["UserName"].ToString();
                userList.Add(userDropDownModel);
            }
            ViewBag.UserList = userList;
            #endregion

            #region Select by id region

            command2.CommandText = "PR_Product_SelectByPK";
            command2.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;
            SqlDataReader read = command2.ExecuteReader();
            DataTable dataTable = new DataTable();
            dataTable.Load(read);

            ProductModel productModel = new ProductModel();
            foreach (DataRow row in dataTable.Rows)
            {
                productModel.ProductID = Convert.ToInt32(@row["ProductID"]);
                productModel.ProductName = @row["ProductName"].ToString();
                productModel.ProductCode = @row["ProductCode"].ToString();
                productModel.ProductPrice = Convert.ToDouble(@row["ProductPrice"]);
                productModel.Description = @row["Description"].ToString();
                productModel.UserID = Convert.ToInt32(@row["UserID"]);
            }
            #endregion
            return View("ProductAddEdit",productModel);
        }
        
        
        public IActionResult SaveProduct(ProductModel productModel)
        {
            if (ModelState.IsValid)
            {
                return RedirectToAction("ProductList");
            }
            return View("ProductAddEdit", productModel);
        }

        [HttpPost]
        public IActionResult ProductSave(ProductModel productModel)
        {
            if (productModel.UserID <= 0)
            {
                ModelState.AddModelError("UserID", "A valid User is required.");
            }

            if (ModelState.IsValid)
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                
                if (productModel.ProductID == null)
                {
                    command.CommandText = "PR_Product_Insert";
                    command.Parameters.Add("@ProductName", SqlDbType.VarChar).Value = productModel.ProductName;
                    command.Parameters.Add("@ProductCode", SqlDbType.VarChar).Value = productModel.ProductCode;
                    command.Parameters.Add("@ProductPrice", SqlDbType.Decimal).Value = productModel.ProductPrice;
                    command.Parameters.Add("@Description", SqlDbType.VarChar).Value = productModel.Description;
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = productModel.UserID;
                }
                else
                {
                    command.CommandText = "PR_Product_Update";
                    command.Parameters.Add("@ProductID", SqlDbType.Int).Value = productModel.ProductID;
                    command.Parameters.Add("@ProductName", SqlDbType.VarChar).Value = productModel.ProductName;
                    command.Parameters.Add("@ProductCode", SqlDbType.VarChar).Value = productModel.ProductCode;
                    command.Parameters.Add("@ProductPrice", SqlDbType.Decimal).Value = productModel.ProductPrice;
                    command.Parameters.Add("@Description", SqlDbType.VarChar).Value = productModel.Description;
                    command.Parameters.Add("@UserID", SqlDbType.Int).Value = productModel.UserID;
                }

                command.ExecuteNonQuery();
                return RedirectToAction("ProductList");
            }

            return View("ProductAddEdit", productModel);
        }
        public IActionResult ProductDelete(int ProductID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Product_Delete";
                command.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;
                command.ExecuteNonQuery();
                return RedirectToAction("ProductList");
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());
                return RedirectToAction("ProductList");
            }
        }
    }
}
