@echo off
setlocal

rem Set variables
set "CLASS_BASE_PATH=./src/lib"
set "CLASS_TEST_BASE_PATH=./test/lib"
set "SCRIPT_NAME=tsk.cmd"

rem Function to display help message
:display_help
echo Usage: %0 [--init|--help|--create-class|--dev|--test|--build|--publish]
echo.
echo --help           Display this help message
echo --init           Initialize the script
echo --create-class   Create new class and test class
echo                   %SCRIPT_NAME% --create-class ClassName
echo.
echo --dev            Run the library in dev mode with autoreload for updates
echo --test           Test the library
echo --build          Build the library
echo --publish        Publish to npm
echo.
goto :eof

rem Function to initialize the script
:initialize
echo Initializing...
echo Update the package.json keys based on the library you create
npm init
npm install
rem Rename README.md to README.main.md
ren README.md README.main.md

rem Rename README.lib.md to README.md
ren README.lib.md README.md
echo Done!
goto :eof

rem Function to create a class
:create_class
echo Validating class name ...
rem Validate CLASS_NAME variable
if "%~1"=="" (
    echo Error: No class name provided.
    echo Usage: %0 ^<class_name^>
    exit /b 1
)

set "CLASS_NAME=%~1"
if not "%CLASS_NAME:~0,1%"=="_" (
    echo Error: Invalid class name. Class name must start with a letter or underscore, followed by letters, digits, or underscores.
    exit /b 1
)

set "TS_CONTENT=export class %CLASS_NAME% (^
    hello^(^
        echo("Hello from ts-skeleton - 💀💀💀!!!"^)
    ^)
^)"

set "TS_TEST_CONTENT=import { %CLASS_NAME% } from "../../src/lib/%CLASS_NAME%";^
describe('%CLASS_NAME%', () => {^
  it('should log the expected message', () => {^
    // Create an instance of %CLASS_NAME%^
    const yourClass = new %CLASS_NAME%();^
^
    // Mock console.log^
    const consoleLogMock = jest.spyOn(console, 'log');^
^
    // Call the hello method^
    yourClass.hello();^
^
    // Assert that console.log was called with the expected message^
    expect(consoleLogMock).toHaveBeenCalledWith('Hello from ts-skeleton - 💀💀💀!!!');^
^
    // Restore the original console.log^
    consoleLogMock.mockRestore();^
  });^
});"

set "CLASS_FILE=%CLASS_BASE_PATH%%CLASS_NAME%.ts"
set "TEST_FILE=%CLASS_TEST_BASE_PATH%%CLASS_NAME%.test.ts"

rem Check if the test file already exists
echo Checking if file exists ...
if exist "%TEST_FILE%" (
    echo Error: Test file %TEST_FILE% already exists.
    echo Please delete it or choose a different class name.
    exit /b 1
)

rem Create the class file
echo Creating a new class ...
echo %TS_CONTENT% > "%CLASS_FILE%"
echo Creating a new test class ...
rem Create the test file
echo %TS_TEST_CONTENT% > "%TEST_FILE%"
echo ----------------------
echo Base Class: - %CLASS_FILE%
echo Test Class: - %TEST_FILE%
echo ----------------------
echo Manually update ./src/index.ts if you need to export this class publicly.
echo ----------------------
echo Done!
npm run test %CLASS_NAME%
goto :eof

rem Function to run the library. Executes the package.json dev command 
:dev
echo Running in dev mode ...
npm run dev %*
goto :eof

rem Function to test the library. Executes the package.json test command 
:test
echo Running the test ...
npm run test %*
echo Done!
goto :eof

rem Function to build the library. Executes the package.json build command 
:build
echo Building ...
npm run build %*
echo Done!
goto :eof

rem Function to publish the library. Executes the 
:publish
echo Publishing ...
tsc
npm publish %*
echo Check your published package by accessing https://npmjs.com/package/*package-name*
echo For more details, check https://docs.npmjs.com/cli/v10/commands/npm-publish
echo Done!
goto :eof

rem Check if any arguments are provided
if "%~1"=="" (
    echo Error: No arguments provided. Use --help for usage instructions.
    echo Done!
    exit /b 1
)

rem Parse command line arguments
:parse_arguments
if /i "%~1"=="--init" (
    call :initialize
) else if /i "%~1"=="--help" (
    call :display_help
) else if /i "%~1"=="--create-class" (
    call :create_class "%~2"
) else if /i "%~1"=="--dev" (
    call :dev %*
) else if /i "%~1"=="--test" (
    call :test %*
) else if /i "%~1"=="--build" (
    call :build %*
) else if /i "%~1"=="--publish" (
    call :publish %*
) else (
    echo Error: Invalid option: %1. Use --help for usage instructions.
    exit /b 1
)
goto :eof
