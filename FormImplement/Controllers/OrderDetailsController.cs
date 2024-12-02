using FormImplement.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace FormImplement.Controllers
{
    public class OrderDetailsController : Controller
    {
        private IConfiguration configuration;
        public OrderDetailsController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult Index()
        {

            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_OrderDetail_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
            return View();
        }

        public IActionResult Form(int OrderDetailID)
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection2 = new SqlConnection(connectionString);
            connection2.Open();
            SqlCommand command2 = connection2.CreateCommand();
            command2.CommandType = System.Data.CommandType.StoredProcedure;
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
           

            SqlConnection connection3 = new SqlConnection(connectionString);
            connection3.Open();
            SqlCommand command3 = connection3.CreateCommand();
            command3.CommandType = System.Data.CommandType.StoredProcedure;
            command3.CommandText = "PR_Product_DropDown";
            SqlDataReader reader3 = command3.ExecuteReader();
            DataTable dataTable3 = new DataTable();
            dataTable3.Load(reader3);
            List<ProductDropdownModel> productList = new List<ProductDropdownModel>();
            foreach (DataRow data in dataTable3.Rows)
            {
                ProductDropdownModel productDropDownModel = new ProductDropdownModel();
                productDropDownModel.ProductID = Convert.ToInt32(data["ProductID"]);
                productDropDownModel.ProductName = data["ProductName"].ToString();
                productList.Add(productDropDownModel);
            }
            ViewBag.ProductList = productList;

            SqlConnection connection4 = new SqlConnection(connectionString);
            connection4.Open();
            SqlCommand command4 = connection4.CreateCommand();
            command4.CommandType = System.Data.CommandType.StoredProcedure;
            command4.CommandText = "PR_Order_DropDown";
            SqlDataReader reader4 = command4.ExecuteReader();
            DataTable dataTable4 = new DataTable();
            dataTable4.Load(reader4);
            List<OrderDropdownModel> orderList = new List<OrderDropdownModel>();
            foreach (DataRow data in dataTable4.Rows)
            {
                OrderDropdownModel orderDropDownModel = new OrderDropdownModel();
                orderDropDownModel.OrderID = Convert.ToInt32(data["OrderId"]);

                orderList.Add(orderDropDownModel);
            }
            ViewBag.OrderList = orderList;




            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_OrderDetail_SelectAllByPK";
            command.Parameters.AddWithValue("@OrderDetailID", OrderDetailID);
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            OrderDetailsModel orderDetailsModel = new OrderDetailsModel();

            foreach (DataRow dataRow in table.Rows)
            {
                orderDetailsModel.OrderDetailID = Convert.ToInt32(@dataRow["OrderDetailID"]);
                orderDetailsModel.ProductID = Convert.ToInt32(@dataRow["ProductID"]);
                orderDetailsModel.OrderID = Convert.ToInt32(@dataRow["OrderID"]);
                orderDetailsModel.TotalAmount = Convert.ToInt32(@dataRow["TotalAmount"]);
                orderDetailsModel.Quantity = Convert.ToInt32(@dataRow["Quantity"]);
                orderDetailsModel.Amount = Convert.ToInt32(@dataRow["Amount"]);
                orderDetailsModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }





            return View("Form",orderDetailsModel);
        }
        public IActionResult OrderDetailsSave(OrderDetailsModel orderDetailsModel)
        {
            if (orderDetailsModel.UserID <= 0)
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
                if (orderDetailsModel.OrderDetailID == null)
                {
                    command.CommandText = "PR_OrderDetail_Insert";
                }
                else
                {
                    command.CommandText = "PR_OrderDetail_Update";
                    command.Parameters.Add("@OrderDetailID", SqlDbType.Int).Value = orderDetailsModel.OrderDetailID;
                }
                command.Parameters.Add("@OrderID", SqlDbType.VarChar).Value = orderDetailsModel.OrderID;
                command.Parameters.Add("@ProductID", SqlDbType.VarChar).Value = orderDetailsModel.ProductID;
                command.Parameters.Add("@Amount", SqlDbType.VarChar).Value = orderDetailsModel.Amount;
                command.Parameters.Add("@Quantity", SqlDbType.VarChar).Value = orderDetailsModel.Quantity;
                command.Parameters.Add("@TotalAmount", SqlDbType.VarChar).Value = orderDetailsModel.TotalAmount;
                command.Parameters.Add("@UserId", SqlDbType.VarChar).Value = orderDetailsModel.UserID;


                command.ExecuteNonQuery();
                return RedirectToAction("Index");
            }


            return View("Form", orderDetailsModel);
        }

        public IActionResult OrderDetailList(OrderDetailsModel orderDetailsModel)
        {
            return View(orderDetailsModel);
        }
        public IActionResult OrderDetailsDelete(int OrderDetailID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_OrderDetail_Delete";
                command.Parameters.Add("@OrderDetailID", SqlDbType.Int).Value = OrderDetailID;
                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = ex.Message;
                Console.WriteLine(ex.ToString());

            }
            return RedirectToAction("Index");
        }
    }
}
