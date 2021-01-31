using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ADMIN_StudentDetailsBrief : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_Load(object sender, EventArgs e)
    {
        Label lbl = (Label)FormView1.FindControl("PictureLabel");
        string pic_url;
        pic_url = lbl.Text;
        if (pic_url == "")
        {
            pic_url = "NoProfile2.jpg";
        }
        Image img = (Image)FormView1.FindControl("Image1");
        img.ImageUrl = "~/App_Themes/Theme1/assets/images/" + pic_url;
    }
}