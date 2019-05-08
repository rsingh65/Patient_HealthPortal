using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Germane1.data;

namespace Germane1.Pages
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                var username = HttpContext.Current.User.Identity.Name;
                //get all the user info here- like appointments etc
                using (var dbContext = new usersinfoEntities())
                {
                    userDetails user = new userDetails();
                    user.username = username;

                    var currentUser = dbContext.userDetails.FirstOrDefault(usr => usr.username == username);
                    if (currentUser != null)
                    {
                        fullName.Text = currentUser.fullname;
                        Session["userid"] = currentUser.userid;
                    }
                    else
                    {
                        //some error in finding details of the user
                    }
                }
            }
            else
            {
                Response.Redirect("~/Login/SignupLogin.aspx");
            }
        }
    }
}