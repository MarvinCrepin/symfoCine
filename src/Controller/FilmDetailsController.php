<?php

namespace App\Controller;

use App\Entity\Comment;
use App\Form\CommentType;
use App\Entity\User;
use App\Entity\Film;
use App\Repository\FilmRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Security;

/**
     * @Route("/film", name="film_")
     * @package App\Controller
 */


class FilmDetailsController extends AbstractController
{
    /**
     * @Route("/details/{slug}", name="details")
     */

        public function details($slug, FilmRepository $filmRepo, Request $request)
        {
            $film = $filmRepo->findOneBy(['slug' => $slug]);
    
            if(!$film){
                throw new NotFoundHttpException('Pas de film trouvé');
            }
    // Partie commentaire 

    
            
        return $this->render('film_details/index.html.twig', compact('film'));
    }
    public function __construct(Security $security)
    {
       $this->security = $security;
    }
    /**
     * @Route("/details/{slug}/comment", name="app_comment")
     */
    public function comment($slug, Request $request): Response
    {
        $filmComment = $this->getDoctrine()
            ->getRepository(Film::class)
            ->findOneBy(['slug' => $slug]);
        $user = $this->security->getUser();

        //Création du formulaire pour récupérer le commentaire
        $commentaire = new Comment();

        $form = $this->createForm(CommentType::class, $commentaire);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
            $commentaire->setFilm($filmComment)
                ->setAuthor($user);

            $em = $this->getDoctrine()
                ->getManager();

            $em->persist($commentaire);

            $em->flush();
        }

        return $this->render('film_details/comment.html.twig', [
            'user' => $user,
            'form' => $form->createView(),
        ]);
    }
}


