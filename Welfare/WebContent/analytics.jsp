<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welfare | Analytics</title>
<link rel="icon" href="img/eu.png" type="image/gif" sizes="20x20">
<link rel="stylesheet" type="text/css" href="css/analytics.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="/css/app.css">
  <link rel="stylesheet" type="text/css" href="css/boot4.3.1/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="js/jquery-ui/jquery-ui.css">
  <script src="js/jquery.js" charset="utf-8"></script>
    <script src="js/jquery-ui/jquery-ui.js" charset="utf-8"></script>
    <script src="css/boot4.3.1/js/bootstrap.js" charset="utf-8"></script>
</head>
<body>
  <div class="mycontainer" style="background-color: yellow !important;">
    <div class="nav">

      <div class="container" >
        <div class="logoa">
          <img src="img/eu.png" alt="Egerton Logo">
            <p style="text-align:center; color:white;">Egerton University <br> Directorate <br> of <br> University Welfare. </p>
        </div>
        <ul id="menu-ul">
          <li id="first"> <a href="/analytics.jsp">Home</a> </li>
          <li> <a href="/analytics.jsp">Profile</a> </li>
          <li> <a href="/analytics.jsp">History</a> </li>
          <li> <a href="analytics.jsp">View Reports</a> </li>
        </ul>

        <div class="social">
          <span class="facebook"> <a href="#"> <img src="img/facebook.svg" alt="facebook" style="width: 30px; height: auto;" > </a> </span>
          <span class="twitter"> <a href="#"> <img id="twit" src="img/twitter.svg" alt="facebook" style="width: 30px; height: auto;"> </a> </span>
          <span class="insta"> <a href="#"> <img src="img/instagram.svg" alt="facebook" style="width: 30px; height: auto;"> </a> </span>

        </div>
        <div class="copy">
          <p>&copy; 2019 <span>Egerton University</span> </p>

        </div>

      </div>

    </div>

    <div class="main">
    <h1>Analytics &amp; Reports.</h1>
    <div class="current-figures flex">
      <div class="figure-box">
        <span id="small-title"> Total Users</span>
        <span class="running-number" id="totusers"></span>

      </div>
      <div class="figure-box">
        <span id="small-title">Top User</span>
        <span>S15/56789/16</span>
        <span style="display:block;"  onclick="getData()">20 complaints</span>

      </div>
      <div class="figure-box">
        <span id="small-title">Open complaints</span>
        <span class="running-number" id="totopen"></span>

      </div>
      <div class="figure-box">
        <span id="small-title">Solved complaints</span>
        <span class="running-number" id="totclosed"></span>

      </div>
    </div>

    <div class="dept-case-month row">
      <div class="col-md-6">
        <div id="chartContainer" style="height: 100% !important; width: 100%; background-color: whitesmoke !important;"></div>
      </div>
      <div class="col-md-6 text-expl">
        <div class="select-params">
          <p>Sellect the a month to see the accompanying data:</p>
          <input id="date-picker" class="form-control" type="text" name="" placeholder="Month, Year" style="max-width: 300px;" autocomplete="off" onchange=" monthCaseReport()">
        </div>
        <div class="narrative">
          <p>
            For the month of <span id="expl-date"></span>, The <span id="expl-highestDept"></span> department had the highest number of complaints
            <span id=expl-highestTot></span> cases in total. The  <span id="expl-2ndDept"></span> department followed with <span id="expl-2ndTot"></span> cases. The second least was
            <span id="expl-3rdDept"></span> department with <span id="expl-3rdTot"></span> cases. <span id="expl-4thDept"></span> had the least cases: <span id="expl-4thTot"></span>
            in total. This month received a total of <span id="expl-allTot"></span> cases.
          </p>
        </div>

      </div>


    </div>

    <div class="row case-reports">
      <div class="col-sm-12 col-md-6 ">
        <div class="case directors">
          <div class="date-param" style="margin-bottom:50px">
            <p>Select a month to view accompanying data:</p>
            <input type="text" id="director-date" name="" placeholder="Month Year" class="form-control" onchange="directorCaseReport()" autocomplete="off" >

          </div>
          <div id="chartContainerDirector" style="height: 300px !important; width: 100%;"></div>
        </div>
      </div>

      <div class="col-sm-12 col-md-6">
        <div class="case dept-trend">
          <div class="date-param" style="margin-bottom:50px">
            <p>Select a year and a department to view how cases were distibuted:</p>
            <div class="row">
              <div class="col-sm-6">
                <input type="text" id="dept-trend" name="" placeholder="Year" class="form-control" onchange="departmentTrend()" autocomplete="off" >
              </div>
              <div class="col-sm-6">
                <select class="form-control" name="deptTrend" id="dept-trend-name" onchange="departmentTrend()">
                  <option value="Accommodation">Accommodation Department</option>
                  <option value="Security">Security Department</option>
                  <option value="Disability">Disability Mainstreaming</option>
                  <option value="Catering">Catering Department</option>

                </select>
              </div>

            </div>


          </div>
            <div id="chartContainerDeptTrend" style="height: 300px !important; width: 100%;"></div>
        </div>
      </div>


    </div>

    <div class="row case-reports">
      <div class="col-sm-12 col-md-6 ">
        <div class="case usershipTrend">
          <div class="date-param" style="margin-bottom:50px">
            <p>Select a month to view accompanying data:</p>
            <input type="text" id="usership-date" name="" placeholder="Month Year" class="form-control" onchange="usershipReport()" autocomplete="off" >

          </div>
          <div id="userGrowthTrend" style="height: 300px !important; width: 100%;"></div>
        </div>
      </div>

      <div class="col-sm-12 col-md-6">
        <div class="case openCases">
          <div class="date-param" style="margin-bottom:62px">

          </div>
          <div id="currOpenCases" style="height: 300px !important; width: 100%; margin-bottom: 62px;"></div>
        </div>
      </div>


    </div>

    <div class="day-basis-report" style="width:100%; min-height:400px; border-radius:10px; background-color: whitesmoke; margin-bottom: 20px;">
      <div class="row">
        <div class="col-md-6">
          <p>Select a date to see accompanying data:</p>
          <input type="text" id="daily-repo" class="form-control" name="" placeholder="dd/month/year">

        </div>
        <div class="col-md-6">
            <div id="day-basis-report" style="height: 400px !important; width: 100%;"></div>
        </div>


      </div>

    </div>

    </div>

  </div>
    <script src="js/jquery-ui/jquery-ui.js" charset="utf-8"></script>
  <script type="text/javascript">
  //////date-picker//////
  $(function() {
	  var month = new Array();
	  month[0] = "January";
	  month[1] = "February";
	  month[2] = "March";
	  month[3] = "April";
	  month[4] = "May";
	  month[5] = "June";
	  month[6] = "July";
	  month[7] = "August";
	  month[8] = "September";
	  month[9] = "October";
	  month[10] = "November";
	  month[11] = "December";

	  var d = new Date();
    var dd = d.getDate();
    var mon = d.getMonth() + 1;
	  var mm = month[d.getMonth()];
	  var yyyy = d.getFullYear();
	  var today = new Date(mm, yyyy, 1);

	  d = mm +  ' ' + yyyy;
	  $('#date-picker').val(d);
     $('#director-date').val(d);
     $('#dept-trend').val(yyyy);
      $('#usership-date').val(yyyy);
      $('#daily-repo').val(dd+"/"+mon+"/"+yyyy);
	// $('#date-picker').datepicker().datepicker('setDate', today);
	// $('#date-picker').datepicker('setDate', today);

	  //console.log("the date today" + today);

         $('#date-picker').datepicker( {
         changeMonth: true,
         changeYear: true,
         showButtonPanel: true,

         dateFormat: 'MM yy',


         onClose: function(dateText, inst) {
             //$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
             var fmonth = month[inst.selectedMonth];
             var date = fmonth+' '+inst.selectedYear;
             $(this).val(date);
             monthCaseReport();
         }

         } );
         monthCaseReport();

         /////date picker for directors cases
         $('#director-date').datepicker({
           changeMonth: true,
           changeYear: true,
           showButtonPanel: true,

           dateFormat: 'MM yy',


           onClose: function(dateText, inst) {
               //$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
               var fmonth = month[inst.selectedMonth];
               var date = fmonth+' '+inst.selectedYear;
               $(this).val(date);
               directorCaseReport();
           }
         });
         directorCaseReport();

         /////date picker for dpartment trend
         $('#dept-trend').datepicker({
           changeMonth: false,
           changeYear: true,
           showButtonPanel: true,

           dateFormat: 'yy',


           onClose: function(dateText, inst) {
               //$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
               var fmonth = month[inst.selectedMonth];
               var date = inst.selectedYear;
               $(this).val(date);
               departmentTrend();
           }
         });
         departmentTrend();


              /////date picker for dpartment trend
              $('#usership-date').datepicker({
                changeMonth: false,
                changeYear: true,
                showButtonPanel: true,

                dateFormat: 'yy',


                onClose: function(dateText, inst) {
                    //$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
                    var fmonth = month[inst.selectedMonth];
                    var date = inst.selectedYear;
                    $(this).val(date);
                    UsershipGrowth();
                }
              });
              UsershipGrowth();

              /////date picker for daily cases
              $('#daily-repo').datepicker({
                changeMonth: true,
                changeYear: true,
                showButtonPanel: true,

                dateFormat: ' dd mm yy',


                onClose: function(dateText, inst) {
                    //$(this).datepicker('setDate', new Date(inst.selectedYear, inst.selectedMonth, 1));
                    var dy = inst.selectedDay ;

                    var fmonth = inst.selectedMonth + 1;
                    var date =dy+"/"+ fmonth+"/"+inst.selectedYear;
                    $(this).val(date);
                   getDailyReports();
                }
              });
             getDailyReports();

     });





  //////////////end of date-picker///

  </script>

  <script type="text/javascript">

  function getUsers() {

    var xhr;
    xhr = new XMLHttpRequest();

    xhr.open('GET', 'getusersno', true);

    xhr.onload=function(){
      if(xhr.status==200){
        document.getElementById('totusers').innerHTML = this.responseText;
        console.log("the total count is " + this.responseText);
      }
      //console.log(this.status);
    }

    xhr.send();

  }

  function getData() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'getdata', true);
    xhr.onreadystatechange=function(){
      if(this.readyState==4 && this.status == 200){
        var data = JSON.parse(this.responseText);
      var dataString = JSON.stringify(data);
        //console.log(data.totalUsers);
        document.getElementById('totusers').innerHTML = data.totalUsers;
        document.getElementById('totopen').innerHTML = data.casesOpen;
        document.getElementById('totclosed').innerHTML= data.closedCases;
      }
    //  console.log("get data status is ", this.status);

    }
    xhr.onerror=function(){
      console.log("error fetching data");
    }
      xhr.send();

  }

  getData();
  setInterval(getData, 10000);
  setInterval(getOpen, 20000);
  ////get the report statement for a month////
  function monthCaseReport(){

    var month = document.getElementById('date-picker').value;
    ///console.log(month);
    var splitString = month.split(" ");
    var mm = splitString[0];
    var yy = splitString[1];
  // v  console.log('the month is ' +mm+' and the year is '+yy);
    var xhr = new XMLHttpRequest();
      var data;
    xhr.open('GET', 'getmonthcases?date='+mm+'&year='+yy, true);

    xhr.onreadystatechange=function(){

      if(this.readyState==4 && this.status == 200){
      /*  var monthCases = JSON.parse(this.responseText);
      var dataString = JSON.stringify(data);
        console.log(data.totalUsers);
        document.getElementById('totusers').innerHTML = data.totalUsers;
        document.getElementById('totopen').innerHTML = data.casesOpen;
        document.getElementById('totclosed').innerHTML= data.closedCases;*/
         data = JSON.parse(this.responseText);
      //var dataString = JSON.stringify(data);
      //  console.log(data[0].name);
        //percentages calculation
        var total = parseInt(data[0].cases) + parseInt(data[1].cases) + parseInt(data[2].cases) + parseInt(data[3].cases);
      //  console.log("the total is "+total);
      var y1 =  Number(parseInt(data[0].cases)/total*100).toFixed(2);
        var y2 = Number(parseInt(data[1].cases)/total*100).toFixed(2);
          var y3 = Number(parseInt(data[2].cases)/total*100).toFixed(2);
            var y4 = Number(parseInt(data[3].cases)/total*100).toFixed(2);
        ////end of percentages calculation
        ///chart variable
        document.getElementById("expl-date").innerHTML= document.getElementById('date-picker').value;
          document.getElementById("expl-highestDept").innerHTML= data[0].name;
            document.getElementById("expl-highestTot").innerHTML= data[0].cases;

              document.getElementById("expl-2ndDept").innerHTML= data[1].name;
                document.getElementById("expl-2ndTot").innerHTML= data[1].cases;

                  document.getElementById("expl-3rdDept").innerHTML= data[2].name;
                    document.getElementById("expl-3rdTot").innerHTML= data[2].cases;

                      document.getElementById("expl-4thDept").innerHTML= data[3].name;
                        document.getElementById("expl-4thTot").innerHTML= data[3].cases;

                          document.getElementById("expl-allTot").innerHTML= total;
                          var mnth = document.getElementById('date-picker').value;
        var chart = new CanvasJS.Chart("chartContainer", {
          exportEnabled: false,
          animationEnabled: true,
          backgroundColor: "whitesmoke",
          title:{
            text: "Departmental Cases for "+mnth
          },
          legend:{
            cursor: "pointer",
            itemclick: explodePie
          },
          data: [{
            type: "pie",
            showInLegend: true,
            toolTipContent: "{name}: <strong>{total} Cases</strong>",
            indexLabel: "{name} - {y}%",
            dataPoints: [
              { y: y1, name: data[0].name, total: parseInt(data[0].cases), exploded: true },
              { y: y2, name: data[1].name, total:data[1].cases },
              { y: y3, name: data[2].name, total:data[2].cases},
              { y: y4, name: data[3].name, total:data[3].cases },

            ]
          }]
        });
          chart.render();
      }
    //  console.log("get data status is ", this.status);

    }

    xhr.onerror=function(){
      console.log("error fetching data");
    }
      xhr.send();


  }
  ///////end of get the report statement for a month///

  /////start of directors' cases
  function directorCaseReport() {
    var month = document.getElementById('director-date').value;
    ///console.log(month);
    var splitString = month.split(" ");
    var mm = splitString[0];
    var yy = splitString[1];
  // v  console.log('the month is ' +mm+' and the year is '+yy);
    var xhr = new XMLHttpRequest();
      var data;
    xhr.open('GET', 'getdirectorcases?date='+mm+'&year='+yy, true);

    xhr.onreadystatechange=function() {
      if(this.status == 200 && this.readyState==4){
       data= JSON.parse(this.responseText);
      //  console.log(data);
        //////////////////directors bar chart

          var chartDirector = new CanvasJS.Chart("chartContainerDirector", {
          	animationEnabled: true,
          	theme: "light2", // "light1", "light2", "dark1", "dark2"
          	backgroundColor: "whitesmoke",
          	title:{
          		text: "Cases Handled by each Director in "+month
          	},
          	axisY: {
          		title: "Cases"
          	},
          	data: [{
          		type: "column",
              toolTipContent: "{label}: <strong>{y} Cases</strong>",
          		showInLegend: true,
          		dataPoints: data
          	}]
          });
          chartDirector.render();


            /////////////////end of directors bar chart




      }
    }

    xhr.onerror=function(){
      console.log("error fetching data");
    }
    xhr.send();


  }
  /////end of director's cases

  //////open cases
  function getOpen() {

  var xhr = new XMLHttpRequest();
  var data = 0;
  var date = new Date();
  xhr.open('GET', 'getcasesopen', true);
  xhr.onreadystatechange=function(){
    if (this.status==200 && this.readyState==4) {
      data = JSON.parse(this.responseText);
    //  console.log(data);

    //////////////////openCases bar chart

      var chartOpenCases = new CanvasJS.Chart("currOpenCases", {
        animationEnabled: true,
        theme: "light2", // "light1", "light2", "dark1", "dark2"
        backgroundColor: "whitesmoke",
        title:{
          text: "Open (on-going) cases per dept as at "+date
        },
        axisY: {
          title: "Cases"
        },
        data: [{
          type: "column",
          toolTipContent: "{label}: <strong>{y} Cases</strong>",
          showInLegend: true,
          dataPoints: data
        }]
      });
      chartOpenCases.render();


        /////////////////end of openCases bar chart

    }


  }


      xhr.onerror=function(){
        console.log("error fetching data");
      }
      xhr.send();


  }
  /////end of open cases

  //////department Trend
  function departmentTrend() {
    var xhr = new XMLHttpRequest();
    var year = document.getElementById('dept-trend').value;
    var dept = document.getElementById('dept-trend-name').value;
    var data;
    xhr.open('GET', 'getdept/trend?year='+year+'&dept='+dept, true);
    xhr.onreadystatechange = function(){
  //    console.log(this.status);
      if(this.status == 200 && this.readyState==4){
        data = JSON.parse(this.responseText);
      //  console.log(data);

            ///////////////start of chartContainerDeptTrend
            var chartDeptTrend = new CanvasJS.Chart("chartContainerDeptTrend", {
        	animationEnabled: true,
        	theme: "light2",
          backgroundColor: "whitesmoke",
        	title:{
        		text: dept+" Department Trend for Year "+year
        	},
        	axisY:{
        		includeZero: false
        	},
        	data: [{
        		type: "line",
            toolTipContent: "{label}: <strong>{y} Cases</strong>",
        		dataPoints: data
        	}]
        });
        chartDeptTrend.render();

            //////////////end of chartContainerDeptTrend


      }
    }

    xhr.send();

    xhr.onerror = function(){
      console.log("error fetching data");
    }

  }
    //departmentTrend();
  //  setTimeout(departmentTrend, 2000); //this works too
  /////end of deprtment trend

  /////Usership userGrowthTrend
  function UsershipGrowth() {

    var xhr = new XMLHttpRequest();
    var year = document.getElementById('usership-date').value;

    var data;
    xhr.open('GET', 'getuser/trend?year='+year, true);
    xhr.onreadystatechange = function(){
  //    console.log(this.status);
      if(this.status == 200 && this.readyState==4){
        data = JSON.parse(this.responseText);
      //  console.log(data);

      ///////////////start of userGrowthTrend
      var chartUserGrowth = new CanvasJS.Chart("userGrowthTrend", {
    animationEnabled: true,
    theme: "light2",
    backgroundColor: "whitesmoke",
    title:{
      text: "Usership Growth Trend for Year "+year
    },
    axisY:{
      includeZero: false
    },
    data: [{
      type: "line",
      toolTipContent: "{label}: <strong>{y} New Users</strong>",
      dataPoints: data
    }]
  });
  chartUserGrowth.render();

      //////////////end of userGrowthTrend



      }
    }

    xhr.send();

    xhr.onerror = function(){
      console.log("error fetching data");
    }


  }
  //////end of userGrowthTrend

  ///////daily Reports
  function getDailyReports() {
    var month = document.getElementById('daily-repo').value;
    ///console.log(month);
    var splitString = month.split("/");
    var d = splitString[0];
    var mm = splitString[1];
    var yy = splitString[2];
    var data;
    var xhr = new XMLHttpRequest();
    xhr.open("GET", "get/daily/report?day="+d+"&month="+mm+"&year="+yy, true);
    xhr.onreadystatechange = function(){
      console.log(this.status);
      if (this.status==200 && this.readyState==4) {
        data = JSON.parse(this.responseText);
        console.log(data);
        ///////////////day-basis chart
        var chartDayBasis = new CanvasJS.Chart("day-basis-report", {
  theme: "light1",
  exportFileName: "Doughnut Chart",
  exportEnabled: false,
  backgroundColor: "whitesmoke",
  animationEnabled: true,
  title:{
    text: "Cases For "+month
  },
  legend:{
    cursor: "pointer",
    itemclick: explodePie
  },
  data: [{
    type: "doughnut",
    innerRadius: 100,
    showInLegend: true,
    toolTipContent: "<b>{label}</b>: ${y} (#percent%)",
    indexLabel: "{label} - #percent%",
    dataPoints: data

  }]
});
chartDayBasis.render();
////////////////end of day-basis chart

      }
    }

    xhr.send();
    xhr.onerror = function(){
      console.log("something went wrong");
    }


  }
  //////end of daily reports

  ///event of date change

