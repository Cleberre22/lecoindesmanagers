<?php

namespace App\Entity;

use App\Entity\News;
use App\Entity\Users;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\CommentsNewsRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass=CommentsNewsRepository::class)
 */
class CommentsNews
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id; 

    /**
     * @ORM\Column(type="text")
     */
    private $contentCommentNews;

    /**
     * @ORM\Column(type="boolean")
     */
    private $active = false;

    /**
     * @ORM\Column(type="datetime")
     */
    private $createdAtCommentNews;

    /**
     * @ORM\Column(type="boolean")
     */
    private $rgpd;

    /**
     * @ORM\ManyToOne(targetEntity=News::class, inversedBy="commentsNews")
     * @ORM\JoinColumn(nullable=false)
     */
    private $news;

    /**
     * @ORM\ManyToOne(targetEntity=Users::class, inversedBy="commentsNews")
     */
    private $users;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getContentCommentNews(): ?string
    {
        return $this->contentCommentNews;
    }

    public function setContentCommentNews(string $contentCommentNews): self
    {
        $this->contentCommentNews = $contentCommentNews;

        return $this;
    }

    public function getActive(): ?bool
    {
        return $this->active;
    }

    public function setActive(bool $active): self
    {
        $this->active = $active;

        return $this;
    }

    public function getCreatedAtCommentNews(): ?\DateTimeInterface
    {
        return $this->createdAtCommentNews;
    }

    public function setCreatedAtCommentNews(\DateTimeInterface $createdAtCommentNews): self
    {
        $this->createdAtCommentNews = $createdAtCommentNews;

        return $this;
    }

    public function getRgpd(): ?bool
    {
        return $this->rgpd;
    }

    public function setRgpd(bool $rgpd): self
    {
        $this->rgpd = $rgpd;

        return $this;
    }

    public function getNews(): ?News
    {
        return $this->news;
    }

    public function setNews(?News $news): self
    {
        $this->news = $news;

        return $this;
    }

    public function getUsers(): ?Users
    {
        return $this->users;
    }

    public function setUsers(?Users $users): self
    {
        $this->users = $users;

        return $this;
    }
}
