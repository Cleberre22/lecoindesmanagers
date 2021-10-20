<?php

namespace App\Controller;

use DateTime;
use App\Entity\PostForum;
use App\Form\PostForumType;
use App\Repository\PostForumRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/post/forum")
 */
class PostForumController extends AbstractController
{
    /**
     * @Route("/", name="post_forum_index", methods={"GET"})
     */
    public function index(PostForumRepository $postForumRepository): Response
    {
        return $this->render('post_forum/index.html.twig', [
            'post_forums' => $postForumRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="post_forum_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $postForum = new PostForum();
        $form = $this->createForm(PostForumType::class, $postForum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $users = $this-> getUser();
            $postForum->setUsers($users); 
            $postForum->setCreatedAt(new DateTime());
            $entityManager->persist($postForum);
            $entityManager->flush();
            $post = $postForum->getId();

            return $this->redirectToRoute('post_forum_show', ['id'=>$post]);
        }                                
        
        return $this->renderForm('post_forum/new.html.twig', [
            'post_forum' => $postForum,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="post_forum_show", methods={"GET"})
     */
    public function show(PostForum $postForum): Response
    {
        return $this->render('post_forum/show.html.twig', [
            'post_forum' => $postForum,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="post_forum_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, PostForum $postForum): Response
    {
        $form = $this->createForm(PostForumType::class, $postForum);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('post_forum_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('post_forum/edit.html.twig', [
            'post_forum' => $postForum,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="post_forum_delete", methods={"POST"})
     */
    public function delete(Request $request, PostForum $postForum): Response
    {
        if ($this->isCsrfTokenValid('delete'.$postForum->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($postForum);
            $entityManager->flush();
        }

        return $this->redirectToRoute('post_forum_index', [], Response::HTTP_SEE_OTHER);
    }
}
