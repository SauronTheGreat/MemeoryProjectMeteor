var stroke;
var luck;
var result;
var lb_score;
var innings_score;
var inns_score;
var total_runs;
var career_best;
var bowler;
var bowler_name;
var speed;
var easing;
var base_speed = 500;
var ball_count;

function exit_game() {
    $('#ball').fadeOut();
    $('#fullbar').fadeOut();
    $('#gamebox').fadeOut();
    $('#scorebox').fadeOut();
    $('#searchbox').fadeIn();
    $('#blackbox').fadeIn();
    $('.vco-toolbar').show();
    $('.inactiveBtn').hide();
    $('#sachinsprite').fadeIn();
    $('.score_text').each(function () {
        $(this).hide()
    });
    $('.marker .flag').fadeIn();
    $('.marker').eq(1).find('.flag').trigger("click");
}

function setBowler() {
    setTimeout(function () {
        $('.score_text').each(function () {
            $(this).show()
        });
    }, 1000);

    var bowler_type = parseInt(Math.random() * 10);
    bowler = 1 + (2 - parseInt(Math.random() * 4)) / 10
    switch (bowler_type) {
        case 0:
            $('#bowler_type').html("Allan Donald: Very, very Quick");
            speed = base_speed * bowler;
            easing = "linear";
            break;
        case 1:
            $('#bowler_type').html("Waqar Younis: Tricky as always");
            speed = base_speed * 1.5 * bowler;
            easing = "easeInExpo";
            break;
        case 2:
            $('#bowler_type').html("Wasim Akram: Quick and Deceptive");
            speed = base_speed * 1.5 * bowler;
            easing = "easeInCirc";
            break;
        case 3:
            $('#bowler_type').html("Curtly Ambrose: Fast and Furious");
            speed = base_speed * 1.5 * bowler;
            easing = "easeInOutExpo";
            break;
        case 4:
            $('#bowler_type').html("Muralidharan: Play him late");
            speed = base_speed * 4 * bowler;
            easing = "easeInElastic";
            break;
        case 5:
            $('#bowler_type').html("Shane Warne: Flipper! Watch Out!");
            speed = base_speed * 3 * bowler;
            easing = "easeInBounce";
            break;
        case 6:
            $('#bowler_type').html("Shane Warne: Flipper! Watch Out!");
            speed = base_speed * 3 * bowler;
            easing = "easeInBounce";
            break;
        case 7:
            $('#bowler_type').html("Glen McGrath: Slow, but Deceptive");
            speed = base_speed * 2 * bowler;
            easing = "easeInQuint";
            break;
        case 8:
            $('#bowler_type').html("Shahid Afridi: You'll figure him out");
            speed = base_speed * 4 * bowler;
            easing = "easeInBounce";
            break;
        case 9:
            $('#bowler_type').html("Waqar Younis: Tricky as always");
            speed = base_speed * 1.5 * bowler;
            easing = "easeInExpo";
            break;

    }
}

