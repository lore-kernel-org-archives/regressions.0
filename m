Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED31348C5B
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198293; cv=pass; b=OVJ/9S6cY3bg1lzLjoJhGV6x+jIjnll+giEM0NtUqzLE4ZGCxDr4DzcKHrPgK89WowBkpqD9pk3WcJTXcD3eaVQP9MnX0a5aHWdDFQqTm0y3l080/WCqo0CG2/tqRNLzy8340nrYWuDvvTWW51Ul9TWvWoOnw0pVw+zQOzBVpKg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198293; c=relaxed/simple;
	bh=TPvCxuHJtKVGhQ/GlHUaH8cPjA9QMgDJQzp3fZRPCXg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jw0R02chdlU48CS0Ay18ei8Bqn1bayrlPl/sZJqzAHXFux+z89MEr6nOovt3tlsSrInfmLA2/ClqsuOLP4WTz18Zo6KQed6rFWDSyZn2ZGmwRiZh8VVCYISY8PYJAO4DJ9G3QhzEOwWwbMU/SlxWy9zlRTQgnuCqBR64snd0JZ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fp3WyKCi; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fp3WyKCi"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-65890a6ca20so3956625d50.0
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 06:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779198291; cv=none;
        d=google.com; s=arc-20240605;
        b=KuOvfNWB2Akex6eb5B3tI6tc/rWQtQ9zJV5lCbu9cPcaoLA8xPF8Yv+bRQwNm66Coh
         F52/e0zrN/yQh1j5CjiMo1E264Xxn3WGNyKbgNoUpWkR/BOec5acp/7m0ALyJQv1bRMW
         bLmal/fvoJfaSvQUsi7lMfCnEcBGWm7nM95+JQ17XOYjRJU4Hz/WUr7kM9d+wy21WwKd
         eFojSl1gx07zFUckUN+1xuNt7C2o5jaNni/rrnABLIL/ChL+d+GiFjuNlnXM+iwA7u/n
         ZC3myzziSVUzm7fDNwzb4YFz4AH0XCoSrfQVSmvymFumKoLo5Nz4pWmP07dli99+bOag
         8rTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8vQ2huze1xO1NqJdBFnf6nbs9kGsrUpnagEQxYLNrLw=;
        fh=kaoC+xJ2sOoCP6M0zJKd17my/fOQBMNUxrEAfDUl9nk=;
        b=J1TJrxUCgp8m6lPLi14r7E2j5XMR9Uc1JLZ7NxvglFSr/G4mjoAo5L4iVtP/0BC3kd
         tb3qRzew4VC+moWL7OS3qWb42gkaLhlBEvYhLPN2pI5HCGAznea0AGSl+OEQxlp0oEam
         TctYPLiPuJq5PgM7uTzTt9lmFwvQhL9WItroxuEcDWI9oD5DE7YnYoUfI4hDNbQZ9SUK
         szgmi475sCeL86+wyefPTknCnlYQc0IGB0hSQcuaYhpvtvpCH9t2TnCAWGqWDz3HbxHp
         W/8hiqWiVSbGZRs7jCrBOYkUuPXzNV8IizEXaoPKlK5pxFIIaSS5ErhvURNyYkJNumT+
         J5ZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779198291; x=1779803091; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vQ2huze1xO1NqJdBFnf6nbs9kGsrUpnagEQxYLNrLw=;
        b=Fp3WyKCiwIKilR23aCHQC7PNYSs8B68Bjh+zOOjWVVismLmAd2gNbVQdXyPE973pNc
         u/6MhlVKG4RHV7GJ4gK2AqRpQ1ztA7HiBYlc0svJ1oUvd6vyP7pK/W++wtdOSdF91add
         R5v+wpO9ij8HcOoGPcRMsCos2zO81ZB8n2j4kNmyFz1qI/b0mMsWXiCSKM0nwAFe3QtH
         k9oI89QxemU6+EMXCTd0WiFpdbHb0uqf3j7nS0UuzREUVz2OqglQctJlbshOIBrHNy4x
         +L+nWAW3Pq1Oqp4pYo1RYMJp5PzDfPccGoPUXhVpvLVyanXbc4WeJADh+07Qvm9QP7Rk
         R+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198291; x=1779803091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8vQ2huze1xO1NqJdBFnf6nbs9kGsrUpnagEQxYLNrLw=;
        b=FysNvOeYLFFNDV6UC5oVBaQ9ysAjsc6ABhDHCAyr475DC8r/kOt6NfBjTlR/KnL4HI
         hUjrHq0Qcg/qlAwYKrKo6me+KT6f6QonscRQbE+7dlAU0Pbn2/ICSjFMoK1gMB/Uudgu
         vUliioD8cKEZvSN+ed7IA3N+5nxWry0rUaUlAGGEZxi0hjpv83I89ZoW6l/jEd4fS9u2
         YgPxqAY2JquirPCnKSSnrCY2/80QF5utDRut3N3MThzAxvMBmzI6dUDygF8JVpw+uI1r
         hvarm/6yoyfYU/c6eanI/5z9BsI9KpglEIRROvJJ98XuT8zvJS1BvHXgSEPydeKoINxK
         4v7g==
X-Forwarded-Encrypted: i=1; AFNElJ9Tnjb40AF0E0sI+QwZXkXO9PFszfo2Mb97Y3HbDCgQEZ8Ja2pe8lz5vA0bj7SdC33t/39X6jADX84S1w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyi7RsDXP4Y3nYEF0RV2YFBnhSGbfvVFTYPAFo2sWcRlOP3JEIl
	JjTUF1+RkGDUsrqLe8VX45CQ3UXw2BQj1Aa961rliyB4SKn3nYlqlqTvmu9Fkde+CCFTyMB4ic4
	X1sb6UQ2Kqwa2PDxoj7KWXODenze4IvM=
