# git guide 2021 

Guida veloce a git per principianti

## Descrizione generale

git è un software che implementa un sistema di controllo di versione distribuito o decentralizzato, ovvero una tipologia di controllo di versione che permette di tenere traccia delle modifiche e delle versioni apportate al codice sorgente del software, senza la necessità di dover utilizzare un server centrale, come nei casi classici.

```git
usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

These are common Git commands used in various situations:

start a working area (see also: git help tutorial)
   clone      Clone a repository into a new directory
   init       Create an empty Git repository or reinitialize an existing one

work on the current change (see also: git help everyday)
   add        Add file contents to the index
   mv         Move or rename a file, a directory, or a symlink
   reset      Reset current HEAD to the specified state
   rm         Remove files from the working tree and from the index

examine the history and state (see also: git help revisions)
   bisect     Use binary search to find the commit that introduced a bug
   grep       Print lines matching a pattern
   log        Show commit logs
   show       Show various types of objects
   status     Show the working tree status

grow, mark and tweak your common history
   branch     List, create, or delete branches
   checkout   Switch branches or restore working tree files
   commit     Record changes to the repository
   diff       Show changes between commits, commit and working tree, etc
   merge      Join two or more development histories together
   rebase     Reapply commits on top of another base tip
   tag        Create, list, delete or verify a tag object signed with GPG

collaborate (see also: git help workflows)
   fetch      Download objects and refs from another repository
   pull       Fetch from and integrate with another repository or a local branch
   push       Update remote refs along with associated objects

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
```

## Utilizzo
### comandi generali

-- # = commenti                                            
-- ! = parametro non necessario


`git init` crea una cartella .git dove viene eseguito il comando, questa cartella serve per contenere tutte le impostazioni del repository 
###### true response

```git
Initialized empty Git repository in /Users/Users-test/Desktop/folder/.git/             
```
`git clone [url] [!name]` effettua un clone di un repository già esistente portando con se la cartella .git quindi tutta la configurazione di quel repo
###### true response

```git
Cloning into 'test-folder'...
remote: Enumerating objects: 9, done.
remote: Counting objects: 100% (9/9), done.
remote: Compressing objects: 100% (9/9), done.
remote: Total 9 (delta 1), reused 0 (delta 0)
Receiving objects: 100% (9/9), done.
Resolving deltas: 100% (1/1), done.
```

`git status` permette  di visualizzare lo status attuale del repository
###### first response = alcun file individuato, aggiungere file per trovare le aggiunte

```git
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```
###### add files response

```git
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	ciao
	ciao-ciao

nothing added to commit but untracked files present (use "git add" to track)
```
Tipi principali di files = Untracked, removed, added, modified ---|--- per altri tipi: [@Documentation](https://git-scm.com/docs/git-status)

`git add [nome file]` aggiunge il file ai documenti tracciati, con `git add *` aggiungi tutti i file della cartella
###### first response = alcun file individuato, aggiungere file per trovare le aggiunte

```git
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

## Contributing
@dlanotte
