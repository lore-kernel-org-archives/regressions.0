Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1258308F15
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 00:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773274513; cv=pass; b=Yqi80EfuQ73zmy9qxeL/QHrIVyTEOMGxr9OCn+eFKiS1dRDnSJ7+tQ11U5YWw4mU0TzKnDzCvdXev/SkvhBygtOg4YlhHWD2HvXunZeR55xotOi6t/XxcQmp7Z6z8og2b4I/YZ4Y9wPP6mohfT5+jX0dTVBgGChgOI8nqb/BPV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773274513; c=relaxed/simple;
	bh=6/itMLCFfyLvJoeA9cy22RHpmFM4fQuJ59IcW2RTNl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahTMsEeQJ6xhtZZPqAhNn54y7ybI4F2I8OPgDj4KtpJg6+O8CyiPVX7PVbKW2ErasBIxtm37WbQlHcxI2bcay0zzrakXvwybWklz+EJgRD7WS76BWe6YIYje1QxG0Rv7+8x2QOypNukpj7vRD0b7GU+HwxFcEW1BEq0r3SkeHfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ej3VKa2n; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ej3VKa2n"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-661b16ac011so677865a12.2
        for <regressions@lists.linux.dev>; Wed, 11 Mar 2026 17:15:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773274510; cv=none;
        d=google.com; s=arc-20240605;
        b=Wt8Ptmjc/NiXT2oV+JCLu01wdxIVdTdoPgDvm5H/gkjN8kSnp7isL0YmEaZ3vJ9Wxu
         vUwd0A368QvXWwo5JS8jb6oqXfyBWtAXVJw3+etmOFVCpYkRrjfoe2XxMOu821ZCMncM
         OsCpZgVojNxc86JSwsxkRZzcrC45T+4Pg8ayTaKv8ItJAd0LAhQ0KFR3yf3F59D8bFCS
         BXo7cdqKsV/LQtr/q9ekqi9qO+RzsVKGs4kyKlJP28dNqS82uj7JzGQp93RLj5HWPVmF
         /QaFoIWF6DXRC6kp/0oJl9ozMyWQCUY3La4ZN5dzdAbdeYBORH8oNDRutNAFgTJlvct3
         OmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pbDxkeMXFgFuSfzV6w0UsHl8/LPcKe8YhwEDSHSsljs=;
        fh=ziQHr37OoUqGMvnjHmj1gAtK03kk4MSgynhFRytWYnA=;
        b=d8aKj0uRrlrIzhCxk1iMPA/2T5PQ5WyAadBF6O68bXO4JNRUlPic7hH27h8MMQoPZG
         IJU6x/Mlud8ywifEyYw4/0GFZGKKZfrdhCXoWKuCwddiCjsJCW791lKQvB6ARdjLj1sU
         XOLUxGkIqqHcGG0GzM3RS/t00H05nDvuY/zfMX0FmdaULWICFh35DmaQ99aB+3vPBDxh
         sjNouKQNqwIE2AfxlOaGlPRf6N6V59FO6UpFbRIFIPHb66UUv0VkgL0+N7qSkO/E8WRK
         4+EzsLJtVFQaHJxqRXo3IST09hh/bc6IHoeONN6gW5Ku5VNUHutLBDQHFDUBl9USUjC1
         yeeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773274510; x=1773879310; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbDxkeMXFgFuSfzV6w0UsHl8/LPcKe8YhwEDSHSsljs=;
        b=ej3VKa2nuEosNigjeDBzuXg5eqYU617b3ZZIEQ0FmixQmrOyg0UfQRkdN16NVpamOc
         Ngpy/m3qE2cJ2bm4HvBBLOJ17bY0cTkiehJpzxFgKEpTrt7c3VFaT33O2gxDyMd7w84f
         FesIdikm2AUqDdEp8CN/189WNmnq/xet5TWvOfR2hVuiucanz+5uqwhGNa7CAJSFjP0b
         rmgAxisnQllFksCc8B1ZDqYtjti25A2yV6I1IJH45+y3+Px0E/SKNDlRSeo7B8E0E8m5
         mef18SRVogrYOwoLqDC8KWgM/oBXorYPkiqRl8i6+kBZcRFS0EFUo5lGdlJEtORerwTL
         3Rvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773274510; x=1773879310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pbDxkeMXFgFuSfzV6w0UsHl8/LPcKe8YhwEDSHSsljs=;
        b=cdVXOMSo3hPv0Q6MWsKxUNyaYD3NFTJ1WUMkE9qaSXcqZzk/TcgLxzTYODsBnNb7rT
         Y/xsZAylcOiCFWjL8BviM55LrynqJuPtYGV75I0EswQUN1VmyqOg9Q4kgCcOVMrKJPcZ
         PYbCz1cZmv1arNP0XuhBJTbJDeSoPe0PyuCUYMSTrUfGqe4/VEMuchDK/Kw6d8u0Ewho
         O4wtoH4t8hHM6MOpp6en4NqReLoT47ty+x8QILv/JBsrvcW5k+vKgje8wNO0Zn/7bhlB
         fFp2ETO+n4GWlTMo+FjGgbduvbGDzvCfJTvmd3NshA1njOmiIuGdOLW0YVvNQThx1GX5
         RZ7g==
