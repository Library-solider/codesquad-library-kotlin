package kr.codesquad.library.domain.category

import javax.persistence.*

@Entity
class Category(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    var id: Long? = null,

    var title: String?
) {
}
