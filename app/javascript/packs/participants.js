$( window ).on( "load", function() {
    function setYr(year) {
        $(".cyr").html(year);
        $(".cyr1").html(year - 1);
        $(".cyr2").html(year - 2);
        $(".cyr3").html(year - 3);
    }

    // Initial form load
    $(".section").hide();
    $("#emp-cont").show();
    $("#emp-nav").css("background", $("#emp-cont").css("border-left-color"));
    $("#emp-nav").css("color", "white");
    setYr(new Date().getFullYear());

    // Change sections
    $(".sec-nav").on("click", function() {
        $(".section").hide();
        $(".sec-nav").css("background", "white");
        $(".sec-nav").css("color", "black");
        $("#" + $(this)[0].id.replace("-nav","") + "-cont").show();
        $(this).css("background", $("#" + $(this)[0].id.replace("-nav","") + "-cont").css("border-left-color"));
        $(this).css("color", "white");
    })

    // Enforce Numbers
    $(".integer").on("keyup", function() {
        $(this).val(parseInt($(this).val()) || "")
    })

    // Enforce Years
    $(".year").on("keyup", function() {
        if ($(this).val().length > 4) {
            $(this).val($(this).val().substring(0,4));
        }
    })

    // Set Confidential Fields
    $("#participant_datayr").on("keyup", function() {
        setYr($("#participant_datayr").val());
    })
});