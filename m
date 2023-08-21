Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF45258
	for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 14:24:14 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9a1681fa868so382648466b.3
        for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 07:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1692627852; x=1693232652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NipE8Lxin/pCkzOpkao8SnUSJGudRzD0GF/Rtrjn1zc=;
        b=WF4GksaOPtUGKCC4gC83q7rI8e1L2TyQoqaveQgi1MWFOVEHgEqOJL2VCOllsQHs4Z
         Bbfh0LoPXiWZVR89UfwzEOpLbJwGHWkOTSNdil58LKRBO0KMjlAQA72FNOzR7WLgyI9S
         vsNCWNB3Gy8KfTcujwEyhoVhHW+TZLyqUPpy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692627852; x=1693232652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NipE8Lxin/pCkzOpkao8SnUSJGudRzD0GF/Rtrjn1zc=;
        b=geLYZYv4CXNRBiVNKC7mloSllox/B3QsNs9Bf55QKT3QHkWuCjxJa3AYgMjpoHqj3H
         G6BlPPFBblv2fQmcojJrufTgQhfu8bj4dvtNSlhiVLQ2YQdLd4ED6uqogY4XF6FClqvG
         1ljJNYLzw4NynR+mG6z62IMkW8lEQ9CcHbz49dZD7AamT+T9BJZpa1p9ax55KhFTvSpe
         YopxAi9MpH9T1co62tbGZfBgRM5jFIwbXhYpB/pbw3bWNxs9QUKUaGjE7OkMMR8hq5Ni
         UBZM+K/KYcfqximq/jFlnaDaHew99MguEfgZpvZafBoEN59T5xousiumIUVQ8S1qAxHW
         09+g==
X-Gm-Message-State: AOJu0Yz49AXDsc1kAopURc098acTQPAoQWZvLYQDMc33tLkjR8xzOdlR
	IX0Ci+w/MAv6+K2vcP4R90xi3mc29xawka8KCzXMBQ==
X-Google-Smtp-Source: AGHT+IEvHdrhoUhs2RBdQ0lNh05gQtxqXKHu45j4UDm/xk5pf4kcGUz69Z1SLEnzMa4fX0sUSCO6eAC+eOavC9lJmmE=
X-Received: by 2002:a17:907:a04b:b0:99b:507d:dc05 with SMTP id
 gz11-20020a170907a04b00b0099b507ddc05mr5557766ejc.16.1692627852176; Mon, 21
 Aug 2023 07:24:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4f66cded234462964899f2a661750d6798a57ec0.camel@bitron.ch>
 <CAJfpeguG4f4S-pq+_EXHxfB63mbof-VnaOy-7a-7seWLMj_xyQ@mail.gmail.com>
 <ZNozdrtKgTeTaMpX@tycho.pizza> <CAJfpegt6x_=F=mD8LEL4AZPbfCLGQrpurhtbDN4Ew50fd2ngqQ@mail.gmail.com>
 <ZNqseD4hqHWmeF2w@tycho.pizza>
In-Reply-To: <ZNqseD4hqHWmeF2w@tycho.pizza>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 21 Aug 2023 16:24:00 +0200
Message-ID: <CAJfpegtzj7=f99=m49DShDTgLpGAzx8gpHSakgPn0qe+dNjHdw@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: execve() fails with ETXTBSY due to async fuse_flush
To: Tycho Andersen <tycho@tycho.pizza>
Cc: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Aug 2023 at 00:36, Tycho Andersen <tycho@tycho.pizza> wrote:
>
> On Mon, Aug 14, 2023 at 04:35:56PM +0200, Miklos Szeredi wrote:
> > On Mon, 14 Aug 2023 at 16:00, Tycho Andersen <tycho@tycho.pizza> wrote:
> >
> > > It seems like we really do need to wait here. I guess that means we
> > > need some kind of exit-proof wait?
> >
> > Could you please recap the original problem?
>
> Sure, the symptom is a deadlock, something like:
>
> # cat /proc/1528591/stack
> [<0>] do_wait+0x156/0x2f0
> [<0>] kernel_wait4+0x8d/0x140
> [<0>] zap_pid_ns_processes+0x104/0x180
> [<0>] do_exit+0xa41/0xb80
> [<0>] do_group_exit+0x3a/0xa0
> [<0>] __x64_sys_exit_group+0x14/0x20
> [<0>] do_syscall_64+0x37/0xb0
> [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> which is stuck waiting for:
>
> # cat /proc/1544574/stack
> [<0>] request_wait_answer+0x12f/0x210
> [<0>] fuse_simple_request+0x109/0x2c0
> [<0>] fuse_flush+0x16f/0x1b0
> [<0>] filp_close+0x27/0x70
> [<0>] put_files_struct+0x6b/0xc0
> [<0>] do_exit+0x360/0xb80
> [<0>] do_group_exit+0x3a/0xa0
> [<0>] get_signal+0x140/0x870
> [<0>] arch_do_signal_or_restart+0xae/0x7c0
> [<0>] exit_to_user_mode_prepare+0x10f/0x1c0
> [<0>] syscall_exit_to_user_mode+0x26/0x40
> [<0>] do_syscall_64+0x46/0xb0
> [<0>] entry_SYSCALL_64_after_hwframe+0x44/0xae
>
> I have a reproducer here:
> https://github.com/tych0/kernel-utils/blob/master/fuse2/Makefile#L7

The issue seems to be that the server process is recursing into the
filesystem it is serving (nested_fsync()).  It's quite easy to
deadlock fuse this way, and I'm not sure why this would be needed for
any server implementation.   Can you explain?

Thanks,
Miklos
