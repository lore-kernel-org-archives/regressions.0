Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C4D198
	for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 14:55:39 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a65so629545qkg.13
        for <regressions@lists.linux.dev>; Sat, 25 Feb 2023 06:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Q8gsNHzpb5kSZtMtig8/+UueCt1zs6M93LoCCjgrGo=;
        b=NxXuAhBYmUdC2MrMV2EFL9Aen3jQKb3jYtB+q7Ty1zm82Fm2n0ZrgTpkYtAL7Jwkx0
         dP4P4erZ/Ht4J73pJS5KwCmpI8j1AWM+7h02RuL0+PfOrImuXj19XfzQq6ClTcQ5YSVL
         0tEubcNYqqLc2jzt5/tAtNMP/UGR7/Sy8HvV5hKbTdtANwlXk7hyhCMExuSzLTVCCSyn
         rzl762yf7jF9WkN2Ye9YeyGVfu6q74ZtViLLtR289BSHDIiuogSmznNWkIHHTX1Yd5DY
         zzQJTumXahViRWwFmYgRygiJBYgIxbsgh8ZigGsj06Qu98s8NZd4Q8Pl08WnL70iNmZ+
         fBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Q8gsNHzpb5kSZtMtig8/+UueCt1zs6M93LoCCjgrGo=;
        b=KEGl1M82TBFsT0os3TQQuCx51fNhaPH0JTX1smisgG5JCgL4QJwGzeRl9eL/sRYHQK
         6YnuGGD++kTXtaHKFfq9xXuRYsD7AL3lvv5veYAFdNrsdiFfnAC4oUvMmYoYAR2VJwuO
         2V2StBxzvDISoSYcbRy0I1wnYZSCNX/xLvXgglh1GuCL1dP096juDjguSjRd0XWt8KWd
         wAABGDk0fSs0Bjj4VaWfYZP14Srni5JL6r6vui5NsZ9wPqsN514Y4wEKwv1UlN9Rpc4p
         t+t4j+l1c+vZlQvm+G5IBbgoq7HqhKOHyGIxEV6lsPGo9UGYFHzYB95virx0uCGFnpnn
         S9zw==
X-Gm-Message-State: AO0yUKVh64VFUvcWO47QHELOBPWp07DEyq94OSsj3Q1XaQHut/21ZlfA
	Ywiah7vR0ufF5yt7JVOc3Svy8repHn0yz9/reSU=
X-Google-Smtp-Source: AK7set8jA+1nFDnQkwfNDsgRkVHfQxRE0kvqoiPSKE7WECLY+Ny/1Ed0v/fPhmsJcfWj1yCPN4mroOYDfGrai4yml8k=
X-Received: by 2002:a05:620a:2589:b0:73b:7f8c:5571 with SMTP id
 x9-20020a05620a258900b0073b7f8c5571mr1261108qko.6.1677336937869; Sat, 25 Feb
 2023 06:55:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsO4=qKBF=2FRPVwW8FA4iLFh0Dt9n1BLMec3k10GUorpg@mail.gmail.com>
 <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info>
In-Reply-To: <9f682c4d-e7b7-5e23-84f5-cea4fdac2085@leemhuis.info>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 25 Feb 2023 19:55:27 +0500
Message-ID: <CABXGCsNruNKfx3d1dpneRUvn3dCqv_bM93TdJsCLeRYiP3qYaA@mail.gmail.com>
Subject: Re: [6.3][regression] after commit 7170b7ed6acbde523c5d362c8978c60df4c30f30
 my system stuck in initramfs forever
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: davidgow@google.com, rmoar@google.com, brendanhiggins@google.com, 
	skhan@linuxfoundation.org, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 25, 2023 at 7:22=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.i=
nfo> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> On 25.02.23 14:51, Mikhail Gavrilov wrote:
> > new kernel release cycle returning with new bugs
> > Today my system got stuck in initramfs environment after updating to
> > commit d2980d8d826554fa6981d621e569a453787472f8.
> >
> > I still do not understand how to configure the network inside the
> > initramfs environment to grab the logs.
> > Since an attempt to rebuild the initramfs with all modules (dracut
> > --no-hostonly --force) leads to the stuck initramfs environment and
> > impossible entering into initramfs console.
>
> Do you see any error messages? I have problems since Friday morning as
> well (stuck in Fedora's initramfs) and see a lot of BPF warnings like
> "BPF: invalid name" and "failed to validate module". Was able to do a
> screenshot:
>
> https://www.leemhuis.info/files/misc/Screenshot_ktst-f36-x86-64_2023-02-2=
4_07:53:14.png
>

I also seen such messages
https://freeimage.host/i/img-1475.HMPL26l

And if initramfs is configured without --no-hostonly I even could
enter in emergency mode.

https://freeimage.host/i/img-1480.HMPsZ3N

But the module for my Keychrone K1 keyboard couldn't be loaded :(

P.S.: I also use Fedora Rawhide.

--=20
Best Regards,
Mike Gavrilov.
