echo "🎁 Installing deps, tools & core apps"
# brew bundle
#sudo spctl --master-disable
# echo "🎁 Installing shell deps."
source "${PWD}/setup_deps.sh"
echo "🎁 Setting up shell enviroment."
source "${PWD}/setup_env.sh"