using Germane1.data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Germane1.Login
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                Response.Redirect("~/Pages/Main.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if (Request.IsAuthenticated)
            //{
            //    Response.Redirect("~/Pages/Main.aspx");
            //}
            //check for password or username correction here
            using (var dbContext = new usersinfoEntities())
            {
                userDetails user = new userDetails();
                user.username = txtUsernamelogin.Text;
                user.password = txtPasswordlogin.Text;

                var result = dbContext.userDetails.FirstOrDefault(usr => usr.username == user.username && usr.password == user.password);
                if (result != null)
                {

                    FormsAuthentication.SetAuthCookie(user.username, true);
                    Response.Redirect("~/Pages/Main.aspx");
                }
                else
                {
                    //user was not found
                }
            }


        }
    }
}