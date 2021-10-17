<?php

namespace App\Controller;

use App\Entity\FavoriteFilm;
use App\Entity\Film;
use App\Repository\FilmRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Core\User\UserInterface;

class FavoritesController extends AbstractController
{
    /**
     * @Route("/favorites", name="app_favorites")
     */

    public function favoriteUserFilm(UserInterface $user): Response
    {
        $favoriteUserFilm = $this->getDoctrine()
            ->getRepository(FavoriteFilm::class)
            ->findBy(["user" => $user]);

            $films = [];
            foreach($favoriteUserFilm as $favFilm){
            $films[] = $favFilm->getFilm();
            }
        
        return $this->render('favorites/index.html.twig', [
            'controller_name' => 'FavoritesController',
            'films' => $films,
        ]);
    }

    public function __construct(Security $security)
    {
       $this->security = $security;
    }
    /**
     * @Route("/favorites/add/{id}", name="add_favorite")
     */
    public function addFavorite(int $id, Request $request): Response
    {
        // you can fetch the EntityManager via $this->getDoctrine()
        // or you can add an argument to the action: createProduct(EntityManagerInterface $entityManager)
        $film = $this->getDoctrine()
        ->getRepository(Film::class)
        ->find($id);
        //L'id du film sur lequel on a cliqué
        $entityManager = $this->getDoctrine()->getManager();
        $user = $this->security->getUser();
        $favoriteFilm = new FavoriteFilm();
        $favoriteFilm->setUser($user);
        $favoriteFilm->setFilm($film);

        // tell Doctrine you want to (eventually) save the Product (no queries yet)
        $entityManager->persist($favoriteFilm);
        // actually executes the queries (i.e. the INSERT query)
        $entityManager->flush();

        return $this->redirectToRoute('app_favorites');
    }
    /**
     * @Route("/favorites/remove/{id}", name="remove_favorite")
     */
    public function removeFavorite(int $id, Request $request): Response
    {
        
        $film = $this->getDoctrine()
        ->getRepository(Film::class)
        ->find($id);
        //L'id du film sur lequel on a cliqué
        $entityManager = $this->getDoctrine()->getManager();
        $user = $this->security->getUser();
        
        // tell Doctrine you want to (eventually) save the Product (no queries yet)
        $entityManager->remove($film);
        // actually executes the queries (i.e. the INSERT query)
        $entityManager->flush();

        return $this->redirectToRoute('app_favorites');
    }
}
