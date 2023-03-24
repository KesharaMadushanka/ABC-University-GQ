$(document).ready(function(){
    //load emp registration view
    $('#addEmp').click(function(){
        $('#loadView').load('emp/registerEmp.php');
    });
})

$(document).ready(function(){
    $('#viewEmp').click(function(){
        $('#loadView').load('emp/empList.php');
    })
})