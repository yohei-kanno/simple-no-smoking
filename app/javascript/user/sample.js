window.onload  = function(){
  setInterval((function showTime(){
    var t = `${gon.time++}`;
    d=Number(""+(t/864000|0)+(t/86400%10|0)).toLocaleString()
    h=""+(t/36000/3600|0)+(t/3600/60%10|0)
    m=""+(t%3600/600|0)+(t%3600/60%10|0)
    s=""+(t%60/10|0)+(t%60%10)
    D=d+"日"+h+"時間"+m+"分"+s+"秒経過"
    document.getElementById("showTime").innerHTML = D;
    return showTime
  }()),1000);
}
