package kr.codesquad.library.domain.recommand

import kr.codesquad.library.domain.account.Account
import kr.codesquad.library.domain.book.Book
import javax.persistence.*

@Entity
class Recommend(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "recommend_id")
    var id: Long? = null,

    @ManyToOne
    @JoinColumn(name = "account_id")
    var account: Account? = null,

    @ManyToOne
    @JoinColumn(name = "book_id")
    var book: Book? = null,
) {
}
