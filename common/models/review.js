'use strict';

module.exports = function(Review) {
    Review.observe('before save', function(ctx, next) {
        if(ctx.currentInstance && ctx.where){
            if(ctx.data.title && ctx.data.content){
                Review.upsertWithWhere(ctx.where, {finish:true, priority:3}, function(err, review) {
                })
                Review.app.models.Task.upsertWithWhere(ctx.where, {reviewProgress:2}, function(err, task){
                })
            }
            if(ctx.data.note){
                Review.app.models.Order.upsertWithWhere(ctx.where, {message:ctx.data.note}, function(err, order){
                })
            }
        }
        next();
    });
};
