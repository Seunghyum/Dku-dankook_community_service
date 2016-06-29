var config = {
    type: 'radar',
    data: {
        labels: ["재미 & 흥미", "교수력", "학점따기", "과제 & 조모임"],
        datasets: [{
            label: gon.lecture_title,
            backgroundColor: "rgba(255,165,0,0.4)",
            pointBackgroundColor: "rgba(255,165,0,1)",
            borderColor: "rgba(255,165,0,1)",
            hoverPointBackgroundColor: "#fff",
            pointBorderColor: "#fff",
            pointHoverBackgroundColor: "#fff",
            pointHighlightStroke: "rgba(255,165,0,1)",
            // backgroundColor: "rgba(255,99,132,0.2)",
            // borderColor: "rgba(255,99,132,1)",
            // pointBackgroundColor: "rgba(255,99,132,1)",
            // pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#fff",
            // pointHoverBorderColor: "rgba(255,99,132,1)",
            data: [gon.av_fun, gon.av_teaching, gon.av_get_grade, gon.av_teamwork_n_asg]
        },
        {

            label: "",
            backgroundColor: "rgba(255,165,0,0)",
            pointBackgroundColor: "rgba(255,165,0,0)",
            borderColor: "rgba(255,165,0,0)",
            // hoverPointBackgroundColor: "#fff",
            // pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#fff",
            pointHighlightStroke: "rgba(255,165,0,0)",
            // backgroundColor: "rgba(255,99,132,0.2)",
            // borderColor: "rgba(255,99,132,1)",
            // pointBackgroundColor: "rgba(255,99,132,1)",
            // pointBorderColor: "#fff",
            // pointHoverBackgroundColor: "#fff",
            // pointHoverBorderColor: "rgba(255,99,132,1)",
            data: [100, 100, 100, 100]
        }]
    },
    options: {
        legend: {
            position: 'top',
            labels: {
              fontSize: 18
            },
        },
        title: {
            display: false,
            text: gon.lecture_title
        },
        scale: {
          reverse: false,
          gridLines: {
            color: ['black', 'red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet']
          },
          ticks: {
            beginAtZero: true
          }
        }
    }
};
window.onload = function() {
    window.myRadar = new Chart(document.getElementById("canvas"), config);
};
