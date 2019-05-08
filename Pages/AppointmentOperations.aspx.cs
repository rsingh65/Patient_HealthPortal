using Germane1.data;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Microsoft.Ajax.Utilities;
using System.IO;
using System.Web.Security;

namespace Germane1.Pages
{
    public partial class AppointmentOperations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userid = (int)Session["userid"];
            //int userid=1;
            if(Request.QueryString["apty"] != null)
            {
                string appointmentType = Request.QueryString["apty"].ToString();

                using (var dbContext = new usersinfoEntities())
                {
                    Response.Clear();
                    Response.ContentType = "application/json; charset=utf-8";
                    var settings = new JsonSerializerSettings
                    {
                        DateFormatString = "yyyy-MM-dd",
                        DateTimeZoneHandling = DateTimeZoneHandling.Utc
                    };
                    string json = "";

                    if (appointmentType == "up")
                    {
                        //display upcoming appointments
                        var userAppointments = dbContext.userAppointmentsInfo.Where(apps => apps.userid == userid && DbFunctions.TruncateTime(apps.appointment_Date) >= DbFunctions.TruncateTime(System.DateTime.Now)).ToList();
                        //var userAppointments1 = userAppointments.ForEach(time => DateTime.Parse(time.appointment_Time.ToString()).ToShortTimeString());

                        for (int i = 0; i < userAppointments.Count; i++)
                        {
                            //TimeSpan sp = TimeSpan.Parse(DateTime.Parse(userAppointments[i].appointment_Time.ToString()).ToShortTimeString());
                        }
                        if (userAppointments != null)
                        {
                            json = JsonConvert.SerializeObject(userAppointments, settings);
                        }
                    }
                    else
                    {
                        //display past appointments 
                        var userAppointments = dbContext.userAppointmentsInfo.Where(apps => apps.userid == userid && DbFunctions.TruncateTime(apps.appointment_Date) < DbFunctions.TruncateTime(System.DateTime.Now)).ToList();
                        if (userAppointments != null)
                        {
                            json = JsonConvert.SerializeObject(userAppointments, settings);
                        }
                    }

                    Response.Write(json);
                    Response.Flush();
                    Response.End();
                }
            }
            else
            {
                string operation = Request.QueryString["op"].ToString();
                Stream req = Request.InputStream;
                req.Seek(0, System.IO.SeekOrigin.Begin);
                string json = new StreamReader(req).ReadToEnd();

                Appointment ap = JsonConvert.DeserializeObject<Appointment>(json);
                if (operation == "create")
                {
                    try
                    {
                        using (var dbContext = new usersinfoEntities())
                        {
                            userAppointmentsInfo userAppointment = new userAppointmentsInfo();
                            userAppointment.appointment_CreationDate = System.DateTime.UtcNow.Date;
                            userAppointment.appointment_Date = ap.date;
                            userAppointment.appointment_Description = ap.description;
                            userAppointment.appointment_Time = ap.time;
                            userAppointment.userid = (int)HttpContext.Current.Session["userid"];
                            userAppointment.appointment_Title = ap.title;

                            dbContext.userAppointmentsInfo.Add(userAppointment);
                            dbContext.SaveChanges();

                            Response.Write("{\"sucess\":\"true\"}");
                            Response.End();
                        }
                    }
                    catch(Exception ex)
                    {
                            //Response.Write("\"sucess\":\"false\"");
                    }
                }
                else if (operation == "edit")
                {
                    try
                    {
                        using (var dbContext = new usersinfoEntities())
                        {
                            var appointment = dbContext.userAppointmentsInfo.SingleOrDefault(app => app.appointmentid == ap.appointmentId);

                            appointment.appointment_Date = ap.date;
                            appointment.appointment_Time = ap.time;

                            dbContext.SaveChanges();

                            Response.Write("{\"sucess\":\"true\"}");
                            Response.End();
                        }
                    }
                    catch (Exception ex)
                    {
                        //Response.Write("\"sucess\":\"false\"");
                    }
                }
                else if (operation == "delete")
                {
                    try
                    {
                        using (var dbContext = new usersinfoEntities())
                        {
                            var appointment = dbContext.userAppointmentsInfo.SingleOrDefault(app => app.appointmentid == ap.appointmentId);
                            dbContext.userAppointmentsInfo.Remove(appointment);
                            dbContext.SaveChanges();

                            Response.Write("{\"sucess\":\"true\"}");
                            Response.End();
                        }
                    }
                    catch (Exception ex)
                    {
                        //Response.Write("\"sucess\":\"false\"");
                    }
                }
                else if (operation == "logout"){
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                }
            }
        }

        [WebMethod()]
        public static void LoadAppointmentTabs(string appointmentType)
        {
            //This creates the appointment for the user
            string jsonData = "";
            try
            {
                int userid = (int)HttpContext.Current.Session["userid"];

                using (var dbContext = new usersinfoEntities())
                {
                    var settings = new JsonSerializerSettings
                    {
                        DateFormatString = "yyyy-MM-dd",
                        DateTimeZoneHandling = DateTimeZoneHandling.Utc
                    };

                    if (appointmentType == "upcoming")
                    {
                        var userAppointments = dbContext.userAppointmentsInfo.Where(apps => apps.userid == userid && DbFunctions.TruncateTime(apps.appointment_Date) >= DbFunctions.TruncateTime(System.DateTime.Now)).ToList();
                        if (userAppointments != null)
                        {
                            //Response.ContentType = "text/html";

                            //Response.Write("<table class='table'><thead><tr><th scope='col'>#</th><th scope='col'><i class='glyphicon glyphicon - calendar'></i>Title</th><th scope='col'>Date</th><th scope='col'>Edit</th></tr></thead><tbody>");
                            //foreach (var appmnt in userAppointments)
                            //{
                            //    Response.Write("<tr><th scope='row'>" + appointmentNumber + "</th><td>" + appmnt.appointment_Title + "</td><td>" + appmnt.appointment_Date + "</td><td><span class='glyphicon glyphicon - calendar'></span></td></tr>");
                            //}

                            //Response.Write("</tbody></table>");

                            jsonData = JsonConvert.SerializeObject(userAppointments, settings);
                            //jsonData = "[{'appointmentid':4,'userid':43,'appointment_CreationDate':'2019-05-02','appointment_Date':'2019-05-10','appointment_Title':'Teeths','appointment_Description':'Clean Teeths','appointment_Time':'12:00:00'},{'appointmentid':6,'userid':43,'appointment_CreationDate':'2019-05-03','appointment_Date':'2019-05-17','appointment_Title':'hands','appointment_Description':'for hands','appointment_Time':'10:00:00'}]";
                        }
                        else
                        {
                            //no upcoming
                        }
                    }
                    else
                    {
                        //display past appointments 
                        var userAppointments = dbContext.userAppointmentsInfo.Where(apps => apps.userid == userid && DbFunctions.TruncateTime(apps.appointment_Date) < DbFunctions.TruncateTime(System.DateTime.Now)).ToList();
                        if (userAppointments != null)
                        {
                            jsonData = JsonConvert.SerializeObject(userAppointments, settings);
                        }
                    }
                    //Response.Write("The database was written");
                }
            }
            catch (Exception ex)
            {
                jsonData = "";
            }
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.Write(jsonData);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.End();
            //return jsonData;
        }

        [WebMethod()]
        public static bool Create_Appointment(string title, string date, string time, string description)
        {
            //This creates the appointment for the user
            bool success = true;
            try
            {
                using (var dbContext = new usersinfoEntities())
                {
                    userAppointmentsInfo userAppointment = new userAppointmentsInfo();
                    userAppointment.appointment_CreationDate = System.DateTime.UtcNow.Date;
                    userAppointment.appointment_Date = DateTime.Parse(date);
                    userAppointment.appointment_Description = description;
                    userAppointment.appointment_Time= TimeSpan.Parse(time);
                    userAppointment.userid = (int)HttpContext.Current.Session["userid"];
                    userAppointment.appointment_Title = title;

                    dbContext.userAppointmentsInfo.Add(userAppointment);
                    dbContext.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                success = false;
            }
            return success;
        }
    }

    class Appointment
    {
        public int userid { get; set; }
        public int appointmentId { get; set; }
        public DateTime CreationDate { get; set; }
        public DateTime date { get; set; }
        public string title { get; set; }
        public string description { get; set; }
        public TimeSpan time { get; set; }
    }
}