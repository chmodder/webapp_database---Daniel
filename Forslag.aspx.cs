using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forslag : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string displayName(int istrue, string username){
        if (istrue == 1 ){
            return username;
        }else{
            return "anonym";
        }
    }
}