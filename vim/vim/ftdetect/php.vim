" symfony 1.x
au BufRead,BufNewFile *.class.php set ft=php.symfony

" Symfony2
"au BufRead,BufNewFile *.php set ft=php.sf2
au BufRead,BufNewFile *Bundle/*.php set ft=php.sf2
au BufRead,BufNewFile */config/*.xml set ft=xml.sf2xml
au BufRead,BufNewFile *schema.xml set ft=xml.propelxml

" Propel 1.x
au BufRead,BufNewFile */runtime/lib/*.php set ft=php.propel
au BufRead,BufNewFile */generator/lib/*.php set ft=php.propel
