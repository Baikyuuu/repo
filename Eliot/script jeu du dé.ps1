# Jeu de dés avec gestion des points, des vies et pause entre chaque partie en PowerShell

# Introduction et règles du jeu
Write-Host "Bienvenue dans le Jeu de Dés !"
Write-Host "Le but est d'obtenir le plus grand nombre de points possible en lançant un dé."
Write-Host "Gagnez des points à chaque victoire et gagnez une vie supplémentaire après avoir remporté trois parties."
Write-Host "Perdez une vie après avoir perdu trois parties. Le jeu se termine lorsque vous n'avez plus de vies."
Write-Host "Appuyez sur Entrée entre chaque partie pour continuer."
Write-Host ""

# Fonction pour lancer un dé (simule un dé à 6 faces)
function Lancer-De {
    Get-Random -Minimum 1 -Maximum 7
}

# Fonction pour afficher le message de victoire
function Afficher-Victoire {
    param([string]$gagnant)
    Write-Host "Félicitations, $gagnant gagne cette partie !"
}

# Fonction pour afficher les statistiques
function Afficher-Statistiques {
    Write-Host "Statistiques :"
    Write-Host "  Score du joueur : $scoreJoueur"
    Write-Host "  Score de l'ordinateur : $scoreOrdinateur"
    Write-Host "  Parties gagnées : $nbPartiesGagnees"
    Write-Host "  Vies restantes : $nbViesRestantes"
    Write-Host ""
}

# Fonction pour afficher le menu
function Afficher-Menu {
    Write-Host "Menu :"
    Write-Host "  D - Démarrer le jeu"
    Write-Host "  Q - Quitter"
    Write-Host ""
}

# Afficher le menu
Afficher-Menu

# Demander à l'utilisateur de choisir une option
do {
    $choix = Read-Host "Choisissez une option (D/Q):"
    switch ($choix.ToUpper()) {
        "D" {
            # Initialisation des variables pour chaque nouvelle partie
            $scoreJoueur = 0
            $scoreOrdinateur = 0
            $nbPartiesGagnees = 0
            $nbViesRestantes = 3

            # Boucle principale du jeu
            while ($nbViesRestantes -gt 0) {
                # Lancer le dé pour le joueur et l'ordinateur
                $scoreJoueur = Lancer-De
                $scoreOrdinateur = Lancer-De

                # Afficher les résultats
                Write-Host "Joueur a lancé un dé et a obtenu $scoreJoueur."
                Write-Host "Ordinateur a lancé un dé et a obtenu $scoreOrdinateur."

                # Déterminer le gagnant
                if ($scoreJoueur -gt $scoreOrdinateur) {
                    $scoreJoueur++
                    Afficher-Victoire -gagnant "le joueur"
                    $nbPartiesGagnees++
                } elseif ($scoreJoueur -lt $scoreOrdinateur) {
                    Write-Host "Dommage, l'ordinateur remporte cette partie."
                } else {
                    Write-Host "Match nul ! Les deux ont obtenu le même score."
                }

                # Afficher les statistiques
                Afficher-Statistiques

                # Gagner une vie après avoir remporté trois parties
                if ($nbPartiesGagnees -eq 3) {
                    $nbViesRestantes++
                    $nbPartiesGagnees = 0
                    Write-Host "Vous avez gagné une vie supplémentaire !"
                }

                # Perdre une vie après avoir perdu trois parties
                if ($scoreJoueur -lt $scoreOrdinateur) {
                    $nbViesRestantes--
                }

                # Demander au joueur d'appuyer sur Entrée pour continuer
                Read-Host "Appuyez sur Entrée pour continuer..."
            }

            # Afficher le message de fin de jeu
            Write-Host "Game Over ! Vous avez épuisé toutes vos vies."
            break
        }
        "Q" {
            # Quitter le jeu
            Write-Host "Merci d'avoir joué ! Au revoir."
            exit
        }
        default {
            Write-Host "Choix invalide. Veuillez entrer 'D' pour démarrer le jeu ou 'Q' pour quitter."
        }
    }
} while ($true)
