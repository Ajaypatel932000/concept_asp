using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Trial : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       //String  str ="\u003cVideo width = 400 controls\u003e\u003cSource src = \u0027 ../ Videos / python tutorials for beginners in hindi - 5 - data types in python.mp4 \u0027 type = video / mp4 \u003e \u003c / video \u003e ";
        String str = "<Video width=400 controls><Source src=../Videos/Probability (1).mp4 type=video/mp4></video>";
       int i = str.IndexOf('.');
       int j = str.LastIndexOf('=');


       int length = (j - i) + 1;
       length = length - 6;
       if (i >= 0)
       {
           // str = str.SubString(i + 1);
           str = str.Substring(i , length);
           
       }
       Label1.Text = str;   
       //for (int i = 0; i < a.Length; i++)
       //{
       //    Label1.Text ="abc";//Convert.ToString( a[i]);
       //}
       
        //Label1.Text = s.Substring(0);
        //String s = "\u003cVideo width = 400 controls\u003e\u003cSource src = \u0027 ../ Videos / python tutorials for beginners in hindi - 5 - data types in python.mp4 \u0027 type = video / mp4 \u003e \u003c / video \u003e ";
        //Label1.Text = s.Trim(Convert.ToChar(Convert.ToString("\u003cVideo width = 400 controls\u003e\u003cSource src = \u0027")));
  //      Label1.Text = s.Substring(55, 80);
       // Label1.Text=s.LastIndexOf(


     
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Boolean gender = Request.Form["gender"];
        Response.Write(gender);
    }
}
