using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Profile;

public partial class Default3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Label1.Text = Profile.Name;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       /* MembershipCreateStatus status;
        Membership.CreateUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, "Username?", TextBox1.Text, true, out status);
        if (status == MembershipCreateStatus.Success)
        {
            /*  MembershipUser user = Membership.GetUser(TextBox1.Text);
              var profile = HttpContext.Current.Profile;
              profile.SetPropertyValue("Name", TextBox4.Text);
              profile.Save();*/
            //Profile.Name = TextBox4.Text;
           // Label1.Text = "Created";
       // }*/

        MembershipCreateStatus status;
        Membership.CreateUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, "Username?", TextBox1.Text, true, out status);
        if (status == MembershipCreateStatus.Success)
        {
            Label1.Text = "Created";
        }
        else {
            Label1.Text = "Failed";
        }
        ProfileCommon pc = Profile.GetProfile(TextBox1.Text);
        pc.Name = TextBox4.Text;
        pc.Save();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       /* MembershipUser user = Membership.GetUser(TextBox1.Text);
              var profile = HttpContext.Current.Profile;
              profile.SetPropertyValue("Name", TextBox4.Text);
              profile.Save();*/

        ProfileCommon pc = Profile.GetProfile(TextBox1.Text);
        pc.Name = TextBox4.Text;
        pc.Save();
    }
}