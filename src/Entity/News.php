<?php

namespace App\Entity;

use App\Entity\Users;
use App\Entity\CommentsNews;
use Doctrine\ORM\Mapping as ORM;
use App\Repository\NewsRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * @ORM\Entity(repositoryClass=NewsRepository::class)
 */
class News
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $titleNews;

    /**
     * @ORM\Column(type="text")
     */
    private $contentNews;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $imgNews;

    /**
     * @ORM\Column(type="datetime")
     */
    private $creationDateNews;

    /**
     * @ORM\Column(type="datetime")
     */
    private $modificationDateNews;

    /**
     * @ORM\ManyToOne(targetEntity=Users::class, inversedBy="News")
     */
    private $users;

    /**
     * @ORM\OneToMany(targetEntity=CommentsNews::class, mappedBy="news", orphanRemoval=true)
     */
    private $commentsNews;

    public function __construct()
    {
        $this->commentsNews = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitleNews(): ?string
    {
        return $this->titleNews;
    }

    public function setTitleNews(string $titleNews): self
    {
        $this->titleNews = $titleNews;

        return $this;
    }

    public function getContentNews(): ?string
    {
        return $this->contentNews;
    }

    public function setContentNews(string $contentNews): self
    {
        $this->contentNews = $contentNews;

        return $this;
    }

    public function getImgNews(): ?string
    {
        return $this->imgNews;
    }

    public function setImgNews(string $imgNews): self
    {
        $this->imgNews = $imgNews;

        return $this;
    }

    public function getCreationDateNews(): ?\DateTimeInterface
    {
        return $this->creationDateNews;
    }

    public function setCreationDateNews(\DateTimeInterface $creationDateNews): self
    {
        $this->creationDateNews = $creationDateNews;

        return $this;
    }

    public function getModificationDateNews(): ?\DateTimeInterface
    {
        return $this->modificationDateNews;
    }

    public function setModificationDateNews(\DateTimeInterface $modificationDateNews): self
    {
        $this->modificationDateNews = $modificationDateNews;

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

    /**
     * @return Collection|CommentsNews[]
     */
    public function getCommentsNews(): Collection
    {
        return $this->commentsNews;
    }

    public function addCommentsNews(CommentsNews $commentsNews): self
    {
        if (!$this->commentsNews->contains($commentsNews)) {
            $this->commentsNews[] = $commentsNews;
            $commentsNews->setNews($this);
        }

        return $this;
    }

    public function removeCommentsNews(CommentsNews $commentsNews): self
    {
        if ($this->commentsNews->removeElement($commentsNews)) {
            // set the owning side to null (unless already changed)
            if ($commentsNews->getNews() === $this) {
                $commentsNews->setNews(null);
            }
        }

        return $this;
    }


}
