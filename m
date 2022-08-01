Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEFB7F
	for <regressions@lists.linux.dev>; Mon,  1 Aug 2022 11:43:04 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 206so5947192pgb.0
        for <regressions@lists.linux.dev>; Mon, 01 Aug 2022 04:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jCZfqgpMIYNePan17xLuQgg/2P+1/yoh0ZDJdZ/18tI=;
        b=IDlZWskTF70cLwVWU511IykP7AjcAZQRAs8VbYY0NylYCYM0GJ2goPqkXxs1+3oyAL
         xruycQ6vh21/kXgFQ6YyXhYqPqZ1o1sM/twBunN/05CtkUSL5NTNSUCHOQL3+WBfWj1S
         4AcaDOZME9ihzikOxhHpu0dIqXM/TVkSLeCIYgjNTgNpA/o/fx8RZj6i7fG4XxG7J857
         a+TOwHrJ0DMEUMKTcXDe6HvsFadmvS+FKR7TchULQyxH8Pc9IWAUDAD5cFxGV9PfKnH7
         6kWiotPrDaGVwgmgJ1jE5AIkwo8+ZF8NPfTbwRjIc/oXl6AWhp/dOZfbjp2DwFyzAKT7
         8P9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jCZfqgpMIYNePan17xLuQgg/2P+1/yoh0ZDJdZ/18tI=;
        b=1o8+xSTO8bEU7d+xDgmvK57Svd8uOMzLgKgRyGqA4USOs9boJHv949b41eFEG0QpiG
         qUkatd5T1kDkyEj2JT2ysbNQZVqJ/noMMALicp3VyEylohxLJ9GND8jZc+moPcaQnxtm
         08msujaT0iMyetJKEljZSqwXkITtvD1x3J9eidA/bK1AgO4YW4HWW+dRTjITWOUvsyM2
         wq9JrKhC5MF7kv8XzkRUvef3idXKsSPPz88knf1RfTBlXakF8LQBVp80xuEV10SGp6bL
         cl21S5uZn8lUTo5+qzHAgo8GlDwQSSJIu3AudnpEFECL3yikwJwk7ltgzSQ2tsGS0vHa
         FJsQ==
X-Gm-Message-State: AJIora/4arjA5F2MtQ6XXT7wnd+dZoKrvFC+5RldeNmTGe7FVB45DPkK
	+895kjvVpCXEy9CAxN99VcHhAg==
X-Google-Smtp-Source: AGRyM1sy7zJbZBiuLqJ7c7UTW7/Bu4BYqPzTf/WcI22nbTu9nQpq2LYP0aw6jf2JYIEIq3ZhrUjwiA==
X-Received: by 2002:a05:6a00:17aa:b0:52a:e94b:67e5 with SMTP id s42-20020a056a0017aa00b0052ae94b67e5mr16104010pfg.76.1659354184093;
        Mon, 01 Aug 2022 04:43:04 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b0016d5cf36ff8sm9496422plf.274.2022.08.01.04.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 04:43:03 -0700 (PDT)
Date: Mon, 1 Aug 2022 17:13:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Mansur Alisha Shaik <mansur@codeaurora.org>,
	open list <linux-kernel@vger.kernel.org>,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	regressions@lists.linux.dev, Linux PM <linux-pm@vger.kernel.org>,
	lkft-triage@lists.linaro.org, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: WARNING: CPU: 4 PID: 326 at drivers/opp/core.c:2471
 dev_pm_opp_set_config+0x344/0x620
Message-ID: <20220801114301.k6ya3gfyy3pcrzwx@vireshk-i7>
References: <CA+G9fYuGFReF0Z9qj7-80eY0gz-J2C5MVpno_8NjrGSH5_RB0Q@mail.gmail.com>
 <20220725102711.p6eerjjzgeqi4blu@vireshk-i7>
 <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>
 <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
 <d074daf4-c8e1-927d-9edd-2575f2335aa1@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d074daf4-c8e1-927d-9edd-2575f2335aa1@linaro.org>

On 01-08-22, 14:36, Stanimir Varbanov wrote:
> Viresh,
> 
> On 8/1/22 05:36, Viresh Kumar wrote:
> > On 25-07-22, 14:55, Stanimir Varbanov wrote:
> >> Hi Viresh,
> >>
> >> I can take a look and provide a patch to fix that.
> > 
> > Any update on this ? I am going to send pull request for 5.20 very soon and it
> > would have been much better if this was fixed before I send that.
> > 
> 
> I'm trying on next-20220728, but applying [1] gives below errors:
> 
> /linux-next/drivers/media/platform/qcom/venus/pm_helpers.c: In function
> ‘core_get_v1’:
> /linux-next/drivers/media/platform/qcom/venus/pm_helpers.c:299:4: error:
> ‘struct dev_pm_opp_config’ has no member named ‘clk_count’
>   299 |   .clk_count = 1,
>       |    ^~~~~~~~~
> 
> 
> Do you have v3 for Venus driver ?

You don't need to apply anything over linux-next, it has everything you need.
The patch you mention is dropped and we carry separate calls to configure OPP
resources for now.

-- 
viresh
