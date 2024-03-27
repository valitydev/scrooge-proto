
namespace java dev.vality.scrooge
namespace erlang scrooge

include "base.thrift"

typedef base.Timestamp Timestamp
typedef base.Balance Balance

typedef map<string, string> StringMap

/** Идентификатор, указывающий на счет провайдера */
typedef string ReferenceID

struct BalanceRequest {
 1: required StringMap options
 2: optional Timestamp request_time
}


/** Данные, определяющие счет провайдера */
struct AccountReference {
  1: required ReferenceID id
}

struct BalanceResponse {
 1: required Balance balance
 2: required AccountReference account_reference
 3: optional Timestamp response_time
}

/**
* Интерфейс для работы со счетами провайдеров. Используется в scrooge в качестве клиента для запроса информации по
* счетам у адаптеров.
*/
service AccountService {

    /**
     * Запрос на получение баланса счета провайдера.
     */
    BalanceResponse GetBalance (1: BalanceRequest balance_request)

}
