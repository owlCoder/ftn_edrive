$(document).ready(function(){
  
    let forma=$("form");
    forma.submit(function(event){
        let inputEl=$("input[name=ime]");
        console.log(inputEl.val())
        alert("Submit dogadjaj");
        event.preventDefault();
    });
});
/*
$(document).ready(function(){
    let inputEl=$("input[name=ime]");

    $("form").submit(function(event){
        let ime=inputEl.val();
        let allTds=$('td');
        let td=allTds[1];
        if(ime==''){
            td.append("Unesite ime");
            $(allTds[0]).css("color", "red");
        }
         event.preventDefault();

    });
});
*/
