Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C279171CF
	for <regressions@lists.linux.dev>; Tue, 27 Jun 2023 10:15:55 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a337ddff16so121329b6e.0
        for <regressions@lists.linux.dev>; Tue, 27 Jun 2023 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687860954; x=1690452954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hVVzoMXdpNjtgUHY250Y/W5hOx8AigmyoHcaBv9Xj10=;
        b=LjOBDS4/K1nP0HoVX8WCclOQn7pQ/8iXxDkxd2EJZUZIqL8CU+WBtEb2dbMRXIV+xW
         hx2e+Bfjd2qjVdRqcI1yWk0+RL+wnpCpmxEHEV49SbegpKBXo7w324p4AU+g4nbQufcT
         L33nhOWiZgUoYXZ+qgy5OZ1wGOLBmiwMowWB2NwSbRg6E8jOrPlCh/7FiRl/AZK/Gojc
         QQK5REJcXX5w2UghRVPnEyLmr+cB8eKAWoyJTsxeQtR/I8Jz2xGtI+KMmyYY/PUv4XdN
         cZYbTCx4452vernxkvXK1Je4I1bQQt61t9xXcAQUsjSU96fm/Ly9Ce/vvPPHpxZwicmA
         2pug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687860954; x=1690452954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hVVzoMXdpNjtgUHY250Y/W5hOx8AigmyoHcaBv9Xj10=;
        b=jk2tp0rcHyRDmMZ794AipLemQLFZOtvg/A5CSrR5ERIm/IYb3bAQoXk1t+cYceu4N7
         z2HUFy9XVVW60NN7RzWZbVZHri9XhEkYBbpj2+Rh6UAPWZPPgvfjJo3dTYStxdzHSfyJ
         9nWPvUfS3zUOkxXEkWJQ0vj5fyQdqN0mUiVkm2kyqyntxtWNaYDm5mo0Aw0dWtScfIoO
         /ljFz+5Wt0U+4Zi8SCd4nvXj0d0+TPTAH6YYjQ1cnIRTNxF5ysLq9SaxtS9SKVTspKLc
         xn3Dv2Ewa1SuLGS8uV3Teeqs3gmlDH7rlVi9QlpxV+wCPjkPSRxvhmSqcM2nXaLsHdCa
         7xUw==
X-Gm-Message-State: AC+VfDxMQIKV7kCIfWCPmQfMtTEu18SZHv6+oe88flc4RC7TvdAXI41u
	raNXz1xXXskapN+DBROdvI4=
X-Google-Smtp-Source: ACHHUZ4D4aCFbAdAdylYjRsMiktTcMuKpBXxQJbIUAzAKWIfqqhf+oEuf1AZTXi3NvUtUseIGyC/nQ==
X-Received: by 2002:a05:6808:1cf:b0:3a1:dcca:9628 with SMTP id x15-20020a05680801cf00b003a1dcca9628mr5197155oic.10.1687860954084;
        Tue, 27 Jun 2023 03:15:54 -0700 (PDT)
Received: from [192.168.0.103] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id t4-20020a62ea04000000b00659b8313d08sm5146492pfh.78.2023.06.27.03.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 03:15:53 -0700 (PDT)
Message-ID: <99b64dfd-be4a-2248-5c42-8eb9197824e1@gmail.com>
Date: Tue, 27 Jun 2023 17:15:42 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: High cpu usage caused by kernel process when upgraded to
 linux 5.19.17 or later
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Lingutla Chandrasekhar <clingutla@codeaurora.org>,
 Frederic Weisbecker <frederic@kernel.org>, "J. Avila" <elavila@google.com>,
 Vivek Anand <vivekanand754@gmail.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Thomas Renninger <trenn@suse.com>,
 Shuah Khan <shuah@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Netfilter Development <netfilter-devel@vger.kernel.org>,
 Netfilter Core Developers <coreteam@netfilter.org>,
 Linux Networking <netdev@vger.kernel.org>,
 Linux Power Management <linux-pm@vger.kernel.org>, x86@kernel.org
References: <01ac399d-f793-49d4-844b-72cd8e0034df@gmail.com>
 <ZJpJkL3dPXxgw6RK@debian.me>
 <20230627073035.GV4253@hirez.programming.kicks-ass.net>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20230627073035.GV4253@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/27/23 14:30, Peter Zijlstra wrote:
> I can't tell from this. Also, please don't use bugzilla.

Why not BZ? I'm confused too...

-- 
An old man doll... just what I always wanted! - Clara

