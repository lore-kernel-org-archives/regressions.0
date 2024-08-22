Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258581C93D7
	for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 13:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724331877; cv=none; b=ZBB2D/iTmvSECYs7XUSV1G/KNWgeQmSoTdX5yr78lMl3ida4R6Mtfn7Zd/3obV8efm1f+17aJJZuNLIzxXN0votC7wWJxsYQWjN+mUOZYnb5uaxX1U5WRSCtsV07O9iVQzdhHx8PIjdTG035IdOknge76wpr4Bm3dCvQO+LRP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724331877; c=relaxed/simple;
	bh=D+1WQ68JOORTtyd+QfOGQg+vLGFePAHV2FySa5bKN30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7CLg/A85+4sgReoaBd8rr5ma28bRSMNUvr39rTdy8ZgWueDhaJon4CWxjWeKwU1ZkZzCWSC7nJjh5V53N7TINdrTvdx+XVqlKGMyi4Hu9BudmWfMIzuYQXKjfsxrUVQc646V0tfGOU4JWVQ7o+NUfGQklOkGW96z9tp/EmDWmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=E4KeN4fU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="E4KeN4fU"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8696e9bd24so48448866b.0
        for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 06:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724331874; x=1724936674; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLb82jSgV/hhu3fWmDhL9/8Eb0IU1BoT2mlOlFTBoFw=;
        b=E4KeN4fUqahHQRK1elcd9hqG6Y1Eo0w6RZuOGAafpNVomCUgiKix2YcaidmvDI1PmP
         8f1mTPD7+cpT+d0/LutIDp0ahfGOYvdhVs4LuVKUPhMStABMKz/Mf8JjdLLXPIYUprMK
         JBSVIpj6LWdR7S7wu+iWlrR6TG+iA3NWFIzLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724331874; x=1724936674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLb82jSgV/hhu3fWmDhL9/8Eb0IU1BoT2mlOlFTBoFw=;
        b=LjAEExtmrUpix2lIO2DUcYB75ii9iQXMRSv+7EnFu2gUr25yyJ3HIUJetqW6xdYjry
         TBnOyBzLQXOFnpUjnX7gtJhUhODiI+s4sW9dIQh+/kpK9UnbWrr5ndJqIeIuKtEGVBX6
         HnallAXDJL87+gmeQi02R+bYvZuldAaMXSaBXvP8vTh1hrDj45Dx3JPRP4y4r3AbMK4V
         W8yApPa2S+3OOzaA5B3/t5ua6Sz67o6lKLP8KB7N6km2abba1Oo84Txeq2rp8GAGJtH+
         j7OOnRKSV+Ax/le56fYEovNk1p7T3iFWamxehcjuDEyp3OzfmPybS20dVUxHsleASx3v
         VymA==
X-Forwarded-Encrypted: i=1; AJvYcCW48KKCB/B7kXm+Vzv0RkpCvcXqrmHFbA3yRfyqun6TfAQIAsJzJ3jJODkDhO9DTg2QrorgwlhYE2lLGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxrPvpgAXtkRTfcRtImCN8GklxNrUQ+H+jn5aAoLGqdzxNIxti
	axlu/QEOujEaRfuHEEbI+Ac+eZNJNarYnf+0HUxjtRiP1f7+IdGu1i3Lgz/4KsDujTzmpDoFBJz
	2yDc7Lloo9NOuere0D+YZhUmwuejyHPTPsr9s9w==
X-Google-Smtp-Source: AGHT+IGsRxUoVr4muJ/9PbrSNtMaKnDsQiFUFPrNJQ/sKNunGXBx6l2Y8CIg9xTkIaYzflu0CGRm420SfEdBXu4IJ5A=
X-Received: by 2002:a17:907:2da2:b0:a7a:bae8:f297 with SMTP id
 a640c23a62f3a-a866f2a0205mr473759766b.15.1724331874075; Thu, 22 Aug 2024
 06:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
 <ZrY97Pq9xM-fFhU2@casper.infradead.org> <5b54cb7e5bfdd5439c3a431d4f86ad20c9b22e76.camel@bitron.ch>
 <ZreDcghI8t_1iXzQ@casper.infradead.org>
In-Reply-To: <ZreDcghI8t_1iXzQ@casper.infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 22 Aug 2024 15:04:22 +0200
Message-ID: <CAJfpegvVc_bZbL1bjcEbEh4+WU=XVS94NMyBPKbcHzAzyxM6_Q@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: copy_file_range() fails with EIO
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>, 
	linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 10 Aug 2024 at 17:12, Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sat, Aug 10, 2024 at 07:56:21AM +0200, J=C3=BCrg Billeter wrote:
> > Thanks for the quick response.
>
> Thanks for the quick test!
>
> > On Fri, 2024-08-09 at 17:03 +0100, Matthew Wilcox wrote:
> > > Do you have CONFIG_DEBUG_VM enabled?  There are some debugging assert=
s
> > > which that will enable that might indicate a problem.
> >
> > With CONFIG_DEBUG_VM enabled, I get:
> >
> > page: refcount:2 mapcount:0 mapping:00000000b2c30835 index:0x0 pfn:0x12=
a113
> > memcg:ffff9d8e3a660800
> > aops:0xffffffff8a056820 ino:21 dentry name:"bash"
> > flags: 0x24000000000022d(locked|referenced|uptodate|lru|workingset|node=
=3D0|zone=3D2)
> > raw: 024000000000022d ffffd9ce04a827c8 ffffd9ce04a84508 ffff9d8e0bbc99f=
0
> > raw: 0000000000000000 0000000000000000 00000002ffffffff ffff9d8e3a66080=
0
> > page dumped because: VM_BUG_ON_FOLIO(folio_test_uptodate(folio))
>
> That's what I suspected was going wrong -- we're trying to end a read on
> a folio that is already uptodate.  Miklos, what the hell is FUSE doing
> here?

Ah, this is the fancy page cache replacement done in fuse_try_move_page().

I understand how this triggers VM_BUG_ON_FOLIO() in folio_end_read().

What I don't understand is how this results in the -EIO that J=C3=BCrg repo=
rted.

Thanks,
Miklos
