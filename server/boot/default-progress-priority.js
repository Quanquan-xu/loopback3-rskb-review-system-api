
module.exports = function(app) {
  let taskPriority =  app.models.Priority;
  let reviewProgress =  app.models.ReviewProgress;
  let orderProgress =  app.models.OrderProgress;
  const defualtTaskPriority = [
    {code:1, english:"ORDER TASK CREATED DONE", chinese:"已创建订单任务", korean:"주문 작업 생성 완료"},
    {code:2, english:"ORDER NUMBER DONE", chinese:"已下单，待留评", korean:"주문 번호 완료"},
    {code:0, english:"ALL DONE", chinese:"已留评", korean:"모두 완료"},
    {code:-1, english:"DELETED", chinese:"已删除", korean:"삭제됨"}
  ];
  const defaultReviewProgress = [
    {code:1, english:"REVIEW TASK CREATED DONE", chinese:"已创建评论任务", korean:"작성된 작업 검토 완료"},
    {code:2, english:"REVIEW WRITED DONE", chinese:"已经写评论", korean:"작성된 검토 완료"}
  ];
  const defualtOrderProgress = [
    {code:1, english:"ORDER TASK CREATED DONE", chinese:"已创建订单任务", korean:"주문 작업 생성 완료"},
    {code:2, english:"ORDER NUMBER DONE", chinese:"已下单，待留评", korean:"주문 번호 완료"},
    {code:3, english:"ORDER REVIEW DONE", chinese:"已留评", korean:"주문 검토 완료"},
    {code:4, english:"ALL DONE", chinese:"已留评", korean:"모두 완료"},
    {code:5, english:"DELETED", chinese:"被删除", korean:"삭제됨"}
  ]
  defualtTaskPriority.forEach( function(element) {
      taskPriority.create(element, function(err, priorities) {
      if (err){
        //console.log(err['messages'])
        //console.log(err['messages'])
      } else{
        console.log('Created priorities:', priorities);
      }
    });
  });
  defaultReviewProgress.forEach( function(element) {
    reviewProgress.create(element, function(err, progresses) {
      if (err){
        //console.log(err['messages'])
        //console.log(err['messages'])
      } else{
        console.log('Created review progresses:', progresses);
      }
    });
  });
  defualtOrderProgress.forEach( function(element) {
    orderProgress.create(element, function(err, progresses) {
      if (err){
        //console.log(err['messages'])
        //console.log(err['messages'])
      } else{
        console.log('Created order progresses:', progresses);
      }
    });
  });
};