X-Forwarded-Encrypted: i=1; AJvYcCXtX82y0Wc0i3naJEpL2yMpV/ErqvxWfop+iZ7XENqkYz/IA8zztpBliM0Y25xz3kdU5UsqLTBqb/ELhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxzj/kfFEX9cid4Yvy5xOZ4r7gytJVwXc8oQWd5C09LW7pw5Viw
	N4C8YB0wMTQj/zO6rgCsGH3jVjKZgrixFnoqrdVMDESIFK43Rp+dkZ8AWwdeusqhH2rw35Of9QC
	WTOJKJkvLLa7XNU/8Tlbk5FJzvlOEHrk=
X-Gm-Gg: ATEYQzzkmD6hJZBsi3Fjdo6xhiYC0cTTxk69q3c0cr0q8HwUBQlLk7YgY23gDOtwDqk
	7cKi1JWpcv529A8W06Djeq58xKBqm52t5TcQr/+1jX5q28K9e1Bcext5KPeNnveBz0MnggNej/4
	AOBA9UUbt21poPwzGUyjfNZxIhXtw0hzhrYV0z51tmkzJ9FYwu2rp9NtiRTy217G8XZFDtK6w2v
	oJ1cnV8haURgludBj6psUKpAbhgvvkfOdoJ8/eijOqkdWf0b5aI+zgw0Mo1dX4JKA9wXKwGpglU
	iJdS4W/8/giwrwFP
X-Received: by 2002:a05:6402:5109:b0:660:f98d:227f with SMTP id
 4fb4d7f45d1cf-66319ee21aemr2290781a12.28.1773274509925; Wed, 11 Mar 2026
 17:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310235642.6d9798f4@plasteblaster> <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
In-Reply-To: <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
From: Shyam Prasad N <nspmangalore@gmail.com>
Date: Thu, 12 Mar 2026 05:44:58 +0530
X-Gm-Features: AaiRm50oWdiNjT1ebRKWHilt31EW_fjU4bk5ELRtpIJIFmb-N6WXXm4YQx0WL0s
Message-ID: <CANT5p=q2Lv4pSvEm5EWcM73b7NZsbt1kYEFJtjaAZRS6Gz_OjQ@mail.gmail.com>
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: "Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>, Steve French <sfrench@samba.org>, 
	linux-cifs@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 7:37=E2=80=AFAM Henrique Carvalho
<henrique.carvalho@suse.com> wrote:
>
> On Tue, Mar 10, 2026 at 11:56:42PM +0100, Dr. Thomas Orgis wrote:
> > Dear Linux-CIFS maintainer(s),
> >
> > I stumbled upon a regression in the Linux cifs/smb3 client when working
> > with a smbd using a non-standard port. I am not the first to note this,=
 see
> >
> >       https://bbs.archlinux.org/viewtopic.php?id=3D306712
> >
> > which is a report from mid last year, indicating the problem sometime
> > after Linux 6.6.72. It is a very simple issue, where details of the
> > kernel builds or mount setup don't seem to matter much: Older kernels
> > reconnect to a SMB server that was restarted (old processes killed and
> > replaced), newer kernels do not and just have a defunct mount.
> >
> > I reproduced this in our HPC cluster environment with such smb.conf on
> > the server side
> >
> > [global]
> > security =3D user
> > map to guest =3D Bad Password
> > server role =3D standalone server
> > smb ports =3D 1445
> >
> > [public]
> > path =3D /some/path
> > guest ok =3D yes
> > read only =3D yes
> >
> > and such a mount command on the client:
> >
> > mount -t smb3 -o port=3D1445,user=3Dguest,password=3Dfoo //server/publi=
c dir
> >
> > When I kill and re-start smbd on the server, older client kernels
> > reconnect and continue to return listings and files from the share,
> > while newer kernels give this:
> >
>
> My suspicion is that the regression was introduced by:
>
>     5713127da855 ("cifs: update dstaddr whenever channel iface is updated=
")
>
> That change causes parse_server_interfaces() -- should this be running
> without multichannel mount option? -- to overwrite the port stored in
> server->dstaddr with CIFS_PORT.
>
> The attached patch preserves the existing port from server->dstaddr.
>
> Note that I have not yet tested this patch or confirmed the regression
> with a bisect. If you can't, I will try to do that tomorrow.
>
> --
> Henrique
> SUSE Labs

Hi Henrique,

AFAIK, the ignoring of port from the results was by design and part of
the original code back in 2018:
CIFS: parse and store info on iface queries

Also, the comment in the code just above says why this is so.
[MS-SMB2] 2.2.32.5.1.1 Clients MUST ignore these

I checked this section and it says:
Port (2 bytes): This field MUST NOT be used and MUST be reserved. The
server SHOULD set this field to zero, and the client MUST ignore it on
receipt.

Based on the conversations here, it looks like smbd ignores this.

I think the right fix would be to make sure that
cifs_chan_update_iface gets called only for secondary channels. That
way, it will not get called for single channel scenarios.

--=20
Regards,
Shyam
