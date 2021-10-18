<?php

namespace App\Controller;

use App\Entity\CategoryForum;
use App\Form\CategoryForumType;
use App\Repository\NewsRepository;
use App\Repository\PostForumRepository;
use Symfony\Bundle\FrameworkBundle\Console\Descriptor\Descriptor;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/admin", name="admin_")
 * @package App\Controller
 */
class AdminController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(PostForumRepository $postForumRepository, NewsRepository $newsRepository): Response
    {
        // 'newsRepository' => $newsRepository->findBy([],['id'=>'DESC'],3),
        return $this->render('admin/index.html.twig', [
            'controller_name' => 'AdminController',
        ]);
    }
}
