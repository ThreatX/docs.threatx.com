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

## Release

The __production__ environment publishes to [docs.threatx.com](https://docs.threatx.com). 
The __staging__ environment publishes to [docs-staging.threatx.com](http://docs-staging.threatx.com).

The steps to publish are: 

1. __Author:__ Commit and push any changes to the documentation source repos. (e.g., [threatx-docs-prevent](https://github.com/ThreatX/threatx-docs-prevent))
2. __Build and Stage:__ Manually dispatch the [Stage](https://github.com/ThreatX/docs.threatx.com/actions/workflows/stage.yml) workflow. This will generate and publish the site to staging.
3. __Release:__ Manually dispatch the [Release](https://github.com/ThreatX/docs.threatx.com/actions/workflows/release.yml) workflow to publish the latest artifact from Generate to production.  


## Development

### Antora Playbook

An `antora-playbook.yml` can be found in the project root and is responsible for generating a documentation site.
It contains the instructions a user wants to relay to the Antora site generator.
These instructions include the content Antora should collect and the UI it should apply to the generated site.

The Antora build process will fetch a UI bundle (zip file) and multiple documentation sources (git repo)
which it will then use to assmemble the site.

#### Build

The default behavior is the fetch the `ui-bundle.zip` from the latest release of [threatx-docs-ui](https://github.com/ThreatX/threatx-docs.ui).  

```bash
npm i
npx antora --fetch --stacktrace antora-playbook.yml
```

The site contents will be found under `public/`.

#### Build with Local Sources
To build in "Author Mode", use the `antora-playbook.devel.yml`. 
This playbook pulls from the HEAD of local git repositories. It also uses the local UI bundle so you will need to create a new playbook to use locally or build the UI bundle locally.  


