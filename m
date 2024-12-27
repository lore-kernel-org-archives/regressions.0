Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09590C2F2
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 12:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735303081; cv=none; b=ndrhmZnsyKq7gDqC8cAA9vQ28mhgJmipzq0caluwPJ/8wuXBMG/sPrG/Bl+2SDg1GvJGHASrd0j5Oy7jYodlJxv5PpimXhHcy8pV4MC7HjiWUZwPeWp/5W9Fb33zO+EbYDqzeEPi0sWx5tPxmykI4HD95Hh5c+56u4gh3PuUhHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735303081; c=relaxed/simple;
	bh=MlKPFo7Cu9Jeo0vzzZM1sCtAKgVYuKYBTVqDZ5PSyCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Idu7TE3xRJc0FByzC/lg8rf9RSRErg4r8Vjc7V6ZN2S7W4mbbIN2PtJogZZgpgbrHFPTfJnYSCkhcUy2b4Emclqy+nsT/2CbMgRrLoc4gqcRspDcfPxsDA3SDuyl/E0LlK2m/m8BkHK33lDyXVtzpdFYKfuq/jEu0Gv/qlz6F+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dV4uVjKi; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dV4uVjKi"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3eba50d6da7so1734553b6e.2
        for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735303079; x=1735907879; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZfPL3yhsHdQKK3p/aSn4YA21fqFImktfAQoLZVNOCE=;
        b=dV4uVjKig5Hs7pVSBdiglzaZL6gTldLP33m3NnrB40l1tNZdfLyxeyAQNmj/0TWeMH
         xMRN1S7gm0iiVPNvahg5wRU7OqfYCuiL5mEo4QkAejdEALnmxAKfbEbyOR4qLqpuIHPW
         HLtb9QQFKas4QESDuTu/gJnL7D7OOOnM3EhU1ELH6BQSzyUTZsyhgoMUz+CG/UZJGRkm
         wgBWivip7WvKxhFJ7AuqsRjyJ9LiXNX7o8L0LnbYWsVUXj5bCe4mz41sKAZ3nnNS/sxi
         WKxQ2CYtJ2jAzHpSvB+E7oWaS09tqB/BSBjihJPcMhP6Df6ZkmWCeBS51UGjEygMzYwt
         1aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303079; x=1735907879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZfPL3yhsHdQKK3p/aSn4YA21fqFImktfAQoLZVNOCE=;
        b=DZIcwzRVdHVr/bnV+Ak4V1FsGxvDYZg3sA04TFvHAEvvacYXlGx8TrAoeHpmQ4sT0/
         7Lg9HnDp/4HX0Iqb20EHL49X181oT4320Ou17/FQBBH63mhHD4UkQvnWdvnWgDpoNIu1
         cVifaVBAadriQGZj23qBheLIrQtX8qwzyQQfZOE6HWw4XT5l6aFL9aRNp0djBxy7CNSZ
         qjbeRktGD9QapK4GMtBACQx3LC+NuIcj4VgrSqvHGrCLwsRqv71GBlfsvxV5TKO+37zw
         a4XnRnxioHwWJKPNvziUX+EWPhYxBQZsd8MfZ5kpivunB4LJEoCSSc755ZBgeP+SuhR6
         nHTA==
X-Gm-Message-State: AOJu0Yx7eLQuKwyqE+5DSTlFbaJKEgOJPAywBqgR3uDUcxXx3rvdriw2
	1dEHVn61CVkSdykxqSeGCrgnExMNItcearGjIHNyq5y3xoeL6Tx3GipqdIUhPjvMqlcO3Yau0vr
	VJLLr4cQqRM+CNtAd8e4mU4FIpC+284D7
X-Gm-Gg: ASbGncvWon2dvZSoDELHRBEkvWcOSCf8Ljy6zbFtDjrz4VoYnqm5nv6dob6BawjwtsP
	FKxjXgU0hmqYsCmss2mWGGcH5ZjValskBFA+unfKKxaj/rQS9a8fMY64E+YF0rqLlFo47Lg==
