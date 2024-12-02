using FormImplement.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace FormImplement.Controllers
{
    public class BillsController : Controller
    {
        private IConfiguration configuration;
        public BillsController(IConfiguration _configuration)
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
            command.CommandText = "PR_Bills_SelectAll";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
            return View();
        }
        public IActionResult Form(int BillID)
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            #region User dropdown
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

            #endregion

            #region order dropdown
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
            #endregion



            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "PR_Bills_SelectByPK";
            command.Parameters.AddWithValue("@BillID", BillID);
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            BillsModel billModel = new BillsModel();

            foreach (DataRow dataRow in table.Rows)
            {
                billModel.BillID = Convert.ToInt32(@dataRow["BillID"]);
                billModel.BillNumber = @dataRow["BillNumber"].ToString();
                billModel.BillDate = Convert.ToDateTime(@dataRow["BillDate"]);
                billModel.TotalAmount = Convert.ToInt32(@dataRow["TotalAmount"]);
                billModel.Discount = Convert.ToInt32(@dataRow["Discount"]);
                billModel.NetAmount= Convert.ToInt32(@dataRow["NetAmount"]);
                billModel.OrderID = Convert.ToInt32(@dataRow["OrderID"]);
                billModel.UserID = Convert.ToInt32(@dataRow["UserID"]);
            }

            return View("Form",billModel);
        }
        public IActionResult BillSave(BillsModel billsModel)
        {
            if (billsModel.UserID <= 0)
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
                if (billsModel.BillID == null)
                {
                    command.CommandText = "PR_Bills_Insert";
                }
                else
                {
                    command.CommandText = "PR_Bills_Update";
                    command.Parameters.Add("@BillID", SqlDbType.Int).Value = billsModel.BillID;
                }
                command.Parameters.Add("@BillNumber", SqlDbType.VarChar).Value = billsModel.BillNumber;
                command.Parameters.Add("@OrderID", SqlDbType.Int).Value = billsModel.OrderID;
                command.Parameters.Add("@BillDate", SqlDbType.DateTime).Value = billsModel.BillDate;
                command.Parameters.Add("@TotalAmount", SqlDbType.Decimal).Value = billsModel.TotalAmount;
                command.Parameters.Add("@Discount", SqlDbType.Decimal).Value = billsModel.Discount;
                command.Parameters.Add("@NetAmount", SqlDbType.Decimal).Value = billsModel.NetAmount;
                command.Parameters.Add("@UserID", SqlDbType.Int).Value = billsModel.UserID;
                command.ExecuteNonQuery();
                return RedirectToAction("Index");
            }
            return View("Form", billsModel);
        }

        public IActionResult BillsList(BillsModel billsModel)
        {
            return View(billsModel);
        }
        public IActionResult BillsDelete(int BillID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "PR_Bills_Delete";
                command.Parameters.Add("@BillID", SqlDbType.Int).Value = BillID;
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
