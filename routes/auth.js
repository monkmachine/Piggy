
function isAuthenticated(req, res, next) {

    if ("true" == "true")
        return next();
        return res(req);
        
  
    res.redirect('/');
  }

  module.exports = isAuthenticated;
