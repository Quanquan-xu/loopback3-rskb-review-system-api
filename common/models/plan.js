'use strict';

module.exports = function(Plan) {
    //Plan.app.models.Priority.
    Plan.beforeRemote('create', function(context, plan, next) {
      const asin = context.args.data.asin;
      const planID = new Date().toLocaleString('en-GB', {year: 'numeric', month: '2-digit', day: '2-digit',hour:'2-digit',minute:'2-digit', second:'2-digit'}).replace(/(\d+)\/(\d+)\/(\d+), (\d+):(\d+):(\d+)/, '$3$2$1$4$5$6') + "-" + asin;
      context.args.data.planID = planID;
      //context.args.data.publisherId = context.req.accessToken.userId;
      next();
    });
    Plan.afterRemote('create', function(context, plan, next) {
        Array.from(Array(plan.planNumber).keys()).forEach((ele, index)=>{
            const taskID = plan.planID + "-" + plan.planNumber + "-" + (index + 1)
            plan.tasks.create({
              id: taskID
            }, function(err, task) {
              if(err) return;
              console.log('Created task:', task);
              plan.orders.create({
                  id:task.id
                },function(err, order){
                  if(err) return;
                  console.log('Created order:', order);
                  plan.reviews.create({
                    id:order.id
                  },function(err, review){
                    if(err) return;
                    console.log('Created comment:', review);
                  });
              });
            });
        });
       // const message = {
       //    response:'Plan and Tasks init successfully!'+ plan.id
       // }
       // context.res.send(message);
       next();
    });
};
