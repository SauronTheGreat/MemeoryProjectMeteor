Template.game.rendered = ()->

 setTimeout ()->
    $("body").append("<script type='text/javascript' src='/js/loadtester.js'></script>")
    setBowler = ->
      bowler = Math.random()
      ball_count = 0
      if bowler < 0.5
        $("#bowler_type").html "Pace Bowler<br/>"
        bowler_speed = (10 - parseInt(bowler * 10))
        i = 0
        while i < bowler_speed
          $("#bowler_type").append "<img src='/images/rocket.png' style='width:32px;'>"
          i++
        speed = base_speed * bowler
        easing = "linear"
      else
        bowler = Math.min(5, bowler)
        $("#bowler_type").html "Spin Bowler <br/>"
        bowler_speed = (10 - parseInt(bowler * 10))
        i = 0
        while i < bowler_speed
          $("#bowler_type").append "<img src='/images/spin.png' style='width:32px;'>"
          i++
        speed = base_speed * 2 * bowler
        easing = "easeInBounce"
    stroke = undefined
    luck = undefined
    result = undefined
    innings_score = undefined
    total_runs = undefined
    career_best = undefined
    bowler = undefined
    speed = undefined
    easing = undefined
    base_speed = 1000
    ball_count = undefined
    $ ->
      innings_score = 0
      total_runs = 0
      career_best = 0
      $("#innings_score").html "Innings Score: " + innings_score
      $("#total_runs").html "Career Runs: " + total_runs
      $("#career_best").html "Career Best: " + career_best
      setBowler()
      $("#play").on "mousedown", ->
        $("#stroker").animate
          height: "100%"
        , speed, easing

      $("#play").on "mouseup", ->
        ball_count += 1
        $("#stroker").stop()
        $("#play").hide()
        stroke = $("#stroker").height() / $("#fullbar").height()
        luck = Math.random()
        if stroke < 0.2 & luck < 0.4
          result = "Out"
          innings_score = 0
        else
          if stroke < 0.2 & luck < 0.8
            result = "0 run"
          else
            if stroke < 0.2
              result = "1 run"
              total_runs += 1
              innings_score += 1
            else
              if stroke < 0.6 & luck < 0.3
                result = "0 run"
              else
                if stroke < 0.6 & luck < 0.8
                  result = "1 run"
                  total_runs += 1
                  innings_score += 1
                else
                  if stroke < 0.6
                    result = "2 runs"
                    total_runs += 2
                    innings_score += 2
                  else
                    if stroke is 0.65 & luck < 0.7
                      result = "4 runs"
                      total_runs += 4
                      innings_score += 4
                    else
                      if stroke is 0.65
                        result = "6 runs"
                        total_runs += 6
                        innings_score += 6
                      else
                        if stroke < 0.75 & luck < 0.3
                          result = "3 runs"
                          total_runs += 3
                          innings_score += 3
                        else
                          if stroke < 0.75 & luck < 0.7
                            result = "4 runs"
                            total_runs += 4
                            innings_score += 4
                          else
                            if stroke < 0.75
                              result = "6 runs"
                              total_runs += 6
                              innings_score += 6
                            else
                              if stroke < 0.9 & luck < 0.4
                                result = "1 run"
                                total_runs += 1
                                innings_score += 1
                              else
                                if stroke < 0.9 & luck < 0.5
                                  result = "2 runs"
                                  total_runs += 2
                                  innings_score += 2
                                else
                                  if stroke < 0.9
                                    result = "0 runs"
                                  else
                                    if luck < 0.7
                                      result = "0 runs"
                                    else
                                      result = "Out"
                                      innings_score = 0
        $("#innings_score").html "Innings Score: " + innings_score + " runs. Over" + ball_count + "/6"
        $("#total_runs").html "Career Runs: " + total_runs + " runs"
        if innings_score > career_best
          career_best = innings_score
          $("#career_best").html "Career Best: " + career_best + " runs"
        $("#score").html result
        setTimeout (->
          $("#play").fadeIn()
          $("#stroker").animate
            height: "0"
          , 500
          setBowler()  if ball_count is 6
        ), 1000
 ,1000

@godgone = ->
  $(".marker").eq(0).find(".flag").trigger "click"
  $("#blackbox").hide()
  $("#searchbox").hide()
  $("#gameModeBtn").hide()
  $("#sachinsprite").hide()

  #            $('#sachinsprite').attr('src', '/assets/stance.png');
  $(".inactiveBtn").fadeIn()
  $(".vco-toolbar").hide()
  $("#playgame").fadeIn()
  $("#fullbar").fadeIn()
  $("#gamebox").fadeIn()
  $("#scorebox").fadeIn()
  $("#bowler_type").fadeIn()
  $("#ball").fadeIn()
  $(".nav-next").fadeOut()
  $(".flag").fadeOut()
  $(".marker").eq(0).find(".flag").trigger "click"
  $(".score_text").each ->
    $(this).show()

  setTimeout (->
    $(".score_text").first().hide()
  ), 1000