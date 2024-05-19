@echo off
REM This has to be in a separate batch file rather than a sequence of ... && ... commands, because the
REM "set" command only takes effect AFTER the line containing it has completed. Chaining it with &&
REM means it will NOT take effect for the commands following it in the same line.
set NODE_ENV=production
set NODE_OPTIONS=--openssl-legacy-provider
IF EXIST .\\js ( rmdir /S /Q .\\js )
REM "tsc" and "yarn" are batch files, so unless we use "call" to execute them, execution won't come back here.
yarn tsc -p tsconfig.build.json
yarn copy-files-windows
yarn rollup -c