using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Germane1.data;

namespace Germane1.Login
{
    public partial class loginSingupOperations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username, fullname, password;

            username = Request.QueryString["usnm"].ToString();
            fullname = Request.QueryString["flnm"].ToString();
            password = Request.QueryString["ps"].ToString();
            using (var dbContext = new usersinfoEntities())
            {
                userDetails user = new userDetails();
                user.username = username;
                user.fullname = fullname;
                user.password = password;

                dbContext.userDetails.Add(user);
                dbContext.SaveChanges();

                Response.Write("The database was written");
            }
        }
    }
}