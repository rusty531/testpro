<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>chart_json.html</title>
</head>
<body>
<div style="width:450px;margin:auto">
  <div>
    <input type="button" value="click" id="jsonLoad">
  </div>
  <div id="target"></div>
  <div id="chart1"></div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://d3js.org/d3.v3.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.4.11/c3.min.js"></script>
<script>
  $(function(){
    $('#jsonLoad').click(function(){
        //alert('click');
        $.ajax({
            // url:'http://192.168.0.36:9000/shop/loadjsonp?callback',
            url:'http://13.209.35.2:9000/shop/loadjsonp?callback',
            type:'GET',
            dataType:'jsonp',
            jsonp:'callback',
            success:function(data){
                console.log(data.columns);
                console.log('**********************');
                console.log(data.data);
                makeBarChart(data.data, data.columns);
            },
            error:function(data){
            	console.log("error>>"+$('#target').text())
            }
        });
    });
    function makeBarChart(jsonData,dcol){
        var datas = [];
        //n개의 컬럼
        var dcolumns = dcol.slice(1, dcol.length);
        //console.log(dcolumns);
        for(var key in jsonData){
            datas.push(jsonData[key]);
        }
        console.log("---------------1");
        console.log(datas)
        var chart = c3.generate({
            bindto:'#chart1',
            data: {
                columns: datas,
                type:'bar',
           },
           bar: {
                width: {
                    ratio: 0.5
                }
            },
            axis:{
                x:{
                    type:'category',
                    categories:dcolumns
                }
            }
        });
    }
  });
</script>
</body>
</html>