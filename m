Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617613FC8
	for <regressions@lists.linux.dev>; Fri, 24 Sep 2021 10:00:38 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id n18so9346656pgm.12
        for <regressions@lists.linux.dev>; Fri, 24 Sep 2021 03:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4vMQMisBtZM7XcTiorQkl1JxcgLI/TRL5gZOHXdOV3E=;
        b=qwydP1VOrJxnox75F1D8NMnpDrI8ksfDG0NgGcSOEDnix9AeVUWkcNqI/P1xHLHJqm
         A3L3ZJEAL8hLM6RT6jq0O1LQrlUSKPr8qpQJhHJo+p6teiulFYwv2AEj7E8dOJeNvuXW
         UVL0mbY/xitJd8g5epDHcI4GZXBMAgBKZdXQBZUUOBCm8J1S+ACZ5AWWAAGJvpT/kkL/
         nkxzXhsKbshQlRe5QjvxZ6F8XYpFh/ivjtOQAvAPEVtiPlurfMXMSxaXYnLnXooR2W2w
         H0lVDyhkXtQHBca4+9uU9D3WidYSQoOwuw7lzeVLENHJdzd8BVzfS1HsRl/cvtRnohLc
         p6Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4vMQMisBtZM7XcTiorQkl1JxcgLI/TRL5gZOHXdOV3E=;
        b=VSIpqyHjKMSfEZsfqt6L9F1YbuvAduYHJsesmbT5OaS/LtugkrvEscbhBsyUqEBc9G
         U3q0XfitFKruqd3g0zMEKuPi3/nCMFIzJmkKaaV1NmRTCs66uXY0EAdlZvcSSgWlvf4I
         DILQODTAjhCt/fhfiEOj50scYITVBY/EIUZr6Nt2kuKgS5Gm/daJCCLx/DNgoRbnG3cK
         vNkM2H0MGQjnd2AGPyejEpL+QxAI30rzPohwS5Lm0WdE++wUD6X4KJfm/L8pRaZCR+7d
         uRe87AYeAHpelD/tYY3/OIUto2Pvu9yVQGQCywgIDyWx2NoYdfds1wgJk2kKBZrrjqxM
         RVvw==
X-Gm-Message-State: AOAM5338PrNnaizlAHLJlYLB/i/CMW40jDE/qaMFjUQPnEFP7fYKWRj0
	MzvaHFlcqW97ASgWnLLtpHQ/
X-Google-Smtp-Source: ABdhPJwhSmGRcYlTGqj1+MU++RDDBntBGaII2yLpDeqa1IaBUCnpQs290DoxEcaPsYRdSIkCDfHREw==
X-Received: by 2002:a63:5252:: with SMTP id s18mr3048353pgl.94.1632477637829;
        Fri, 24 Sep 2021 03:00:37 -0700 (PDT)
Received: from workstation ([120.138.12.62])
        by smtp.gmail.com with ESMTPSA id f144sm8399311pfa.24.2021.09.24.03.00.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Sep 2021 03:00:37 -0700 (PDT)
Date: Fri, 24 Sep 2021 15:30:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20210924100034.GC19050@workstation>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Fri, Sep 24, 2021 at 11:43:55AM +0200, Loic Poulain wrote:
> Hi Kalle,
> 
> On Fri, 24 Sept 2021 at 10:36, Kalle Valo <kvalo@codeaurora.org> wrote:
> >
> > Loic Poulain <loic.poulain@linaro.org> writes:
> >
> > > Hi Kalle,
> > >
> > > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> > >>
> > >> Hi Loic and Mani,
> > >>
> > >> I hate to be the bearer of bad news again :)
> > >>
> > >> I noticed already a while ago that commit 020d3b26c07a ("bus: mhi: Early
> > >> MHI resume failure in non M3 state"), introduced in v5.13-rc1, broke
> > >> ath11k resume on my NUC x86 testbox using QCA6390. Interestingly enough
> > >> Dell XPS 13 9310 laptop (with QCA6390 as well) does not have this
> > >> problem, I only see the problem on the NUC. I do not know what's causing
> > >> this difference.
> > >
> > > I suppose the NUC is current PCI-Express power during suspend while
> > > the laptop maintains PCIe/M2 power.
> >
> > Sorry, I'm not able to parse that sentence. Can you elaborate more?
> 
> Ouch, yes, I wanted to say that the NUC does not maintain the power of
> PCI express during suspend (leading to PCI D3cold state), whereas the
> laptop maintains the power of the M2 card... well, not sure now I see
> your logs.
> 
> >
> > >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> > >> everything works without problems. Is there a simple way to fix this? Or
> > >> maybe we should just revert the commit? Commit log and kernel logs from
> > >> a failing case below.
> > >
> > > Do you have log of success case?
> >
> > A log from a successful case in the end of email, using v5.15-rc1 plus
> > revert of commit 020d3b26c07abe27.
> >
> > > To me, the device loses power, that is why MHI resuming is failing.
> > > Normally the device should be properly recovered/reinitialized. Before
> > > that patch the power loss was simply not detected (or handled at
> > > higher stack level).
> >
> > Currently in ath11k we always keep the firmware running when in suspend,
> > this is a workaround due to problems between mac80211 and MHI stack.
> > IIRC the problem was something related MHI creating struct device during
> > resume or something like that.
> 
> Could you give a try with the attached patch? It should solve your
> issue without breaking modem support.
> 

It will... But we should first try to see what is causing the device to
be in MHI RESET state. We can't add a force resume case without knowing
the rootcause.

And for workaround, we can proceed resume if device is in RESET state
adding a comment on why. But let's first get the MHI debug logs.

> Regards,
> Loic


