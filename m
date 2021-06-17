Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2295E72
	for <regressions@lists.linux.dev>; Thu, 17 Jun 2021 12:15:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id b11so3708856edy.4
        for <regressions@lists.linux.dev>; Thu, 17 Jun 2021 05:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qja68kctcb7tECvcD3vKyKnzp3JkFSLhCUKx4V5p/io=;
        b=vacGRMy/kpEKBpEJGikZRYXVrAAkQ3UOW9ogN8REKVbe499gzllInYYjWKB7dyFEar
         ROMtah+mlXF8sVew9m5uWj4hs0CW7Qg64fQ0Bh0R6sZ3tFpiP3H/DD93IRGXlxiWEImB
         NBbbtSdfoyKOzNvHt+PNyAdXYRKm2FIgre2YK6Yrq1/Q3wWCtQITRvmIOYoQ5WMSejK9
         gmLIR194sNOsIG2O8fSX5X3YsViFTXtOTfbPlS2T1OZumRsN94VMRfiHaJ5eg8olv25M
         bnHqEwtskQX7no1N8OVsmeruikmjNJ0wAzRpsPYTd6z/zAKHemxBjFTBur1AeoyKGbvV
         K7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qja68kctcb7tECvcD3vKyKnzp3JkFSLhCUKx4V5p/io=;
        b=H2Hxvue9rs33vYQWT4VxtCDYCGGiXQVsi+hQFiVI8Q5JpGfbkDxIJmUafNd2dZXdkU
         HXyQGKX4hnW0dpcyrh2E/xPNBqU9QYu1CQK1PSvO2FTGVXqZ7z5+kINfjvyWID/oVa93
         vvYYVUudDljWdVXBXkEnNMOaGhil9WqmuNMdB5ta/GTkifMEb3O9uKzKnEXKiYvZU9fK
         e7+0R7NZRZTBvh7pwshp6+93aYPek0SqXcCZP/7fWUsp2cpuhC1aJmvSvEczxo29Ir8E
         WJiPR+0LSaIvb7DlEKxZEh1yw2F4EPXFxOYkQoA8tLyYdaKxsAtN2fuWGgZChnPxX/nc
         /6GQ==
X-Gm-Message-State: AOAM532UTz4296dWVBRUosNNGv0eRjIQu8jqDHbSCgMNz+6nHTpA53IR
	j8Qu8VwJ3HymrVadWapd5u6xWo9X4WwucXgVJgI5bQ==
X-Google-Smtp-Source: ABdhPJxScap+bpjJHGCJGL/6faTbZ8og0NFlPnI724tvKuQtyYMLaheWpTBmohhNcXt0wfyEb0oyqWyzgYy7W7qibYU=
X-Received: by 2002:a05:6402:220d:: with SMTP id cq13mr6037900edb.52.1623932146500;
 Thu, 17 Jun 2021 05:15:46 -0700 (PDT)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvvm2tW5QAe9hzPgs7sV8udsoufxs0Qu6N0ZjV0Z686vw@mail.gmail.com>
 <20210615115044.GC20598@willie-the-truck>
In-Reply-To: <20210615115044.GC20598@willie-the-truck>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 17 Jun 2021 17:45:34 +0530
Message-ID: <CA+G9fYvCX5fd5dHdaGpQ7wpZNcea-=vtuhapW00D8AUkE5VUqA@mail.gmail.com>
Subject: Re: [next] [arm64] kernel BUG at arch/arm64/mm/physaddr.c
To: Will Deacon <will@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mike Rapoport <rppt@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Tue, 15 Jun 2021 at 17:20, Will Deacon <will@kernel.org> wrote:
>
> Hi Naresh,
>
> On Tue, Jun 15, 2021 at 04:41:25PM +0530, Naresh Kamboju wrote:
> > Following kernel crash reported while boot linux next 20210615 tag on qemu_arm64
> > with allmodconfig build.

<trim>

> Thanks for the report, although since this appears to be part of a broader
> testing effort, here are some things that I think would make the reports
> even more useful:
>
>   1. An indication as to whether or not this is a regression (i.e. do you
>      have a known good build, perhaps even a bisection?)
>
>   2. Either a link to the vmlinux, or faddr2line run on the backtrace.
>      Looking at the above, I can't tell what sparse_init_nid+0x98/0x6d0
>      actually is.
>
>   3. The exact QEMU command-line you are using, so I can try to reproduce
>      this locally. I think the 0-day bot wraps the repro up in a shell
>      script for you.
>
>   4. Whether or not the issue is reproducible.
>
>   5. Information about the toolchain you used to build the kernel (it
>      happens to be present here because it's in the kernel log, but
>      generally I think it would be handy to specify that in the report).
>
> Please can you provide that information for this crash? It would really
> help in debugging it.

Sorry for the incomplete bug report.

Thanks for sharing these details.
Next time I will include the suggested data points in my email report.

- Naresh
