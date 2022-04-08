<h1>Projet Furet Du Nord</h1>
<h2>Projet réalisée par Tanguy Ozano et Olivier Lohez</h2>
<br/>
<h2>Sommaire</h2>
<ul>
  <li><a>Présentation du projet</a></li>
  <li><a>Présentation de la structure de données</a></li>
  <li><a>Présentation de la structure du programme</a></li>
  <li><a>Présentation des fonctionnalités du programme</a></li>
  <li><a>Démonstration d'un exemple de fonctionnement</a></li>
</ul>
<hr>

<h3>Présentation du projet</h3>
<br/>
<p>Notre projet permet d'utiliser une base de données,plus précisément une base de données pour la chaîne de librairie Furet du Nord
Ce projet permet de gérer les auteurs,les éditeurs et les produits
Ce projet rend accessible la gestion des auteurs,éditeurs et des produits de ces bases de données</p>

<hr>
<h3>Présentation de la structure de données</h3>
<div align="center">
<a href="https://github.com/OlivierLohez/FuretDuNord/blob/main/Readmeimages/drive-download-20220407T110644Z-001/Structurededonnées.png">
  <center>
  <img src="Readmeimages/drive-download-20220407T110644Z-001/Structurededonnées.png" style="text-align:center" width="80%" height="80%">
  </center>
</a>
</div>
<div>
<p>Nous avons dans notre programme trois tables composée comme ceci :
  <ul>
      <li>Editeur
      <ul>
        <li>IDEditeur
        <li>
  </ul>
</div>
<hr>

  
<h3>Présentation de la structure du programme</h3>
<br/>

<p>Notre projet se compose de plusieurs éléments, répondant aux critères d'un Modèle Vue Contrôleur.</p>

<p>Tout d'abord, commençons par le contrôleur, le fichier "main", qui sert de point de départ et de fin du programme.</p>

<p>Nous avons 4 cerveaux, commençant tous par le suffixe "db_" suivit du contenu avec lequel il interragit, chacun à pour rôle de gérer les requêtes SQL :</p>
<p>- Permettant à l'utilisateur d'agir directement sur le contenu de la base de données. </p>
<p>- Permettant à l'utilisateur d'agir directement sur le contenu de la table éditeur. </p>
<p>- Permettant à l'utilisateur d'agir directement sur le contenu de la table auteur. </p>
<p>- Permettant à l'utilisateur d'agir directement sur le contenu de la table produit. </p>
<br/>
<p>Les informations extraites par les différentes tables (on ne prend pas en compte la base de données dans son ensemble) sont stockées grâces à des instances de classe. Chacune des classes possède un fichier qui lui est propre à son nom. Une classe abstraite "Data" sert de modèle par défaut pour l'appel et l'affichage des classes "Editeur", "Auteur" et "Produit". Ces trois dernières classes ont leur propres méthodes d'affichage et possèdent plusieurs constructeurs. Les deux plus importants étant le constructeur prenant toutes les données à afficher et le constructeur d'un objet "vide" non null pour empêcher les bugs lors de la récupération de données inexistantes.</p>
<br/>
<p>Enfin, nous avons de nombreux fichiers utilisés pour les vues, commençant tous par le suffixe "ihm_" suivit du nom de leur tableau.</p>
<p>Le fichier "ihm_principal" sert à la fois de premier panneau d'affichage et de stockage de méthode d'affichage réutilisées dans les autres fichiers ihm. Chaque panneau affiché par un ihm permet soit de naviguer vers un autre tableau, soit de faire appel à une méthode du tableau.</p>
<p>Ces méthodes présentent dans les fichiers ihm font appel à leur tour aux méthodes présentent dans leur cerveau associé, qui se connecte à la base de données SQL et envoie sa requête. Il est possible de récupérer grâce à certaines méthodes du cerveau des données (les méthodes dont la signature commence par "select"). Celle-ci sont stockées temporairement dans leur classe respective (Editeur, Auteur ou Produit), pour être restitué à la méthode de la vue qui affiche les les objets reçus.</p>
<br/>
<hr>

<h3>Présentation des fonctionnalité du programme</h3>
<br/>

<p>Le premier élément à noter est la présence d'un système de vérification de la connexion. Si celle-ci n'est pas possible (c'est-à-dire qu'une première connexion sans requête n'a pas réussie), le programme se ferme directement.</p>
<br/>
<p>Si la connexion a été réussie, un premier panneau s'ouvre. Il suffit de saisir le nombre 0 sur ce panneau pour quitter le programme. Sur tous les autres panneaux, cela permet de revenir au panneau précédent.</p>
<p>Chaque panneau possède 2 types d'actions : la navigation vers de nouvelles options ou une interaction avec la base de données ou une des tables. Si l'on interragit avec une table, l'utilisateur reste sur le même panneau et pourra continuer d'interragir avec cette même table.</p>
<br/>
<p>Les interactions avec la base de données sont : la vérification de la présence de toutes les tables, la création de toutes les tables manquantes, la suppression d'une table spécifique et la suppression de toutes les tables.</p>
<br/>
<p>Les interactions avec la base de données sont : 
  <ul>
    <li>l'ajout d'un nouvel élément
    <li>sa modification
    <li>la suppression d'un ou de tous les élements en fonction d'une condition (présente dans la table ou en interaction directe avec la table)
    <li>l'affichage de tous les éléments répondant à un même critère (de la table même ou en interaction directe avec la table)
  </ul>
</p>
<p>L'ajout et la modification d'un produit ou d'un auteur permet de faire apparaître l'option d'associer cet élément avec un élément d'une autre table (produit avec auteur et auteur avec produit), remplissant ainsi une 4e table, la table "CREER". La suppression de l'un ou l'autre de ces éléments débute par la suppression de toutes ses références dans la table CREER, puis de l'élément même.</p>
<p>De la même manière, la suppression d'un éditeur nécessite de supprimer tous les produits associés. Hors, il faut d'abord supprimer ces produits dans la table CREER, pour les effacer dans la table PRODUIT, pour enfin supprimer l'éditeur. Il faudra donc être prudent lors de la suppression d'un éditeur de la base de données.</p>
<hr>

<h3>Démonstration d'un exemple de fonctionnement</h3>
<br/>
<hr>
