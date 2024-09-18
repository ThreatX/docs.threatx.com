# ThreatX User Documentation Site and Playbook Project

This is a playbook project for the ThreatX User Documentation site.

It is only for orchestrating the Antora site generation process and not for storing the actual content.

Antora is a static site generator that generates documentation sites from AsciiDoc files.

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

```bash
npm i
npx antora antora-playbook.yml
```
The generated site will be in `public/` if successful.

### Release

A github action builds and uploads the site to the S3 bucket `s3://docs.threatx.com`.  

The documentation site can be found at [docs.threatx.com](https://docs.threatx.com). 
A CloudFront distribution fronts the static S3 site.  


