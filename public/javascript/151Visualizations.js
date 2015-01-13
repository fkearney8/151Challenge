// Get context with jQuery - using jQuery's .get() method.
var ctx = $("#myChart").get(0).getContext("2d");

var data = {
    labels: ["Situps"],
    datasets: [
        {
            label: "Frank",
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: [65]
        },
        {
            label: "Theresa",
            fillColor: "rgba(151,187,205,0.5)",
            strokeColor: "rgba(151,187,205,0.8)",
            highlightFill: "rgba(151,187,205,0.75)",
            highlightStroke: "rgba(151,187,205,1)",
            data: [28]
        }
    ]
};

var options = {
    legendTemplate : '<ul>'
        +'<% for (var i=0; i<datasets.length; i++) { %>'
        +'<li>'
        +'<span style=\"background-color:<%=datasets[i].fillColor%>\">'
        +'<% if (datasets[i].label) { %><%= datasets[i].label %><% } %>'
        +'</span>'
        +'</li>'
        +'<% } %>'
        +'</ul>',

        //tooltipTemplate: "<%if (label){%><%=label%>: <%}%><%= value %>",
        tooltipTemplate: "Tooltip Template",
        showTooltips: true,
        //multiTooltipTemplate: "<%= value %>"
        multiTooltipTemplate: "MultiTooTip"

};

var barChart = new Chart(ctx).Bar(data, options);

var legend = barChart.generateLegend();

$('#legend').html(legend);
