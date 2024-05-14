Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FBFFC1F
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 09:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715677873; cv=none; b=PKD0QAVh0PkNIJ/5iud6QxW2UYxtVCXzQIBqS9lMAqkUftFmHzdtNPWHU0Aw6VG7p6UYweW1Dc9+XqxFSothp1U+y3GHGi/YfDkTEAkjXF1eelvTZRvZ8I05g9fn0qgTixYMcJ7NMXTnqauQk6ooQRecr9Di4+3U6debv/rUeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715677873; c=relaxed/simple;
	bh=7PTgTRv/gPnm/uiQywhTGGmvC+Pdw1Pc1e0e8X51IKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IQVBeVXpy+NMvh2miU2uIxVwfPuClEkIFqHqi1gSno7VUUhArFjx/4BmgKkPcrTE2s94TfqjQY9ZbPMvqeMpX/C/uyiqFhuPyo2bDeelHa2u9DSVZvG26XqL3NAx/6tmyP/h91IoYxvGtqftAr0UprztuhOsjSR+YghHcJc8PHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K36e1o0W; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K36e1o0W"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so523195866b.0
        for <regressions@lists.linux.dev>; Tue, 14 May 2024 02:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715677869; x=1716282669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeAhMJBtq8CWgf1hZR49e40QzwLCoGUX1qRWLCzbmgM=;
        b=K36e1o0WXXwcoNFX2V+XnTSUw++vDGyQENQBceF1RnJv/0cjz1rSdvVrRbT4om27+l
         mslmF9F+jmsx7wtHuOUY6mA/deexoCskgKA21DeQb6OiBr1Fh/8ox9/0E01m1hYSqruc
         ZFv7PVSaV7PwLo0WtnDpz/gsz0Jq6cu/RVGJ6tDJRArF9wmY658Wu0jGD8BI1GhKpfAx
         JtNskk6mfeW4CofZJlJJayPqVGZbl7PQXoJnIaV+Q4KoKj995zSp15OkoS2lCnyys5kb
         w29v8d3CItCP+5QAufBVqqEv5jrTHFzNmgWE8kCkCvK368E9R+hZJs83Vyj30s+LXATc
         4hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715677869; x=1716282669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VeAhMJBtq8CWgf1hZR49e40QzwLCoGUX1qRWLCzbmgM=;
        b=BRPl5puijzj68YZzjSLS6NHWkuHhPtOdoiFL9kTwah+JQiCDEI0QGxJidKYtBkx5PI
         8oGHg66RqOCy5vricp6NOJ4JafJ18MfJ2Sfm2Gc3d7Z/HCQwpQf11OOWDU6Ce5Ed+9SC
         wd/k/M1UWJUSLvslSkcBwk3c1yk/Dlr43rf1IN88KTgFXz5HX1YIQxLodP6Dve5RBh5A
         G5XMq4HdiBkPwuMT8+bi9Lfohr4TqCSASbaN5jjQTA1QU7HOf2wvzmqCzcX5F2+rwV6m
         6h4iPUE4fzaL47+TCkrrKwVGqf+MXbZLYrZZEr7eJww4g0vRjiuwC/hj+ugvnsEHnQVW
         g7LA==
X-Forwarded-Encrypted: i=1; AJvYcCVaKP1D0NQdhZQJZU8OIN3N4D8N4D1tHeqceS5nTkFg7Br95DxDe/GxmFOHPVLDYhpPlns5eieP7I7+sLBi/g4VbzGtNxXtMHRd+W0=
X-Gm-Message-State: AOJu0YyYaJV75oAJLmwVgLHrDhXPlkjNIluWGakYYUKch13vh0502do1
	VgoJlVsPdQIXMA0LlFyHE0rvKUpljhIhxjMbF3ib6lHIDuLbIrfUzQdVhcVu3LqKfJqG9jq0pVw
	aK+xY70GHYFAP2MbnFwTeEkEmLpI=
X-Google-Smtp-Source: AGHT+IGPWSUehLEQZr9WtSRkGgGvOAbA6ON8q4E2LmVCB+2l/MfXxKnlUja5e3c79K7bHiM3gwTfiXkN+xn3oXQ00wE=
X-Received: by 2002:a17:907:9449:b0:a59:bdb7:73f5 with SMTP id
 a640c23a62f3a-a5a2d6668camr964239066b.52.1715677868928; Tue, 14 May 2024
 02:11:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZkLv3wn62jqMVpSF@archie.me>
In-Reply-To: <ZkLv3wn62jqMVpSF@archie.me>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 12:10:32 +0300
Message-ID: <CAHp75VcjeJ5oZy2JjbyrKn+GVvixJKmfh3Yj1p-HxcJHrm0Wzg@mail.gmail.com>
Subject: Re: [regression] [bisected] commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0
 corrupts data sent via pseudoterminal device
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Serial <linux-serial@vger.kernel.org>, 
	Gilles Buloz <gilles.buloz@kontron.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Vincent Whitchurch <vincent.whitchurch@axis.com>, vkrevs@yahoo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 8:00=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> Hi,
