# git guida 2021 - versione italiana

Guida veloce a git per principianti #42Roma #42
##### ❌ Avvertenze ❌
`Ciò che viene cancellato non sempre può essere recuperato, quindi prima di eseguire comandi di cui non si conosce il fine è bene eseguire un backup. Questa guida non riporterà indietro file eliminati, ne vi spiegherà come farlo `.
## Descrizione progetto
Una guida per aiutare tutti coloro che hanno problemi nel uso quotidiano di git, guida fatta in maniera open-source, si accettano miglioramenti, aggiunte, correzioni e contributi di ogni tipo, nella guida si è cercato di spiegare tutti i termini usati, se dovesse mancare qualcosa segnalarlo.            
grazie. 
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
## Stati dei file
- Non tracciato `il file esiste ma git non ne tiene conto al fine del invio su server`
- Tracciato `il file viene tracciato, git sa dell'esistenza e ne tiene traccia della copia`
- Committato `viene aggiunta una descrizione al file e viene fatta una copia dello stesso associata all'id della commit`
- Pushato `il file esiste sul server e la versione attuale corrisponde all'id della commit fatta sul client`      
- altri tipi di file -->  [git-docs](https://git-scm.com/docs/git-status) (Inglese)

## Consigli generali 
- In caso di condivisione del repository è sempre bene fare un git pull del repository, in modo da aggiornarlo all'ultima versione in caso non si stia lavorando su due branch diversi.    
`definizione branch = seconda` [istanza](https://it.wikipedia.org/wiki/Istanza#:~:text=Istanza%20–%20in%20informatica%2C%20una%20determinata,sistema%20(task%20o%20tool).) `del progetto (di solito su un progetto c'è il branch `master` che contiene la versione funzionante del progetto e il branch `develop` che contiene la versione in sviluppo e con bug.`
- I messaggi di commit non devono essere a caso, ma devono rappresentare le modifiche fatta dalla versione precedente anche in piccola parte ad esempio: `fixed` diventa `fixed splash screen bug` 

- Non creare git dentro dei git già esistenti, controlla sempre che nella directory con ci siano altre sotto directory `.git`, deve essere sempre solo una, tranne se si parla di `sotto-moduli git`, ma è un'argomento diverso e più complesso. Per controllare velocemente questa cosa raggiungi la directory dove è presente la cartella `.git` principale e lancia questo comando: `find . -name 
".git"` se la risposta sarà la seguente: 

###### - git init ripetuto più volte o errore submodules 
```bash
❯ find . -name ".git"

./.git
./ciao/.git
./ciao-2/.git
```
vuol dire che il repository è contaminato e le subdirectory `./ciao/.git` e `./ciao-2/.git` andranno eliminate per eliminare le sub-directory velocemente utilizzare il comando `find ./* -name ".git"` e controllare che esca un risultato simile: 
```bash 
❯ find ./* -name ".git"

./ciao/.git
./ciao-2/.git
```
adesso bisognerà aggiungere le flags `-exec rm -rf "{}" \`, in questo modo i file verrano eliminati. Comando finale: `find ./* -type d -name ".git" -exec rm -rf "{}" \;` risposta: 
```bash 
❯ find ./* -type d -name ".git" -exec rm -rf "{}" \;

find: ./ciao/.git: No such file or directory
find: ./ciao-2/.git: No such file or directory
```
Adesso, lanciando nuovamente il comando: `find . -name ".git"` la risposta corretta sarà: 
```bash 
❯ find . -name ".git"

./.git
```
###### per altri errori riguardanti i submodules già committati: segui questa guida: [@guide](https://gist.github.com/myusuf3/7f645819ded92bda6677)
###### per altri errori riguardanti i submodules già pushati: [contattami- skype](https://join.skype.com/invite/ibNkhh8fTBg9) o sull'intra: [@dlanotte](https://profile.intra.42.fr/users/dlanotte)
## Utilizzo
### comandi generali
-- # = commenti                                            
-- ! = parametro non necessario


`git init` crea una cartella .git dove viene eseguito il comando, questa cartella serve per contenere tutte le impostazioni del repository 
###### true response

```git
Initialized empty Git repository in /Users/Users-test/Desktop/folder/.git/             
```

`git pull` crea una cartella .git dove viene eseguito il comando, questa cartella serve per contenere tutte le impostazioni del repository 
###### true response

```git
❯ git pull

remote: Enumerating objects: 5, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (3/3), done.
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (3/3), done.
From https://github.com/zxcvbinz/42cursus
   8919644..5c3644a  master     -> origin/master
Updating 8919644..5c3644a
Fast-forward
 README.md | 6 ++++++
 test_file.md | 6 ++++++
 1 file changed, 6 insertions(+)       
```
###### another response
```git
❯ git pull

Already up to date.                     # Repo aggiornato server-client (copie uguali di file tracciati)
```
```git 
❯ git pull

fatal: not a git repository (or any parent up to mount point /Users)      # git non presente
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
###### untracked files response

```git
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	ciao
	ciao-ciao

nothing added to commit but untracked files present (use "git add" to track)
```


`git add [nome file]` aggiunge il file ai documenti tracciati, con `git add *` aggiungi tutti i file della cartella
###### first response = alcun file individuato, aggiungere file per trovare le aggiunte

```git
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```
###### Nota speciale in caso di aggiunta sbagliata -  nb: eseguire un backup prima.
Se nella coda di file tracciati (vedi tipi file) dovessero essere presenti file spazzatura o file aggiunti per errore (`.DS_Store`, `.gitignore`, ecc) basterà eseguire il comando `git rm --cached [nome-file/cartella]` in caso di errori o altro git consiglia di aggiungere la flag -r per eliminare quei file dalla coda, comando finale: `git rm -r --cached [nome-file/cartella]`

`git remote [!general-flags]` Impostazioni generali per il push        
`git remote` Visualizza i server git collegati al repository     
`git remote add [name] [url]` Aggiunge sotto il nome di name l'url del server di git    
`git remote remove [name]` Rimuove un remote address

`git push [!flags]` conferma i commit effettuati e gli invia al server impostato     
#####  Si divide in 

- primo push verso `origin` e branch `master` - `git push -u origin master`
- push normale verso il server default (origin, dopo il primo push) `git push`
- push verso server custom `git push server_address master`
- push verso server custom e branch custom `git push address branch`

## simple-git-beta
progetto git semplificato attraverso una finta GUI in zsh/bash repo: [42-utils-simple-git](https://github.com/zxcvbinz/42-utils/tree/master/simple-git) # versione beta disponibile - funzioni limitate - agg. 04-05-2021   
Se vuoi contribuire contattami! [@dlanotte](https://profile.intra.42.fr/users/dlanotte)

## Contributing
[@dlanotte](https://profile.intra.42.fr/users/dlanotte)    
 
## Issues
Per segnalare errori, aggiunte, nuove problematiche intra [dlanotte](https://profile.intra.42.fr/users/dlanotte), o [skype](https://join.skype.com/invite/ibNkhh8fTBg9)
