<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sample1.aspx.cs" Inherits="Sample1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css" />
    <link href="App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/libs/css/style.css"/>
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div class="form-group">
                                        <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" id="BirthDate" runat="server" name="BithDate" />
                                            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                            </div>
                                        </div>
                                    </div>

    <script src="App_Themes/Theme1/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="App_Themes/Theme1/assets/libs/js/main-js.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/moment.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/tempusdominus-bootstrap-4.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/datepicker.js"></script>
</asp:Content>

