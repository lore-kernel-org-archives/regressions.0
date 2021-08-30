Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D4A3FC2
	for <regressions@lists.linux.dev>; Mon, 30 Aug 2021 16:04:17 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o39-20020a05600c512700b002e74638b567so348092wms.2
        for <regressions@lists.linux.dev>; Mon, 30 Aug 2021 09:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3npUBe0XXavbP8WJVaMhY8ZrHdW9iFAEaPwrx+1F2i0=;
        b=kv/ORKs5fUBu03T9lYN00LUW3/FMATroXsOwxoFjOFNug/sQgvDLh0tctoL2fXQxYo
         SR289eCcNIv147Ay4HyVDUI03bgCZfwuGWbf5TohJc3zLcKM/OuApjauGDs/FCdO5K09
         mG7HqNmiPPl7E/a1EN1+ShguTllaaD/IqrtEGg7R7RAE3sknnKruk7tLkQ2mwg7sWS/f
         F7aGQC53inGpcPCSFItJ2qopObAYSW9zbBdh2RqGdTsHZ84b9CBphrZpRHq2C7VrPz5q
         odtFR3mLTRPaHqThfGnRyXUqUqsTrW64wk8zWZUr0fqk6zCpxzZo7aXiUCBoOqc5L3zG
         k3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3npUBe0XXavbP8WJVaMhY8ZrHdW9iFAEaPwrx+1F2i0=;
        b=g9Q2PFZas/Ij5nTzHZnB20Yan4m0TtoPlk6ruxsJqeEqip+0IEXjR0ePfWBZgDT3Cc
         3Rq2mrRWS395BHiYfKdHiFy00oXW+W5g4bej90u2MTrfZ5KcQNYI5DcXyGPOGwe6Yv77
         MuEfhxJ2+C3lH6tmWt3VFvZPCcTURdN4flyRL7h5VhCRJWTcLE+Rohy8DAUgcuicyDdR
         858BaV+960ObbAPzUeAsAvfr8tedCsgUA9zxHHgYZqNsuhavd5+RpPlgPp9jNl9bC2E5
         OtvHtKGRS+upINwNrM62XHPL5UzDH8IB7z1LzRUWIufUZntrCl1diCCg1RvQS0boUPtJ
         5Y9w==
X-Gm-Message-State: AOAM532RQs3Bib7qLwrbkz7uYicpL4J0VTktUAeo2+37SenoiD3FgCWY
	emdz2pSgpq+wv4AgpluYPHYSh7P9URQWg9JrxHkUdA==
X-Google-Smtp-Source: ABdhPJwaWkgvsaMall0VM9NOjtmefWQszHwRhhuB9zaGdOGdRexopmsYFCb6Sec9eOkCckSGGtgDjC9xfGjhONmwnnA=
X-Received: by 2002:a05:600c:14c6:: with SMTP id i6mr14912005wmh.99.1630339455825;
 Mon, 30 Aug 2021 09:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a8cddf24-ecfc-088e-27f4-98cbbb5fb67c@penguintechs.org>
 <87y28sqq4l.fsf@codeaurora.org> <843e7689-fa1e-441b-c49a-ed7291046d5f@freebox.fr>
 <87tujgqcth.fsf@codeaurora.org> <87mtp47073.fsf_-_@codeaurora.org>
 <YSenaxWzxRkYkucv@kroah.com> <20210826074850.16768dee@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87eeag6yjr.fsf@codeaurora.org> <87y28o5cw4.fsf@codeaurora.org>
 <20210826111207.364d0ba5@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com> <87sfyv5abg.fsf@codeaurora.org>
In-Reply-To: <87sfyv5abg.fsf@codeaurora.org>
From: Nicolas Schichan <nschichan@freebox.fr>
Date: Mon, 30 Aug 2021 18:04:04 +0200
Message-ID: <CAHNNwZD2dLC9dWui7kAEg8R04U0LVdQJMJCyugkHA6rdfRwGLQ@mail.gmail.com>
Subject: Re: [regression] Re: 5.14 rc6 broken for QCA6390 on Dell XPS 13 9310
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Linus Torvalds <torvalds@linuxfoundation.org>, 
	Wren Turkal <wt@penguintechs.org>, ath11k@lists.infradead.org, 
	linux-wireless@vger.kernel.org, regressions@lists.linux.dev, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Hemant Kumar <hemantk@codeaurora.org>, 
	Loic Poulain <loic.poulain@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 27, 2021 at 2:41 PM Kalle Valo <kvalo@codeaurora.org> wrote:
> Jakub Kicinski <kuba@kernel.org> writes:
> > Done, thank you!
>
> Thank you waiting for me :)
>
> I just tested commit 7e9965cddea8 from Linus' tree on Dell XPS 13 9310
> laptop with QCA6390 and ath11k works without problems. So the issue
> should be solved in the final v5.14 release.
>

Good evening,

I have tested loading ath11k on v5.14.0 and I can confirm that the
driver loads fine now, with a phy and wlan interface being created as
a result.

Thanks and best regards,

-- 
Nicolas Schichan
