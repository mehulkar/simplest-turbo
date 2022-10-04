const fs = require("fs");
const path = require("path");

const fileName = process.argv[2];

const p = path.join(process.cwd(), fileName);
const pkg = require(p);

const newts = +Date.now();

if (pkg.description.match(/\-ts\d+/)) {
  pkg.description = pkg.description.replace(/\-ts\d+/, `-ts${newts}`);
} else {
  pkg.description += `-ts${newts}`;
}

const newpkg = JSON.stringify(pkg, null, 2);

fs.writeFileSync(p, newpkg);
