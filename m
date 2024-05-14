Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4287012D761
	for <regressions@lists.linux.dev>; Tue, 14 May 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715679228; cv=none; b=qu+uzQZQgsM4o8cxLx9yAGGXRDT5cmCRydtGnTG7jZywtOP+FkNwravv91WyUrpjnJUu3QaYgRXsdYL4WRsEV1fuOvuvmFCMWCUuqnoD6VRj7DHszJZ9GS5Xgy6kzupoPBnUWnzawMDFlCOITz6GZpA4r4lGNkO9+dpRb1htxUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715679228; c=relaxed/simple;
	bh=5QLuxRfvd+1qGhx8UXztidmfANvVUZa2jZmUkoA1gN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RJVRiPFPwcmv8vZ+iSnmkbaI4lW4Fs7ymzMu1e0m9eNg+yVeqlO04+9YBqZyDRaE2WqlAQXkCWHqqV4aCYPgAwzhjhTk0gvs3EUazfT2KfKXNtmIGWje5pVCdxr6QE/AhmMLVzTI9tG4F+FmuiLA2dNHxWlugai79I4nIzFyvj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQyVuiNj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQyVuiNj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a59a352bbd9so873644866b.1
        for <regressions@lists.linux.dev>; Tue, 14 May 2024 02:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715679224; x=1716284024; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vvhQQXLlY1q374hvVcmmTIItYN4TuVcT0kU+Q8i1yh4=;
        b=HQyVuiNjc/PV9UqcVUHukbICFhBGx32jYt/0xAfCzij114qnHtoHweeRhzNMxP+uiB
         hFSNKvuftv7Iqj9+dXu48L2vIOssgVID53pEbNSRyZ0r5NkunfwGwAnfG77wipjJ6m4L
         ldEjPh2d9JS5gwP6ddvPKQLkqKVocs4TMMeCGgNu83uXHp+vpKW+lvyD3OZnc6suWjXE
         lthIwFEonUWrgLdD5wTys9JHz6INuWVx/Ue7CVGyl+oaa2ORExl/L2W5ykB+FatwaOIC
         wPTGBZr4qzQXB1E1MBMes7Ev2tcTrxII0xWnpGyPaV3/1Pl65ohXmMiw6Z9yjstCd1oK
         a0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715679224; x=1716284024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vvhQQXLlY1q374hvVcmmTIItYN4TuVcT0kU+Q8i1yh4=;
        b=kIsLB5JKmaf+3pRDEN/hEK3D7Z5J6tIfedd7kg+IMENb4XpPwjv1VaR4w3ZPxhI/1c
         3gofajBVImc/I6Nhk2N4/BRnVlYVbqS2jthRU+XvVeKwMLoMsApk7+BiOnu3a7ykvqF+
         aATCc4PFbILhnUOOB4F09doaO5JKTp6jo1WhNpQU8QzMUa6Gz3xb4LTBzhdQWvIY2crH
         k+O5xpZr0pePZKIkP3QcUPxVZQjapiR58aUlxirMn2JhWJIZR+aVlrLYonVvarvO42rT
         H4yC2ofo72fDuEmxCamVvTAkvy5Z0n+KuehNJNuAofGfaAtDKyf4CCgagI0rZ+FP44Fb
         7NPA==
X-Forwarded-Encrypted: i=1; AJvYcCUVkcizn85Fd66ysNfhND/5dGCNW/Rp7zjvvMKwCe5xmlnXUlvx5Ztfl8BgmtejAqPOV8v0KTKJ2u2ZnNxXoXf2B7wfGRgusSsMmDM=
X-Gm-Message-State: AOJu0YwZ/P35YkghfZmprRZu0qz/DygnXMoz9eKCKWY0dyYNE3j0J2pH
	GgsWRgmMbdj+jXD8ZvYWKQ6GhryMGnuk0BFq7GXf8B4yAiIx3+YsNintWvQ2Rj4J5fM2pM+OWTL
	dyXL80IR+C19sIj8Ul3V8bi+bb7s=
X-Google-Smtp-Source: AGHT+IEVr8pA7N5wJSBHLEqP9NWjrznEty63oLQWCi+u8xtGKtUtLPA0gdZgWyYzApBwpPnW8e3VakFkKun0zaUnXb4=
X-Received: by 2002:a17:906:d10e:b0:a59:9fcb:e9ac with SMTP id
 a640c23a62f3a-a5a2d1afc74mr1013075566b.11.1715679223622; Tue, 14 May 2024
 02:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZkLv3wn62jqMVpSF@archie.me> <CAHp75VcjeJ5oZy2JjbyrKn+GVvixJKmfh3Yj1p-HxcJHrm0Wzg@mail.gmail.com>
 <606328522.1205749.1715678929830@mail.yahoo.com>