function calculate_runs(stroke, luck) {
    if (stroke < 0.2 & luck < 0.4) {
        result = "Out";
        lb_score = -1;
        inns_score = innings_score;
        innings_score = 0;
    } else {
        if (stroke < 0.2 & luck < 0.8) {
            result = "0 run"
            lb_score = 0;
        } else {
            if (stroke < 0.2) {
                result = "1 run";
                lb_score = 1;
                total_runs += 1;
                innings_score += 1;
            } else {
                if (stroke < 0.45 & luck < 0.3) {
                    lb_score = 0;
                    result = "0 run"
                } else {
                    if (stroke < 0.45 & luck < 0.8) {
                        result = "1 run";
                        lb_score = 1;
                        total_runs += 1;
                        innings_score += 1;
                    } else {
                        if (stroke < 0.45) {
                            result = "2 runs";
                            lb_score = 2;
                            total_runs += 2;
                            innings_score += 2;
                        } else {
                            if (stroke == 0.5 & luck < 0.7) {
                                result = "4 runs";
                                lb_score = 4;
                                total_runs += 4;
                                innings_score += 4;
                            } else {
                                if (stroke == 0.5) {
                                    result = "6 runs";
                                    lb_score = 6;
                                    total_runs += 6;
                                    innings_score += 6;
                                } else {
                                    if (stroke < 0.65 & luck < 0.3) {
                                        result = "3 runs";
                                        lb_score = 3;
                                        total_runs += 3;
                                        innings_score += 3;
                                    } else {
                                        if (stroke < 0.65 & luck < 0.7) {
                                            result = "4 runs";
                                            lb_score = 4;
                                            total_runs += 4;
                                            innings_score += 4;
                                        } else {
                                            if (stroke < 0.65) {
                                                result = "6 runs";
                                                lb_score = 6;
                                                total_runs += 6;
                                                innings_score += 6;
                                            } else {
                                                if (stroke < 0.9 & luck < 0.4) {
                                                    lb_score = 1;
                                                    result = "1 run";
                                                    total_runs += 1;
                                                    innings_score += 1;
                                                } else {
                                                    if (stroke < 0.9 & luck < 0.5) {
                                                        lb_score = 2;
                                                        result = "2 runs"
                                                        total_runs += 2;
                                                        innings_score += 2;
                                                    } else {
                                                        if (stroke < 0.9) {
                                                            lb_score = 0;
                                                            result = "0 runs"
                                                        } else {
                                                            if (luck < 0.7) {
                                                                lb_score = 0;
                                                                result = "0 runs"
                                                            } else {
                                                                lb_score = -1;
                                                                result = "Out"
                                                                inns_score = innings_score;
                                                                innings_score = 0;
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

function gameturn() {

    ball_count += 1;
    $('#ball').stop();
    //        $('.inactiveBtn').hide();
    stroke = (-parseInt($('#ball').css('margin-left').split("px")[0]) ) / parseInt(window.innerWidth * 0.52);
    luck = Math.random();
    calculate_runs(stroke, luck);
    //************************* Building Functinality for matching score**********//
    //console.log(lb_score);
    ss1 = $($('.' + lb_score)[Math.floor(Math.random() * $('.' + lb_score).length)]).find('.card_score').val();
    var randcard = parseInt($('input.id_no[value=' + ss1 + ']').prev().val())
    //var randcard = Math.min(parseInt($('.marker').length * Math.random() + 1), $('.marker').length)
    $('.marker').eq(randcard).find('.flag').trigger("click");

    $('#score_splash').html(result);
    $('#score_splash').css({
        fontSize: "5px",
        opacity: "1"
    })
    $('#score_splash').animate({
        fontSize: "40px",
        opacity: "0"
    }, 2000);

    $('#scorebox').html("<h3 style='padding: 0;margin: 0'>Score: " + innings_score + " runs</h3>");
    $('#scorebox').append("Last Ball: " + result);
    $('#innings_score').html("Innings Score: <br/> " + innings_score + " runs.");
    $('#total_runs').html("Career Runs: " + total_runs + " runs");
    if (innings_score > career_best) {
        career_best = innings_score;
        $('#career_best').html("Career Best: " + career_best + " runs");
    }

//        $('.slider-item').eq(randcard).find('.score').first().html(result);

    setTimeout(function () {
        if (result == "Out") {
            var data = {i_score: []}
            data["i_score"].push(inns_score);
            $.ajax({
                url: "/update_score",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify(data),
                success: function (data) {
                    inns_score = 0;
                }
            });

            $.ajax({
                url: "/unlock_trophy/" + inns_score,
                type: "get",
                contentType: "application/json",
                success: function (data) {
                    if (data != "Nothing to Unlock") {
                        //alert(data.name)
                        $("#" + data.name).find('img').attr('src', '/assets/trophy1.png');
                        $("#" + data.name).click(function () {
                            show_trophy(data.name);
                        });
                    }

                }
            });
            $('#ball').css({
                marginLeft: 0
            })
            exit_game();
            $('.inactiveBtn').css('pointer-events', 'auto');
        } else {
            $('#gamebox').fadeOut();
            $('#ball').css({
                marginLeft: 0
            })
            $('.marker .flag').hide();
            $('.marker').eq(randcard).find('.flag').show();
            setTimeout(function () {
                setBowler();
                $('#playgame').fadeIn();
                $('#gamebox').fadeIn();
                $('.inactiveBtn').css('pointer-events', 'auto');
            }, 2000)
        }
    }, 1000)
}
$(function () {
    innings_score = 0;
    total_runs = 0;
    career_best = 0;
    $('#scorebox').html("<h3 style='padding: 0;margin: 0'>Score: " + innings_score + " runs</h3>");
    $('#scorebox').append("Last Ball: - ");
    $('#total_runs').html("Career Runs: " + total_runs);
    $('#career_best').html("Career Best: " + career_best);
    $('#ball').fadeIn();
    setBowler();
    $('img.inactiveBtn').on("mousedown", function () {
        $('#ball').animate({
            marginLeft: "-=" + window.innerWidth * 0.52 + "px"
        }, speed, easing, function () {
            gameturn();
        });
    });

    $('.inactiveBtn').on("mouseup", function () {
        $(this).css('pointer-events', 'none');
        gameturn();
    });

    $('.chosenbox').change(function () {
        var randcard = (25 - $(this).val()) * 5;
        $('.marker').eq(randcard).find('.flag').trigger("click");
    });

})
