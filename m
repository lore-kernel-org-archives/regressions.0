Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298D1F6695
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735313323; cv=none; b=Jj+gjtOqPBEg9b2d3fBb1iwLYNwJOWYmEL25mViKmeETtJPgLfeFAOniclHpuRLIj7P91ht7HxTY/XLR9v09dpETA8l5MATLDn1H21yVvjdN3j3TOpZfw//a1MJHG99U6SBLZ3YcIB+cWkLwUiBQykmg6Lj+nBpCinmyTfHYttg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735313323; c=relaxed/simple;
	bh=iz88ImqigGmwxXebl1cIPLdUhieWgQW1xVvBsQCc6P8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYia8H9MGMWVAzbUu6vfDk6zwcJwmaLzSM00+eT9hSqaj2NZNJQYORIUk6xdnQjMYywvwjXTcLw3VkfaQIGNX9v1TlpIwT3o+Ri0gzRNtTGSX+m0qylk+bAixm7eFwg0xgThAanNPoRchmJvIyFVIemMF3N88OqhE9oV/qMhXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijlwqLQ/; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijlwqLQ/"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3eba7784112so3396722b6e.2
        for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 07:28:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735313321; x=1735918121; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa0fqKDzdWUWgl9YIyEjQ+EFtrp32SWDVcpDJH2NtZk=;
        b=ijlwqLQ/YkX9uf4jtlplapDyzGXCVvaLAL55qvn7qZp9tTgObqfKM25EcsNulIT6Sp
         ysuvR0zd2cwwkOT9UQmzDFg88eCCS52AqgCkk94rExYrVb3mnKB0OTr1InMccl9XYd6S
         w6F/n7xzI0fKwD39Ot6oC0OfMnunJApJOzKpOMS4brLtUIwKkcT0j+eL7Kok/A6Zq+qX
         APknX/Bt60Onkxv4yChmNWgpk8L121sAZAIQVduk+X85HmPMGEPmSXQ5pe7Zpj28lpC5
         FApSnjQ5LaMbiMMRu4HwH8T/2oCp2zyWtFKELGUKX8Hbf4r4R/4bWhH1VTTL2Je5sriZ
         Rb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735313321; x=1735918121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fa0fqKDzdWUWgl9YIyEjQ+EFtrp32SWDVcpDJH2NtZk=;
        b=q2t+XeBAFeEsn9gjnqH3hN4PUXSiti3t5knd4UqJYALtz6LDawv+ArolukFE8ZeyrA
         MKlX2rhGAuwHLkL88WMLqmMiJzhFZBerR9o5LXS5S1MwLDQA/HTw0hEKa3SXR2V8wSQm
         uTK3oTy9hFSshKgR0eryTJ0rzUmyhlr94zGfzrsCpjhBvEogWNG/EWwbN9cWZH/Y9x3N
         PHtlIymXuB9MNtAIYMy1eOkVMltxadl1b0K8NFQB7cDgALm3O6Duofnn7IV33RnZPfnC
         jhyhQw7nqySVNG/T3AE9YsF98T/3GZop3c1lcxXgan31nt2QJUxSZl9EHJ/xUNC121nE
         i1pQ==
X-Gm-Message-State: AOJu0YxOaAS39Gkqtz/kPMMAxPpgYLJc28TTn41H4nP7TZaHKTMbntcV
	zV3Ru8aPOZZNZXIxW2EiPxA36Z+N0Qmsx6oKaN89exmlT3/2B1r8w8yEkPKCHctvLVvKNinGpZI
	cgCJH2TDovKSJyKuI4LMiWXTAF9y4lMyS
X-Gm-Gg: ASbGnctTPbYJ5wh6jM20iV8JLygtlapnok2bAowKBHTG/ZshCqzsAB0NGSEQo6WeOHQ
	+Bt+OnFcxzvWHAdyxUIPPUJEwls/K0NuHjyxLF6q2s3iHRs9eJs48oTdrJcOh4E8WRQa9Jg==
X-Google-Smtp-Source: AGHT+IHlhtXNIIP6CcHFNHWTlNhXv4FVZELDr908El/Jcm2tR2FkPTydUKVEgkkTa60SXlVH8rmnaZ3k4WO4gW7MuV8=
X-Received: by 2002:a05:6808:1514:b0:3eb:6631:ec29 with SMTP id
 5614622812f47-3ed88eced6fmr15642422b6e.6.1735313320894; Fri, 27 Dec 2024
 07:28:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>
 <CAKUwrzDtcu2JGdVve0BF9nUR-25M3bZrSyJ6xLLiwjCehmWCxw@mail.gmail.com>
 <2024122755-status-provolone-58f2@gregkh> <CAKUwrzA2ue3g3Ys=Vg=eeunE1mw-RSockLPoqnU=F6jB1jjVBw@mail.gmail.com>
 <2024122716-previous-plethora-0ebb@gregkh>
In-Reply-To: <2024122716-previous-plethora-0ebb@gregkh>
From: Alvaro Kuolas <kuolas@gmail.com>
Date: Fri, 27 Dec 2024 12:28:30 -0300
Message-ID: <CAKUwrzBH13SzGGSpDbxf44T1JnuKyHoL4y_KSdEQjAqpG1fz1A@mail.gmail.com>
Subject: Re: Longer boot times with kernel 6.11.7 and newer (including 6.12.6).
To: Greg KH <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The problem is related to upower and Realtek ALC4080 USB audio chip.

https://gitlab.freedesktop.org/upower/upower/-/issues/288

Disabling the USB audio chip in the motherboard BIOS settings makes
the system boot without delays.

Thanks Greg for all your help.

On Fri, Dec 27, 2024 at 9:41=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Fri, Dec 27, 2024 at 09:35:31AM -0300, Alvaro Kuolas wrote:
> >    "as expected" is what, faster boot?
> >
> > Sorry for my wording. I mean the system boots faster and it is more
> > responsive without commit cfc72b86fa20cbf44d2b6cc27b35eb15080232ab.
> >
> > I noticed this problem on my system when logging in after a Fedora 41
> > update. From GDM login screen to Gnome desktop running with the commit =
is
> > roughly ~19sec and without it is ~5sec. This freeze on GDM login is why=
 I
> > started debugging.
> >
> > At first I reinstalled from the latest iso F41, then tried to block upo=
wer
> > update, and later I tried different kernel versions. That is when I hit
> > this commit.
> >
> > I have compiled 6.13-rc4 with commit
> > cfc72b86fa20cbf44d2b6cc27b35eb15080232ab and without, I will start test=
ing
> > why this behaviour is on my machine and in other machines I have access=
 to.
> > I will try to look at why upower takes that much time, and why Gnome lo=
ses
> > responsiveness, and check if it is only on my system (Ryzen 7900X, B650=
E,
> > Vega10GL) or if it happens on other systems as well. I can change this
> > testing to 6.12 stable if it is for the better.
> >
> > Thank you for your time and comments on this subject, I really apprecia=
te
> > it.
>
> If you look at commit 15fffc6a5624 ("driver core: Fix uevent_show() vs
> driver detach race"), it shows what the original fix was attempting to
> resolve, by removing a lock on the path of reading the uevent sysfs
> file.
>
> It's odd that gnome wants to read that file so much, so perhaps you
> should look into what is happening there.  That file should ONLY be read
> once at boot, during the "cold plug" portion of the boot process, and
> not afterward as that wouldn't make much sense.  Perhaps a speed up
> could be just fixing userspace to not do that anymore.
>
> good luck!
>
> greg k-h
