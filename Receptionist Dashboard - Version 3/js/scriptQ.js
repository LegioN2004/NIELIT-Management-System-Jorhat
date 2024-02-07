$(document).ready(function () {
    // Load initial content
    $('#rightpart').load('dashboard.html');

    // Handle menu item clicks
    $('a.side-button').click(function () {
        var file = $(this).data('file');
        $('#rightpart').load(file);
    });
    
});
