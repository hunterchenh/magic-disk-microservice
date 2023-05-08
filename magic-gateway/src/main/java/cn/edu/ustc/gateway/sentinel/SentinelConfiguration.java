package cn.edu.ustc.gateway.sentinel;

import cn.edu.ustc.common.result.ResultCode;
import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.BlockRequestHandler;
import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.GatewayCallbackManager;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.server.ServerResponse;

import javax.annotation.PostConstruct;

/**
 * 自定义网关流控异常
 *
 */
@Configuration
public class SentinelConfiguration {

    @PostConstruct
    private void initBlockHandler() {
        BlockRequestHandler blockRequestHandler = (exchange, t) ->
                ServerResponse.status(HttpStatus.TOO_MANY_REQUESTS)
                        .contentType(MediaType.APPLICATION_JSON)
                        .body(BodyInserters.fromValue(ResultCode.FLOW_LIMITING.toString())
                        );
        GatewayCallbackManager.setBlockHandler(blockRequestHandler);
    }
}
