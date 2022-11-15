<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<!-- ${pageContext.request.contextPath} -->
<!-- 자바스크립트 차단된 콘텐츠 자동 허용 실시 -->
<!-- saved from url=(0013)about:internet -->


<!-- 헤더 정의 부분 -->


    <!-- 내부 CSS 스타일 지정 -->
    <style>

        html, body{
            width : 100%;
            height : 100%;
            margin : 0;
            padding : 0;
            border : none;  
            /* 배경 색상 지정 */
            /*background-color: #171e38;*/            
            overflow : auto;                    
        }    
                                              
    </style>    



    <!-- 내부 JS 지정 : 일반 -->
    <script>


        /*
        [JS 요약 설명]
        1. window.onload : 브라우저 로드 완료 상태를 나타냅니다
        2. chart.js 공식 사이트 : https://www.chartjs.org/docs/latest/
        3. chart.js 플러그인 datalabels : https://chartjs-plugin-datalabels.netlify.app/
        4. cdn 설치 사이트 : https://chartjs-plugin-datalabels.netlify.app/guide/getting-started.html#installation
        */


        // [html 최초 로드 및 이벤트 상시 대기 실시]
        window.onload = function() {
            console.log("");
            console.log("[window onload] : [start]");
            console.log("");
        };




        // [차트 그리기에 사용할 전역 변수 지정 실시]
        var canvas;
        var ctx;
        var height = "";
        var width = "";
        var myChart;


        // [캔버스 크기 지정 실시]
        // type : [1 = bar 세로 막대 / 2 = bar 그룹 차트 / 3 = line 라인 차트 / 4 = scatter 분산 차트]
        function canvasSizeCheck(type){
            console.log("");
            console.log("[canvasSizeCheck] : [start]");
            console.log("");

            // [캔버스를 포함하고 있는 상위 부모 컨테이너 id 지정 >> 부모 컨테이너 크기에 맞춰서 캔버스 리사이즈]
            var tagId = document.getElementById("canvas_container");

            height = window.getComputedStyle(tagId).height;
            width = window.getComputedStyle(tagId).width;
            console.log("");
            console.log("[canvasSizeCheck] : [height] : " + height);
            console.log("[canvasSizeCheck] : [width] : " + width);
            console.log("");

            // [화면 사이즈가 변경된 경우 기존 차트 삭제 실시]
            if(ctx != null){ 
                canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
                ctx.beginPath();
                myChart.destroy();
            }

            // [인풋으로 들어온 타입 값에 따라서 그래프 분기 표시 실시]
            if(type == 1){ 
                createCheartBarVertical(); // bar 세로 막대
            }
            if(type == 2){ 
                createCheartBarGroup(); // bar 그룹 막대
            }
            if(type == 3){ 
                createCheartLineWave(); // line 꺽은선
            }
            if(type == 4){ 
                createCheartScatter(); // scatter 분산
            }
        };






        // [bar 세로 막대 그래프 그리기]
        function createCheartBarVertical(){
            console.log("");
            console.log("[createCheartBarVertical] : [start]");
            console.log("");

            // [body 에 선언된 캔버스 id 지정 실시]
            canvas = document.getElementById('myBarHeightChart');
            ctx = canvas.getContext('2d');

            // [캔버스 크기를 부모 컨테이너 크기에 맞춥니다 : 부모 크기 % 지정 (반응형)]
            canvas.height = height;
            canvas.width = width;

            // [차트 그리기 실시]
            myChart = new Chart(ctx, {
                // [전체 차트 타입 지정]
                type: 'bar', 


                // [그래프 내에 수치 데이터 표시 위함]
                plugins:[ChartDataLabels],


                // [차트 그래프 관련 데이터 및 컬럼 속성 지정]
                data: {
                    labels: ['one', 'two', 'three', 'four', 'five', 'six'], // [X 축 데이터 라벨 (제목)]
                    datasets: [
                        {
                            label: '평균', // [데이터 시트 제목]
                            type : 'line', // 그래프 타입 'line' 설정
                            fill : false,  // 채우기 없음
                            lineTension : 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
                            pointRadius : 6,    // 각 지점에 포인트 설정 (0 이면 일자선)                            
                            backgroundColor: 'rgb(255, 0, 0)', // 빨강
                            borderColor: 'rgb(255, 0, 0)', // 빨강
                            data: [18, 18, 18, 18, 18, 18], // [Y 축] 데이터 평균 값으로 통일 실시
                            borderWidth: 1, // [막대 테두리 굵기 설정]

                            // 수치 데이터 표시
                            datalabels:{
                                color:'#000',                                 
                                font:{
                                    size:0
                                } 
                            }
                        },
                        {
                            label: '데이터', // [데이터 시트 제목]
                            type : 'bar', // 그래프 타입 'bar' 설정 (전체 타입과 같다면 생략가능)
                            data: [26, 19, 23, 5, 2, 3], // [Y 축] 데이터 표시 값 설정 [X 축 데이터 라벨에 맞게 지정]
                            barThickness: 100, // 막대 그래프 두께 설정 
                            backgroundColor: [ // [막대 배경 색상 : Red ~ Orange ]
                                // [하나 정의 시 - 그래프 모두 공통 색상 적용]
                                'rgba(75, 192, 192, 0.4)', // 초록

                                // [여러개 정의 시 - 데이터에 맞게 색상 각각 적용]
                                //'rgba(255, 99, 132, 0.4)', // 빨강
                                //'rgba(54, 162, 235, 0.4)', // 파랑 
                                //'rgba(255, 206, 86, 0.4)', // 노랑
                                //'rgba(75, 192, 192, 0.4)', // 초록
                                //'rgba(153, 102, 255, 0.4)', // 보라
                                //'rgba(255, 159, 64, 0.4)' // 오렌지
                            ],
                            borderColor: [ // [막대 테두리 색상 : Red ~ Orange ]
                                // [하나 정의 시 - 그래프 모두 공통 색상 적용]
                                'rgba(75, 192, 192, 1)', // 초록

                                // [여러개 정의 시 - 데이터에 맞게 색상 각각 적용]
                                //'rgba(255, 99, 132, 1)', // 빨강
                                //'rgba(54, 162, 235, 1)', // 파랑
                                //'rgba(255, 206, 86, 1)', // 노랑
                                //'rgba(75, 192, 192, 1)', // 초록
                                //'rgba(153, 102, 255, 1)', // 보라
                                //'rgba(255, 159, 64, 1)' // 오렌지
                            ],
                            borderWidth: 1, // [막대 테두리 굵기 설정]

                            // 수치 데이터 표시
                            datalabels:{
                                color:'#000',                                 
                                font:{
                                    size: 15,
                                    weight: 'normal'
                                } 
                            }
                        }                        
                    ]
                },


                // [차트 추가 옵션 속성 관련 지정 실시]
                options: {
                    plugins: {
                        title: { // [차트 타이틀 지정 실시]
                            display: true,
                            text: 'BAR CHART',
                            color: '#000', // [타이틀 폰트 색상]
                            font: { // [폰트 스타일 변경]
                                //family: 'Comic Sans MS',
                                family: 'Helvetica Neue',
                                //family: 'Helvetica',
                                size: 30,
                                weight: 'bold',
                                lineHeight: 1.2,                                
                            },
                            padding: {top: 20, left: 0, right: 0, bottom: 0}                            
                        },
                        // 수치 데이터 표시 위치 지정
                        datalabels: {
                            anchor :'end',
                            align :'top'
                        },
                        // datasets >> label 표시 여부 및 폰트 설정
                        legend: {
                            display: true,
                            labels: {
                                color: 'rgb(0, 0, 0)',
                                font: { // [폰트 스타일 변경]
                                    //family: 'Comic Sans MS',
                                    family: 'Helvetica Neue',
                                    //family: 'Helvetica',
                                    size: 15,
                                    weight: 'bold',
                                    //weight: 'normal',
                                    lineHeight: 1.2,   
                                } 
                            }
                        }
                    },
                    scales: {
                        y: { // [y 축 관련 설정] 
                            min: 0, // [y 축 데이터 설정 0 ~ 30 까지 제한]
                            max: 30,
                            grid: { // [y 축 데이터 시트 배경 선색 표시]
                                drawBorder: false,
                                color: function(context) {
                                    // y 축 값별로 그리드 선색 변경 실시
                                    if (context.tick.value >= 0) {
                                        return 'rgba(0, 0, 0, 0.1)'; // 검정
                                    }
                                    else {
                                        return 'rgba(255, 0, 0, 0.1)'; // 빨강
                                    }                                 
                                }
                            },
                            ticks: {
                                beginAtZero: true,
                                color: '#000', // [y 축 폰트 색상 설정]
                                font: { // [폰트 스타일 변경]
                                    //family: 'Comic Sans MS',
                                    family: 'Helvetica Neue',
                                    //family: 'Helvetica',
                                    size: 15,
                                    weight: 'bold',
                                    //weight: 'normal',
                                    lineHeight: 1.2,   
                                } 
                            }
                        },
                        x: { // [x 축 관련 설정] 
                            ticks: {
                                color: '#000', // [x 축 폰트 색상 설정]
                                font: { // [폰트 스타일 변경]
                                    //family: 'Comic Sans MS',
                                    family: 'Helvetica Neue',
                                    //family: 'Helvetica',
                                    size: 15,
                                    weight: 'bold',
                                    //weight: 'normal',
                                    lineHeight: 1.2,   
                                } 
                            }
                        }
                    }
                    /*
                    tooltips: {
                        enabled: false
                    },
                    hover: {
                        animationDuration: 0
                    }*/                   
                }
            });
        };





       
    </script>    

</head>









<body>

<!-- 타이틀 부분 -->
<div style="width: 80%; height: 10%; margin: 0 auto; padding: 0; border: 1px solid #000;
        float: top; position: relative; top: 5%; left: 0;">

    <!-- Bar 세로 막대 그래프 -->
    <div id="bar_vertical_container"
        style="width: 20%; height: 100%; margin: 0 auto; padding: 0; border: none; cursor: pointer; background: #999;
            float: left; position: relative; top: 0; left: 0; display: table; table-layout: fixed;"
        onclick="canvasSizeCheck(1);">
        <p style="display: table-cell; vertical-align: middle; text-align: center; color: #fff; font-weight: bold;">
            Bar 세로 막대
        </p>
    </div>
    
</div>



<!-- 차트 표시 영역 부분 -->
<div id="canvas_container" 
    style="width: 80%; height: 80%; margin: 0 auto; padding: 0; border: 1px solid #000;
        float: top; position: relative; top: 5%; left: 0;">    

    <!-- canvas에 실제로 차트가 그려진다 -->
    <canvas id="myBarHeightChart"></canvas> 

</div>

</body>

</html>
