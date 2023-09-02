Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DAA3C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:44:42 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c1e780aa95so190815ad.3
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693669481; x=1694274281; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o5MqIon8Nabrk/UvYJeaLuN2bLyxr6GffPmpVBNQNzY=;
        b=YkzWtOzLYbc1iuAw1O9st76htD88Eqeu9kP/UXrXNi0ulXIqUp/LKKZ7Lg4zTilCMy
         nRydozqN4RMKv3ns4xB624ezTVaKTQVHSMYs4Rf+nU8anqwxOtgSaKaFD0/l11wCqxRK
         8Y1dDJHkAEcTirw/3L/qR6cFxNRANwAgZ0/OBooOFkjom4w0R+Ag1MWdUVIuvZGxEr1i
         vhr774cqySaYwqiAVkGZbRE7rLKt0vRBEIZgF96TodfeBw3mdu5g32H2G4LrpIuJ0Ur0
         VvXjREoU/BSOc7qVh6f6mQhBUedlwXGyMdccnSACfpXIpfNz5Oj1KYtsNg3xbpqAczUj
         R2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693669481; x=1694274281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5MqIon8Nabrk/UvYJeaLuN2bLyxr6GffPmpVBNQNzY=;
        b=PwlzSVwA5tFnmROVpqTZW+TjG18e+BNC/vov0HnPdR7iswTdhsCuglBsMzZlyRpySl
         ROa/XukxuzLZkVrlUSrqVJnYpKzaz2gVSV+gd33e/lt/X/fmFG/7HedxXVDhobG86pAf
         dQ13sxFlX763oCs8wm1v8pIWjzfLzw29ccyMELPOvMxjwsKYCw9oowmwuvwVB7A8ua7s
         QQIA4XLKCcRR9bemmb8uBN3ZbTciWx3tzMJId6JkKIlFygJ36JO0RbRTCqdUtHXE5YGr
         3mmUgH+GD6votTi70hHq8tY8Mude9Y6wT2oOi34flR/Vsr0L91xtypCqOzbSnc1H5JV2
         E0FQ==
X-Gm-Message-State: AOJu0YyLfqIhHIy1paACKSFw0Kks1r70FtVRc8FG9oxyqaDxXmM9i+Ts
	GKJhLtNCWU5pabhl7m6Vquo=
X-Google-Smtp-Source: AGHT+IGcBMkV457o3ML4vRJH+8WU9TjzwVYKJ5GtcOPGFgZvYZ1JSFh3URPE+iNYyEfnC0CaeAZMcw==
X-Received: by 2002:a17:903:26ce:b0:1bd:f1ae:309d with SMTP id jg14-20020a17090326ce00b001bdf1ae309dmr4955077plb.9.1693669481269;
        Sat, 02 Sep 2023 08:44:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:eca7])
        by smtp.gmail.com with ESMTPSA id l9-20020a170902d34900b001bdcde49bc3sm4802471plk.119.2023.09.02.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 08:44:40 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Sat, 2 Sep 2023 05:44:39 -1000
From: Tejun Heo <tj@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: mainline build failure due to d1d4ff5d11a5 ("cgroup: put
 cgroup_tryget_css() inside CONFIG_CGROUP_SCHED")
Message-ID: <ZPNYZ8quPOdJeVa2@slm.duckdns.org>
References: <ZPMdTJ7zwrCkdMTu@debian>
 <CAHk-=wgmvf9OjxeiO7ZzN2hsmDZ7-HViP9AjQkRN84fuDXNATQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wgmvf9OjxeiO7ZzN2hsmDZ7-HViP9AjQkRN84fuDXNATQ@mail.gmail.com>

On Sat, Sep 02, 2023 at 08:37:38AM -0700, Linus Torvalds wrote:
> On Sat, 2 Sept 2023 at 04:32, Sudip Mukherjee (Codethink)
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > git bisect pointed to d1d4ff5d11a5 ("cgroup: put cgroup_tryget_css() inside CONFIG_CGROUP_SCHED").
> 
> I pushed out a commit that should fix it (76be05d4fd6c: "cgroup: fix
> build when CGROUP_SCHED is not enabled")

Ah, you beat me to it. I'll drop my fix branch.

Thanks.

-- 
tejun