/*  document.getElementById('date-picker').onchange = function() {
    monthCaseReport();
  };*/
  //getOpen();
  ////////////////PIE-CHART CANVAS JS TRIAL
  window.onload = function () {

    getOpen();


/*  var charts = new CanvasJS.Chart("chartContainers", {
  	exportEnabled: false,
  	animationEnabled: true,
  	backgroundColor: "whitesmoke",
  	title:{
  		text: "Departmental Cases for this month"
  	},
  	legend:{
  		cursor: "pointer",
  		itemclick: explodePie
  	},
  	data: [{
  		type: "pie",
  		showInLegend: true,
  		toolTipContent: "{name}: <strong>{total} Cases</strong>",
  		indexLabel: "{name} - {y}%",
  		dataPoints: [
  			{ y: 26, name: "Security", total:200, exploded: true },
  			{ y: 20, name: "Accommodation",total:500 },
  			{ y: 5, name: "Catering",total:250  },
  			{ y: 3, name: "Disability Mainstreaming",total:50  },

  		]
  	}]
  });
  charts.render();*/

//////////////////directors bar chart

/*  var chartDirector = new CanvasJS.Chart("chartContainerDirector", {
  	animationEnabled: true,
  	theme: "light2", // "light1", "light2", "dark1", "dark2"
  	backgroundColor: "whitesmoke",
  	title:{
  		text: "Cases Handled by each Director"
  	},
  	axisY: {
  		title: "Cases"
  	},
  	data: [{
  		type: "column",
      toolTipContent: "{label}: <strong>{y} Cases</strong>",
  		showInLegend: true,
  		dataPoints: [
  			{ y: 300, label: "Kibe" },
  			{ y: 266,  label: "Saida" },
  			{ y: 169,  label: "Director 2" },
  			{ y: 158,  label: "Dir 3" },

  		]
  	}]
  });
  chartDirector.render();*/


    /////////////////end of directors bar chart

    ///////////////start of chartContainerDeptTrend
  /*  var chartDeptTrend = new CanvasJS.Chart("chartContainerDeptTrend", {
	animationEnabled: true,
	theme: "light2",
  backgroundColor: "whitesmoke",
	title:{
		text: "Department Trend for Year 2019"
	},
	axisY:{
		includeZero: false
	},
	data: [{
		type: "line",
    toolTipContent: "{label}: <strong>{y} Cases</strong>",
		dataPoints: [
			{ y: 450,label: "Jan/19" },
			{ y: 414,label: "Feb/19"},
			{ y: 520,label: "Mar/19", indexLabel: "highest",markerColor: "red", markerType: "triangle" },
			{ y: 460,label: "Apr/19"},
			{ y: 450,label: "May/19" },
			{ y: 500,label: "Jun/19"},
			{ y: 480,label: "Jul/19" },
			{ y: 480,label: "Aug/19" },
			{ y: 410,label: "Sept/19" , indexLabel: "lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
			{ y: 500,label: "Oct/19"},
			{ y: 480,label: "Nov/19" },
			{ y: 510,label: "Dec/19" }
		]
	}]
});
chartDeptTrend.render(); */

    //////////////end of chartContainerDeptTrend

    ///////////////start of userGrowthTrend
/*    var chartUserGrowth = new CanvasJS.Chart("userGrowthTrend", {
  animationEnabled: true,
  theme: "light2",
  backgroundColor: "whitesmoke",
  title:{
    text: "Usership Growth Trend for Year 2019"
  },
  axisY:{
    includeZero: false
  },
  data: [{
    type: "line",
    toolTipContent: "{label}: <strong>{y} Cases</strong>",
    dataPoints: [
      { y: 450,label: "Jan/19" },
      { y: 414,label: "Feb/19"},
      { y: 520,label: "Mar/19", indexLabel: "highest",markerColor: "red", markerType: "triangle" },
      { y: 460,label: "Apr/19"},
      { y: 450,label: "May/19" },
      { y: 500,label: "Jun/19"},
      { y: 480,label: "Jul/19" },
      { y: 480,label: "Aug/19" },
      { y: 410,label: "Sept/19" , indexLabel: "lowest",markerColor: "DarkSlateGrey", markerType: "cross" },
      { y: 500,label: "Oct/19"},
      { y: 480,label: "Nov/19" },
      { y: 510,label: "Dec/19" }
    ]
  }]
});
chartUserGrowth.render(); */

    //////////////end of userGrowthTrend

    //////////////////openCases bar chart

  /*    var chartOpenCases = new CanvasJS.Chart("currOpenCases", {
      	animationEnabled: true,
      	theme: "light2", // "light1", "light2", "dark1", "dark2"
      	backgroundColor: "whitesmoke",
      	title:{
      		text: "Open (on-going) cases per dept"
      	},
      	axisY: {
      		title: "Cases"
      	},
      	data: [{
      		type: "column",
          toolTipContent: "{label}: <strong>{y} Cases</strong>",
      		showInLegend: true,
      		dataPoints: [
      			{ y: 300, label: "Security" },
      			{ y: 266,  label: "Accommodation" },
      			{ y: 169,  label: "Disability Mainstreaming" },
      			{ y: 158,  label: "Catering" },

      		]
      	}]
      });
      chartOpenCases.render(); */


        /////////////////end of openCases bar chart


  }

  function explodePie (e) {
  	if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
  		e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
  	} else {
  		e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
  	}
  	e.chart.render();
    e.chartDayBasis.render();

  }

  ///////////////END OF CANVAS JS TRIAL


  </script>

  <script src="js/canvasjs.min.js" charset="utf-8"></script>

</body>
</html>
