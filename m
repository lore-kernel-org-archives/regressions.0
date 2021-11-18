Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCA32C82
	for <regressions@lists.linux.dev>; Thu, 18 Nov 2021 17:41:50 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so8817196pjc.4
        for <regressions@lists.linux.dev>; Thu, 18 Nov 2021 09:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ciIRwy+yxvWn2LwEQWDIz+C3VSCgM6erWfnwc1pCQE=;
        b=Po2980MK3nArAg5kgUQyTvOoghzp/so1mpxQqFmgkHfEuiVm8w/dsmqAfsmBEK0PsS
         t8cSYt5UI3z/+ZqDacYoUWritLHHkVDbZ9H8o9dp/O9FE2zwEefIwO2aYxWPBOIDi0K+
         Q6hRyiEXWNyugSaBdzEw/qLSH/sOZJ2SYBgfg+OKWsSQamHGH9lENraxerysU0vcMk+Q
         gndcskSMDwvdRTBfqcZ/DzJsMtzISsqSBCwYI5CaincTsqedpUpjUlPSNAVWCz32JR6l
         sapZEjrhakrT/HOKweuJvuRS6yVR6zqLJ7XwBGb7SQS30043DmQ13cwyhGCRWf9lL4m9
         Y6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ciIRwy+yxvWn2LwEQWDIz+C3VSCgM6erWfnwc1pCQE=;
        b=ErWcjxuGKIEv0AwnXGOBGixINo2RvZMTCTZ3M85OPw7OMo+8Pdfsc7sqrhOAWRId+0
         sjR2/fXkcYqGL2VWY4bRqN9D+6plPWbLa9jD7Q7UfrivTqDTofZcPOdK8X+ktMQI9uMo
         fDE/RNZD+dyVo064gI4TlCV6LMgXxHQN5KWSt7267oB49JfRF01evoiolParA2nrFo5/
         jYvD6lpFMd3o1vLcdAcZLObOTjK6gQflUYFg08xWg8E6rfQIR3D+mGEf6h7fqOTToYRX
         fnoMUzBVlol8W/tAxgGrxcMFHtPgXrwadR58aueX8hzeID5ULODb0ZL3CaR6l37xz2X4
         +nQA==
X-Gm-Message-State: AOAM531kQQ5V1IJVzF1eBXYmk+4GDHTjUW44OhNgxteUQYIW9bNG5viS
	zvab+5lRgtNVcaqBbzUL+90i
X-Google-Smtp-Source: ABdhPJz4ckUHzppPNRFH93bqoC4QHvF8HTUl6iWPtRcLKk0HfikDz9RyuU6wf05bW3QmHIX+Gogc6A==
X-Received: by 2002:a17:90a:a396:: with SMTP id x22mr12624056pjp.14.1637257310302;
        Thu, 18 Nov 2021 09:41:50 -0800 (PST)
Received: from thinkpad ([117.202.188.63])
        by smtp.gmail.com with ESMTPSA id h6sm271494pfh.82.2021.11.18.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 09:41:49 -0800 (PST)
Date: Thu, 18 Nov 2021 23:11:45 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	regressions@lists.linux.dev, mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20211118174145.GA31300@thinkpad>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 <87a6jl9ndo.fsf@codeaurora.org>
 <87ee8hgqni.fsf@codeaurora.org>
 <20211021100305.GD7580@workstation>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021100305.GD7580@workstation>

On Thu, Oct 21, 2021 at 03:33:05PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
> > Kalle Valo <kvalo@codeaurora.org> writes:
> > 
> > > (adding the new mhi list, yay)
> > >
> > > Hi Loic,
> > >
> > > Loic Poulain <loic.poulain@linaro.org> writes:
> > >
> > >>> Loic Poulain <loic.poulain@linaro.org> writes:
> > >>>
> > >>> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> > >>>
> > >>> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> > >>> >> everything works without problems. Is there a simple way to fix this? Or
> > >>> >> maybe we should just revert the commit? Commit log and kernel logs from
> > >>> >> a failing case below.
> > >>> >
> > >>> > Do you have log of success case?
> > >>>
> > >>> A log from a successful case in the end of email, using v5.15-rc1 plus
> > >>> revert of commit 020d3b26c07abe27.
> > >>>
> > >>> > To me, the device loses power, that is why MHI resuming is failing.
> > >>> > Normally the device should be properly recovered/reinitialized. Before
> > >>> > that patch the power loss was simply not detected (or handled at
> > >>> > higher stack level).
> > >>>
> > >>> Currently in ath11k we always keep the firmware running when in suspend,
> > >>> this is a workaround due to problems between mac80211 and MHI stack.
> > >>> IIRC the problem was something related MHI creating struct device during
> > >>> resume or something like that.
> > >>
> > >> Could you give a try with the attached patch? It should solve your
> > >> issue without breaking modem support.
> > >
> > > Sorry for taking so long, but I now tested your patch on top of
> > > v5.15-rc3 and, as expected, everything works as before with QCA6390 on
> > > NUC x86 testbox.
> > >
> > > Tested-by: Kalle Valo <kvalo@codeaurora.org>
> > 
> > I doubt we will find enough time to fully debug this mhi issue anytime
> > soon. Can we commit Loic's patch so that this regression is resolved?
> > 
> 
> Sorry no :( Eventhough Loic's patch is working, I want to understand the
> issue properly so that we could add a proper fix or patch the firmware
> if possible.
> 
> Let's try to get the debug logs as I requested.
> 

I'm able to reproduce the issue on my NUC. I'm still investigating on how to
properly fix this issue. Expect a patch soon.

Thanks,
Mani 

> Thanks,
> Mani
> 
> > At the moment I'm doing all my regression testing with commit
> > 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
> > testing without any hacks.
> > 
> > -- 
> > https://patchwork.kernel.org/project/linux-wireless/list/
> > 
> > https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
