#!/bin/bash
: '
=======================================================
		  Get Project Details
=======================================================
'
echo "------------------------------------"
PROMPT="What is the Project Name? "
read -p "$PROMPT" PROJECT_NAME
echo "------------------------------------"
PROMPT="What is the Project Description? "
read -p "$PROMPT" PROJECT_DESCRIPTION
echo "------------------------------------"
PROMPT="What is the Entry Point (index.js)? "
read -p "$PROMPT" ENTRY_POINT
if [[ ${ENTRY_POINT} == "" ]]; then
ENTRY_POINT=index.js
fi
echo "------------------------------------"
PROMPT="What is the Git Repository? "
read -p "$PROMPT" GIT_REPO
echo "------------------------------------"
PROMPT="Who is the Author? "
read -p "$PROMPT" AUTHOR
echo "------------------------------------"
PROMPT="Is this a React Project (yes or no)? "
read -p "$PROMPT" REACT_PROJECT
echo "------------------------------------"
: '
=======================================================
		  Create package.json
=======================================================
'
if [[ ${REACT_PROJECT} == "y" ]] \
|| [[ ${REACT_PROJECT} == "yes" ]] \
|| [[ ${REACT_PROJECT} == "Y" ]] \
|| [[ ${REACT_PROJECT} == "YES" ]] \
|| [[ ${REACT_PROJECT} == "Yes" ]] \
|| [[ ${REACT_PROJECT} == "yES" ]]; then
npx create-react-app "${PROJECT_NAME}"
cd "${PROJECT_NAME}"
rm -f .gitignore
cat << EOF > package.json
{
  "name": "${PROJECT_NAME}",
  "version": "1.0.0",
  "description": "${PROJECT_DESCRIPTION}",
  "private": true,
  "author": "${AUTHOR}",
  "license": "ISC",
  "scripts": {
    "start": "react-scripts start",
    "build": "react-scripts build",
    "test": "react-scripts test",
    "eject": "react-scripts eject"
  },
  "eslintConfig": {
    "extends": [
      "react-app",
      "react-app/jest"
    ]
  },
  "browserslist": {
    "production": [
      ">0.2%",
      "not dead",
      "not op_mini all"
    ],
    "development": [
      "last 1 chrome version",
      "last 1 firefox version",
      "last 1 safari version"
    ]
  }
}
EOF
npm install \
@testing-library/jest-dom \
@testing-library/react \
@testing-library/user-event \
react \
react-dom \
react-scripts \
web-vitals
npm install --save-dev \
eslint \
eslint-config-airbnb \
eslint-config-prettier \
eslint-plugin-html \
eslint-plugin-no-unsanitized \
eslint-plugin-node \
eslint-plugin-prettier \
eslint-plugin-prototype-pollution-security-rules \
eslint-plugin-react \
eslint-plugin-scanjs-rules \
prettier
rm -drf .git/
else
mkdir "${PROJECT_NAME}" && cd "${PROJECT_NAME}"
touch package.json
cat << EOF > package.json
{
  "name": "${PROJECT_NAME}",
  "version": "1.0.0",
  "description": "${PROJECT_DESCRIPTION}",
  "main": "${ENTRY_POINT}",
  "scripts": {
    "start": "node ${ENTRY_POINT}"
  },
  "author": "${AUTHOR}",
  "license": "ISC"
}
EOF
npm install --save-dev \
eslint \
eslint-config-airbnb \
eslint-config-prettier \
eslint-plugin-html \
eslint-plugin-no-unsanitized \
eslint-plugin-node \
eslint-plugin-prettier \
eslint-plugin-prototype-pollution-security-rules \
eslint-plugin-react \
eslint-plugin-scanjs-rules \
prettier
touch ${ENTRY_POINT}
touch README.md
fi
: '
=======================================================
		  Create ESLint File
