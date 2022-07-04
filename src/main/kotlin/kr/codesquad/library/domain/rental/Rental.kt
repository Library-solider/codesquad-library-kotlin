package kr.codesquad.library.domain.rental

import kr.codesquad.library.domain.account.Account
import kr.codesquad.library.domain.book.Book
import java.time.LocalDate
import javax.persistence.*

@Entity
class Rental(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_id")
    var id: Long? = null,

    @Column(columnDefinition = "TIMESTAMP")
    var beginDate: LocalDate? = null,

    @Column(columnDefinition = "TIMESTAMP")
    var returnDate: LocalDate? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "book_id")
    var book: Book? = null,

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "account_id")
    var account: Account? = null,

    var isReturned: Boolean = false
) {
}
