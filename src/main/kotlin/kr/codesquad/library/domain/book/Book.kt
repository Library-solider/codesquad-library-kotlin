package kr.codesquad.library.domain.book

import kr.codesquad.library.domain.bookcase.Bookcase
import kr.codesquad.library.domain.category.Category
import java.time.LocalDate
import javax.persistence.*

@Entity
class Book(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "book_id")
    var id: Long? = null,

    var title: String,
    var description: String? = null,
    var author: String? = null,
    var publisher: String? = null,

    @Column(columnDefinition = "TIMESTAMP")
    var publicationDate: LocalDate? = null,

    var isbn: String? = null,
    var available: Boolean = true,
    var recommendCount: Long = 0,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    var category: Category? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "bookcase_id")
    var bookcase: Bookcase? = null,
) {
}
