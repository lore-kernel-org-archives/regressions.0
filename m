Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAE1257824
	for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773330045; cv=pass; b=glxZJseYA9mzcwN1Y+zOm4wjAyhM77fiWpHHhJ1FCIzCZbEICiZaZBLa9/GehxvrwWXFbQwTI6jG9GZo5ixan1tEASZYFOuLk5qCzYPIyIgokOdYmhwKP27e99tTRyZBOUs473oRcPNPdAIEcbDzCy3JzV1/JT1droz6Z2Fzqbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773330045; c=relaxed/simple;
	bh=9U79XuSEDogMsEE6qxccDeqtvH3bBahfO34fvcv/Lvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0XfvHPBhqDvgamWbJamVGTPMdggkvqgB60TFDgfLuJQdaVVjbbhSZiqWyXWcdZbhfhv8QvL0mVeRSBIkza1vBAWwOFDwp8ASoCxJOsJrYRksrBfrFr7jxEqYbmqvqHrMXiKTKUfBv4s8GRh7Xiv0Vvv6A6SA7eLFn9YTIbEFOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6o4XeRg; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6o4XeRg"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899ed41208fso4124186d6.1
        for <regressions@lists.linux.dev>; Thu, 12 Mar 2026 08:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773330043; cv=none;
        d=google.com; s=arc-20240605;
        b=cNtJ6BKRL/AQU2lTY1gY31k+1UC+efkDc/WNzNXI9915klc2Liw1YWl0Osm0CRgNrv
         IHkMriMzfl97IWodzbonWzrYZBGymxoHymgMqQkqp91q3agaF59FPDVYahO8rlKLFUsZ
         mcHcctz0op1rcxKETZ7SqeXiKQo8gos0R3XHP/HOwV6szK9ryPDSx3o167Mmxaf5UONL
         xdKbszEEqsYUfhGRWT0XOlL3eq7EieQDK8RgP4xRIVDalfslku2M94bKmATBf+POvKHx
         djeExEadqRtal19SnklkWXcD1Ee2Ibafvm7nbOYoQ+lqcKcJixFj0UivscfuoD+oNOV4
         vq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pTMqddxceH06ae4/6PYanD/2oexQ8xHGkM95DOK/9Sw=;
        fh=7n7NTZpsMo3X+TRZi6dgu+BDS4s4qYdtawb04U8lIvI=;
        b=dBd1vFFD+F1IDmwrTGu9eaN6sacKhnMsTWAwlV/0m3f5An+igL5adZa27yo/2JCQJ4
         FkuK7+IhTiTT9lKcrUMT5eLeUPuBuLm3pdui0XUq5/GSLF1DkChwMMmb59klA5COPvmn
         OMOa8LAZ2sHYxcuD3P10yuWDj77REgFJhIEoBsxct/lWenk1fXZLV+6IHbLRrSUfYK2n
         PT2pdvCzncSXFrrQJnlpWYZErrlIJtG6l+BN6vRpHJMt3/Y0Iom2cEZRmgBabGW9d7Kz
         0IsC0sblIkjamq6XXy1X72C8iSJQr4awJ2g2dNQz9jm+XgTctP62gW1L/Y3ZvmHWpfRP
         XArg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773330043; x=1773934843; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTMqddxceH06ae4/6PYanD/2oexQ8xHGkM95DOK/9Sw=;
        b=k6o4XeRgKv+mR/r+scOUiub88JEJU83dTkCpgCfq1Q5c831h75mIoFSLOr3pFqgQhC
         2YcGtRUdDZJjoeGJCf8qV1GHtE/HTfTSnkp3RliULT0jd7fsu22NXulA11gX+ndkWTnZ
         gZZbpqhDpBecFe4lGZcDttppufqadjaqvNBga7QMO0QX2K+WyoRIVxMkEtl5OS4Vk1xA
         a7T58nFYEyMNWp30tNcjibLVBYvH/E6Bih5+d4UzpjQVnOjG2uYH06xM3f/09gjC4mSq
         cXfD7npTOtNfHk8Ek9+c12pGVpbK5BVU/+tL8SR8XLNKpjmygfWKDaf4bi8B8//jamFq
         8udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330043; x=1773934843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTMqddxceH06ae4/6PYanD/2oexQ8xHGkM95DOK/9Sw=;
        b=nAg6zHXPhKoVEFTp1hP2dCUEV2KAgLZsx95xjUV9Jk0oD9uCFVyB0Z++5iR1oZqhHd
         HGrZ5HTebHXdJ2hQqxvNaTp6hUfWD4tBDMg6L+Mq1/Rts8SGv0vmJHjKGdz3wHBfH/bS
         lcQsodP7flwfxAW6VNZWHI6hxSl1gQPdos6nM/j12Bjfo3bYEovZrdCCW7KUDENuy3mV
         NFOvzPgT1j5QqZlqBvGcQ1o7pDsQlDoObpyePH6qGVs/YKtKxGDe2bbF4HT/MwQ3wIYk
         Hkfwvgl6UtIuWEp3P97ULkqakcJA0Z0eUwqN4wYdfd931+e70SooBc53nNXSGLt+fO+B
         BUOw==