X-Gm-Gg: Acq92OFMzBAFTawKaqkqdfJNVjm/FafL6YA4sf12EZOl9aSmkbDNC+d1+W2uYbR9Lcy
	HzdJvF9tgYP6SMYddFhgq12Tzr/jP2zUJYIB+ro05SD8K+fNvO7rhMJSMDSchmffaQWzqRHdFlA
	RtVk1t9pK7cbgVoMiHudacd52fml7+HFCcbwoZW1Wx80dN1NavL4OX3vfV6esqLTH/YOnYVkPH/
	QMcelanw3LxK1u4eAnFb8A2c5XoQ7xwQ+tlhkDDMvh956XFIbVCRaU3V5yDs5GA0nEXRuQGKlEs
	3eG2VlcfbavZBYGA6UIRijgaVJ/NvKTScxgBeD+dODoTGt8lNPDfJ9iQT6V/N2IN7rWtdg==
X-Received: by 2002:a05:690e:1586:10b0:65c:17fe:6d49 with SMTP id
 956f58d0204a3-65e2287ddbamr15415688d50.61.1779198291234; Tue, 19 May 2026
 06:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514172340.1515042-1-luiz.dentz@gmail.com>
 <f5cf1c30-48a4-4102-ae00-b74cf02e639e@leemhuis.info> <4946f5f3-b7e2-4949-89f7-6427015027c6@leemhuis.info>
 <2026051954-revision-sierra-6bb4@gregkh> <eb5301f9-3133-4fe3-b358-61f14d1ffa5b@leemhuis.info>
 <2026051909-impurity-nemesis-2f65@gregkh>
In-Reply-To: <2026051909-impurity-nemesis-2f65@gregkh>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 19 May 2026 09:44:39 -0400
X-Gm-Features: AVHnY4J8lmhWqH_MENNxHDU5i3eOmFVjrJt3J47QyY0UJsMFJDc4Qg43-D2Njck
Message-ID: <CABBYNZKKbTXc-okp9P2OncMYXHX9C1XC+pRC7XWOhv-8nPNZ5A@mail.gmail.com>
Subject: Re: [GIT PULL] bluetooth 2026-05-14
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Tue, May 19, 2026 at 8:07=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Tue, May 19, 2026 at 12:53:49PM +0200, Thorsten Leemhuis wrote:
> > On 5/19/26 12:30, Greg KH wrote:
> > > On Tue, May 19, 2026 at 09:04:38AM +0200, Thorsten Leemhuis wrote:
> > >> On 5/15/26 17:10, Thorsten Leemhuis wrote:
> > >>> On 5/14/26 19:23, Luiz Augusto von Dentz wrote:
> > >>>
> > >>>> The following changes since commit c78bdba7b9666020c0832150a4fc4c0=
aebc7c6ac:
> > >>>>   net: phy: DP83TC811: add reading of abilities (2026-05-14 15:17:=
12 +0200)
> > >>>>
> > >>>> are available in the Git repository at:
> > >>>>
> > >>>>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoot=
h.git tags/for-net-2026-05-14
> > >>>>
> > >>>> for you to fetch changes up to 375ba7484132662a4a8c7547d088fb6275c=
00282:
> > >>>>
> > >>>>   Bluetooth: hci_qca: Convert timeout from jiffies to ms (2026-05-=
14 09:58:08 -0400)
> > >>>
> > >>> It seems this PR sadly came too late for this week's net PR to main=
line
> > >>> that was merged yesterday.
> > >>>
> > >>> TWIMC, from my point of view, it would be great if we somehow could
> > >>> still get the changes from this PR or at least the btmtk fix it
> > >>> contains[1] to mainline this week before -rc4, as it is fixing a
> > >>> regression known since 2026-04-24 that at least five people encount=
ered
> > >>> with mainline since -rc3 due to 634a4408c0615c ("Bluetooth: btmtk:
> > >>> validate WMT event SKB length before struct access") [006b9943b982 =
in
> > >>> -next].
> > >>
> > >> Greg, Sasha, that [1] fix I was talking about now reached -next as
> > >> 162b1adeb057d2 ("Bluetooth: btmtk: accept too short WMT FUNC_CTRL
> > >> events") and will likely hit mainline on Thursday or so with the wee=
kly
> > >> -net PR to -mainline. If that's good enough for you, I'd say it woul=
d be
> > >> good to pick this up for the next round of stable kernels.
> > >
> > > That "Fixes:" tag is referring to something that is also not in any
> > > tree, but that commit does have a cc: stable in it.  So do we need bo=
th
> > > of these:
> >
> > Valid question, as yes, there is a slight mixup here:
> >
> > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB length before=
 struct access")
> >
> > That is already in v7.0.7, v6.18.30, v6.12.88, as 041e88fb0c08 is the
> > -next commit-id for mainline commit-id 634a4408c0615c ("Bluetooth:
> > btmtk: validate WMT event SKB length before struct access") -- the one
> > that is causing the regression that I want to get fixed. So we now only
> > need:
> >
> > > 162b1adeb057 ("Bluetooth: btmtk: accept too short WMT FUNC_CTRL event=
s")
>
> Ok, but that "Fixes:" tag pointing to an invalid commit is going to be a
> nightmare to track over time, ugh.

Hmm, did we get the wrong hash or something? Usually, that would show
up in the verify-fixes.sh, but perhaps it didn't capture it this time
for some reason, perhaps I'm running an outdated version or something
similar.

I will try making the Bluetooth CI run the verify-fixes.sh to detect
this sort of issue early on.

> I'll go queue this up now, thanks.
>
> greg k-h



--=20
Luiz Augusto von Dentz
