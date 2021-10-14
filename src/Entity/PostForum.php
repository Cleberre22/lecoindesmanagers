<?php

namespace App\Entity;

use App\Entity\Users;
use App\Entity\CategoryForum;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use App\Repository\PostForumRepository;

/**
 * @ORM\Entity(repositoryClass=PostForumRepository::class)
 */
class PostForum
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
    private $titlePost;

    /**
     * @Gedmo\Slug(fields={"titlePost"})
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="text")
     */
    private $contentPost;

    /**
     * @ORM\Column(type="datetime")
     */
    private $created_at;

    /**
     * @ORM\Column(type="boolean")
     */
    private $active = false;

    /**
     * @ORM\ManyToOne(targetEntity=Users::class, inversedBy="postForums")
     * @ORM\JoinColumn(nullable=false)
     */
    private $users;

    /**
     * @ORM\ManyToOne(targetEntity=CategoryForum::class, inversedBy="postForums")
     * @ORM\JoinColumn(nullable=false)
     */
    private $categoryForum;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTitlePost(): ?string
    {
        return $this->titlePost;
    }

    public function setTitlePost(string $titlePost): self
    {
        $this->titlePost = $titlePost;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function getContentPost(): ?string
    {
        return $this->contentPost;
    }

    public function setContentPost(string $contentPost): self
    {
        $this->contentPost = $contentPost;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->created_at;
    }

    public function setCreatedAt(\DateTimeInterface $created_at): self
    {
        $this->created_at = $created_at;

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

    public function getUsers(): ?Users
    {
        return $this->users;
    }

    public function setUsers(?Users $users): self
    {
        $this->users = $users;

        return $this;
    }

    public function getCategoryForum(): ?CategoryForum
    {
        return $this->categoryForum;
    }

    public function setCategoryForum(?CategoryForum $categoryForum): self
    {
        $this->categoryForum = $categoryForum;

        return $this;
    }
}
