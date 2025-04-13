(defun rhombus--module-language-hook (lang)
  (when (or (string-equal lang "rhombus")
            (string-prefix-p "rhombus/" lang))
    (setq-local racket-hash-lang-pairs nil
                font-lock-keywords nil)
    (modify-syntax-entry ?_ "w")
    (modify-syntax-entry ?~ "w")
    (font-lock-add-keywords
     nil
     `((,(regexp-opt rhombus-keywords-1 'words) . font-lock-keyword-face)
       (,(regexp-opt rhombus-keywords-2 'words) . font-lock-type-face)
       (,(regexp-opt rhombus-keywords-3 nil) . font-lock-keyword-face)))))

(add-to-list 'auto-mode-alist '("\\.rhm\\'" . racket-hash-lang-mode))
(add-hook 'racket-hash-lang-module-language-hook #'rhombus--module-language-hook)

;; (define-derived-mode rhombus-mode racket-hash-lang-mode
;;   "Rhombus"
;;   "Major mode for editing Rhombus source files.")

(defvar rhombus-keywords-1
  '("_"
    "abstract"
    "all_defined"
    "all_from"
    "annotation"
    "as"
    "authentic"
    "binding"
    "block"
    "class"
    "cond"
    "constructor"
    "converting"
    "def"
    "def"
    "described_as"
    "described_as"
    "each"
    "except"
    "except_space"
    "export"
    "expose"
    "expression"
    "extends"
    "field"
    "file"
    "final"
    "fold"
    "for"
    "fun"
    "fun"
    "if"
    "immutable"
    "implements"
    "import"
    "in"
    "interface"
    "internal"
    "is_a"
    "let"
    "lib"
    "match"
    "matches"
    "matching"
    "maybe"
    "meta"
    "meta_label"
    "method"
    "module"
    "mutable"
    "names"
    "namespace"
    "nonfinal"
    "only"
    "only_meta"
    "only_meta_label"
    "opaque"
    "open"
    "operator"
    "override"
    "parent"
    "prefab"
    "primitive_property"
    "private"
    "property"
    "protected"
    "reconstructor"
    "reconstructor_fields"
    "rename"
    "satisfying"
    "self"
    "super"
    "this"
    "unless"
    "values"
    "when"
    "where"
    "with"))

(defvar rhombus-keywords-2
  '("Any"
    "Array"
    "Boolean"
    "Byte"
    "Exact"
    "False"
    "Fixnum"
    "Flonum"
    "Inexact"
    "Int"
    "Integral"
    "List"
    "NegInt"
    "NegReal"
    "None"
    "NonnegInt"
    "NonnegReal"
    "Number"
    "PosInt"
    "PosReal"
    "Rational"
    "Real"
    "True"))

(defvar rhombus-keywords-3
  '(":~" "::" ":=" "=" "==" "===" ".=" "!=" ".!=" "<" ">" ">=" "<="
    "|>" "?>" "..." ".." "->" "!!." "!!" "?." "&&" "||" "++" "+&"))