>
> <vkrevs@yahoo.com> reported on Bugzilla
> (https://bugzilla.kernel.org/show_bug.cgi?id=3D218834) pseudoterminal dat=
a
> corruption regression. He wrote:
>
> > Hello. There appears to be a regression in pseudoterminal support intro=
duced by commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0.
> >
> > We have a wrapper program that uses a pseudoterminal to transform data =
fed into input/read from output of a child process. Transformed data is wri=
tten to the master device, the child process, whose stdin/stdout are mapped=
 to the slave device, reads data from parent by reading from its stdin, pro=
cesses that data and sends it back to parent by writing the response to its=
 stdout, and then data from the child process is read by the wrapper from p=
seudoterminal master descriptor.
> >
> > This used to work fine on various Linux distros such as Amazon Linux2, =
SLES 12/15, openSUSE 15, RHEL 8/9 with pre 6.0 kernels. However, running ou=
r regression suite on Amazon Linux 2023 which uses a 6.x kernel revealed re=
gression. Sometimes, when a lot of data is written by the parent process in=
to the master device's descriptor, some data is lost or corrupted when the =
child process is reading it from the slave device's descriptor. We've verif=
ied that this is a kernel regression introduced via commit 6bb6fa6908ebd3cb=
4e14cd4f0ce272ec885d2eb0 by performing kernel bisection as described in htt=
ps://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html#in=
troguide-bissbs. Bisection was performed using openSUSE 15.5 in VirtualBox =
(so the kernels had the tainted flag set) but the issue can also be reprodu=
ced outside of VirtualBox.
> >
> > Bisection logs and a repro test case used to perform bisection are in t=
he repro+bisect.zip attachment.
> >
> > -----------------------------------------------------------------------=
------------
> > The test script, ptybug.sh, pipes a large plain text file containing 10=
27800 plain text records separated by newlines into the wrapper program. Ea=
ch record is a 0-padded record number padded with spaces to 80 bytes.
> >
> > The wrapper program sends the unmodified data read from its stdin to th=
e child program via a pseudoterminal, reads the output from the child and p=
rints it on its stdout. Wrapper's stdout is redirected to a file which is t=
hen compared with expected output.
> >
> > The child process reads exactly 1000000 records from its stdin, strips =
off trailing whitespace, and prints the record on its stdout.
> >
> > Both the wrapper and the child process mirror the data written into the=
 pseudoterminal master descriptor/read from the pseudoterminal slave descri=
ptor into separate files - which are identical on kernels prior to commit 6=
bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 and which differ on kernels that in=
clude that commit.
> >
> > -----------------------------------------------------------------------=
------------
> > How to reproduce:
> >
> > tar xvf repro+bisect.tar.zstd
> > cd repro
> > ./ptybug.sh
> >
> > Expected output (on 5.19.0-rc1* kernels prior to commit 6bb6fa6908ebd3c=
b4e14cd4f0ce272ec885d2eb0)
> > rm -f ptybug ptybug_child gen  *.o
> > cc     ptybug.c   -o ptybug
> > cc     ptybug_child.c   -o ptybug_child
> > cc     gen.c   -o gen
> > Test run 1 ...
> > Test run 2 ...
> > Test run 3 ...
> > Test run 4 ...
> > Test run 5 ...
> > PASS
> >
> > Actual/bad output (on 5.19.0-rc1* starting from commit 6bb6fa6908ebd3cb=
4e14cd4f0ce272ec885d2eb0 and later kernels, including latest)
> > rm -f ptybug ptybug_child gen  *.o
> > cc     ptybug.c   -o ptybug
> > cc     ptybug_child.c   -o ptybug_child
> > cc     gen.c   -o gen
> > Test run 1 ...
> > FAIL Actual and expected output does not match (gen1027800)
> > FAIL
> >
> >
> > To see the difference between data written by the master into the pseud=
oterminal master descriptor and data read by the child from the pseudotermi=
nal slace descriptor (stripping off trailing spaces) run:
> > diff -u gen1027800_sysin.txt.nospace gen1027800_a_out.txt.copy |more
> >
> > One possible output is below (every time you run this on a kernel start=
ing from commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 the results are sl=
igtly different). As you can see lines corresponding to records 17861-17862=
 have been erroneourly replaced with lines 17858-17859, and so on.
> >
> > --- gen1027800_expected.txt     2024-04-26 14:39:22.287121535 +0100
> > +++ gen1027800_a_out.txt.copy   2024-05-13 15:52:48.915952662 +0100
> > @@ -17858,8 +17858,8 @@
> >  000000000000017858
> >  000000000000017859
> >  000000000000017860
> > -000000000000017861
> > -000000000000017862
> > +000000000000017858
> > +000000000000017859
> >  000000000000017863
> >  000000000000017864
> >  000000000000017865
> > @@ -51261,7 +51261,7 @@
> >  000000000000051261
> >  000000000000051262
> >  000000000000051263
> > -000000000000051264
> > +0000000000000512651264
> >  000000000000051265
> >  000000000000051266
> >  000000000000051267
> > @@ -104576,9 +104576,9 @@
> >  000000000000104576
> >  000000000000104577
> >  000000000000104578
> > -000000000000104579
> > -000000000000104580
> > -000000000000104581
> > +000000000000104576
> > +000000000000104577
> > +000000000000104578
> >  000000000000104582
> >  000000000000104583
> >  000000000000104584
> > @@ -110897,8 +110897,8 @@
> >  000000000000110897
> >  000000000000110898
> >  000000000000110899
> > -000000000000110900
> > -000000000000110901
> > +000000000000110898
> > +000000000000110899
> >  000000000000110902
> >  000000000000110903
> >  000000000000110904
> > @@ -279673,9 +279673,9 @@
> >  000000000000279673
> >  000000000000279674
> >  000000000000279675
> > -000000000000279676
> > -000000000000279677
> > -000000000000279678
>
> See Bugzilla link for the reproducer mentioned.
>
> IMO, this is quite different from the case fixed by 56c14fb4086b2d ("tty:=
 Fix
> lookahead_buf crash with serdev").

What's the output of `stty -a -F /dev/...` (dunno if you can do it on
pty, but at least control tty can do it)?
Or can you share the pty configuration done for this? (I haven't
looked into any shared code, maybe it's already there)


--=20
With Best Regards,
Andy Shevchenko