In-Reply-To: <606328522.1205749.1715678929830@mail.yahoo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 14 May 2024 12:33:07 +0300
Message-ID: <CAHp75VefMFJMAHrKmDf1joSkKOcaRMJWse8yM63Nt5v2W7w3Fw@mail.gmail.com>
Subject: Re: [regression] [bisected] commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0
 corrupts data sent via pseudoterminal device
To: Vadym Krevs <vkrevs@yahoo.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Linux Serial <linux-serial@vger.kernel.org>, 
	Gilles Buloz <gilles.buloz@kontron.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 12:28=E2=80=AFPM Vadym Krevs <vkrevs@yahoo.com> wro=
te:
>
> It's a standard setup for an out-of-the box default install of openSUSE 1=
5.5 with KDE. All tests done in Konsole with bash as shell.
>
> stty -a -F /dev/pts/1
> speed 38400 baud; rows 57; columns 217; line =3D 0;
> intr =3D ^C; quit =3D ^\; erase =3D ^?; kill =3D ^U; eof =3D ^D; eol =3D =
<undef>; eol2 =3D <undef>; swtch =3D <undef>; start =3D ^Q; stop =3D ^S; su=
sp =3D ^Z; rprnt =3D ^R; werase =3D ^W; lnext =3D ^V; discard =3D ^O; min =
=3D 1; time =3D 0;
> -parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
> -ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon i=
xoff -iuclc -ixany -imaxbel iutf8
> opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 v=
t0 ff0
> isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echop=
rt echoctl echoke -flusho -extproc

Thank you!

Yeah. SW flow control is enabled, but I don't see which character is
being used for that. Anyway, let's give Ilpo a chance to look into
this.

> On Tuesday, 14 May 2024 at 10:11:11 BST, Andy Shevchenko <andy.shevchenko=
@gmail.com> wrote:
> On Tue, May 14, 2024 at 8:00=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:

