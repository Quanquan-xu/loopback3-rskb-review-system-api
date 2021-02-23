'use strict';

module.exports = function(Order) {
    Order.observe('before save', function(ctx, next) {
        if(ctx.currentInstance && ctx.where){
            if(ctx.data.orderNumber && !ctx.data.postDate && !ctx.data.postBy){
                Order.app.models.Task.upsertWithWhere(ctx.where, {orderProgress:2}, function(err, task){
                })
            }
            if(ctx.data.postDate && ctx.data.postBy){
                Order.app.models.Task.upsertWithWhere(ctx.where, {orderProgress:3}, function(err, task){
                })
            }
            if(ctx.data.note){
                Order.app.models.Review.upsertWithWhere(ctx.where, {message:ctx.data.note}, function(err, task){
                })
            }
        }
        next();
    });
};
