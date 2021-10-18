<?php

namespace App\Controller\Admin;

use App\Entity\CategoryForum;
use App\Form\CategoryForumType;
use App\Repository\NewsRepository;
use App\Repository\PostForumRepository;
use Entity\Repository\CategoryRepository;
use App\Repository\CategoryForumRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Console\Descriptor\Descriptor;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/admin/categories", name="admin_categories_")
 * @package App\Controller\Admin
 */
class CategoryForumController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(CategoryForumRepository $categoryForumRepo)
    {

        return $this->render('admin/categories/index.html.twig', [
            'categories' => $categoryForumRepo->findAll(),
        ]);
    }

    /**
     * @Route("/ajout", name="ajout")
     */
    public function AddCategory(Request $request)
    {
        $categoryForum = new CategoryForum();
        $form = $this->createForm(CategoryForumType::class, $categoryForum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($categoryForum);
            $entityManager->flush();

            return $this->redirectToRoute('admin_categories_home');
        }

        return $this->render('admin/categories/ajout.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     * @Route("/modifier/{id}", name="modifier")
     */
    public function EditCategory(CategoryForum $categoryForum, Request $request)
    {
        $form = $this->createForm(CategoryForumType::class, $categoryForum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($categoryForum);
            $entityManager->flush();

            return $this->redirectToRoute('admin_categories_home');
        }

        return $this->render('admin/categories/modifier.html.twig', [
            'form' => $form->createView()
        ]);
    }

    /**
     *  @Route("/supprimer/{id}", name="supprimer")
     */
    public function DeleteCategory(CategoryForum $categoryForum, Request $request)
    {
        if ($this->isCsrfTokenValid('delete' . $categoryForum->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($categoryForum);
            $entityManager->flush();
        }

        return $this->render('admin_categories_home.html.twig');
    }
}
