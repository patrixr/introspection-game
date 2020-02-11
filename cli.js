#!/usr/bin/env node

const { execSync }              = require('child_process');
const { readdirSync, statSync } = require('fs');
const { join }                  = require('path');

const command = process.argv[2];

function runTests(dir) {
  readdirSync(dir).forEach(function(file) {
    const path = join(dir, file);
    if (statSync(path).isDirectory()) {
      runTests(path);
    }
    else if (/_test.moon/.test(file)) {
      execSync(`LOVE_ENV=test moon ${path}`, {stdio: 'inherit'})
    }
  });
};

switch (command) {
  case 'test':
    runTests(join(__dirname, 'tests'));
}