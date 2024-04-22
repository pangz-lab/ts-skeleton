
![Logo](https://raw.githubusercontent.com/pangz-lab/ts-skeleton/main/ts-skeleton.png)
# Typescript Skeleton
This repo provides the bare minimum to effectively create and publish a ts library.<br>
In it's own, this repo has no function and simply serve as a template anyone can use and customize.

## Introduction
Typescript and NodeJS has been around for some time but despite of this, it's surprising that there is no standard steps of creating a library.
It's a bit cumbersome to start a project especially if you are a beginner who wants to simply publish but cannot find a simpler and easy way to create one.
<br>
<br>
Without a proper template to use, you might find yourself installing/uninstalling libraries or modules you think you need but turned out to be of no use(as far as library creation in concern).
<br>
<br>
This template helps to bridge that gap.
<br>
<br>
By following a few easy steps, you can create your own publishable library in a minute.

## 📑 Requirements
- `node`- `latest`
- `npm`- `latest`
- `npm` ***account***  ( create this only when you are ready to publish your library )

> There are no other hard requirements for using this however, publishing requires an account. Currently, this supports `npm` only (although there are other repository like yarn and others). You can check the official [npm](https://docs.npmjs.com/about-the-public-npm-registry) or [yarn](https://classic.yarnpkg.com/lang/en/docs/publishing-a-package/) website for more details. 
<br>
<br>
Publishing library to `npm` automatically make it available to `yarn` without an extra steps.

## 📥 Installation
Clone/download this repo by using any of the methods.
### Git CLI
```bash
git clone https://github.com/pangz-lab/ts-skeleton.git
```

### cURL
```bash
curl -o ts-skeleton.zip https://github.com//pangz-lab/ts-skeleton/archive/refs/heads/main.zip
# extract the zip file after download
```

### WGET
```bash
wget -O ts-skeleton.zip https://github.com//pangz-lab/ts-skeleton/archive/refs/heads/main.zip
# extract the zip file after download
```

> ⚠️ NOTE <br>
> Extract the zip file after the download.

# 🗂 Setup
>
> Open your favorite terminal and run the following commands.
> - [x] Make sure you're outside the project folder
> - [x] Do an `ls` ( Linux or macOS ) or `dir`( Windows ) to check if you see the downloaded/extracted `ts-skeleton` folder
> - [x] Update the `new-name` to your preferred library name
<br>

[![L](https://skillicons.dev/icons?i=linux)](-) [![L](https://skillicons.dev/icons?i=apple)](-)
#### Linux & macOS
```bash
# Update the new-name as the new library name
# Running the ./tsk --init will show a prompt that allows an update of your package.json
chmod +x tsk
NEW_LIB_NAME=new-name && mv ts-skeleton $NEW_LIB_NAME && cd $NEW_LIB_NAME && ./tsk --init
```

[![L](https://skillicons.dev/icons?i=windows)](-)
#### Windows 
```cmd
@rem Update the new-name as the new library name
@rem Running the ./tsk --init will show a prompt that allows an update of your package.json
set NEW_LIB_NAME=new-name && move ts-skeleton %NEW_LIB_NAME% && cd %NEW_LIB_NAME% && tsk.cmd --init
```


# How to start?
Simply follow the development flow below. There are check-points/notes for each section to serve as a guide however
as your progress, you'll find yourself skipping most of it.

## 💻 Development
- Run the following command to start your library.
- It autoreloads your changes when updating parts of your code. Thanks to [`nodemon`](https://nodemon.io/).
```bash
./tsk --dev
```
- While development, you might need to create another class and test class. Create using the following command.
```bash
./tsk --create-class YourClass
```

## ✅ Test
- Run the following command to test your library.
- [`jest`](https://jestjs.io/) is used as the main testing framework.
```bash
./tsk --test
```

## 📤 Publishing
Before publishing, check the following.
- [x] Make sure you created your `npm` [account](https://docs.npmjs.com/creating-a-new-npm-user-account).
- [x] You need to login first in `npm` thru CLI during the first run. You can use `npm login`.
- [x] Check your `package.json` and update the keys accordingly. Check the values of the common keys like
 <br>`version`, `description`, `keywords`, `dependencies`,`homepage`, `bugs` and others. [See here](https://docs.npmjs.com/cli/v10/configuring-npm/package-json) for details.
- [x] Each publish requires a new version. Increment the `version` value as needed.
- [x] Document your library. Check and update the TODOs marker of `README.lib.md`.
- [x] Rename `README.md` to `README.main.md` and `README.lib.md` to `README.md`

```bash
./tsk --publish
```
<br>
<hr>
<br>

## "tsk" Script
- ***tsk*** is a utility script created to help automate common tasks during the development.
- It's a simple wrapper of existing `npm` commands and others. 
- You might want to use it to do your stuff quickly like creating a class or publishing.
## Usage
> Open a terminal and run the following command.
```bash
./tsk --help
```
### Flags
| Name   |  Usage |
|:-----|:--------|
| `--help` | show available flags |
| `--init` | you only need this when initializing your project. This is called automatically during the setup |
| `--create-class` | create class and a test class. i.e. - `./tsk --create-class ClassName`|
| `--test` | run the tests. i.e. - `./tsk --test` or `./tsk --test ClassName` for specific files/class|
| `--dev` | run the library in dev mode with autoreload for updates |
| `--build` | builds the library. Transpiled code is generated to `dist` folder|
| `--publish` | publish the library to npm|

<hr>

# Support
For any issues or inquiries, you can raise a PR or contact me at
| Contacts    |  - |
|:-----:|:--------|
| [![Discord](https://skillicons.dev/icons?i=discord)](discordapp.com/585287860513669135) | `Pangz#4102` |
| [![Gmail](https://skillicons.dev/icons?i=gmail)](pangz.lab@gmail.com) |`pangz.lab@gmail.com` |
| [![Twitter](https://skillicons.dev/icons?i=twitter)](https://x.com/Pangz55192569?t=CEpyeN6IetPWqWkqyvweyQ&s=09) |`@Pangz55192569` |

# Reference
- ***NPM Commands*** : https://docs.npmjs.com/cli/v10/commands/
- ***PACKAGE-JSON*** : https://docs.npmjs.com/cli/v10/configuring-npm/package-json

# License
This library is released under the [MIT License](https://github.com/pangz-lab/ts-skeleton/blob/main/LICENSE).