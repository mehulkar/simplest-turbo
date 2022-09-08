const fs = require("fs");

const pkg = require("./apps/web/package.json");

const newts = +Date.now();

if (pkg.description.match(/\-ts\d+/)) {
  pkg.description = pkg.description.replace(/\-ts\d+/, `-ts${newts}`);
} else {
  pkg.description += `-ts${newts}`;
}

const newpkg = JSON.stringify(pkg, null, 2);

fs.writeFileSync("./apps/web/package.json", newpkg);
