Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404B87F
	for <regressions@lists.linux.dev>; Mon,  1 Aug 2022 02:36:47 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y9so9342240pff.12
        for <regressions@lists.linux.dev>; Sun, 31 Jul 2022 19:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/btFMtkRWmBmwZL2J5Giju8R89Pj69dl4iEYhrOPPD0=;
        b=l14ypADMZwmwBX3PPuNnhfhC0pkWgO3nxHo/kcyqcDQQy6USdhzex+seukGsSkiqSF
         CD7pjPOYfJb33Kd7/A6vDuOlVFJR69nqhta9PCeUDn5y37fM+EkdqrOWOxK0nM364cNI
         2hS6W+ancz2HhSWKGABkGucgEiskAd7ylplsxyesLdgbKYAGyM0I/K+ZEXPCQJj/GkFL
         8Y9XaXvYU44xz7LbcwFhfHWp3z3bb1GMR4qPIK58+MeCotpAY7lzMuOK025gYsWI0JgR
         W00nJkIsFipx8cXltA+pedB7ltCKnQ+3K6ezUJJcMD8vPYZcKGA2QkZCWNkwtVcXUu7k
         0vXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/btFMtkRWmBmwZL2J5Giju8R89Pj69dl4iEYhrOPPD0=;
        b=1M29UkwTsfVkdcCk/GdS4Xgr50K09XwLJhWn1tIcMJgvLTRrVOiflCzsMoVdau32c4
         ay6ppraoUZgK3ZsfLV0GBXMKA8sIt89EFG6yQyH8yejYkvtc9FeslwGE6dSZq13l4TGj
         2JeWR4hWxyqq4SprGfAqWq9uzxhj9W7WluX43oKh+mcWglniW9snDYLyHngodxLPzRAj
         DCyGnE8lGvDU/Vqd4CgVMAqEpMetd7Ge/NxrAyi2B+wA3xTmKdbjyB7Tj0fVv+d1C4Qw
         Yp2UyhjVG77EtIwkmQCeYedPdzMvkbtys3IbZ5uMJo9A4LwX/D9wIw6Badrqo2AprDAp
         p+yg==
X-Gm-Message-State: AJIora/0brv0ap6aYcsDGT7mUBw73A2xbEtPCd2Ceb4eYb3Ohe5h3YgA
	7RtHlHj2rDGjcsf0+7M+44huCw==
X-Google-Smtp-Source: AGRyM1uWuPpbJThAzj8401hKyu6FavGanE+K+gT78KliFc+nSDEucI4aDKw5IqZW2VO01+cLRobseA==
X-Received: by 2002:a05:6a00:24c6:b0:52b:ee89:eca9 with SMTP id d6-20020a056a0024c600b0052bee89eca9mr14043056pfv.78.1659321406689;
        Sun, 31 Jul 2022 19:36:46 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id j11-20020a170902da8b00b0016d1f6d1b99sm8237530plx.49.2022.07.31.19.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 19:36:46 -0700 (PDT)
Date: Mon, 1 Aug 2022 08:06:36 +0530
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
Message-ID: <20220801023636.p5ytjqasedpohmdy@vireshk-i7>
References: <CA+G9fYuGFReF0Z9qj7-80eY0gz-J2C5MVpno_8NjrGSH5_RB0Q@mail.gmail.com>
 <20220725102711.p6eerjjzgeqi4blu@vireshk-i7>
 <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f914f5c5-dd61-8495-b362-3043406582da@linaro.org>

On 25-07-22, 14:55, Stanimir Varbanov wrote:
> Hi Viresh,
> 
> I can take a look and provide a patch to fix that.

Any update on this ? I am going to send pull request for 5.20 very soon and it
would have been much better if this was fixed before I send that.

-- 
viresh
