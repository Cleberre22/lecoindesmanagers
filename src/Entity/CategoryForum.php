<?php

namespace App\Entity;

use App\Repository\CategoryForumRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * @ORM\Entity(repositoryClass=CategoryForumRepository::class)
 */
class CategoryForum
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     
     * @ORM\Column(type="string", length=100)
     */
    private $nameCategory;

    /**
     * @Gedmo\Slug(fields={"nameCategory"})
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\ManyToOne(targetEntity=CategoryForum::class, inversedBy="categoryForums")
     */
    private $parent;

    /**
     * @ORM\OneToMany(targetEntity=CategoryForum::class, mappedBy="parent")
     */
    private $categoryForums;

    /**
     * @ORM\OneToMany(targetEntity=PostForum::class, mappedBy="categoryForum")
     */
    private $postForums;

    public function __construct()
    {
        $this->categoryForums = new ArrayCollection();
        $this->postForums = new ArrayCollection();
    }

    public function __toString()
    {
        return $this->nameCategory;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getNameCategory(): ?string
    {
        return $this->nameCategory;
    }

    public function setNameCategory(string $nameCategory): self
    {
        $this->nameCategory = $nameCategory;

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function getParent(): ?self
    {
        return $this->parent;
    }

    public function setParent(?self $parent): self
    {
        $this->parent = $parent;

        return $this;
    }

    /**
     * @return Collection|self[]
     */
    public function getCategoryForums(): Collection
    {
        return $this->categoryForums;
    }

    public function addCategoryForum(self $categoryForum): self
    {
        if (!$this->categoryForums->contains($categoryForum)) {
            $this->categoryForums[] = $categoryForum;
            $categoryForum->setParent($this);
        }

        return $this;
    }

    public function removeCategoryForum(self $categoryForum): self
    {
        if ($this->categoryForums->removeElement($categoryForum)) {
            // set the owning side to null (unless already changed)
            if ($categoryForum->getParent() === $this) {
                $categoryForum->setParent(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection|PostForum[]
     */
    public function getPostForums(): Collection
    {
        return $this->postForums;
    }

    public function addPostForum(PostForum $postForum): self
    {
        if (!$this->postForums->contains($postForum)) {
            $this->postForums[] = $postForum;
            $postForum->setCategoryForum($this);
        }

        return $this;
    }

    public function removePostForum(PostForum $postForum): self
    {
        if ($this->postForums->removeElement($postForum)) {
            // set the owning side to null (unless already changed)
            if ($postForum->getCategoryForum() === $this) {
                $postForum->setCategoryForum(null);
            }
        }

        return $this;
    }
}
