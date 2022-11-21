Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD94BA4F
	for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 08:44:36 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id 7so12748870ybp.13
        for <regressions@lists.linux.dev>; Mon, 21 Nov 2022 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MOA8LWvdV7vpIMbp9gmLxG/AXDKNs21CCNUeFEEyCbw=;
        b=mh4hjbsIkIWgtGVdWHbO6uRTTCtqDAaA0PiKTf6yrwq0RcoypNQhrl/hYvdzXzWCSx
         4lh1uj9/Hk34rHY3RRHj8YY0c0FzORA+o2GBvv6yPIZSjhd2jlsh+8T8lCDtdOkXtmOB
         rW/pgrqGY06BVrtyfCcsByO5HjzpcxVzOLy4QJPB2k6nSxcRbaEqvJWnrLb4tx7GSnYB
         aw5TNaDTTXCSZj5CcoHz4YDn4hvADeiFFUiFWRXOLPdDVvBkC7JFocJIFD36e3P0lr+w
         j5UVmAkFg4IDeJgaGmQ+j7zvrpC4P+ES1RMO0XnoUx+Zvly7UwjMnf+W7bFcUla06Xxh
         KYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MOA8LWvdV7vpIMbp9gmLxG/AXDKNs21CCNUeFEEyCbw=;
        b=v4AgleNiCkhpLXE04/in/4+p7avYFkORVFltGiDJ/NPymmo+uV/edKgi4zVILz1OO0
         1jrFrZFkBNx6J44rqysQC6Esdsu+xbxlxCXLSJVGCMwWX2BoFrKHOtaMYeqV9PgUmErL
         uikOrViqUsS8r420oyk535b5s/Z7rVRRaB5PBE53v7v35WeX3hvS/I9Kreh0OjJeG8Kn
         D5s8/7gXrCsUmKrLUibn6aG0uM62OODWWXNVpDnD3F9cjq9N+u04OBPTT9NHP+wkM1rS
         vGNyCRNKEi9cyFDekF4rbDOihfrELDNbK9bUKuMcXSeXa1tGwLjneYM0SB9BxmtC82wU
         c0Hw==
X-Gm-Message-State: ANoB5pmEnoHBSCvJMcaUEU/yGLlsFZKbjBtYeLRG0xVo0BpGYNaKb4vR
	fLKaNoqb8KZqHWe8OUSZYEmex9BXKBTC4nCZBxNKWQ==
X-Google-Smtp-Source: AA0mqf71c9Z2Oz47hdONC4Rp43orqWmur2bLHwuIBQFUL1X3mP3qGUw0rlvHQu+QiIynGYu5DNDw6ViXPOhYelbY4LQ=
X-Received: by 2002:a25:75d7:0:b0:6ea:c9e3:fcc3 with SMTP id
 q206-20020a2575d7000000b006eac9e3fcc3mr6559879ybc.553.1669020275636; Mon, 21
 Nov 2022 00:44:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
 <Y3Y+DQsWa79bNuKj@elver.google.com> <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
 <Y3bCV6VckVUEF7Pq@elver.google.com> <41ac24c4-6c95-d946-2679-c1be2cb20536@intel.com>
 <CA+G9fYs3NLZgorPT33vu6XQ3HA6BpN_hL6GZWbfnirGYt1tNaQ@mail.gmail.com>
In-Reply-To: <CA+G9fYs3NLZgorPT33vu6XQ3HA6BpN_hL6GZWbfnirGYt1tNaQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 21 Nov 2022 09:43:59 +0100
Message-ID: <CANpmjNOrZgBsgk1xxxz8-DrpnT0F0zyjin67=8_Ss7YZK-5_Mw@mail.gmail.com>
Subject: Re: WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46 kfence_protect
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	kasan-dev <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	regressions@lists.linux.dev, lkft-triage@lists.linaro.org, 
	Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Nov 2022 at 08:28, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Hi Dave,
>
> On Fri, 18 Nov 2022 at 05:24, Dave Hansen <dave.hansen@intel.com> wrote:
> >
> > On 11/17/22 15:23, Marco Elver wrote:
> > > Yes - it's the 'level != PG_LEVEL_4K'.
> >
> > That plus the bisect made it pretty easy to find, thanks for the effort!
> >
> > Could you double-check that the attached patch fixes it?  It seemed to
> > for me.
>
> I have applied the attached patch on Linux next 20221118 and tested [1].
> The reported issue has been fixed now.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>
>
> OTOH,
> I request you to walk through the boot and test log [1] (new see few failures).
>  not ok 7 - test_double_free
>  not ok 9 - test_invalid_addr_free
>  not ok 11 - test_corruption
>  not ok 18 - test_kmalloc_aligned_oob_write
>  # kfence: pass:19 fail:4 skip:2 total:25
>  # Totals: pass:19 fail:4 skip:2 total:25
>  not ok 6 - kfence

Fixed by https://lkml.kernel.org/r/20221118152216.3914899-1-elver@google.com
