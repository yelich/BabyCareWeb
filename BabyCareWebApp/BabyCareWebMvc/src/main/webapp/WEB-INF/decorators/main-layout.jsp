<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page session="true"%>
<%-- <%@page contentType="text/html" pageEncoding="UTF-8"%> --%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="url" value="${pageContext.request.contextPath}"></c:set>
<c:url value="/j_spring_security_logout" var="logoutUrl" />
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<title><dec:title default="BabyCare Application" /></title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="${url}/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    
    <!--  Light Bootstrap Dashboard core CSS    -->
    <link href="${url}/resources/assets/css/light-bootstrap-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="${url}/resources/assets/css/demo.css" rel="stylesheet" />

    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <link href="${url}/resources/assets/css/pe-icon-7-stroke.css" rel="stylesheet" />
<dec:head />
</head>
<body>
	
	<div class="wrapper">
		<div id="menu">
			<%@ include file="menu.jsp"%>
		</div>
		<div class="main-panel">
			<div id="menu_header">
				<%@ include file="menu_top.jsp"%>
			</div>
			<div id="content">
				<dec:body />
			</div>
			<div id="footer">
				<%@ include file="footer.jsp"%>
			</div>
		</div>
	</div>
<!--   Core JS Files   -->
<script src="${url}/resources/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="${url}/resources/assets/js/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="${url}/resources/assets/js/bootstrap.min.js"
	type="text/javascript"></script>


<!--  Forms Validations Plugin -->
<script src="${url}/resources/assets/js/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="${url}/resources/assets/js/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="${url}/resources/assets/js/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src="${url}/resources/assets/js/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script
	src="${url}/resources/assets/js/bootstrap-checkbox-radio-switch-tags.js"></script>

<!--  Charts Plugin -->
<script src="${url}/resources/assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="${url}/resources/assets/js/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="${url}/resources/assets/js/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="${url}/resources/assets/js/jquery-jvectormap.js"></script>

<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>

<!-- Wizard Plugin    -->
<script src="${url}/resources/assets/js/jquery.bootstrap.wizard.min.js"></script>

<!--  Datatable Plugin    -->
<script src="${url}/resources/assets/js/bootstrap-table.js"></script>

<!--  Full Calendar Plugin    -->
<script src="${url}/resources/assets/js/fullcalendar.min.js"></script>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="${url}/resources/assets/js/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="${url}/resources/assets/js/demo.js"></script>

