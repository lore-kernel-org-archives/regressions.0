Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0DE1EB9F3
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530972; cv=none; b=qCXOMhKixpKLtSqCmDG63XKuaWng95UuS8YMAuROPrzj+CNIDRc8NTy6+/HF2ihpKwgdVZQ+7mil63h3/q4KGuuKZ3qijbBR4EFxt1avqZVQpugGd0h94mvZU+ZisA8wYjOl+IHyaXNTzH1bKN1RNukUXhotiio97zmrgpnXmVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530972; c=relaxed/simple;
	bh=P7M6hK2QGGokXWddLX6ahenELm3JSyYN9TJnSQFDCtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Peludkex7JW9pjoOfp8fIcgYULEZd5HukqDS3gcR1Lx6xGQYTEZUlWh7zDksJmnYH5MdawQCjFJZ3MROOJzXz9pT0x+2UY97b4wKomyLXvVXawZqbfNxmaZsYqroPBk8B/VWSOpyk944awFh/A9YOvcgIh0Ijv7cdIyeyc7cOig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVSr5Tsu; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVSr5Tsu"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2fb3110b964so41541691fa.1
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729530969; x=1730135769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjIFzIpBZflzITDVXrEWci55i0lCxZNwkLn1/JkamZk=;
        b=eVSr5TsuKDWlB/tgcmCX6xlYgzGbva/KlsRchFUFsGQYGupYO5hIOoFc9saJZBKbYf
         fF9JnFEuuUYE85GQZbXj166Oa1gGl6WeR7x68s1Wa2756IYBvsC3Jbb76cNmc0incElr
         +9UXnWzDxuy+LTt38Q/M7l9k4qsHo1u7ooV26XcNaYqB2SndbX1/5tMvWHcWOMyh+/l+
         L5zsxaiCPZzVzBKl5ldvkcdzbCOTXSr+pwPAYk87bkp0lOJoUGxKXAlXafDwbD7LLLGI
         OJ/ZRt5+WvOnXHu+g6Z4zmn6+0adM2Wk1vnuuwp3pxlEafS4ThS8YWTUbi7PZBoiEDq8
         Qnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530969; x=1730135769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjIFzIpBZflzITDVXrEWci55i0lCxZNwkLn1/JkamZk=;
        b=l+NX7TuWdgmviM0GNwTGYhnOi555bMubzExOopwx0h/St4lEJhwZT+v65m2ppzxImY
         NDXWyDOR7fZR2xfhHZypdghXsPwhz8+NQid3skI9klPglGd0I97gh13uy36Vht5H3Cys
         QLSmuzHh9qL3TBgCglcWpq7ZeHZyBVpu6hG0dHVJCnWDngIm8zlnz/4I0EUudB2XjOiB
         Xz3t3kHA8c4MtxpSL048FmzI36kkdO1YjCtVCLYsFtu0DsGcltfmrdF40oiI3ypgjqcn
         njD/jUF7RimZiVQRQQRQ3X+NwSTI1LMNF+OKsgJxLNA9RYr0VjCdJrBEht6zIhAje4N2
         THUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiRnSHPEBOq1jJ9bkcuIlJ+GS80DC4/syWX9D5jEoF35CGErfuXLZWbqo05+7lQImYYDcchCuNkhKoUg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywml5Xd7j2zvoxisGMh3rrfL/2QAUbo1d8sDB5o0aeI+jA3RR/p
	YS9nrt2AzeH3kbj+fH+rY1e4HynBZ/I0oCOC15//a2I3SUBpJP/ruy0/jFRo/HdlwTRE4FDXiMe
	9eoKoiEWlvc5Lox4vNfJId872U5o=
X-Google-Smtp-Source: AGHT+IEkZ7gfcQYBcHFr2b0K8I9CQ3NUCnWQqHfvZazLDfBUdpefcdsx2PbVYbOCZnJ24Y5S7krAD7KMHWs7fkb/D9o=
X-Received: by 2002:a2e:a58a:0:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2fb82eaee9bmr53020881fa.23.1729530968390; Mon, 21 Oct 2024
 10:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016204258.821965-1-luiz.dentz@gmail.com> <4e1977ca-6166-4891-965e-34a6f319035f@leemhuis.info>
 <be9ead27-bd67-49a8-a311-a7ce5e82d4fa@redhat.com>
In-Reply-To: <be9ead27-bd67-49a8-a311-a7ce5e82d4fa@redhat.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 21 Oct 2024 13:15:55 -0400
Message-ID: <CABBYNZKWSqpn9whkYGVm49B472JsGpumF09fK8Nw7dWvmhrKVw@mail.gmail.com>
Subject: Re: pull request: bluetooth 2024-10-16
To: Paolo Abeni <pabeni@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, davem@davemloft.net, kuba@kernel.org, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

On Mon, Oct 21, 2024 at 11:29=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wr=
ote:
>
> On 10/18/24 07:30, Thorsten Leemhuis wrote:
> > [CCing Linus, the two other -net maintainers, and the regressions lists=
]
> >
> > On 16.10.24 22:42, Luiz Augusto von Dentz wrote:
> >> The following changes since commit 11d06f0aaef89f4cad68b92510bd9decff2=
d7b87:
> >>
> >>   net: dsa: vsc73xx: fix reception from VLAN-unaware bridges (2024-10-=
15 18:41:52 -0700)
> >>
> >> are available in the Git repository at:
> >>
> >>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.gi=
t tags/for-net-2024-10-16
> >
> > FWIW, from my point of view it would be nice if these changes could mak=
e
> > it to mainline this week. I know, they missed the weekly -net merge,
> > despite the quoted PR being sent on Wednesday (I assume it was too late
> > in the day).
>
> The net PR is prepared and sent on Thursday morning - either European
> Time or West Cost, depending on who actually is cooking it.
>
> Wednesday is usually/nearly always a good time for PR to be send on
> netdev to land into the next 'net' PR, but due to some unfortunate
> scheduling, we are lagging behind the netdev ML traffic - to the point
> that I'm processing this email only now.
>
> The limited capacity will last for all the current week, but we should
> come back to speed from the next one.

Thanks for the feedback, I will try to get the bluetooth tree PR done
on Wednesday (weekly) morning (East Coast) then.

>
> Cheers,
>
> Paolo
>


--=20
Luiz Augusto von Dentz
