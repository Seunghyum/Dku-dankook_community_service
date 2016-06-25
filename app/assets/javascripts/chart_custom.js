var config = {
    type: 'radar',
    data: {
        labels: ["재미 & 흥미", "교수력", "점수받기", "관대함", "과제 & 조모임"],
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
            data: [gon.fun, gon.teaching, gon.get_grade, gon.generous, gon.teamwork_n_asg]
        }]
    },
    options: {
        // legend: {
        //     position: 'bottom',
        // },
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
