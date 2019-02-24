#!/bin/bash
# metaprograma
echo '#!/bin/bash' > programa
for ((I=1; I<=992; I++)) do
    echo "echo $I" >> programa
done
chmod +x programa
source ./programa