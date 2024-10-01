# ThreatX User Documentation Site and Playbook Project

This is a playbook project for the ThreatX User Documentation site.

It is only for orchestrating the Antora site generation process and not for storing the actual content.

Antora is a static site generator that generates documentation sites from AsciiDoc files.

The UI for this site is in another repository: [threatx-docs-ui](https://github.com/ThreatX/threatx-docs-ui).

## Links

* [Introduction to Documentation-as-Code](docs/docs-as-guide-introl.md)
* [Why Use Antora?](docs/antora-intro.md)
* [Style and Formatting Guide Or Documentation Authors](docs/style-guide.md)

---


## Antora Playbook

An `antora-playbook.yml` can be found in the project root and is responsible for generating a documentation site.
It contains the instructions a user wants to relay to the Antora site generator.
These instructions include the content Antora should collect and the UI it should apply to the generated site.

The Antora build process will fetch a UI bundle (zip file) and multiple documentation sources (git repo)
which it will then use to assmemble the site.

### Build

The default behavior is the fetch the `ui-bundle.zip` from the latest release of [threatx-docs-ui](https://github.com/ThreatX/threatx-docs.ui).  

```bash
npm i
npx antora --fetch --stacktrace antora-playbook.yml
```

The site contents will be found under `public/`.

### Release

A github action builds and uploads the site to the S3 bucket `s3://docs.threatx.com`.  

The documentation site can be found at [docs.threatx.com](https://docs.threatx.com). 
A CloudFront distribution fronts the static S3 site.  


#### Author Mode

If you have cloned this project, as well as the documentation sources and ui project into the same directory, the local playbook will build from the HEAD of each local git repo.

```bash
git clone --branch main git@github.com:ThreatX/threatx-docs-public 
git clone --branch main git@github.com:ThreatX/threatx-docs-ui
git clone --branch main git@github.com:ThreatX/threatx-docs-general
git clone --branch 1.0 git@github.com:ThreatX/threatx-docs-txprevent
git clone --branch 3.20 git@github.com:ThreatX/threatx-docs-txprotect

# First build the UI
cd threatx-docs-ui
npm i
./node_modules/.bin/gulp 

# Now generate the site
cd ../threatx-docs-public
npm i
npx antora --fetch --stacktrace local-antora-playbook.yml

## View the result
open public/index.html
```


