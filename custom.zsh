gch() {
	git checkout "$(git reflog | grep checkout | cut -d " " -f 8 | uniq | head ${1} | fzf | tr -d '[:space:]')"
}
