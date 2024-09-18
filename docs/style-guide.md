
## 📚 introduction to documentation as code

### 🙋 what is documentation as code?

[__docs as code__](https://www.writethedocs.org/guide/docs-as-code/) aims to solve the complexity of managing documentation by treating it as code.
this means that documentation is stored in a version control system,
written in a markup language, and built using a ci/cd pipeline. 


### 🧑‍🏫 about asciidoc

[__asciidoc__](https://docs.asciidoctor.org/asciidoc/latest/) is a lightweight and semantic markup language primarily designed for writing technical documentation.  

[__asciidoctor__](https://asciidoctor.org) is a fast, open source, text processor for parsing asciidoc.

#### 🌟 rich and beautiful 
it allows the writer to be much more expressive, which we believe _is a requirement_
for useful documentation.

#### 🌟 quality of life
it supports quality-of-life functionality out of the box, like the simple but powerful `copy` button 
source code blocks.

#### 🌟 composable 
asciidoc writers can include existing modules into thieir docoumentation which is not only convenient, but
preserves the single source of truth.

#### 🌟 supports publishing at scale
it can be used to create a framework where documentation is well-integrated into the sdlc where it is
deployed using pipelines that perform various quality checks or publish in certain formats.  

#### 🌟 easy to adopt

asciidoc is fully backwards-compatible with traditional markdown.

#### conclusion

while it is not the only language viable for docs as code, but it is arguably the best at balancing features and low barrier to entry.  

if you want to read more, try the [__asciidoc syntax quick reference__](https://docs.asciidoctor.org/asciidoc/latest/syntax-quick-reference/).

--- 

jj [sidebars ↗](https://docs.asciidoctor.org/asciidoc/latest/blocks/sidebars/)
- [example blocks ↗](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/)

---

### 🏆 goals

this document has __three (3)__ goals:

1️⃣  __support a consistent style__ and user experience across all documentation  
2️⃣   __protect the integrity of the threatx brand__  
3️⃣  __lower the barrier to contribution__ for all threatx employees

---

### ℹ️ Formatting

This section covers very simple formatting, such as when to use bold, italic, underline, etc. 

### 📚 Text Decoration

This section recommends the use of bold and italic text for specific purposes. 

#### Bold
- Field labels
- Page/tab labels

#### Italic 
- User input values
- Simple Emphasis

#### Text Decoration Examples 
> In the __Event__ field, enter: _alligator-wrestling_  

> _Do not_ push the red button.  



### ⚙️ AsciiDoc Writer's Guide
 
Asciidoc is highly expressive and writer-friendly. This section covers formatting and styling that is applied at build time by the Asciidoc processing engine. 

_Hyperlinked headings are to the respective section of the Asciidoc Official Documentation._

🔗 [AsciiDoc Writer's Guide](https://asciidoctor.org/docs/asciidoc-writers-guide/)

#### 🎨 UI Macros

The Asciidoc processor can apply special formatting for __buttons, menus, and keyboard keys__.   
Use of these UI macros should be preferred over standard bold, italic, etc. for these UI elements.  


| 🎨 UI Element | ⚙️ UI Macro Usage          | 
| ------------- | --------------------------|
| ⏺️ Button      | `btn:[Next]`                |
| 📋 Menu       |  `menu:View[Zoom > Reset]`  |
| ⌨️ Keyboard    |  `kbd:[Ctrl+T]`             |


 🔗 [UI Macros](https://docs.asciidoctor.org/asciidoc/latest/macros/ui-macros/)

#### 📖 Headings

##### 🫥 Excluded From TOC

This is known as a _discete heading_. It will not be shown in the table of contents. Any level may be used.

```asciidoc
[discrete]
==== H4
```

 🔗 [Headings](https://docs.asciidoctor.org/asciidoc/latest/blocks/discrete-headings/) 

___

### 📋 Lists

1. __Unordered__ lists are created with asterisk(s) (`*`).  
2. __Ordered__ lists will be automatically numbered when periods (`.`) are used (asciidoc-only).

```asciidoc
. Firt step
.. Sub-step
. Second Step
```

Result:
1. First Step  
    a. Sub-Step
2. Second Step  

🔗 [Lists](https://docs.asciidoctor.org/asciidoc/latest/lists/) 

---

####  🎓 Example Blocks

```asciidoc
.Optional title
[example]
This is an example of an example block.
```

🔗 [Example Blocks](https://docs.asciidoctor.org/asciidoc/latest/blocks/example-blocks/)

---

#### ➡️ Sidebars
_Sidebars_ contain text related to the main flow.
 
 ```asciidoc
[sidebar]
Sidebars are used to visually separate auxiliary bits of content
that supplement the main text.
 ```

 🔗 [Sidebars](https://docs.asciidoctor.org/asciidoc/latest/blocks/sidebars/)


