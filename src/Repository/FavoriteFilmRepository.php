<?php

namespace App\Repository;

use App\Entity\FavoriteFilm;
use App\Entity\Film;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Query\Parameter;

/**
 * @method FavoriteFilm|null find($id, $lockMode = null, $lockVersion = null)
 * @method FavoriteFilm|null findOneBy(array $criteria, array $orderBy = null)
 * @method FavoriteFilm[]    findAll()
 * @method FavoriteFilm[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class FavoriteFilmRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, FavoriteFilm::class);
    }

    // /**
    //  * @return FavoriteFilm[] Returns an array of FavoriteFilm objects
    //  */
    

    /*
    public function findOneBySomeField($value): ?FavoriteFilm
    {
        return $this->createQueryBuilder('f')
            ->andWhere('f.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
