// Get context with jQuery - using jQuery's .get() method.
//var barChartContext = $("#barChart").get(0).getContext("2d");
//
//var barChartData = {
//    labels: ["Situps"],
//    datasets: [
//        {
//            label: "Frank",
//            fillColor: "rgba(220,220,220,0.5)",
//            strokeColor: "rgba(220,220,220,0.8)",
//            highlightFill: "rgba(220,220,220,0.75)",
//            highlightStroke: "rgba(220,220,220,1)",
//            data: [65]
//        },
//        {
//            label: "Theresa",
//            fillColor: "rgba(151,187,205,0.5)",
//            strokeColor: "rgba(151,187,205,0.8)",
//            highlightFill: "rgba(151,187,205,0.75)",
//            highlightStroke: "rgba(151,187,205,1)",
//            data: [28]
//        }
//    ]
//};
//
//var barChartOptions = {
//    legendTemplate : '<ul>'
//        +'<% for (var i=0; i<datasets.length; i++) { %>'
//        +'<li>'
//        +'<span style=\"background-color:<%=datasets[i].fillColor%>\">'
//        +'<% if (datasets[i].label) { %><%= datasets[i].label %><% } %>'
//        +'</span>'
//        +'</li>'
//        +'<% } %>'
//        +'</ul>',
//
//        //tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
//        tooltipTemplate: "Tooltip Template",
//        showTooltips: true,
//        //multiTooltipTemplate: "<%= value %>"
//        multiTooltipTemplate: "MultiTooTip"
//
//};
//
//var barChart = new Chart(barChartContext).Bar(barChartData, barChartOptions);
//
//var legend = barChart.generateLegend();
//
//$('#legendBarChart').html(legend);
//

//var lineChartContext = $("#lineChart").get(0).getContext("2d");
//
//var lineChartData = {
//    labels: ["1/12", "1/13", "1/14", "1/15", "1/16", "1/17", "1/18"],
//    datasets: [
//        {
//            label: "Everyone - daily progress",
//            fillColor: "rgba(220,220,220,0.2)",
//            strokeColor: "rgba(220,220,220,1)",
//            pointColor: "rgba(220,220,220,1)",
//            pointStrokeColor: "#fff",
//            pointHighlightFill: "#fff",
//            pointHighlightStroke: "rgba(220,220,220,1)",
//            data: [65, 59, 80, 81, 56, 55, 40]
//        }
//    ]
//};
//
//var lineChartOptions = {
//    bezierCurve : false
//};
//
//var lineChart = new Chart(lineChartContext).Line(lineChartData, lineChartOptions);
//
//var lineChartLegend = lineChart.generateLegend();
//$('#legendLineChart').html(lineChartLegend);


var createLineChart = function($location, graphLabels, graphData){

    var lineChartContext = $($location).get(0).getContext("2d");

    var lineChartData = {
        labels: graphLabels,
        datasets: [
            {
                label: "Progress By Day",
                fillColor: "rgba(220,220,220,0.2)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                pointDotRadius : 2,
                pointHitDetectionRadius : 0,
                data: graphData
            }
        ]
    };

    var lineChartOptions = {
        bezierCurve : false
    };

    var lineChart = new Chart(lineChartContext).Line(lineChartData, lineChartOptions);

    //var lineChartLegend = lineChart.generateLegend();
    //$('#legendLineChart').html(lineChartLegend);

};