> > <vkrevs@yahoo.com> reported on Bugzilla
> > (https://bugzilla.kernel.org/show_bug.cgi?id=3D218834) pseudoterminal d=
ata
> > corruption regression. He wrote:
> >
> > > Hello. There appears to be a regression in pseudoterminal support int=
roduced by commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0.
> > >
> > > We have a wrapper program that uses a pseudoterminal to transform dat=
a fed into input/read from output of a child process. Transformed data is w=
ritten to the master device, the child process, whose stdin/stdout are mapp=
ed to the slave device, reads data from parent by reading from its stdin, p=
rocesses that data and sends it back to parent by writing the response to i=
ts stdout, and then data from the child process is read by the wrapper from=
 pseudoterminal master descriptor.
> > >
> > > This used to work fine on various Linux distros such as Amazon Linux2=
, SLES 12/15, openSUSE 15, RHEL 8/9 with pre 6.0 kernels. However, running =
our regression suite on Amazon Linux 2023 which uses a 6.x kernel revealed =
regression. Sometimes, when a lot of data is written by the parent process =
into the master device's descriptor, some data is lost or corrupted when th=
e child process is reading it from the slave device's descriptor. We've ver=
ified that this is a kernel regression introduced via commit 6bb6fa6908ebd3=
cb4e14cd4f0ce272ec885d2eb0 by performing kernel bisection as described in h=
ttps://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html#=
introguide-bissbs. Bisection was performed using openSUSE 15.5 in VirtualBo=
x (so the kernels had the tainted flag set) but the issue can also be repro=
duced outside of VirtualBox.
> > >
> > > Bisection logs and a repro test case used to perform bisection are in=
 the repro+bisect.zip attachment.
> > >
> > > ---------------------------------------------------------------------=
--------------
> > > The test script, ptybug.sh, pipes a large plain text file containing =
1027800 plain text records separated by newlines into the wrapper program. =
Each record is a 0-padded record number padded with spaces to 80 bytes.
> > >
> > > The wrapper program sends the unmodified data read from its stdin to =
the child program via a pseudoterminal, reads the output from the child and=
 prints it on its stdout. Wrapper's stdout is redirected to a file which is=
 then compared with expected output.
> > >
> > > The child process reads exactly 1000000 records from its stdin, strip=
s off trailing whitespace, and prints the record on its stdout.
> > >
> > > Both the wrapper and the child process mirror the data written into t=
he pseudoterminal master descriptor/read from the pseudoterminal slave desc=
riptor into separate files - which are identical on kernels prior to commit=
 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 and which differ on kernels that =
include that commit.
> > >
> > > ---------------------------------------------------------------------=
--------------
> > > How to reproduce:
> > >
> > > tar xvf repro+bisect.tar.zstd
> > > cd repro
> > > ./ptybug.sh
> > >
> > > Expected output (on 5.19.0-rc1* kernels prior to commit 6bb6fa6908ebd=
3cb4e14cd4f0ce272ec885d2eb0)
> > > rm -f ptybug ptybug_child gen  *.o
> > > cc    ptybug.c  -o ptybug
> > > cc    ptybug_child.c  -o ptybug_child
> > > cc    gen.c  -o gen
> > > Test run 1 ...
> > > Test run 2 ...
> > > Test run 3 ...
> > > Test run 4 ...
> > > Test run 5 ...
> > > PASS
> > >
> > > Actual/bad output (on 5.19.0-rc1* starting from commit 6bb6fa6908ebd3=
cb4e14cd4f0ce272ec885d2eb0 and later kernels, including latest)
> > > rm -f ptybug ptybug_child gen  *.o
> > > cc    ptybug.c  -o ptybug
> > > cc    ptybug_child.c  -o ptybug_child
> > > cc    gen.c  -o gen
> > > Test run 1 ...
> > > FAIL Actual and expected output does not match (gen1027800)
> > > FAIL
> > >
> > >
> > > To see the difference between data written by the master into the pse=
udoterminal master descriptor and data read by the child from the pseudoter=
minal slace descriptor (stripping off trailing spaces) run:
> > > diff -u gen1027800_sysin.txt.nospace gen1027800_a_out.txt.copy |more
> > >
> > > One possible output is below (every time you run this on a kernel sta=
rting from commit 6bb6fa6908ebd3cb4e14cd4f0ce272ec885d2eb0 the results are =
sligtly different). As you can see lines corresponding to records 17861-178=
62 have been erroneourly replaced with lines 17858-17859, and so on.
> > >
> > > --- gen1027800_expected.txt    2024-04-26 14:39:22.287121535 +0100
> > > +++ gen1027800_a_out.txt.copy  2024-05-13 15:52:48.915952662 +0100
> > > @@ -17858,8 +17858,8 @@
> > >  000000000000017858
> > >  000000000000017859
> > >  000000000000017860
> > > -000000000000017861
> > > -000000000000017862
> > > +000000000000017858
> > > +000000000000017859
> > >  000000000000017863
> > >  000000000000017864
> > >  000000000000017865
> > > @@ -51261,7 +51261,7 @@
> > >  000000000000051261
> > >  000000000000051262
> > >  000000000000051263
> > > -000000000000051264
> > > +0000000000000512651264
> > >  000000000000051265
> > >  000000000000051266
> > >  000000000000051267
> > > @@ -104576,9 +104576,9 @@
> > >  000000000000104576
> > >  000000000000104577
> > >  000000000000104578
> > > -000000000000104579
> > > -000000000000104580
> > > -000000000000104581
> > > +000000000000104576
> > > +000000000000104577
> > > +000000000000104578
> > >  000000000000104582
> > >  000000000000104583
> > >  000000000000104584
> > > @@ -110897,8 +110897,8 @@
> > >  000000000000110897
> > >  000000000000110898
> > >  000000000000110899
> > > -000000000000110900
> > > -000000000000110901
> > > +000000000000110898
> > > +000000000000110899
> > >  000000000000110902
> > >  000000000000110903
> > >  000000000000110904
> > > @@ -279673,9 +279673,9 @@
> > >  000000000000279673
> > >  000000000000279674
> > >  000000000000279675
> > > -000000000000279676
> > > -000000000000279677
> > > -000000000000279678
> >
> > See Bugzilla link for the reproducer mentioned.
> >
> > IMO, this is quite different from the case fixed by 56c14fb4086b2d ("tt=
y: Fix
> > lookahead_buf crash with serdev").
>
>
> What's the output of `stty -a -F /dev/...` (dunno if you can do it on
> pty, but at least control tty can do it)?
> Or can you share the pty configuration done for this? (I haven't
> looked into any shared code, maybe it's already there)
>
>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
With Best Regards,
Andy Shevchenko
