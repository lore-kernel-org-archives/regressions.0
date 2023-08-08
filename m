Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC7FA34
	for <regressions@lists.linux.dev>; Tue,  8 Aug 2023 05:54:19 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-58439daf39fso56996317b3.1
        for <regressions@lists.linux.dev>; Mon, 07 Aug 2023 22:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691474058; x=1692078858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=09klJUG3E7m7lMTHPxkNawbEkMYXnC041vOPFpaGyec=;
        b=nPRuf9Te4Ui7TNlmAjuRrwBv2faFDmFdlL0PWKhf+zDzIajJXsVZOMWS+eyVYWWB5z
         ereClTvZwsTljiya5eF2vc3e3jlWKGL3byDJC9DtX7ZBt9UieA7RBu9A2jFJNeyW7s27
         pG31prQmOwwOTPpqnexmcnberq2CLahPQS3egsfE5n8dtR3jkznXTCOdTzl/gWZowNtT
         +b4a8si3ygzA8XAC/SAGsKdwsXHzamft6ACCGifsMBP4vTXU6mLIskgMhS+TsUDkW0Ix
         k8oSgXwWWxWo2AXI1Tuck4XpEOTOS0bKSkmOwXE6DskB//xCTQGPtGTU+LbT0XR061UU
         ov7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691474058; x=1692078858;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09klJUG3E7m7lMTHPxkNawbEkMYXnC041vOPFpaGyec=;
        b=Wgr5ZKyYZC6mftd5bb1RwgBY1dC8Zn7kO5NvY1C9gm3iwtjjyumSkxbzQwA8muUcaD
         VW/zpLlV/xUpIaKXVk8CJW7bdXks7QlL86kzxpZfQw5rEKEchKt0+6BCtMoKcKMotHMA
         MUrEBxzlA+EZRZdJC4TCvyciYvXgVd+9tN33GYE8SCTSPolWG8nXN6kBxsIgL+Z1TXno
         03jZXO1hIy0ql6kFLVpSkqYhZBX6wSA19Tpi7036yK+FxOjXlls21Do6QHwLqEAHzL6/
         Px0cE92/Iyjp8DeVZ/9o4aKtiZbLodxxDD+2/ZNI6xwXEq6ZfDUBIvfroPmTfAslK0zW
         T80A==
X-Gm-Message-State: AOJu0YzdYVIvq+r329f+dI+0QFCGkMLuL3Hp+6nhpcNmPmP50ShR1o9S
	m3Ck52kqgo7+x2jJ5Sx9gIbuuFwq0Q34tai4PjqHQqbKnxagqSf3cvg=
X-Google-Smtp-Source: AGHT+IHlFLAeyv78YVYnq1ySVnVkxYkbJrCQSKBgHmGWKUUsTThVMRgiG15Q+zST67zlAt4VNOFqtAtDE1owyOCFMI8=
X-Received: by 2002:a0d:e647:0:b0:577:a46:26e5 with SMTP id
 p68-20020a0de647000000b005770a4626e5mr10443409ywe.31.1691474058453; Mon, 07
 Aug 2023 22:54:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANWZPgK2+9SCavsbSZv1DfJyhy0XUpJZ6+ebatM9ZGJPpAN1yA@mail.gmail.com>
 <a65bd290-52d5-475c-0234-85759c5892a2@leemhuis.info>
In-Reply-To: <a65bd290-52d5-475c-0234-85759c5892a2@leemhuis.info>
From: =?UTF-8?B?Sm9zw6kgUmFtw7NuIE11w7FveiBQZWtrYXJpbmVu?= <koalinux@gmail.com>
Date: Tue, 8 Aug 2023 08:53:49 +0300
Message-ID: <CANWZPgLxq+G9+ytvLNoyVJqZGncBsPbj6PbjwgwYb-wPCFvARQ@mail.gmail.com>
Subject: Re: atkbd input regression
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 7 Aug 2023 at 10:53, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>
> Hi, Thorsten here, the Linux kernel's regression tracker.
>
> On 07.08.23 07:19, Jos=C3=A9 Ram=C3=B3n Mu=C3=B1oz Pekkarinen wrote:
> >     Sorry again, now in plaintext mode.
> >
> >     Hi,
> >
> >     I'd like to seek help or advise in a possible
> > regression that I detected on my system(a
> > Thinkpad L14 Gen 1) that concerns the atkbd
> > module. My OS is a gentoo, with self built
> > kernels, and a plasma desktop environment
> > using wayland. Up to the kernel 5.16.x my
> > builtin keyboard worked(and works still)
> > fine both in tty and the plasma session, but
> > from that kernel on, the keyboard works only
> > in tty, and no longer in the plasma session.
>
> Could you try bisecting this? A few howtos on the net describe what to
> do. Be sure to use the configuration for your working 5.16 kernel for
> any builds of newer versions (ideally put it <somewhere> and run "cp
> <somewhere> .config; make oldconfig" every time before building a newer
> kernel.

    I'm afraid I run into unexpected results, since rebuilding the
same version of the kernel that works resulted in a non working
keyboard for my kernel 5.16 also, and I needed to recover the
former build from some backup. This make me think the problem
could be somewhere else.

    Thanks!

    Jos=C3=A9
