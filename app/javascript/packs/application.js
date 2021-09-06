// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"

Rails.start()
//Turbolinks.start()
ActiveStorage.start()

$(window).on("load", function() {
    const setHeader = () => {
        console.log($("header").height());
        $("#content").css("top", $("header").height() + 30);
    }

    setHeader();

    $("nav li").on("mouseenter", function() {
        $(this).find(".nav-static").hide();
        $(this).find(".nav-hover").show();

        $(this).children("ul").animate({
              height: 300
        }, 500, function() {

        })
    }).on("mouseleave", function() {
        $(this).find(".nav-static").show();
        $(this).find(".nav-hover").hide();

        $(this).find("ul").animate({
            height: 0
        }, 300, function() {

        })
    })

    $(window).on("resize", function() {
        setHeader()
    });
});