X-Google-Smtp-Source: AGHT+IGX8rCPVPxRKEJpPPxRY8m/o/ErWgKjqhAA+IpuaqcznWdPvv7pxcDgXllP0NnJGURh5bagFc99z89pWQDCVWQ=
X-Received: by 2002:a05:6808:1a03:b0:3eb:549b:2c15 with SMTP id
 5614622812f47-3ed88e9ea5bmr11912792b6e.1.1735303079044; Fri, 27 Dec 2024
 04:37:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>
 <CAKUwrzDtcu2JGdVve0BF9nUR-25M3bZrSyJ6xLLiwjCehmWCxw@mail.gmail.com> <2024122755-status-provolone-58f2@gregkh>
In-Reply-To: <2024122755-status-provolone-58f2@gregkh>
From: Alvaro Kuolas <kuolas@gmail.com>
Date: Fri, 27 Dec 2024 09:37:48 -0300
Message-ID: <CAKUwrzCkMNO2oPysLk3fFgeE68DdexxrRru1TooeC0NN8K3X1g@mail.gmail.com>
Subject: Re: Longer boot times with kernel 6.11.7 and newer (including 6.12.6).
To: Greg KH <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 5:01=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, Dec 26, 2024 at 06:33:44PM -0300, Alvaro Kuolas wrote:
> > ///////////////////////////////////////////////////////////////////////=
//////////
> > bisecting the regression ended in this commit:
> > ///////////////////////////////////////////////////////////////////////=
//////////
> >
> > cfc72b86fa20cbf44d2b6cc27b35eb15080232ab is the first bad commit
> > commit cfc72b86fa20cbf44d2b6cc27b35eb15080232ab
> > Author: Greg Kroah-Hartman <gregkh>
> > Date:   Tue Oct 29 01:23:04 2024 +0100
> >
> >     Revert "driver core: Fix uevent_show() vs driver detach race"
> >
> >     commit 9a71892cbcdb9d1459c84f5a4c722b14354158a5 upstream.
> >
> >     This reverts commit 15fffc6a5624b13b428bb1c6e9088e32a55eb82c.
> >
> >     This commit causes a regression, so revert it for now until it can =
come
> >     back in a way that works for everyone.
> >
> >     Link:
> > https://lore.kernel.org/all/172790598832.1168608.4519484276671503678.st=
git@dwillia2-xfh.jf.intel.com/
> >     Fixes: 15fffc6a5624 ("driver core: Fix uevent_show() vs driver deta=
ch
> > race")
> >     Signed-off-by: Greg Kroah-Hartman <gregkh>
> >
> >  drivers/base/core.c   | 13 +++++--------
> >  drivers/base/module.c |  4 ----
> >  2 files changed, 5 insertions(+), 12 deletions(-)
> >
> > ///////////////////////////////////////////////////////////////////////=
//////////
> >  - Building the latest git kernel without this commit:
> >
> > Reverting the commit on 6.13.0-rc4 works as expected.
>
> "as expected" is what, faster boot?
>
> And yes, this will slow things down as we add back the lock we had
> removed as we had reports of real regressions with this change.  Sorry,
> but a slow down is better than a non-working system, and in fact, you
> are just back to the same speed you were before this commit was added,
> so it shouldn't be that big of an issue.
>
> In other words, we can't revert this revert, sorry.
> If you could help out in fixing the issue that this original change
> caused, that would be great, as then we could add it, and the fix, to
> the tree and your speed would come back.
>
> But really, upower taking that long at boot time feels very odd.  What
> is it attempting to do?
>
> thanks,
>
> greg k-h

"as expected" is what, faster boot?

Sorry for my wording. I mean the system boots faster and it is more
responsive without commit cfc72b86fa20cbf44d2b6cc27b35eb15080232ab.

I noticed this problem on my system when logging in after a Fedora 41
update. From GDM login screen to Gnome desktop running with the commit
is roughly ~19sec and without it is ~5sec. This freeze on GDM login is
why I started debugging.

At first I reinstalled from the latest iso F41, then tried to block
upower update, and later I tried different kernel versions. That is
when I hit this commit.

I have compiled 6.13-rc4 with commit
cfc72b86fa20cbf44d2b6cc27b35eb15080232ab and without, I will start
testing why this behaviour is on my machine and in other machines I
have access to. I will try to look at why upower takes that much time,
and why Gnome loses responsiveness, and check if it is only on my
system (Ryzen 7900X, B650E, Vega10GL) or if it happens on other
systems as well. I can change this testing to 6.12 stable if it is for
the better.

Thank you for your time and comments on this subject, I really appreciate i=
t.