X-Forwarded-Encrypted: i=1; AJvYcCV8wwJKRcfJUCgsHmSdY9B0o/S592TfCmizaO499+COhw3ALXqgjiHa3R6sH62iCZw/OtyntmnkYFfNgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxDfCZ34jn1GYzELLW/lWTbV0u38jPbimU2D6kvCCddH22tO4P
	6CrbBUWUVtxhU1VZY/QD0pV7Yk//XXtHTkQsSVUWPvJPeohpqqLgBoy3LPvADYWJeBEzYMDAGhG
	oCskhOZ08sdIMKHAD+l/tGOR7QAqOT+s=
X-Gm-Gg: ATEYQzzY689UCPpAvZFrc5reCA2Skzpa5UmzHJQnoB+wDbDBmez5ai4ZyNvnuggALTQ
	h/kAiQltIaQHe7nNz5XHX63waql1WoKMSV1fzrc6HkZL0T+V7r1natzpl77U750zE9Fz0/kYO2u
	57FCDZ9EVuhzmELrRYfrWK/w4qPY8HewCnNmRjvafbIc/kaGUOHCpMj+qooZQANIYmJOeq8jUhM
	LjaIt5wvWQMGTm8mQ4tgQhSzBr927+R7+L+72h6sxvheeGHgm0ockRafG8gbxBy9d29Wd0c6DrW
	PuC7bFkCroYZWFIcCD5UrhIUuwjvcl4t/HxekpC3l3dbGRlHXrtgraIs+MmMdDeOk5Q5o0/VQm7
	Hg4+D2HhehRgeDIZtLAOgCibAD4uVpQRA3WXK4IHQvuFvXmgPX4wNbe7Wpa3do72yU488CVgDxM
	x8dK/ncTjRhDjywn1/nuF8wQ==
X-Received: by 2002:ad4:5ca2:0:b0:899:fd80:f79f with SMTP id
 6a1803df08f44-89a81dde5abmr2633836d6.23.1773330042750; Thu, 12 Mar 2026
 08:40:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260310235642.6d9798f4@plasteblaster> <c66p7dr6vlujvnwczbnrmqx7monkdgdnm4rwewm76aibn7jza3@d3uik74dei72>
 <CANT5p=q2Lv4pSvEm5EWcM73b7NZsbt1kYEFJtjaAZRS6Gz_OjQ@mail.gmail.com> <42utcrhajix2x3feckj7ap373osq65sgfz6ximnaj4rasszret@ymhf44ddz2wh>
In-Reply-To: <42utcrhajix2x3feckj7ap373osq65sgfz6ximnaj4rasszret@ymhf44ddz2wh>
From: Steve French <smfrench@gmail.com>
Date: Thu, 12 Mar 2026 10:40:30 -0500
X-Gm-Features: AaiRm52ah7-n07dCG73FeRnFD_pUuk-pLBG0LIJHG-WBVhN-iBaM9Rrd33zCEk0
Message-ID: <CAH2r5msUyFejEbDafcWzSf5oLE3pJCdreaQTm2dxbqfmGtqCRQ@mail.gmail.com>
Subject: Re: [REGRESSION] failure to reconnect on SMB server restart with
 custom TCP port (not 445): Host is down (at least since 6.6.95)