<script type="text/javascript">
$().ready(function(){
    
    var $validator = $("#wizardForm").validate({
	  rules: {
	    email: {
            required: true,
            email: true,
            minlength: 5
	    },
	    emailjob: {
            email: true,
            minlength: 5
	    },
	    firstname: {
	        required: true
	    },
	    lastname: {
	        required: true
	    },
	    contactfirstname: {
	    	required: true
	    },
	    contactlastname: {
	    	required: true
	    },
	    contactrelationship: {
	    	required: true
	    },
	    contactphone: {
	    	required: true
	    },
	    contactaddress: {
	    	required: true
	    },
	    website: {
	        required: true,
            minlength: 5,
            url: true
	    },
	    framework: {
		    required: false,
		    minlength: 4
	    },
	    cities: {
		    required: true
	    },
	    phone: {
		    required: true
	    },
	    address: {
		    required: true
	    },
	    relationship: {
	    	required: true
	    },
	    price:{
		    number: true
	    }
	  }
	});
    
     
            
            // you can also use the nav-pills-[blue | azure | green | orange | red] for a different color of wizard
            
            $('#wizardCard').bootstrapWizard({
            	tabClass: 'nav nav-pills',            	
            	nextSelector: '.btn-next',
                previousSelector: '.btn-back',
            	onNext: function(tab, navigation, index) {
            		var $valid = $('#wizardForm').valid();
    
            		if(!$valid) {
            			$validator.focusInvalid();
            			return false;
            		}
            	},         
                onInit : function(tab, navigation, index){
                
                    //check number of tabs and fill the entire row
                    var $total = navigation.find('li').length;
                    $width = 100/$total;
                    
                    $display_width = $(document).width();
                    
                    if($display_width < 600 && $total > 3){
                       $width = 50;
                    }
                   navigation.find('li').css('width',$width + '%');                
                },
                onTabClick : function(tab, navigation, index){
                    // Disable the posibility to click on tabs
                    return false;
                },
                onTabShow: function(tab, navigation, index) {
                    var $total = navigation.find('li').length;
                    var $current = index+1;
                    
                    var wizard = navigation.closest('.card-wizard');
                    
                    // If it's the last tab then hide the last button and show the finish instead
                    if($current >= $total) {
                        $(wizard).find('.btn-next').hide();
                        $(wizard).find('.btn-finish').show();
                    } else if($current == 1){
                        $(wizard).find('.btn-back').hide();
                    } else {
                        $(wizard).find('.btn-back').show();
                        $(wizard).find('.btn-next').show();
                        $(wizard).find('.btn-finish').hide();
                    }
                }
                
            });
            
        }); 
        
        function onFinishWizard(){
            //here you can do something, sent the form to server via ajax and show a success message with swal
            
            swal("Good job!", "You clicked the finish button!", "success");
        }   
        
		$().ready(function(){
            
            // Init Sliders 
            demo.initFormExtendedSliders();
            
            // Init DatetimePicker
            demo.initFormExtendedDatetimepickers();
        });  
		
		$().ready(function(){
            
            $('#registerFormValidation').validate();
            $('#loginFormValidation').validate();
            $('#allInputsFormValidation').validate();
        }); 
		
		$().ready(function(){
            demo.initFullScreenGoogleMap(); 
        });
		
		$().ready(function(){
            demo.initSmallGoogleMaps(); 
        });
		
		$().ready(function(){
	            demo.initVectorMap(); 
	     });
		 
		$(document).ready(function(){
	        	
	        	lbd.checkFullPageBackgroundImage();
	    });
		 
		$().ready(function(){
	            lbd.checkFullPageBackgroundImage();
	            
	            setTimeout(function(){
	                // after 1000 ms we add the class animated to the login/register card
	                $('.card').removeClass('card-hidden');
	            }, 700)
	    });
		
		$().ready(function(){
	            lbd.checkFullPageBackgroundImage();
	            
	            setTimeout(function(){
	                // after 1000 ms we add the class animated to the login/register card
	                $('.card').removeClass('card-hidden');
	            }, 1000)
	    });
		
		var $table = $('#bootstrap-table');
        
        function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="View" class="btn btn-simple btn-info btn-icon table-action view" href="javascript:void(0)">',
                    '<i class="fa fa-image"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="btn btn-simple btn-warning btn-icon table-action edit" href="javascript:void(0)">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="btn btn-simple btn-danger btn-icon table-action remove" href="javascript:void(0)">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        }
         
        $().ready(function(){
            window.operateEvents = {
                'click .view': function (e, value, row, index) {
                    info = JSON.stringify(row);
                    
                    swal('You click view icon, row: ', info);
                    console.log(info);
                },
                'click .edit': function (e, value, row, index) {
                    info = JSON.stringify(row);
                    
                    swal('You click edit icon, row: ', info);
                    console.log(info);    
                },
                'click .remove': function (e, value, row, index) {
                    console.log(row);
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
                }
            };
            
            $table.bootstrapTable({
                toolbar: ".toolbar",
                clickToSelect: true,
                showRefresh: true,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                searchAlign: 'left',
                pageSize: 8,
                clickToSelect: false,
                pageList: [8,10,25,50,100],
                
                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..." 
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
            
            //activate the tooltips after the data table is initialized
            $('[rel="tooltip"]').tooltip();      
            
            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });
    
            
        }); 
        
        $(document).ready(function(){

        	demo.initDashboardPageCharts();
        	demo.initVectorMap();

        	$.notify({
            	icon: 'pe-7s-bell',
            	message: "<b>Light Bootstrap Dashboard PRO</b> - forget about boring dashboards."

            },{
                type: 'warning',
                timer: 4000
            });

    	});
        
        $().ready(function(){
            demo.initFullCalendar();
        });
        
        $().ready(function(){
            demo.initCharts(); 
        });
        
    </script>
</body>
</html>


