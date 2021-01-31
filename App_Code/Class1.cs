using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
	public Class1()
	{
		//
		// TODO: Add constructor logic here
		//
	}
   
}

public class Subject_details
{
    public string ID { get; set; }
    public string Name { get; set; }
}

public class Chapter_details
{
    public string ID { get; set; }
    public string Name { get; set; }
}

public class Note_Video_Details
{
    public string path;
    public string details;
}

public class Attendence_details
{
    public string date;
    public string Status;
    public string Year;
    public string A_date;
}
