Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AC61C9EDD
	for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724332508; cv=none; b=GFvYQk/frjRS3kZltApwK0knIgzLDba47rVsJEGakU/FL66MOtc2T+NUs0lKMXpNh51ONRd9mwT1J2nyqOEPLS4lQr2EFf2mSE5R9KBtnU2rlE+QwpDxGuZdfGu6TxyySAyc6PnjG3VxJLTCyJBiUIbZT3xCfLNG5Zu6SrP4Jes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724332508; c=relaxed/simple;
	bh=JLR5XN8uPapW+jGPHfnnP6iSyGSSHrWe2Q3eKtDUGUk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s84jI4J8nANCIUM5nKnHBBa2obhLJIwEoETlSmjKog9Qb6nePQ+aMbwHBzPNTjJLl7AL6xAaXAcQEUnF1D7ehd5IRl31D/hwaHE823dglpmIP7b0jmED7PoPmopTQX5D6/PhwcFzNbU1iBlWdceCcbOHMpAUxQAPUdT5xxFRdBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=LihhPeXV; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="LihhPeXV"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-533463f6b16so1040357e87.1
        for <regressions@lists.linux.dev>; Thu, 22 Aug 2024 06:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1724332505; x=1724937305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9KRMSVPaqZO1TNrx4pIrSfA8dcRqpzS+a6vGuAD6mU=;
        b=LihhPeXVypr9/+j3jO7z2NGUQi/8P8sO1+8bwmBlqROPY7RbNzFsfk+3wveoImqEvo
         OKrvlFAU9KsyK5w6lRXvhdHgg6BVW9Uf2HdcvEoD4mO1drbdUje+1vbXhjP6YxQf3agu
         h1gbYuZBswAOngdVQQ077mkeAVOg8bdUE8cJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724332505; x=1724937305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9KRMSVPaqZO1TNrx4pIrSfA8dcRqpzS+a6vGuAD6mU=;
        b=RbMaoO2c3Ps3nVGuYI1oi32DsNtcmVhkkP+ohS8mVP33G6sDur1rJA+kp+eFyjNYEH
         oztOz2/O44tWkNTLZGtrqQY7c3c+eCc67Ss1Tz0f6teXj4RqTMjACvf+hnCLYvoZB/Fk
         x2JMyXMpOjV8aqjZgMzbgXt95kqlSAVExr6L3P64FJtTM66DKjcTrPH/PuVxz2kt6uKH
         m+JMf5wMC7svVfjKeAqC2jrHjksCd6gjevs6GOuQqcdp4Jb1UvW07wUs7KBvsWKypl+k
         D/Vfy84h1WhkRphpYRPC1arA+nKCJBvugy2ao1v1pK/uIJRYJamXm7tc1h5lJagUCok7
         AMpg==
X-Forwarded-Encrypted: i=1; AJvYcCWvpaeatOOtEsBMgMK86HjSbIrgwvb7kDJM1dv/c4gzjRbwNk+7NuMnCjtoPqgjVF1c6+ul+ezV45SzrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0L06+FCApm9bLDaawX2c2nKZmq6h0ioXM506YqREH62ND/TdH
	WqKl6iYVAeFvHs+4ChO6zeTbPLL3XOsP1pQgcvnR8VrrPUcGPYk2IxPw6bOeZ3bCoTHuLXCgQD9
	hwWyANelbx0OkbCcZP+vA0CxTbL+EmFZKqlOxH3Jfc97LvVJ8
X-Google-Smtp-Source: AGHT+IFQu2aJ42dHK1Z1+2uPmeklOwGyLwUpaqn5jLGSzisWf/Jt2pe/jwo3NJQ6UOHcAFDcAl4kEdNp94Hdh3Dj/Xk=
X-Received: by 2002:a05:6512:3e10:b0:52c:80f6:d384 with SMTP id
 2adb3069b0e04-5334854a39cmr3726537e87.3.1724332504893; Thu, 22 Aug 2024
 06:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <792a3f54b1d528c2b056ae3c4ebaefe46bca8ef9.camel@bitron.ch>
 <ZrY97Pq9xM-fFhU2@casper.infradead.org> <5b54cb7e5bfdd5439c3a431d4f86ad20c9b22e76.camel@bitron.ch>
 <ZreDcghI8t_1iXzQ@casper.infradead.org> <CAJfpegvVc_bZbL1bjcEbEh4+WU=XVS94NMyBPKbcHzAzyxM6_Q@mail.gmail.com>
 <ea297a16508dbf8ecfa4417cc88eef95b5d697e8.camel@bitron.ch>
In-Reply-To: <ea297a16508dbf8ecfa4417cc88eef95b5d697e8.camel@bitron.ch>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 22 Aug 2024 15:14:53 +0200
Message-ID: <CAJfpegsvQLtxk-2zEqa_ZsY5J_sLd0m4XhWXn1nVoLoSs8tjrw@mail.gmail.com>
Subject: Re: [REGRESSION] fuse: copy_file_range() fails with EIO
To: =?UTF-8?Q?J=C3=BCrg_Billeter?= <j@bitron.ch>
Cc: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Aug 2024 at 15:12, J=C3=BCrg Billeter <j@bitron.ch> wrote:
>
> On Thu, 2024-08-22 at 15:04 +0200, Miklos Szeredi wrote:
> > On Sat, 10 Aug 2024 at 17:12, Matthew Wilcox <willy@infradead.org> wrot=
e:
> > > That's what I suspected was going wrong -- we're trying to end a read=
 on
> > > a folio that is already uptodate.  Miklos, what the hell is FUSE doin=
g
> > > here?
> >
> > Ah, this is the fancy page cache replacement done in
> > fuse_try_move_page().
> >
> > I understand how this triggers VM_BUG_ON_FOLIO() in folio_end_read().
> >
> > What I don't understand is how this results in the -EIO that J=C3=BCrg
> > reported.
>
> I'm not really familiar with this code but it seems `folio_end_read()`
> uses xor to update the `PG_uptodate` flag. So if it was already set, it
> will incorrectly clear the `PG_uptodate` set, which I guess triggers
> the issue.

Indeed, that would explain this.

Thanks,
Miklos
