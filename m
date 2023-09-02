Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3953C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:38:00 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99c0cb7285fso12784766b.0
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693669078; x=1694273878; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqKOi6XeDft6JHIA0q1WMDUlAe87S892KnJGjksHzw4=;
        b=NP0Q2nvO2KQkjmvdJgo60GkWTQJTLezbc6Ey+/BUKrlpZLxFPSmU37o+pE9LRxYbk/
         4Au2CqJr3B4+tAYAXNwI+moUQJwWqtSHG/u10PUn1bAVP4of0QGfxc76SryQYCGKYsn5
         Rxy8lHaqhyU2Ey33miCh0KF5N8SbAP1gpPDEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693669078; x=1694273878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqKOi6XeDft6JHIA0q1WMDUlAe87S892KnJGjksHzw4=;
        b=kWQ9E9L5vDbXsvMlctNeKDHcge1MnSKx/uHcPu6xEM8p4H7iWX2z59OoxXiNUHLXeP
         gPfKf8GyxH43yxJoY/+BcQ3eeaBoPISemV244ozjQDD/5fsqYE21j+B0WUEvFrZVurzq
         Rq9gzYmMbIJb8Cu1vF3Yw7hJs02vCgllpEUnqoGjIcWKDD3wTXeZipIzJxOjD0t5vJo3
         M1wmlACDlA326m1OwROKUfKV8icoJH+n7igOKjb0V4TdNE/fbUkh8c9rxxhVlfwui8YM
         5A5gQCAd+S1O89/Qx1lNUHMwBF301emU0Ckybu+C6fSiHFqV322L3NR28p0i6p4/daED
         NHEg==
X-Gm-Message-State: AOJu0YyjERLIgvhHyANJaShnP7vkG+uKv0/PERRwM4WJYRDa0LoP0Hv6
	qvZ8hY5rJ3/k47YR/XMNpfqiRy7glBnL0ECte6oO4g==
X-Google-Smtp-Source: AGHT+IFboO8lZqZOGyHRup31HLhMai6lfIVG8Fcpk9Z2H8E4/ZGl3ynMAjURvexOiGDdTdgBVA9iiw==
X-Received: by 2002:a17:906:53ca:b0:9a5:c431:e100 with SMTP id p10-20020a17090653ca00b009a5c431e100mr3982223ejo.39.1693669078241;
        Sat, 02 Sep 2023 08:37:58 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id gj17-20020a170906e11100b0098921e1b064sm3516378ejb.181.2023.09.02.08.37.56
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 08:37:56 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-52bd9ddb741so10022a12.0
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:37:56 -0700 (PDT)
X-Received: by 2002:a05:6402:12d7:b0:51d:d390:143f with SMTP id
 k23-20020a05640212d700b0051dd390143fmr4373503edx.5.1693669076297; Sat, 02 Sep
 2023 08:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPMdTJ7zwrCkdMTu@debian>
In-Reply-To: <ZPMdTJ7zwrCkdMTu@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Sep 2023 08:37:38 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgmvf9OjxeiO7ZzN2hsmDZ7-HViP9AjQkRN84fuDXNATQ@mail.gmail.com>
Message-ID: <CAHk-=wgmvf9OjxeiO7ZzN2hsmDZ7-HViP9AjQkRN84fuDXNATQ@mail.gmail.com>
Subject: Re: mainline build failure due to d1d4ff5d11a5 ("cgroup: put
 cgroup_tryget_css() inside CONFIG_CGROUP_SCHED")
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Miaohe Lin <linmiaohe@huawei.com>, Tejun Heo <tj@kernel.org>, 
	Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Sept 2023 at 04:32, Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> git bisect pointed to d1d4ff5d11a5 ("cgroup: put cgroup_tryget_css() inside CONFIG_CGROUP_SCHED").

I pushed out a commit that should fix it (76be05d4fd6c: "cgroup: fix
build when CGROUP_SCHED is not enabled")

            Linus
