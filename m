Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6976036
	for <regressions@lists.linux.dev>; Wed, 16 Oct 2024 01:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729041792; cv=none; b=R2GPmSu1sg9eEgABZS/CYMAIKHRyjNO/o1TwOpRMBxe9S7IGf1I3++rrMObWPD1qYryH4g79+tqS44K1okPbV6jCqJ1ALWCOU+7fQ8DI8KzHXHTbaYPrke3EwHClsNOpdcdv64Mgc26Ps4OOgnvYdk0jFzIYtbmQl/jFlCPFoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729041792; c=relaxed/simple;
	bh=aKMOa2lsMcZ+PzeFhDC9/s5MDDTvDylmgOWrFIZX/mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Txuxy3JXTv8qEI6f2/2VcELHqX/Q9yAUsLdCErN3YQ+FU48Pw7hFuox9uh0vXFGf+HoDd2mU/ArURUHY3vkTToUt4xl6xiRfBkSOEqXDgYyFSiLlmueeskkTr4wqi5shbcQHT7G6nWRZbO4S2gdhroxDr4vrc/rxBNenApLQ4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BMX/PGns; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BMX/PGns"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a86e9db75b9so865839166b.1
        for <regressions@lists.linux.dev>; Tue, 15 Oct 2024 18:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729041788; x=1729646588; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKMOa2lsMcZ+PzeFhDC9/s5MDDTvDylmgOWrFIZX/mc=;
        b=BMX/PGns8R70tscu/Y7bcsY4pXtjsiDR/ERw1E0hEjMyQinPX1DEi8BBACxKviOzYY
         Rtn7HKpkpiqZ8B8XbZygYUAbZtudRsJGC+WlzvdMLMH1oLSzcIcqjuG/7bUlPylHJqti
         4yQxbFhUgtLcwGlnhg0qvyuzlee8XT00j/bLvQxxQEMuWNrDbBWllAb2A+Obtl776Wgw
         WzETtXl/iaLW5bAmrxVhiY5SM43UL2Rh8HxJwd2fBNuzzSWqwfqrpxJ+z4e6yGKrgLyZ
         BjlF0XDUYPN/4oRdxfaRpoKmxJR/mFf5016o0WbwE+4BU/RW8jagpg5V1nVonT4LvPma
         Dl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729041788; x=1729646588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKMOa2lsMcZ+PzeFhDC9/s5MDDTvDylmgOWrFIZX/mc=;
        b=uhnX997xyMf7rGoX710muCRckniqYmVumspg10d2Lm4vvn3+zkFsxOoTqNa9W5Ecjs
         jipqKOAG+tIyZ5E8sHSQuToCH/TbzmYyiGZzhOHlweElhbHTGzwjLuO8fJGyRbNbcDGi
         egpoiNtJ9Z7BlYSyEgZ59EEs7TyQoWcp0g8tGPnIZvOjGIDQ/6UXUpyVqIKHuKppT5V/
         hNCY7kA4RItXbjyuhJat57XDITooJNKpcA072zUkOEzhbdQZRQaIrHD2HVdMGwUrUUEN
         K29GlFB9wZtowRXKh/kAj7oMGPD85OnafIou+8uMQq1upzunFzFJGHyJIvGUMHBtZEgV
         zWhw==
X-Forwarded-Encrypted: i=1; AJvYcCV9/2t+309S64QOueBMydNPX5ObfGlwd2Yqjz2Bl09WP41SxWzCdBO10s6FJa2Vl6xb233NVoyk3e3yxg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjbuESG/CtoOl5LNXecFRmHzPhRKHjzXOXQ8LIKvdLUl8RbHpI
	GkBh0cBPT/33TdqKgfMAoBMJG3+7b5Y/GnsozmqiI9SWMLcg4nvrf6WJ1Jqcb+DxPeWUNu0yfFy
	0YsNFxi0iKEFnOLX29pL+R9Fidj2ylnhP8qo=
X-Google-Smtp-Source: AGHT+IHdkfklJ4F1OwuM1/1DqBmbkhdk3WE3vsIugWlT33b5VzThcJq7LfO9xnbbLXiMKZS361OAmCHXw1jqbZb5Hjo=
X-Received: by 2002:a17:907:9709:b0:a9a:4d1:460 with SMTP id
 a640c23a62f3a-a9a04d10662mr910288566b.63.1729041788043; Tue, 15 Oct 2024
 18:23:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZvV6X5FPBBW7CO1f@archlinux> <3E304FB2-799D-478F-889A-CDFC1A52DCD8@toblux.com>
 <A499F119-5F0C-43FC-9058-7AB92057F9B3@toblux.com> <Zvg-mDsvvOueGpzs@archlinux>
 <202409281331.1F04259@keescook> <21D2A2BB-F442-480D-8B66-229E8C4A63D3@toblux.com>
 <Zv6BEO-1Y0oJ3krr@archlinux>
In-Reply-To: <Zv6BEO-1Y0oJ3krr@archlinux>
From: Bill Wendling <morbo@google.com>
Date: Tue, 15 Oct 2024 18:22:50 -0700
Message-ID: <CAGG=3QVecaZfoRrjToToq8=Azh8M0vQ5Q=V8dfhdBnDR8GWy5A@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in bch2_xattr_validate
To: Jan Hendrik Farr <kernel@jfarr.cc>
Cc: Thorsten Blum <thorsten.blum@toblux.com>, Kees Cook <kees@kernel.org>, kent.overstreet@linux.dev, 
	regressions@lists.linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 4:33=E2=80=AFAM Jan Hendrik Farr <kernel@jfarr.cc> w=
rote:
> On 02 11:18:57, Thorsten Blum wrote:
> > On 28. Sep 2024, at 22:34, Kees Cook <kees@kernel.org> wrote:
> > > [...]
> > >
> > > Sorry, I've been out of commission with covid. Globally disabling thi=
s
> > > macro for clang is not the right solution (way too big a hammer).
> > >
> > > Until Bill has a fix, we can revert commit
> > > 86e92eeeb23741a072fe7532db663250ff2e726a, as the problem is limited t=
o
> > > certain situations where 'counted_by' is in use.
> >
> > I already encountered two other related __counted_by() issues [1][2]
> > that are now being reverted. Would it be an option to disable it
> > globally, but only for Clang < v19 (where it looks like it'll be fixed)=
?
> >
> > Otherwise adding __counted_by() might be a slippery slope for a long
> > time and the edge cases don't seem to be that rare anymore.
> >
> > Thanks,
> > Thorsten
> >
> > [1] https://lore.kernel.org/all/20240909162725.1805-2-thorsten.blum@tob=
lux.com/
> > [2] https://lore.kernel.org/all/20240923213809.235128-2-thorsten.blum@l=
inux.dev/
>
> This issue is now fixed on the llvm main branch:
> https://github.com/llvm/llvm-project/commit/882457a2eedbe6d53161b2f78fcf7=
69fc9a93e8a
>
> So presumably this will go into 19.1.2, not sure what this means for
> distros that ship clang 18. Will they have to be notified to backport
> this?
>
FYI, Clang 19.1.2 shipped with your fix in it.

-bw
