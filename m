Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C9317C6
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 10:28:04 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id e184so30367315ybf.8
        for <regressions@lists.linux.dev>; Tue, 07 Jun 2022 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lLb4OstT3sRsRSOzWSrE/P7lW42UYdWQsdQ0kmyUq3w=;
        b=pCE60kVDw2MImA3LMLKXGPwLWoHbYh3JLP0GUT87HFqfaKmFBv/ReQSW0JJHa/Ix53
         dH+UtzW9JX977Qi0MrS3OXG5uD485M/CUkNH068x00Uxuoe52+M2BjozYvWdP7TyXUlq
         ByKNbzCe6n4lAvFnOcfrQ3ASctplUIjZ0CTh+40kssFrI1FdW6D7pEQC4bd7q7dXi1xI
         Z0YFyCFhZgKWp+TkKtnp5UsUenGdtau3pTfr7bTveX32n903KMJ4gFQv4hSUlraiX18k
         P5OD/58Kj9LqVbwv9staYVQYt6fG58glp/46sWLLwIdoFfoZCTtNHUNG0WNk5ent5wvD
         XIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lLb4OstT3sRsRSOzWSrE/P7lW42UYdWQsdQ0kmyUq3w=;
        b=FWLxrEkblAiI7rdtUKoaTOsE4pTNGquybs/4zaiVSAss57SEwMqHss4zPjCHfFw2im
         3wsFwpBbbZYxzv6lhAlN6ealWl9/kw/ueBIu+9OE/wCXcDOf3UzkPhYvUfnXaj245ej0
         A5m/unwOpZCElWbk7mzxH2YIkPH1KKt/CYeFmcKz/Ul21SeYw+ZAcw5qoTINmD5LDJgX
         GiP7U9XxmCdxVzqCYjf7K13LNpnoE0OHBhwylODVexe4pRNftBEIm8VfNsMvsYNOnW6x
         NGM0lFJBgusMf4eJwSY2f3YjB1kzcax8uYj8/0vVWmXsd86aFYNxhv1L3AGXcF6VuGsC
         vG9Q==
X-Gm-Message-State: AOAM533lvoOe6TzGk/row9IpD310qbJvePLnrMvCqLLm5LfujzxOulyD
	ZxvvcFGeiZsbgHW8ebHGyPkfpc5E0RUtRkmluitL2A==
X-Google-Smtp-Source: ABdhPJwKT2UmpuK+kDxqDiEIkG8TF0esYpFi4IVr32ervm1z3rjq6TIlEmUWrJNsgH3MWaBpO5f9Rfu/L0y/NukH9mc=
X-Received: by 2002:a25:4705:0:b0:65d:43f8:5652 with SMTP id
 u5-20020a254705000000b0065d43f85652mr28527025yba.389.1654597683604; Tue, 07
 Jun 2022 03:28:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com>
 <20220607162504.7fd5a92a@canb.auug.org.au> <CALvZod5XBjw7MZfYSNv-UnE7pHMKTquUNomqyC5T05Qu_ef6Zw@mail.gmail.com>
 <CALvZod4DhM00LXsPty=cnYyv3Ci5YS5otasu_tr9o7ujQekKLw@mail.gmail.com>
In-Reply-To: <CALvZod4DhM00LXsPty=cnYyv3Ci5YS5otasu_tr9o7ujQekKLw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 7 Jun 2022 15:57:52 +0530
Message-ID: <CA+G9fYve1faH7AmpEa-p_ySb_WCgc4DdjqyS6fSdiJYsaEi=rA@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To: Shakeel Butt <shakeelb@google.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Raghuram Thammiraju <raghuram.thammiraju@arm.com>, Mark Brown <broonie@kernel.org>, 
	Will Deacon <will@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Vasily Averin <vvs@openvz.org>, Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Shakeel,

> > > Can you test v5.19-rc1, please?  If that does not fail, then you could
> > > bisect between that and next-20220606 ...
> > >
> >
> > This is already reported at
> > https://lore.kernel.org/all/Yp4F6n2Ie32re7Ed@qian/ and I think we know
> > the underlying issue (which is calling virt_to_page() on a vmalloc
> > address).
>
> Sorry, I might be wrong. Just checked the stacktrace again and it
> seems like the failure is happening in early boot in this report.
> Though the error "Unable to handle kernel paging request at virtual
> address" is happening in the function mem_cgroup_from_obj().
>
> Naresh, can you repro the issue if you revert the patch "net: set
> proper memcg for net_init hooks allocations"?

yes. You are right !
19ee3818b7c6 ("net: set proper memcg for net_init hooks allocations")
After reverting this single commit I am able to boot arm64 successfully.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
