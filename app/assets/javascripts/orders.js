$(document).ready(function() {
    $('#status-sort').change(function() {
        $('.orderwrapper').hide();
        var filter = $('#status-sort').val().toLowerCase();
        var ordersToShow;

        if(filter === 'all') ordersToShow = $('.orderwrapper');
        else ordersToShow = $('.status-' + filter);

        ordersToShow.show();
        $('#show-amt').text(ordersToShow.length);
    });
});
