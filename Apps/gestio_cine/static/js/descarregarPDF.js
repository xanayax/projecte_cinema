
$('#download').click(function () {
    const resum = document.getElementById("resum");
    console.log(resum);
    html2pdf(resum);
});