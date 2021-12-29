# Null site

The barest minimum.

## Source Layout

## Build the site

Install [Pandoc](https://pandoc.org/) if necessary, then:

    bin/build.sh

The built site is in the `build` directory.

## View the site locally

Install Python if necessary, then:

    cd build
    python3 -m http.server

Test by going to [http://localhost:8000/](http://localhost:8000/)

## Deploy the site

Use Netlify to serve a static site from a repo on github/gitlab/bitbucket.

1. Add a new site.
  - a. Import an existing project: connect to the repo.
  - b. Authorize configuration on Github.
  - c. "Deploy settings" -> Basic build settings:
    - Base directory: leave blank (means toplevel of repo)
    - Build command: `bin/build.sh`
    - Publish directory: `build`
2. Click "Deploy Site" and wait for the site to be updated automatically.

Test by going to the site given by Netlify (like `https://distracted-goldfish-ab4928.netlify.app`).

## Point a domain at the site

1. Choose a domain for the site (like `foo.net`).  Buy a domain from [Namecheap](https://namecheap.com) if you want.
2. Go to the DNS provider (same as the domain registrar unless specified differently).
3. Go to Advanced DNS settings and add a new DNS record for `www`.
  - a. type: CNAME
  - b. hostname: `www` (or whatever host you want for the site page).
  - c. the hostname from Netlify (will end in netlify.app).  Remove the `https://` and the trailing `/`.
4. Configure Netlify to handle `www.foo.net`.
  - a. "Site Settings"
  - b. "Add a custom domain": `www.foo.net`
  - c. "Add domain"
  - d. click on "Provision certificate" to enable https
5. Add a DNS record to redirect the bare site (like https://foo.net, without any `www.`) to the `www` site.
  - a. type: URL Redirect
  - b. hostname: `@` (this means bare site)
  - c. target: `https://www.foo.net`

Test by going to your own site (like https://foo.net).

## View Netlify logs

Netlify will only publish updates to the site, if the site builds successfully.

If the site is build successfully locally, your best tool to diagnose the problem is to view the Deploy logs.

1. Click on "Site overview" on the site's netlify home page.
2. Click on the relevant deploy in the "Production deploys" section.
    - The topmost deploy is the most recent build.
    - There will be an label if a build was successfully "Published" or if its publishing "Failed".

On that page will be the "Deploy log" for that build.

---
