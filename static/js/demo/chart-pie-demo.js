// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var pen = document.getElementById('pending');
var com = document.getElementById('complete');
var new_ = document.getElementById('new');
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Complete", "Pending", "New"],
    datasets: [{
      data: [com.innerText, pen.innerText, new_.innerText],
      backgroundColor: ['#1cc88a', '#f6c23e', '#36b9cc'],
      hoverBackgroundColor: ['#17a673', '#dbac34', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
