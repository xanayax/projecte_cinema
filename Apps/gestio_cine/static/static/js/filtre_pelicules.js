$.ajax({
     url: "{% url 'cartellera' %}",
     method: 'GET',
     data : {
             filter_category: parseInt(airlineSelected)
     },
     success: function(data){
         console.log(data)
     },
     error: function(xhr, errmsg, err){
         console.log("error")
         console.log(error_data)
     }
});