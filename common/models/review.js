'use strict';

module.exports = function(Review) {
    Review.observe('before save', function(ctx, next) {
        if(ctx.currentInstance){
            if(ctx.currentInstance.title && ctx.currentInstance.content){
                ctx.data['status'] = false
            }
        }
        console.log('supports isNewInstance?', ctx.currentInstance);
        next();
        }
    );
};
