Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4B3C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 15:46:05 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5007f3d3235so144406e87.2
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1693669563; x=1694274363; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sTVrfuoyyUEeTTw7w2mP5y9qGCPLtPAJX6CEnNqN/W4=;
        b=YgjgOI+yBcIH+XPXmFyCGePCzG03fJxPDQzLr3m9+mlZwxOT4x++5VhYe980OFOJIu
         5Gj1HnPw0kIgfG23d+kZU95CyRWgFA59HLGtTSbPzH1g1pHYHNakZyetWHose5YawlZq
         7Ht1tkFJV2WPic6kS/DNYbSJUUxiCYbSfCgnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693669563; x=1694274363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTVrfuoyyUEeTTw7w2mP5y9qGCPLtPAJX6CEnNqN/W4=;
        b=XqK9Xo/+FNiVqMnG2I+ZtUN3hvCOeVHAvHNyRvx4RcpgRDycXa0d3Haafwz3dh4eTC
         mMmASy1KZVl7navzkPbr1UnU4VCM4XCIrbp53OiywIYKHQTSPUnaut0/NjSQI5RM11E0
         UCYJrwp3lXRdkuKbg41xlIYwCRjQmhgvnyVzEoHqJPMRCb3wWGpMpOjDjne+9nmDZpzf
         SxtbAQ6FIAnTbMSbyBmrUnyK9eOmMhGzVRxgeRieXcfrYBg7XBCf1yFeLXdiNXirsV33
         lGeGtQn6XKqSyPpWtxVi8cQ9WdxvCOJsP7l7DO2cKY8CV/Ob6hgMvdETcPfM0g2567cw
         amdg==
X-Gm-Message-State: AOJu0YwWuuIiSU/J2UhB5PjtTvTABkOp8f6Vr6VQE9jyVh3gktrrAAft
	XJf3JP4NrBB1earw8q1pI7c8HNkFPRIAlxKrXu+p4A==
X-Google-Smtp-Source: AGHT+IFnzvWKPPwneGHQZjlFTwUvSXrQfNm9L3o/tjj3IdwOVcOfhD3+a6JQ0DD5m5MMlsy0efSv3A==
X-Received: by 2002:a05:6512:3047:b0:500:9860:f8a with SMTP id b7-20020a056512304700b0050098600f8amr3695275lfb.4.1693669563106;
        Sat, 02 Sep 2023 08:46:03 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q26-20020ac24a7a000000b00500832b083esm1007788lfp.298.2023.09.02.08.46.02
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Sep 2023 08:46:02 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5008faf4456so143933e87.3
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 08:46:02 -0700 (PDT)
X-Received: by 2002:a05:6512:3b2c:b0:500:9026:a290 with SMTP id
 f44-20020a0565123b2c00b005009026a290mr4608993lfv.9.1693669561847; Sat, 02 Sep
 2023 08:46:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZPMdTJ7zwrCkdMTu@debian> <ZPNX-jZAZbebizXA@slm.duckdns.org>
In-Reply-To: <ZPNX-jZAZbebizXA@slm.duckdns.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 2 Sep 2023 08:45:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha+VT3yC3BKS1046GpuH2JRPER+_MXVu_Z1V2K1Ja6Dw@mail.gmail.com>
Message-ID: <CAHk-=wha+VT3yC3BKS1046GpuH2JRPER+_MXVu_Z1V2K1Ja6Dw@mail.gmail.com>
Subject: Re: [PATCH cgroup/for-6.6-fixes] cgroup: Put cgroup_local_stat_show()
 inside CONFIG_CGROUP_SCHED
To: Tejun Heo <tj@kernel.org>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 2 Sept 2023 at 08:42, Tejun Heo <tj@kernel.org> wrote:
>
> Sorry about that. This should fix it. Guess nobody is building linux-next w/
> !CONFIG_CGROUP_SCHED. I'll send the pull request to Linus soon.

I solved it slightly differently by moving the whole function around
rather than adding yet another #ifdef.

See 76be05d4fd6c ("cgroup: fix build when CGROUP_SCHED is not enabled")

                Linus
