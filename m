Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458787A
	for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 16:47:34 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id e66so11873344pgc.8
        for <regressions@lists.linux.dev>; Wed, 15 Jun 2022 09:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9LNaObpm8Up+d88THK7j7rjplRd3qN/NAg8yWi2diNY=;
        b=SEzTgTqa1tibXsbn9UFQMy9G1j3oY2LzsGeP1/MsJ5JJXf0sd7nyHGFUJ6/LOFFYdY
         H4EyGJK07bylBZJ7bWTbCDXGivk/AHDglGYTakidrgvK7ug3j2zUIb4bIjMmAUVf7T7X
         A7r2GSjnNOIRo9mArxNglUNnA141QT33PijaYjcvmcidjrfJppErZnv1ZExyZ+zbgvE8
         t+qt4QFLbrXBcns+UIsJXSJPv6aEX6xvL2dnHhguwHn28wfAF2b9jFg+tHQDnSb+Ps3n
         ftojStBruMb0ksJ36aCYFYwIfEoPTvtvpcrm0hxN8ngBIL51TfQKLIYq727o9PXGuNi+
         PPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=9LNaObpm8Up+d88THK7j7rjplRd3qN/NAg8yWi2diNY=;
        b=QZIc/dnPc/4NxySR47ENaPSJU9AFut0yhQ8lXVnXFBUsaVOO3/8dq7zn9okn7jbewl
         w/qvrUh7ybjOBmQixBBcRA3YYuFDyJODyPZtQEQVJxK1mVFsBidiHld5XPAf+pSU/wD0
         T5zweYJBqyZ5n+aSj+1UuSoA2unUInLU9VhzIEUSFgB594iEvFSXBPvTlYKeVSirDVWX
         46Ci6+Bp4nTaYbRbSRxxzjNlFe7wc8OhpzWqhD+keE4nRWoJvtodNXHyVkzm92ppjxr/
         kZaMw1CIl4O6z+Xg4h8cloJec7S5pxiSVySmMAX8ICefqkHtaN/lPfW8uupWUgx0yQ6n
         NSug==
X-Gm-Message-State: AJIora/7V0wt/84lst8FrnSrIsNDFP2yd6qjRbzDk2bkQVwaLfRxkbQm
	qlOFiWZGkWdIJuEQdNhb7ws=
X-Google-Smtp-Source: AGRyM1u3viDRQjQA5a9+XRpLEHSUbaKAGBHEbFtATV5l0RU0mettXUmjuzH+0a0EmpJMHBNq6wak1g==
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id k16-20020a056a00169000b00517cc9e3e2dmr527231pfc.0.1655311653545;
        Wed, 15 Jun 2022 09:47:33 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:aa45:48f4:5c45:8d55])
        by smtp.gmail.com with ESMTPSA id l1-20020a17090a384100b001e307d66123sm2024477pjf.25.2022.06.15.09.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 09:47:32 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Wed, 15 Jun 2022 09:47:30 -0700
From: Minchan Kim <minchan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: umgwanakikbuti@gmail.com, bigeasy@linutronix.de,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqoNIgqYl8lWRFTZ@google.com>
References: <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
 <YqANP1K/6oRNCUKZ@google.com>
 <YqBRZcsfrRMZXMCC@google.com>
 <CA+G9fYvjpCOcTVdpnHTOWaf3KcDeTM3Njn_NnXvU37ppoHH5uw@mail.gmail.com>
 <YqbtH9F47dkZghJ7@google.com>
 <Yqdqfz4Ycbg33k1R@google.com>
 <Yqf+PC+cKePAsaNI@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqf+PC+cKePAsaNI@google.com>

On Tue, Jun 14, 2022 at 12:19:24PM +0900, Sergey Senozhatsky wrote:
> On (22/06/13 09:49), Minchan Kim wrote:
> > > Many thanks for the tests.
> > > 
> > > Quite honestly I was hoping that the patch would not help :) Well, ok,
> > > we now know that it's mapping area lock and the lockdep part of its
> > > memory is zero-ed out. The question is - "why?" It really should not
> > > be zeroed out.
> > 
> > Ccing Mike and Sebastian who are author/expert of the culprit patch
> > 
> > Naresh found zsmalloc crashed on the testing [1] and confirmed
> > that Sergey's patch[2] fixed the problem.
> > However, I don't understand why we need reinit the local_lock
> > on cpu_up handler[3].
> > 
> > Could you guys shed some light?
> 
> My guess is that it's either something very specific to Naresh's arch/config
> or a bug somewhere, which memset() per-CPU memory. Not sure how to track it
> down. KASAN maybe?
> 
> We certainly don't expect that
> 
> 	static DEFINE_PER_CPU(struct mapping_area, zs_map_area) = {
> 	        .lock   = INIT_LOCAL_LOCK(lock),
> 	};
> 
> would produce un-initialized dep_map. So I guess we start off with a
> valid per-CPU lock, but then it somehow gets zeroed-out.

Yes, I don't think we need to reinitialize the local_lock.

Naresh, we believe the patch Sergey provided for the test
was just band aid to hide the problem.

Could you please try to bisect it?