To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, 
	"Dr. Thomas Orgis" <thomas.orgis@uni-hamburg.de>, Steve French <sfrench@samba.org>, 
	linux-cifs@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 10:10=E2=80=AFAM Henrique Carvalho
<henrique.carvalho@suse.com> wrote:
>
> On Thu, Mar 12, 2026 at 05:44:58AM +0530, Shyam Prasad N wrote:
> > On Wed, Mar 11, 2026 at 7:37=E2=80=AFAM Henrique Carvalho
> > <henrique.carvalho@suse.com> wrote:
> > >
> > > On Tue, Mar 10, 2026 at 11:56:42PM +0100, Dr. Thomas Orgis wrote:
> > > > Dear Linux-CIFS maintainer(s),
> > > >
> > > > I stumbled upon a regression in the Linux cifs/smb3 client when wor=
king
> > > > with a smbd using a non-standard port. I am not the first to note t=
his, see
> > > >
> > > >       https://bbs.archlinux.org/viewtopic.php?id=3D306712
> > > >
> > > > which is a report from mid last year, indicating the problem someti=
me
> > > > after Linux 6.6.72. It is a very simple issue, where details of the
> > > > kernel builds or mount setup don't seem to matter much: Older kerne=
ls
> > > > reconnect to a SMB server that was restarted (old processes killed =
and
> > > > replaced), newer kernels do not and just have a defunct mount.
> > > >
> > > > I reproduced this in our HPC cluster environment with such smb.conf=
 on
> > > > the server side
> > > >
> > > > [global]
> > > > security =3D user
> > > > map to guest =3D Bad Password
> > > > server role =3D standalone server
> > > > smb ports =3D 1445
> > > >
> > > > [public]
> > > > path =3D /some/path
> > > > guest ok =3D yes
> > > > read only =3D yes
> > > >
> > > > and such a mount command on the client:
> > > >
> > > > mount -t smb3 -o port=3D1445,user=3Dguest,password=3Dfoo //server/p=
ublic dir
> > > >
> > > > When I kill and re-start smbd on the server, older client kernels
> > > > reconnect and continue to return listings and files from the share,
> > > > while newer kernels give this:
> > > >
> > >
> > > My suspicion is that the regression was introduced by:
> > >
> > >     5713127da855 ("cifs: update dstaddr whenever channel iface is upd=
ated")
> > >
> > > That change causes parse_server_interfaces() -- should this be runnin=
g
> > > without multichannel mount option? -- to overwrite the port stored in
> > > server->dstaddr with CIFS_PORT.
> > >
> > > The attached patch preserves the existing port from server->dstaddr.
> > >
> > > Note that I have not yet tested this patch or confirmed the regressio=
n
> > > with a bisect. If you can't, I will try to do that tomorrow.
> > >
> > > --
> > > Henrique
> > > SUSE Labs
> >
> > Hi Henrique,
> >
> > AFAIK, the ignoring of port from the results was by design and part of
> > the original code back in 2018:
> > CIFS: parse and store info on iface queries
> >
> > Also, the comment in the code just above says why this is so.
> > [MS-SMB2] 2.2.32.5.1.1 Clients MUST ignore these
> >
> > I checked this section and it says:
> > Port (2 bytes): This field MUST NOT be used and MUST be reserved. The
> > server SHOULD set this field to zero, and the client MUST ignore it on
> > receipt.
> >
> > Based on the conversations here, it looks like smbd ignores this.
> >
> > I think the right fix would be to make sure that
> > cifs_chan_update_iface gets called only for secondary channels. That
> > way, it will not get called for single channel scenarios.
>
> Sure, I read the comment in the code and the MS-SMB2 protocol. The
> protocol states that "client MUST ignore [Port] on receipt". Since we
> are not using p->Port, I don't see how this is a protocol violation.

Agree. Looks harmless

> We're using the port that was selected on mount and copied over to
> server->dstaddr, so that when server->dstaddr is overwridden,
> server->dstaddr keeps the user selected port.
>
> Now, even if we only fix that for primary channels, the secondary
> channels will still get the wrong port when they are overwridden, no? So
> I don't see how that fixes the issue.
>
> Apologies if I'm missing something.
>
> Best regards,
>
> --
> Henrique
> SUSE Labs
>


--=20
Thanks,

Steve
