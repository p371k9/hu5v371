tpl=$(cat index.tpl)
md=$(markdown README.md)
printf "$tpl" "$md"