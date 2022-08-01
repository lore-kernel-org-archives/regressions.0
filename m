Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555707F
	for <regressions@lists.linux.dev>; Mon,  1 Aug 2022 07:38:39 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id a11so5339691wmq.3
        for <regressions@lists.linux.dev>; Mon, 01 Aug 2022 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=9M7ldFJwPPyHRHC4pJgvhcKgnF4pbM0tP8St0djzKuw=;
        b=sW8QpDnWF7xSXsUFb0joWJpFbsJqVghEnrKrJiEApa5LRNUMreHQchJqNvaJXnjeIY
         RwJAt4hM+PIx/vy1HV0B/EmXNipyqYuCEZcJpZ9PwoIAEC6czpPBu/6BkoxJhu0xPPfy
         DWK67l7OHjeoEU1+R5qE5bLNiGi+3dysmc4SftaMj5xgGbuVVn0vNz8zLC1IvzDS7vfB
         et1x6XPqtgukzkSOIgZdA/eZqCsY9AVczZ68zbKqaqzk8mH2CQ67i84zjPIDqUC3rE2g
         F467MLLePwrZCHDdooMO3PqZITyPuaIqH0vT2VzOpsWsUEN7zsAhQKc9GcaacWrf55ks
         NcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=9M7ldFJwPPyHRHC4pJgvhcKgnF4pbM0tP8St0djzKuw=;
        b=e/XCujENjdKY1BAmbkHEFA76dHmjPOFHYjw639/32xkaKH7AaFwmU9Mvf51Wk5OA8A
         lZZhQ7rMGl5DFZYzn6aG/YYGcCywZSJlZa4dCmiiWBCCUGrC6p41k8QLI465ChlHSQMj
         tQ9iQkiNSaHXpu8M4tqNIOs3on+a9CWxOVW3k7e5+6XseOiRY4evuhgf4jlw+r1Qu6uQ
         bc+7ymKphMpLnDvXjaxoCC4OTXJ90O+iDslmGbmFwgDTBjBxQbymam+f4eOm+QsMHq7I
         KQBGoTtOZ7AdtfY/pHa515zmzpWwWr7cD9lW8fN+I9KQCKpt8IBilw4znOxl4HKHtWIP
         FXSg==
X-Gm-Message-State: AJIora9u5h2WvTf89Ya67QAufWMVw2YkyGFaNRPEQX5+qv9oqe9cQ8Nm
	Cre8ztaHLDXWAsxbMQHq0Bx7Mg==
X-Google-Smtp-Source: AGRyM1uiAOLx+QSU7QqVWX8hyXfWnsrdp3pynTasFZMa2HyimA+kO0txTY3bP8kzaaOaIuTSSAIOvw==
X-Received: by 2002:a05:600c:b5a:b0:3a3:186f:a564 with SMTP id k26-20020a05600c0b5a00b003a3186fa564mr10613679wmr.71.1659339517668;
        Mon, 01 Aug 2022 00:38:37 -0700 (PDT)
Received: from [192.168.1.5] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id u11-20020a056000038b00b0021e4829d359sm11473355wrf.39.2022.08.01.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 00:38:37 -0700 (PDT)
Message-ID: <aebc16fa-b5be-5db4-c4d3-17bfde697eed@linaro.org>
Date: Mon, 1 Aug 2022 10:38:09 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: WARNING: CPU: 4 PID: 326 at drivers/opp/core.c:2471
 dev_pm_opp_set_config+0x344/0x620
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mansur Alisha Shaik <mansur@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 regressions@lists.linux.dev, Linux PM <linux-pm@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <CA+G9fYuGFReF0Z9qj7-80eY0gz-J2C5MVpno_8NjrGSH5_RB0Q@mail.gmail.com>
 <20220725102711.p6eerjjzgeqi4blu@vireshk-i7>
 <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>
 <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
In-Reply-To: <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Viresh,

On 8/1/22 05:36, Viresh Kumar wrote:
> On 25-07-22, 14:55, Stanimir Varbanov wrote:
>> Hi Viresh,
>>
>> I can take a look and provide a patch to fix that.
> 
> Any update on this ? I am going to send pull request for 5.20 very soon and it
> would have been much better if this was fixed before I send that.
> 

I hope, I will finish up this today.


-- 
regards,
Stan
