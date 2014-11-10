
// FIXME: fix month number as I did with the day
function set_user_timezone(mm, dd, yyyy, hh, min) {
    var min_offset = new Date().getTimezoneOffset();
    var hour_offset = Math.floor(min_offset / 60);
    var tmp = hh + hour_offset;

    dd = dd + Math.floor(tmp / 24);
    hh = tmp % 24;    
    document.write(mm.toString() + '/' + dd.toString() + '/' + yyyy.toString() + ' at ' + hh.toString() + ':' + min.toString());
}