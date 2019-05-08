<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="Germane1.Pages.Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
</head>
<body>
    <form id="Main" runat="server">
        <div id="alerts">
        </div>
        <div class="form-inline">
            <div class="form-group">
                <asp:Image ImageUrl="~/images/germanelogo.JPG" runat="server" Style="height: 40px;" />
            </div>
            <div id="login" class="form-group" style="">
                <div class="form-group input-group" style="margin-left: 650px;">
                    <label style="font-weight:bold;margin-left: 240px;">Hi</label>
                    <asp:Label ID="fullName" runat="server" style="margin-left: 15px;"></asp:Label>
                    <a id="logout" href="AppointmentOperations.aspx?op=logout" style="margin-left: 50px;">Logout</a>
                </div>
            </div>
        </div>
        <div>
            <div class="panel panel-default" style="width: 1000px; padding: 10px; margin-top: 10px; margin-left: 250px;">
                <div id="apptabs" role="tabpanel">
                    <a id="createAppointment" data-toggle="modal" data-target="#appointmentCreate" style="margin-left: 755px;">Create Appointment</a>
                    

                    <!-- Nav tabs -->
                    <ul id="appTabsHead" class="nav nav-tabs" role="tablist">
                        <li class="active"><a href="upcoming" data-url="AppointmentOperations.aspx?apty=up" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-calendar"></i>Upcoming</a></li>
                        <li><a href="past" data-url="AppointmentOperations.aspx?apty=pst" role="tab" data-toggle="tab"><i class="glyphicon glyphicon-fire"></i>Past Appointments</a></li>

                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content" style="padding-top: 20px">
                        <div role="tabpanel" class="tab-pane active" id="upcoming">
                        </div>
                        <div role="tabpanel" class="tab-pane" id="past">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div id="appointmentEdit" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Edit Appointment</h4>
                    </div>
                    <div class="modal-body">
                        <label for="title">Title - </label>
                        <label id="titleForModal" style="font-weight:normal;"></label>
                        <br />
                        <label for="dateFieldEdit">Date</label>
                        <div class='input-group date' id='datePicker'>
                            <input type='text' class="form-control" id="dateFieldEdit" value="hello" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Time</label>
                            </div>
                            <select class="custom-select" id="inputGroupEditTime">
                                <option selected="selected">Choose...</option>
                                <option value="9:00:00">9 A.M.</option>
                                <option value="10:00:00">10 A.M.</option>
                                <option value="11:00:00">11 A.M.</option>
                                <option value="12:00:00">12 P.M.</option>
                                <option value="13:00:00">1 P.M.</option>
                                <option value="14:00:00">2 P.M.</option>
                                <option value="15:00:00">3 P.M.</option>
                                <option value="16:00:00">4 P.M.</option>
                                <option value="17:00:00">5 P.M.</option>
                                <option value="18:00:00">6 P.M.</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="UpdateAppointment();">Save Changes</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="DeleteAppointment();">Delete Appointment</button>
                    </div>
                    <asp:HiddenField ID="appointmentid" runat="server" />
                </div>

            </div>
        </div>
        <div id="appointmentCreate" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Create Appointment</h4>
                    </div>
                    <div class="modal-body" style="height: 500px">
                        <label for="titleForModalCreate">Title</label><br />
                        <input id="titleCreate" type='text' class="form-control" />
                        <br />
                        <label>Date</label>
                        <div class='input-group date' id='datePickerCreate' style="width: 50%">
                            <input id="dateCreate" type='text' class="form-control" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <label class="input-group-text" for="inputGroupSelect01">Time</label>
                            </div>
                            <select class="custom-select" id="inputGroupCreateTime">
                                <option selected="selected">Choose...</option>
                                <option value="9:00:00">9 A.M.</option>
                                <option value="10:00:00">10 A.M.</option>
                                <option value="11:00:00">11 A.M.</option>
                                <option value="12:00:00">12 P.M.</option>
                                <option value="13:00:00">1 P.M.</option>
                                <option value="14:00:00">2 P.M.</option>
                                <option value="15:00:00">3 P.M.</option>
                                <option value="16:00:00">4 P.M.</option>
                                <option value="17:00:00">5 P.M.</option>
                                <option value="18:00:00">6 P.M.</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="textAreaDescription">Description</label>
                            <textarea class="form-control" id="textAreaDescription" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="CreateAppointment();">Create Appointment</button>
                    </div>
                </div>

            </div>
        </div>
        
    </form>
