const doPost = (request) => {
  console.log(request);
  
  var form = FormApp.openById('1NYSpTy4Zl7ZS1Pm584QfClivHJia1y5GUP6lM6Bh2fE');

  var questions = form.getItems();
  var q1 = questions[0].asTextItem();
  var q2 = questions[1].asTextItem();
  var q3 = questions[2].asTextItem();
  var q4 = questions[3].asTextItem();
  var q5 = questions[4].asTextItem();

  results = JSON.parse(request.postData.contents)

  var q1_name = q1.createResponse(results["name"])
  var q2_rank = q2.createResponse(results["rank"])
  var q3_pos = q3.createResponse(results["position"])
  var q4_det = q4.createResponse(results["detachment"])
  var q5_email = q5.createResponse(results["email"])

  var FormResponse = form.createResponse();
  FormResponse.withItemResponse(q1_name);
  FormResponse.withItemResponse(q2_rank);
  FormResponse.withItemResponse(q3_pos);
  FormResponse.withItemResponse(q4_det);
  FormResponse.withItemResponse(q5_email);

  FormResponse.submit();

  return ContentService.createTextOutput(JSON.stringify("Success"));
};