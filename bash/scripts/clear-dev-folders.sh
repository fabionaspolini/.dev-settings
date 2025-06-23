echo "Apagar pastas 'bin'..."
find . -iname "bin" | xargs rm -rf

echo "Apagar pastas 'obj'..."
find . -iname "obj" | xargs rm -rf

echo "Apagar pastas 'node_modules'..."
find . -iname "node_modules" | xargs rm -rf

echo "Apagar pastas 'terraform'..."
find . -iname ".terraform" | xargs rm -rf

echo "Apagar pastas 'publish'..."
find . -iname "publish" | xargs rm -rf