<?php

namespace App\Repository;

use App\Entity\CommentsNews;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method CommentsNews|null find($id, $lockMode = null, $lockVersion = null)
 * @method CommentsNews|null findOneBy(array $criteria, array $orderBy = null)
 * @method CommentsNews[]    findAll()
 * @method CommentsNews[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CommentsNewsRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, CommentsNews::class);
    }

    // /**
    //  * @return CommentsNews[] Returns an array of CommentsNews objects
    //  */
    /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('c.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

    /*
    public function findOneBySomeField($value): ?CommentsNews
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
