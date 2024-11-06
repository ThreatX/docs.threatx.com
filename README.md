# ThreatX User Documentation Site and Playbook Project

This is a playbook project for [docs.threatx.com](https://docs.threatx.com).

It is only for orchestrating the [Antora](https://antora.org) site generation process and not for storing the actual content.

Antora is a static site generator that generates documentation sites from AsciiDoc files and modular sources.

The UI for this site is in another repository: [threatx-docs-ui](https://github.com/ThreatX/threatx-docs-ui).

## Links

* [Antora](https://docs.antora.org/antora/latest/)
* [Antora User Interface](https://docs.antora.org/antora-ui-default/)
* [AsciiDoc Syntax Reference](https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/)
* [AsciiDoc Language](https://docs.asciidoctor.org/asciidoc/latest/)
* [AsciiDoctor (AsciiDoc Processor)](https://docs.asciidoctor.org/asciidoctor/latest/)
* [AsciiDoctor PDF Converter](https://docs.asciidoctor.org/pdf-converter/latest/)
* [Docs-as-code](https://www.writethedocs.org/guide/docs-as-code/)
* [RedHat Style Guide](https://redhat-documentation.github.io/supplementary-style-guide/)
---

## Release process

The __production__ environment publishes to [docs.threatx.com](https://docs.threatx.com).  
The __staging__ environment publishes to [docs-staging.threatx.com](http://docs-staging.threatx.com).

**Generate the site** and **deploy to the staging environment** by manually dispatching the **[Publish](https://github.com/ThreatX/docs.threatx.com/actions/workflows/stage.yml)** workflow.  
There is a __Required Reviewer__ approval gate protecting the production environment.


## Components

__Documentation Sources:__  
* [threatx-docs-txprevent](https://github.com/ThreatX/threatx-docs-txprevent)
* [threatx-docs-txprotect](https://github.com/ThreatX/threatx-docs-txprotect)
* [threatx-docs-general](https://github.com/ThreatX/threatx-docs-general)

__User Interface:__  
* [threatx-docs-ui](https://github.com/ThreatX/threatx-docs-ui)

__Site (playbook):__
* [docs.threatx.com](https://github.com/ThreatX/docs.threatx.com)



## Development

### Build process

#### Antora Playbook

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


