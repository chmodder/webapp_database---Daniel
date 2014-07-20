﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["userName"] != null && Request.Cookies["userPassword"] != null)
            {
                name.Text = Request.Cookies["userName"].Value;
                password.Attributes["value"] = Request.Cookies["userPassword"].Value;
            }
        }
    }
    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        //laver en coockie med brugernavn og adgangskode, som husker brugeren

        // husker brugernavn og adgangskode i 30 dage, hvis man har hakket tjekboksen af
        if (chkRememberMe.Checked)
        {
            Response.Cookies["userName"].Expires = DateTime.Now.AddDays(30);
            Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(30);
        }
        //Laver eller overskriver en cookie, som ikke husker brugernavn og adgangskode, hvis man IKKE har hakket tjekboksen af
        else
        {
            Response.Cookies["userName"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["userPassword"].Expires = DateTime.Now.AddDays(-1);

        }
        //Trim fjerner whitespace fra det indtastede inden brugernavn og adgangskoden bliver gemt i coockien.
        Response.Cookies["userName"].Value = name.Text.Trim();
        Response.Cookies["userPassword"].Value = password.Text.Trim();



        // opret forbindelse til databasen
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        // SQL strengen
        cmd.CommandText = @"
        SELECT * FROM [User]
        WHERE [User].userName LIKE @userName
            AND [User].userPassWord LIKE @Password";

        // Tilføj parametrer (input fra brugeren / TextBox fra .aspx siden) til din SQL streng
        cmd.Parameters.Add("@userName", SqlDbType.NVarChar).Value = name.Text;
        cmd.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password.Text;

        // Åben for forbindelsen til databasen
        conn.Open();

        // Udfør SQL komandoen
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            // Gem informationer om login i Session
            Session["BrugerId"] = reader["userID"];

            //DITLEV CHECK
            //if (Session["CurrentUrl"] == null)
            //{
            //    // Send brugeren videre
            //    Response.Redirect("StudentPages/Default.aspx");
            //}

            //else
            //{
            //    //tager den gemte url og putter den ind i en anden variabel, så sessionvariblen bliver nulstillet
            //    string BackToLastPage = (string)Session["CurrentUrl"];
            //    Session["CurrentUrl"] = null;
            //    Response.Redirect(BackToLastPage);
            //}
            Response.Redirect("Default.aspx");

        }

        else
        {
            //DITLEV CHECK
            //// Vis fejlmeddelelse
            //PanelMsgError.Visible = true;
        }

        // Luk for forbindelsen til databasen
        conn.Close();
    }
    
}