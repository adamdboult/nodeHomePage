// Only allow letters, numbers, "_" and "-" in page names taken from the URL.
// Stops URLs like /theory/..%2F..%2Fsomething reaching files outside theory/.
function isSafeName(name) {
  return /^[a-zA-Z0-9_-]+$/.test(name);
}

module.exports = function (app) {
  app.get("/", function (req, res) {
    res.render("home");
  });

  app.get("/home", function (req, res) {
    res.render("home");
  });

  app.get("/theory", function (req, res) {
    res.redirect("/");
  });

  app.get("/about", function (req, res) {
    res.render("about", { user: req.user });
  });

  // DYNAMIC
  app.get("/theory/:area", function (req, res) {
    if (!isSafeName(req.params.area)) {
      return res.render("404", { url: req.url });
    }
    res.render("theory/" + req.params.area, {}, function (err, html) {
      if (err) {
        console.log(err);
        res.render("404", { url: req.url });
      } else {
        res.send(html);
      }
    });
  });

  app.get("/theory/:area/:subject", function (req, res) {
    if (!isSafeName(req.params.area) || !isSafeName(req.params.subject)) {
      return res.render("404", { url: req.url });
    }
    res.render(
      "theory/" + req.params.area + "/" + req.params.subject,
      {},
      function (err, html) {
        if (err) {
          console.log(err);
          res.render("404", { url: req.url });
        } else {
          res.send(html);
        }
      },
    );
  });
  app.get("/theory/:area/:subject/:subsubject", function (req, res) {
    if (
      !isSafeName(req.params.area) ||
      !isSafeName(req.params.subject) ||
      !isSafeName(req.params.subsubject)
    ) {
      return res.render("404", { url: req.url });
    }
    res.render(
      "theory/" +
        req.params.area +
        "/" +
        req.params.subject +
        "/" +
        req.params.subsubject,
      {},
      function (err, html) {
        if (err) {
          res.render("404", { url: req.url });
        } else {
          res.send(html);
        }
      },
    );
  });
};
