package kr.codesquad.library.domain.bookcase

import javax.persistence.*

@Entity
class Bookcase(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bookcase_id")
    var id: Long? = null,

    var location: String? = null
) {
}
