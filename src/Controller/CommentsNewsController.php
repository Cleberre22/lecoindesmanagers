<?php

namespace App\Controller;

use App\Entity\CommentsNews;
use DateTime;
use App\Form\CommentsNews1Type;
use App\Repository\CommentsNewsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

/**
 * @Route("/comments/news")
 */
class CommentsNewsController extends AbstractController
{
    /**
     * @Route("/", name="comments_news_index", methods={"GET"})
     */
    public function index(CommentsNewsRepository $commentsNewsRepository): Response
    {
        return $this->render('comments_news/index.html.twig', [
            'comments_news' => $commentsNewsRepository->findAll(),
        ]);
    }

    /**
     * @Route("/new", name="comments_news_new", methods={"GET","POST"})
     */
    public function new(Request $request): Response
    {
        $commentsNews = new CommentsNews();
        $form = $this->createForm(CommentsNews1Type::class, $commentsNews);
        $form->handleRequest($request);
        // var_dump($commentsNews);die;
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            
            $commentsNews->setCreatedAtCommentNews(new DateTime());
            $entityManager->persist($commentsNews);
            $entityManager->flush();

            return $this->redirectToRoute('comments_news_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('comments_news/new.html.twig', [
            'comments_news' => $commentsNews,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="comments_news_show", methods={"GET"})
     */
    public function show(CommentsNews $commentsNews): Response
    {
        return $this->render('comments_news/show.html.twig', [
            'comments_news' => $commentsNews,
        ]);
    }

    /**
     * @Route("/{id}/edit", name="comments_news_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, CommentsNews $commentsNews): Response
    {
        $form = $this->createForm(CommentsNews1Type::class, $commentsNews);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('comments_news_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('comments_news/edit.html.twig', [
            'comments_news' => $commentsNews,
            'form' => $form,
        ]);
    }

    /**
     * @Route("/{id}", name="comments_news_delete", methods={"POST"})
     */
    public function delete(Request $request, CommentsNews $commentsNews): Response
    {
        if ($this->isCsrfTokenValid('delete'.$commentsNews->getId(), $request->request->get('_token'))) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->remove($commentsNews);
            $entityManager->flush();
        }

        return $this->redirectToRoute('comments_news_index', [], Response::HTTP_SEE_OTHER);
    }
}
