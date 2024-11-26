Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8BC1B87C7
	for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 22:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732660446; cv=none; b=kvtyISw73Zh46uhM8/C3lKF6WW5u3j7/izJ5XLU9qyrtuyykFga2NKwBjmzCNrL6RipsFLcZsyOkf+DLKY3OiYRyTq+CRN/nwbiUY8uvyuZZc3xIwpyOU4EPSGznW/CRYd0QP+Lo5oBggewKKpUCvxCTjCKhj1Dqy90CvlS5S4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732660446; c=relaxed/simple;
	bh=4vrbf3mKf+jSzEqVixBjqytq08FEluiMcVcJeXf93+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwZOhDfqtNTV/wflaBeWzvNX7roevtRmul0FXjbkRhV/Y1VO/CPUZRndi18TigzOhpqtPRNGEeYnwdtzxCdftcw8eMYgU4pZvrDBA/RgiI0PeoU9IFhwpqkXEyzpk76roTW+UIhazIaq3s0sn1kovPjmRgbMU2CC07gOi4TKB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPJlf0SR; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPJlf0SR"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8419d05aa66so118818639f.0
        for <regressions@lists.linux.dev>; Tue, 26 Nov 2024 14:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732660444; x=1733265244; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4vrbf3mKf+jSzEqVixBjqytq08FEluiMcVcJeXf93+8=;
        b=dPJlf0SRhVaO91vVDa2LtTTFb5y6EffY8zzlnIxyV2LaCtoYRu428lmnVtvVidOEK3
         IJFuEwXMxz68+z9Nx1kYnoW8iMc0Acj5ouIWy0DPu6viQ6Tl6NegpxPbkfuIailPHMbI
         BAFK9t+Erit3bvS2AxzWQ9baSZk/ttxI5D4FyVefNXYPCRfz4ejXyHzHOxOOM4KTr4+R
         OIumin1/++3UdOIXsniSvT6rIQM53qpKKSfFBkQ1OfgoCnJqaVBMOSSPfHkJvfTNAnN+
         M8bOzfAsION2E98xjZ28/r27WVY+fhNKSFLFIOzkovRhB9E9cGLgD2AaXQTZ+UTpPx7/
         HAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732660444; x=1733265244;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4vrbf3mKf+jSzEqVixBjqytq08FEluiMcVcJeXf93+8=;
        b=l1Vvu0CP+dsFP6+rL/7ZPXcdC8kMnxZ8LUNljPasRMRLS3ChfUkdwBBVo9b5JOBnBH
         rN9XrPbFN8+ORc+a2FVN9q4GDklWuuMVUmov7GRX0jQv+rIhSzPHv/N73YY70BPWdvXC
         7DrpAY0SfeIrQCH1zkCPlUalvqJbQcDTdNfFB3VF/xKjRBGH+e+svqSzwFrx32bn+iOl
         JE8UsbtDOp0i7fQBp8tViT2l6mhVT8sxKfW2jXauvrBAJ9lkoAhTAG1QssNKWsmJ6XFj
         5RfJVXdxMBlo5V2RF00HMKbPzYdYY+0s7YzxOJYUPjm6BhlRQe8/zwonxVOyYZp2XSZl
         pEcg==
X-Forwarded-Encrypted: i=1; AJvYcCXsllnRGA16acJG7iMLALMQHVzZ/MiEkPqSlXjlU6KV7Q8ABB8x+P+Bea7R88gOmfVhxNjExEB+nldFIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGZ65QwcRpYc5lTLOSpvl2mM5jy6oHZzD9uhFIJLQJas6SUWxp
	w9c3V1jfHqL3r+3Mkn6hzy2Gtu2P220WvmM54Ik4jfzxAeG4xMRnOv7iKAcIRG9Bou8lAeiXIAs
	0F2B0SyyHxyO1OC5E9dJKF6AQLDU=
X-Gm-Gg: ASbGnctS7/4uvdLCGWgmg9OTI22FPOXqjSHIR3gTU6pwwqLiaI7G1nJvMhBlkNBHIIK
	G/lkA9t0snu2ykYCO3OzEYuN3t2Dvekj5Swjg9oWMJ1DJGJZ47cdG1rrd6FpJ92BixQ==
X-Google-Smtp-Source: AGHT+IE+KUQpYGQR7ThM04qKSHGTtBIabX470BMpqzPPr8fqZPNqxQz01x1yzva22I6zYbnxaT+nJXD+77U1WbkVJHo=
X-Received: by 2002:a05:6602:3416:b0:83a:872f:4b98 with SMTP id
 ca18e2360f4ac-843eceaecf4mr113347839f.2.1732660444317; Tue, 26 Nov 2024
 14:34:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACKH++YAtEMYu2nTLUyfmxZoGO37fqogKMDkBpddmNaz5HE6ng@mail.gmail.com>
 <4a2bc207-76be-4715-8e12-7fc45a76a125@leemhuis.info>
In-Reply-To: <4a2bc207-76be-4715-8e12-7fc45a76a125@leemhuis.info>
From: Rui Ueyama <rui314@gmail.com>
Date: Wed, 27 Nov 2024 07:33:53 +0900
Message-ID: <CACKH++YYM2uCOrFwELeJZzHuTn5UozE-=7PS3DiVnsJfXg1SDw@mail.gmail.com>
Subject: Re: [REGRESSION] mold linker depends on ETXTBSY, but open(2) no
 longer returns it
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: brauner@kernel.org, regressions@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux-fsdevel <linux-fsdevel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 11, 2024 at 9:02=E2=80=AFPM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> [adding a few CCs, dropping stable]
>
> On 28.10.24 12:15, Rui Ueyama wrote:
> > I'm the creator and the maintainer of the mold linker
> > (https://github.com/rui314/mold). Recently, we discovered that mold
> > started causing process crashes in certain situations due to a change
> > in the Linux kernel. Here are the details:
> >
> > - In general, overwriting an existing file is much faster than
> > creating an empty file and writing to it on Linux, so mold attempts to
> > reuse an existing executable file if it exists.
> >
> > - If a program is running, opening the executable file for writing
> > previously failed with ETXTBSY. If that happens, mold falls back to
> > creating a new file.
> >
> > - However, the Linux kernel recently changed the behavior so that
> > writing to an executable file is now always permitted
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D2a010c412853).
>
> FWIW, that is 2a010c41285345 ("fs: don't block i_writecount during
> exec") [v6.11-rc1] from Christian Brauner.
>
> > That caused mold to write to an executable file even if there's a
> > process running that file. Since changes to mmap'ed files are
> > immediately visible to other processes, any processes running that
> > file would almost certainly crash in a very mysterious way.
> > Identifying the cause of these random crashes took us a few days.
> >
> > Rejecting writes to an executable file that is currently running is a
> > well-known behavior, and Linux had operated that way for a very long
> > time. So, I don=E2=80=99t believe relying on this behavior was our mist=
ake;
> > rather, I see this as a regression in the Linux kernel.
> >
> > Here is a bug report to the mold linker:
> > https://github.com/rui314/mold/issues/1361
>
> Thx for the report. I might be missing something, but from here it looks
> like nothing happened. So please allow me to ask:
>
> What's the status? Did anyone look into this? Is this sill happening?

Ping? I think this is a fairly major kernel regression. We can't ask
all our mold linker users to upgrade their linker before upgrading
their kernel. Isn't "Never break userland" the kernel's policy? I
wonder why no action or even a discussion has taken place so far.
