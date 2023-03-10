Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F578BE1
	for <regressions@lists.linux.dev>; Fri, 10 Mar 2023 16:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678464096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0xUmcNvm9OhI6gvTwqauUicJ3Galf9wGdney4qbqfVc=;
	b=Cj3YAPtpnjIr4uY4SiAATA9jpJXPtuk/SLzwb/ak7C27MmLLvv0uZD/pS7T4mBzF9PyAw9
	wqwxKvl6GN0OjaAjI1NaHlBrY3F8lMXHEvowmaUjr4qqG0xgzyc29WQhF6PsoUazvp5Wl6
	8HtrZDjniYiCnlDNvosdiQiGKZm9nVE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-YFqwHbeeNQOpqGbeglpTmA-1; Fri, 10 Mar 2023 11:01:35 -0500
X-MC-Unique: YFqwHbeeNQOpqGbeglpTmA-1
Received: by mail-wm1-f72.google.com with SMTP id u19-20020a05600c00d300b003eb24ce58ceso1986080wmm.9
        for <regressions@lists.linux.dev>; Fri, 10 Mar 2023 08:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464094;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0xUmcNvm9OhI6gvTwqauUicJ3Galf9wGdney4qbqfVc=;
        b=JjSsCVXxMyAcU3Ib8idz7wywXbR94yrC7uze6F/KpHJ6KgeUY+yIRs+7GCfEtDEWdm
         Vqn7HBjmeh6dfWVdntN2u+H7zwT7ZaKdPa0ar3+6S7mse+U82xb9XZanRQ8i9FXym728
         sekIfWMkGXgNUJ4cPUOpYnYN+MN8qUvZBIvuNdgjQoUgaCGXp6NhEQ8pDSKtvAE+P86z
         /crhChQbcVsgx4rMPDpyqPbCt3BD/gSgIbLupjP72xJPZFXP5l6Tu0IsmAqGs8ILtfoa
         mkwWiBwWPkRSXL1X1+52wFM7WECLtsKsPoK3hNEWs6edZ86b/taQyC1VHyWunDAV5vfH
         8Y6A==
X-Gm-Message-State: AO0yUKX/gKZoFSg+Dkv5GtwqfhCZldKAFQyEyhAqK2iKDv0Cvd453pt+
	ux/EJU3NI3TkZdBP+2hlDX2xjNklHRGrleJiEkhpDyqerpnL1ww1NPwm2AEN+pCaDV3YoIr2MlU
	t0r2XzWOvhtFwGZhD/wt/7bU=
X-Received: by 2002:a05:600c:1c8d:b0:3df:d8c5:ec18 with SMTP id k13-20020a05600c1c8d00b003dfd8c5ec18mr3277839wms.13.1678464093913;
        Fri, 10 Mar 2023 08:01:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8TykNev7d9AXrs/W7cNFl0qC1yRTdR8u3Il2ju5XgUGDpbh61KqtKbXx5Wxs36LiH+NFMs9w==
X-Received: by 2002:a05:600c:1c8d:b0:3df:d8c5:ec18 with SMTP id k13-20020a05600c1c8d00b003dfd8c5ec18mr3277811wms.13.1678464093647;
        Fri, 10 Mar 2023 08:01:33 -0800 (PST)
Received: from [192.168.188.25] ([80.243.52.134])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d40ce000000b002c5539171d1sm152743wrq.41.2023.03.10.08.01.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:01:33 -0800 (PST)
Message-ID: <e21bf153-80b0-9ec0-15ba-e04a4ad42c34@redhat.com>
Date: Fri, 10 Mar 2023 17:01:31 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Paul Holzinger <pholzing@redhat.com>
Subject: [REGRESSION] v6.1+ bind() does not fail with EADDRINUSE if dual stack
 is bound
To: stable@vger.kernel.org
Cc: netdev@vger.kernel.org, regressions@lists.linux.dev,
 martin.lau@kernel.org, kuba@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

there seems to be a regression which allows you to bind the same port 
twice when the first bind call bound to all ip addresses (i. e. dual stack).

A second bind call for the same port will succeed if you try to bind to 
a specific ipv4 (e. g. 127.0.0.1), binding to 0.0.0.0 or an ipv6 address 
fails correctly with EADDRINUSE.

I included a small c program below to show the issue. Normally the 
second bind call should fail, this was the case before v6.1.


I bisected the regression to commit 5456262d2baa ("net: Fix incorrect 
address comparison when searching for a bind2 bucket").

I also checked that the issue is still present in v6.3-rc1.


Original report: https://github.com/containers/podman/issues/17719

#regzbot introduced: 5456262d2baa


```

#include <sys/socket.h>
#include <sys/un.h>
#include <stdlib.h>
#include <stdio.h>
#include <netinet/in.h>
#include <unistd.h>

int main(int argc, char *argv[])
{
     int ret, sock1, sock2;
     struct sockaddr_in6 addr;
     struct sockaddr_in addr2;

     sock1 = socket(AF_INET6, SOCK_STREAM, 0);
     if (sock1 == -1)
     {
         perror("socket1");
         exit(1);
     }
     sock2 = socket(AF_INET, SOCK_STREAM, 0);
     if (sock2 == -1)
     {
         perror("socket2");
         exit(1);
     }

     memset(&addr, 0, sizeof(addr));
     addr.sin6_family = AF_INET6;
     addr.sin6_addr = in6addr_any;
     addr.sin6_port = htons(8080);

     memset(&addr2, 0, sizeof(addr2));
     addr2.sin_family = AF_INET;
     addr2.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
     addr2.sin_port = htons(8080);

     ret = bind(sock1, (struct sockaddr *)&addr, sizeof(addr));
     if (ret == -1)
     {
         perror("bind1");
         exit(1);
     }
     printf("bind1 ret: %d\n", ret);

     if ((listen(sock1, 5)) != 0)
     {
         perror("listen1");
         exit(1);
     }

     ret = bind(sock2, (struct sockaddr *)&addr2, sizeof(addr2));
     if (ret == -1)
     {
         perror("bind2");
         exit(1);
     }
     printf("bind2 ret: %d\n", ret);

     if ((listen(sock2, 5)) != 0)
     {
         perror("listen2");
         exit(1);
     }

     // uncomment pause() to see with ss -tlpn the bound ports
     // pause();

     return 0;
}

```


Best regards,

Paul