</body>
<script>
    $(document).ready(function () {
        console.log("inside ready");
        loadTabs();
        $('#apptabs').on('click', '.tablink,#appTabsHead a', function (e) {
            loadTabs($(this));
        });

        $('#datePicker').datetimepicker({ format: 'YYYY/MM/DD' });
        $('#datePickerCreate').datetimepicker({ format: 'YYYY/MM/DD' });
    });

    function loadTabs(tb) {
        try {
            var url = $(tb).attr("data-url");
            var appType = $(tb).attr("href");
            if (appType == undefined) {
                url = "AppointmentOperations.aspx?apty=up";
                appType = "upcoming";
            }

            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json; charset=utf-8",
               
                success: function (response) {
                    //response = '[{"english":"bag","kana":"kaban","kanji":"K"},{"english":"glasses","kana":"megane","kanji":"M"}]';
                    //response = '[{"appointmentid":4,"userid":43,"appointment_CreationDate":"2019-05-02","appointment_Date":"2019-05-10","appointment_Title":"Teeths","appointment_Description":"Clean Teeths","appointment_Time":"12:00:00"},{"appointmentid":6,"userid":43,"appointment_CreationDate":"2019-05-03","appointment_Date":"2019-05-17","appointment_Title":"hands","appointment_Description":"for hands","appointment_Time":"10:00:00"}]';
                    //response = JSON.parse(response);
                    createTable(response,appType);
                },
                failure: function (response) {
                    alert(response.d);
                },
                onError: function (response) {
                    alert(response.d);
                }
            });
        }
        catch (e) {
            console.log(e);
        }
    };

    function createTable(data, appType) {
        var s = "<thead><tr><th scope='col' style='width:10px'>#</th><th scope='col'>Title</th><th scope='col'>Date</th><th scope='col'>Time</th><th scope='col'>Edit</th></tr></thead>";
        var c = "<tr><th scope='row'>1</th><td>Some</td><td>some</td><td></td></tr></tbody></table>";
        var appointmentNumber = 1;
        var table = createElement('table', 'table', '');
        table.className = "table table - striped";
        table.innerHTML = s;
        //var tHead = createElement('thead', '', '');
        var tBody = createElement('tbody', '', '');
        table.appendChild(tBody);

        for (var i = 0; i < data.length; i++) {
            var tr = createElement('tr', '', '');
            // tr.attr["scope"] = "row";
            var th = createElement('th', '', appointmentNumber);
            th.style.csstext ="width","10px";
            var tdTitle = createElement('td', '', data[i].appointment_Title);
            var tddate = createElement('td', '', data[i].appointment_Date);
            var tdTime = createElement('td', '', data[i].appointment_Time);
            var tdEdit = createElement('td', '', '');

            var a = document.createElement("a");
            a.setAttribute("userid", data[i].userid);
            a.setAttribute("onClick", "EditAppointment('" + data[i].appointmentid + "','" + data[i].appointment_Title + "','" + data[i].appointment_Date + "','" + data[i].appointment_Time + "');");
            a.setAttribute("appointmentid", data[i].appointmentid);
            a.setAttribute("data-toggle", "modal");
            a.setAttribute("data-target", "#appointmentEdit");
            a.className = "glyphicon glyphicon-edit";
            tdEdit.appendChild(a);

            tr.appendChild(th);
            tr.appendChild(tdTitle);
            tr.appendChild(tddate);
            tr.appendChild(tdTime);
            tr.appendChild(tdEdit);
            tBody.appendChild(tr);

            appointmentNumber += 1;
        }

        var upcomingTab = document.getElementById("upcoming");
        upcomingTab.removeChild(upcomingTab.firstChild);
        upcomingTab.appendChild(table);
    }

    function createElement(type, classname, innerHtml) {
        var element = document.createElement(type);
        element.className = classname;
        element.innerHTML = innerHtml;
        return element;
    }

    function EditAppointment(appId,title, date, time) {
        var apptitle = document.getElementById("titleForModal");
        apptitle.innerHTML = title;

        $('#datePicker').data("DateTimePicker").date(moment(date).format('YYYY-MM-DD'));
        $("#inputGroupEditTime option[value='" + time + "']").attr("selected", "selected");
        $('#appointmentid').val(appId);
    }

    //this function creates the appointments
    function CreateAppointment() {
        var title = document.getElementById("titleCreate").value;
        var date = document.getElementById("dateCreate").value;
        var time = document.getElementById("inputGroupCreateTime").value;
        var description = document.getElementById("textAreaDescription").value;

        var url = "AppointmentOperations.aspx?op=create";
        $.ajax({
            type: "POST",
            url: url,
            data: '{title: "' + title + '",date: "' + date + '",time: "' + time + '",description: "' + description + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (data) {
            loadTabs(this);
            $("#alerts").html('<div class="alert alert-success"><button type="button" class="close">×</button>Appointment Created</div>');

            window.setTimeout(function () {
                $(".alert").fadeTo(500, 0).slideUp(500, function () {
                    $(this).remove();
                });
            }, 3000);

            $('.alert .close').on("click", function (e) {
                $(this).parent().fadeTo(500, 0).slideUp(500);
            });

            document.getElementById("titleCreate").value = "";
        }).fail(function (data) {
            alert(data.d);
        });
    }

    //this function updates the appointment
    function UpdateAppointment() {
        var date = document.getElementById("dateFieldEdit").value;
        var time = document.getElementById("inputGroupEditTime").value;
        let appId = document.getElementById("appointmentid").value;
        

        let url = "AppointmentOperations.aspx?op=edit";
        $.ajax({
            type: "POST",
            url: url,
            data: '{appointmentId: "' + appId + '" ,date: "' + date + '",time: "' + time + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (data) {
            loadTabs();
            $("#alerts").html('<div class="alert alert-success"><button type="button" class="close">×</button>Appointment Updated</div>');

            window.setTimeout(function () {
                $(".alert").fadeTo(300, 0).slideUp(300, function () {
                    $(this).remove();
                });
            }, 5000);

            $('.alert .close').on("click", function (e) {
                $(this).parent().fadeTo(500, 0).slideUp(500);
            });
        }).fail(function (data) {
            alert(data.d);
        });
    }

    //this deletes the appointments
    function DeleteAppointment() {
        let appId = document.getElementById("appointmentid").value;

        let url = "AppointmentOperations.aspx?op=delete";
        $.ajax({
            type: "POST",
            url: url,
            data: '{appointmentId: "' + appId + '"}',
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function (data) {
            loadTabs();
        }).fail(function (data) {
            alert(data.d);
        });
    }
</script>
</html>
