
namespace java dev.vality.scrooge.terminal.balance
namespace erlang scrooge.terminal.balance

include "base.thrift"

typedef base.ID ID
typedef base.Timestamp Timestamp
typedef base.Balance Balance
typedef base.ContinuationToken ContinuationToken

/** Запрос к сервису */
struct TerminalBalanceRequest {
    1: optional i32 limit
    2: optional ContinuationToken continuation_token
}

struct Terminal {
    1: required ID id
    2: required string name
}

struct Provider {
    1: required ID id;
    2: required string name;
}

/** Ответ сервиса */
struct TerminalBalanceResponse {
    1: required string account_id
    2: required Provider provider
    3: required Terminal terminal
    4: required Balance balance
    5: required Timestamp last_updated;
}

/**
* Интерфейс для работы со счетами провайдеров. Используется в scrooge в качестве сервера для предоставления информации
* о терминалах.
*/
service TerminalService {

    /**
     * Запрос на получение баланса терминала.
     */
    TerminalBalanceResponse GetTerminalBalance(1: TerminalBalanceRequest balance_request)

}