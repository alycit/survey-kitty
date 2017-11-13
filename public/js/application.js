$(document).ready(function() {
  $("#survey").on("submit", function(event){
    event.preventDefault();

    var $form = $(this);

    $.ajax({
      url: $form.attr("action"),
      method: $form.attr("method"),
      data: $form.serialize()
    }).done(function(stats){
      $form.hide();
      var $chartsContainer = $("#charts");

      for(var i = 0; i < stats.length; i++) {
        $chartsContainer.append(`<div id="question${i}">
                                    <h3>${stats[i].question}</h3>
                                    <canvas id="chart${i}"></canvas>
                                  </div>`);
        createChart(stats[i], i);
      }
    });

  });
});

function createChart(questionStats, number) {
  var ctx = document.getElementById("chart" + number).getContext('2d');

  var data = {
    datasets: [{
        data: questionStats.data,
        backgroundColor: getColors(questionStats.data.length),
        borderColor: "black",
        borderWidth: 2
    }],
    labels: questionStats.labels
  };

  var chartOptions = {
    rotation: -Math.PI,
    cutoutPercentage: 30,
    circumference: Math.PI,
    legend: {
      position: 'left'
    },
    animation: {
      animateRotate: true,
      animateScale: true
    }
  };

  var myDoughnutChart = new Chart(ctx, {
    type: 'doughnut',
    data: data,
    options: chartOptions
  });
}

function getColors(number) {
  var colors = [];

  for(var i = 0; i < number; i++) {
    colors.push('#'+Math.floor(Math.random()*16777215).toString(16))
  }

  return colors;
}
