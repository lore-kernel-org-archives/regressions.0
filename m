Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE263B
	for <regressions@lists.linux.dev>; Mon, 25 Jul 2022 12:09:51 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id q41-20020a17090a1b2c00b001f2043c727aso10099178pjq.1
        for <regressions@lists.linux.dev>; Mon, 25 Jul 2022 05:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/vAlD2Uj4JArMK2xat0u8itYglD8Kk8L5ACdFaAlxqs=;
        b=A2oNuiPlEVJtYLXgw2uTDbD5XoOkhTkRZ+TgJG9T0B0UnRIol8tNmoj+OnwvNTiEZc
         hle3V416mtDl6YnRY54Uz7ZYoma7m8kzIx8/sH8Zt/v1ff/uW63BeM/ei5HFh8fLCpNv
         6C0RZ+0axhJRxw1pbu0Wwk1xEj3iHOxBSS0IUpvGlOJDhX99a4BSryMuaAVVRNaigVCz
         Eezn91YMhIcU+BzP8pmyW2Cpxua8a69l8hJMfGFixyqsWwuCm1AYWNB+kPUmtzHc+fak
         63ETFIbHFLKullcdOwvTPZNIOwkGv8O/GjgK0UZ4M5Gg3dCujVbmnz3mHGPBMdy9JpDu
         nh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/vAlD2Uj4JArMK2xat0u8itYglD8Kk8L5ACdFaAlxqs=;
        b=po+/3GzYqGLfHBCxTUCKHQ2QbzmsyJBfaH03c+C336QieJkctgULK9oLWntj5X8kDs
         TnqMjOFqC5f5SE+7gqrxH8A9pXrXhVI7ItBxwriLPTg/NTsWUF4zOz3Z/Ia8+4mbnSuY
         UO5doKJIEOF9ukXA680wI/uf6rPH8l95c5aJvP0yj1cvVE4Ug4f2ONH6/lOOjHrlsyX5
         CrLKsCeYK6FXx50OnWfxXTuKHFXv5VjeKz0dM8U2trPPZk/s1a4mk/vCOY1fLe+Pkuj6
         hh3xed569xs6CeDv6b0P5e27gs1WpuLkLOZAaevCYs4cEWA13JMvIBMewoI4q/ikCSeQ
         0kqA==
X-Gm-Message-State: AJIora+L6vHKpy3LPJyoCWUE2Ssg0+CzdE/UI4LNVwjolCFUPnwzVf5t
	axCtywL9d9OFQ++IwiW5l4kcpw==
X-Google-Smtp-Source: AGRyM1sSBp98T6cTNyv8vujrNsns4paivHQuBGy782p0vi4eo2Asxwnq5ntBEh1AcH0145Y434mvdQ==
X-Received: by 2002:a17:90a:f003:b0:1f2:49f8:19d5 with SMTP id bt3-20020a17090af00300b001f249f819d5mr14573096pjb.28.1658750991448;
        Mon, 25 Jul 2022 05:09:51 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id r13-20020aa7962d000000b0052acb753b8bsm9325800pfg.158.2022.07.25.05.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 05:09:51 -0700 (PDT)
Date: Mon, 25 Jul 2022 17:39:49 +0530
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
Message-ID: <20220725120949.fofc7chlsnrgfpvm@vireshk-i7>
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
> 
> But, is this a new warn or it is a consequence of new changes in
> opp/core.c ?

This WARN was missing earlier (by mistake) and is added now after some
redesigning. You can reproduce it on the OPP tree:

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git opp/linux-next

-- 
viresh