=======================================================
'
touch .eslintrc.json
cat << EOF > .eslintrc.json
{
  "extends": ["airbnb-base", "plugin:prettier/recommended", "plugin:react/recommended", "plugin:node/recommended"],
  "plugins": ["html", "no-unsanitized", "prettier", "prototype-pollution-security-rules", "scanjs-rules"],
  "parserOptions": {
    "sourceType": "module",
    "ecmaFeatures": { "jsx": true }
  },
  "env": {
    "browser": true,
    "commonjs": true,
    "es2021": true,
    "node": true
  },
  "rules": {
    "prettier/prettier": "error",
    /** ESLint rules **/
    "arrow-body-style": ["error", "as-needed"],
    "arrow-parens": ["error", "always"],
    "func-style": ["error", "expression"],
    "eqeqeq": "error",
    "new-cap": "error",
    "no-eval": "error",
    "no-implied-eval": "error",
    "no-invalid-this": "error",
    "no-new-func": "error",
    "no-param-reassign": "error",
    "no-plusplus": "error",
    "no-var": "error",
    "no-with": "error",
    "prefer-arrow-callback": "error",
    "prefer-const": "error",
    "prefer-destructuring": [
      "error",
      {
        "array": true,
        "object": true
      },
      {
        "enforceForRenamedProperties": true
      }
    ],
    /** ScanJS rules **/
    "scanjs-rules/accidental_assignment": "warn",
    "scanjs-rules/assign_to_hostname": "warn",
    "scanjs-rules/assign_to_href": "warn",
    "scanjs-rules/assign_to_location": "warn",
    "scanjs-rules/assign_to_onmessage": "warn",
    "scanjs-rules/assign_to_pathname": "warn",
    "scanjs-rules/assign_to_protocol": "warn",
    "scanjs-rules/assign_to_search": "warn",
    "scanjs-rules/assign_to_src": "warn",
    "scanjs-rules/call_Function": "warn",
    "scanjs-rules/call_addEventListener": "warn",
    "scanjs-rules/call_addEventListener_deviceproximity": "warn",
    "scanjs-rules/call_addEventListener_message": "warn",
    "scanjs-rules/call_connect": "warn",
    "scanjs-rules/call_eval": "error",
    "scanjs-rules/call_execScript": "warn",
    "scanjs-rules/call_hide": "warn",
    "scanjs-rules/call_open_remote=true": "warn",
    "scanjs-rules/call_parseFromString": "warn",
    "scanjs-rules/call_setImmediate": "warn",
    "scanjs-rules/call_setInterval": "warn",
    "scanjs-rules/call_setTimeout": "warn",
    "scanjs-rules/identifier_indexedDB": "warn",
    "scanjs-rules/identifier_localStorage": "warn",
    "scanjs-rules/identifier_sessionStorage": "warn",
    "scanjs-rules/new_Function": "warn",
    "scanjs-rules/property_addIdleObserver": "warn",
    "scanjs-rules/property_createContextualFragment": "warn",
    "scanjs-rules/property_crypto": "warn",
    "scanjs-rules/property_geolocation": "warn",
    "scanjs-rules/property_getUserMedia": "warn",
    "scanjs-rules/property_indexedDB": "warn",
    "scanjs-rules/property_localStorage": "warn",
    "scanjs-rules/property_mgmt": "warn",
    "scanjs-rules/property_sessionStorage": "warn",
    /** no-unsanitized rules**/
    "no-unsanitized/method": "error",
    "no-unsanitized/property": "error",
    /** prototype-pollution-security-rules rules**/
    "prototype-pollution-security-rules/detect-merge": "warn",
    "prototype-pollution-security-rules/detect-merge-objects": "warn",
    "prototype-pollution-security-rules/detect-merge-options": "warn",
    "prototype-pollution-security-rules/detect-deep-extend": "warn",
    /** Node.js rules **/
    "node/exports-style": ["error", "module.exports"],
    "node/file-extension-in-import": ["error", "always"],
    "node/prefer-global/buffer": ["error", "always"],
    "node/prefer-global/console": ["error", "always"],
    "node/prefer-global/process": ["error", "always"],
    "node/prefer-global/url-search-params": ["error", "always"],
    "node/prefer-global/url": ["error", "always"],
    "node/prefer-promises/dns": "error",
    "node/prefer-promises/fs": "error"
  }
}
EOF
: '
=======================================================
		  Create Prettier File
=======================================================
'
touch .prettierrc.json
cat << EOF > .prettierrc.json
{
  "trailingComma": "all",
  "useTabs": false,
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true,
  "printWidth": 150
}
EOF
: '
=======================================================
		  Initialize Git and Create .gitignore
=======================================================
'
git init
touch .gitignore
cat << EOF > .gitignore
# See https://help.github.com/articles/ignoring-files/ for more about ignoring files.

# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

#Snyk
.dccache
EOF
