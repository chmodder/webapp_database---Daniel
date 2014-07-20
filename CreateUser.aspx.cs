using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserBtn_Click(object sender, EventArgs e)
    {
        // FELTET MELLEM [] SKAL ÆNDRES SÅ DET PASSER TIL NAVNET PÅ DIN CONNECTIONSTRING - KAN FINDES I WEB.CONFIG FILEN
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        // SQL strengen
        cmd.CommandText = @"
        INSERT INTO [User] 
        (UserName, userPassword) 
        VALUES 
        (@CreateUsername, @CreatePassword)";


        cmd.Parameters.Add("@CreateUsername", SqlDbType.NVarChar).Value = CreateUserNameText.Text;
        cmd.Parameters.Add("@CreatePassword", SqlDbType.NVarChar).Value = CreatePassWordText.Text;

        // Åben for forbindelsen til databasen
        conn.Open();

        // Udfør SQL komandoen
        cmd.ExecuteNonQuery();

        // Luk for forbindelsen til databasen
        conn.Close();

        //DITLEV CHECK
        //// Besked til brugeren om at beskeden er modtaget
        //MsgLbl.Text = "Tak! Vi har modtaget din besked og den vil blive behandlet indenfor 24 timer";

        CreateUserNameText.Text = "";
        CreatePassWordText.Text = "";
    }
}