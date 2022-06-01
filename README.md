# ct-aws-hipaa-services-for-confluence

[![Build AWS HIPAA Services List](https://github.com/CU-CommunityApps/ct-aws-hipaa-services-for-confluence/actions/workflows/build-services-list.yml/badge.svg)](https://github.com/CU-CommunityApps/ct-aws-hipaa-services-for-confluence/actions/workflows/build-services-list.yml)

Workflow/script that collects the current list of HIPAA eligible services at AWS and then outputs an
HTML file embedded in this Confluence page: <https://confluence.cornell.edu/display/CLOUD/HIPAA+at+AWS>

## Contents

- `./src/index.js`
  - main script
- `./package.json`/`./package-lock.json`
  - script dependencies and dev/linter config
- `./docs/` (served via HTTPS by GH Pages)
  - `./docs/hipaa-services-list.json`
    - JSON file generated and used by script
    - <https://cu-communityapps.github.io/ct-aws-hipaa-services-for-confluence/hipaa-services-list.json>
  - `./docs/hipaa-services-list.html`
    - HTML file generated by  script and embedded in Confluence
    - <https://cu-communityapps.github.io/ct-aws-hipaa-services-for-confluence/hipaa-services-list.html>
- `./.github/dependabot.yml`
  - Dependabot config set to check daily for GH Actions and npm dependency updates
- `./.github/workflows/build-services-list.yml`
  - GH Action Workflow used to execute script/update repo
- Misc Development Related Files
  - Docker-related files included to help with local dev
    - `./Dockerfile`
    - `./.dockerignore`
    - `./docker-compose.yml`
  - Editor config files
    - `./.editorConfig`
    - `./jsconfig.json`

## Prerequisites

To run locally for testing, development, etc.

- Node.js >= v16.x (with npm >= v8.x)

OR

- Docker

## Behavior

Script makes HTTP call to AWS HIPAA Eligible Services Reference page and checks for updates to the page since the last time it ran.  Script outputs JSON and HTML files - JSON is used by the script and HTML is embedded into our Confluence page. Script only updates (writes new files) if the content has been updated.

## Local Development

- via Node.js/npm
  1. Install dependencies
      - `npm install`
  1. Execute script
      - `npm run dev` (or `npm start`)
- via Docker/docker-compose
  - `docker-compose up`
  - notes:
    - installs dependencies automatically while bringing container up
    - run to cleanup when you are done
      - `docker-compose down --rmi 'all'`
    - if both Docker and Node are installed, you can optionally use
      - `npm run docker-up`
        - the above command will  automatically call `npm run postdocker-up` when done and clean up after itself
