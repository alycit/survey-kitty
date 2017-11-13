var questionCount = 0;
var answerCount = 0;

$(document).ready(function() {
  $("#addQuestion").on("click", function(event){
    event.preventDefault();

    questionCount++;
    answerCount = 0;

    $(".fields").append(`
        <div class="question">
          <label for="survey[question${questionCount}][text]">Question ${questionCount}: <label><input type="text" name="survey[question${questionCount}][text]">
        </div>
      `);
    $(this).hide()
    $("#completeSurvey").hide();
    $("#addChoice").show()
    $("#completeQuestion").show();
  });

  $("#addChoice").on("click", function(event){
    event.preventDefault();

    answerCount++;

    $(".fields").append(`
      <div class="choice">
        <label for="survey[question${questionCount}][answer${answerCount}][text]">Answer ${answerCount}: <label><input type="text" name="survey[question${questionCount}][answer${answerCount}][text]">
      </div>
      `);
  });

  $("#completeQuestion").on("click", function(event){
    event.preventDefault();
    $(this).hide()
    $("#addChoice").hide();
    $("#addQuestion").show()
    $("#completeSurvey").show();
  });
});
