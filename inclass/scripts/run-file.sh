echo "---------------------------------------------"
PRACTICE_TYPE=$(node -p "require('./practice.config.json').$1.type")
PRACTICE_FOLDER=$(node -p "require('./practice.config.json').$1.src")


CODE_TYPE="code"
SIMPLE_CODE_TYPE="scode"
TEST_GLOBAL_TYPE="test-global"
TEST_TYPE="test"
DOJO_TYPE="dojo"

TYPE="$PRACTICE_TYPE"

echo ${VAR1}
if [ "$TYPE" = "$SIMPLE_CODE_TYPE" ]; then
    npx ts-node ${PRACTICE_FOLDER}.ts

if [ "$TYPE" = "$CODE_TYPE" ]; then
    npx ts-node --no-tty ${PRACTICE_FOLDER}/$2.ts

elif [ "$TYPE" = "$TEST_TYPE" ]; then
    npm test -- --no-tty ${PRACTICE_FOLDER}/$2.spec.ts
    
elif [ "$TYPE" = "$TEST_GLOBAL_TYPE" ]; then
    npm test -- --no-tty ${PRACTICE_FOLDER}/

elif [ "$TYPE" = "$DOJO_TYPE" ]; then
    npx jest --no-tty -- ${PRACTICE_FOLDER} --watch

else
    echo "No type supported"
fi
