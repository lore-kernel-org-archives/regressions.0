Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E333A039
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 15:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779205801; cv=pass; b=P/J99rVBggFdz6yoWs7OXpJp5gtTV7okUI9+02YqIVKGBzgcATxll9HVvd7WuiT317/99bKXji9h3OTzhu1j7nva5jqfsmoIVWbDzuOUoWFWq9FYir5VgaGh6Mb70hhm9A1f0HNU1ka9i9176/ZqptKnq6Mf/22Zy4AggXkFP6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779205801; c=relaxed/simple;
	bh=x/7cCwdNDXXJxtXg1SGsgN05u2+rsVMZSWA2qFFjjh0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9jcmAwa7xsVn2/4azz+diRoCyexoiBR8uLGjETnsZvqqDobf/+GL42vzHYcA1mAU3a3vE7R8ekEyglx9jTxbMb5AmmQ6ENi4ojY8fRGZ7lg9BlNcr+OqV8uHpdvYpIdmdwEVGnwh1g0f9o8xAHPIzO9KIg9UcP4FHVnI6nWM+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PEl5jYxK; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PEl5jYxK"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-65c477a3278so3957581d50.3
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 08:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779205798; cv=none;
        d=google.com; s=arc-20240605;
        b=UoBxE0uTs7OoIfAMBo6uFaMGUlPZ+FFRRAlzdtiWHEfdRear7FutgY9505BGZnL0Qj
         zqwSY2i/nkTJCMDaOtTahXp1208f+Soy9j7Skqf6Qk9O/40kATKpoSTelqfLotDpvXov
         KeLhITzI6QvWn3nI2jdUwPD5x4RMcqPMBaiR1+BxOZE7r3MBmP2wdg35u2WbCecmmisx
         dDx3ttfs0wbAjoNV91hjsHTLwH3Ed27LyzHPlYqVeRhczzwe6Vgkrc14UjUbj/Y08/Gw
         irqItkm9aE8/WUSJMzj1e26nBOv1Qqw3gsz/qct19UiR/RRHTJJcDARepUOq+Ijg5LL2
         3E4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=svXaO9Car/cL1x6P0kXNjSbwoRo/ZLSYkrf9JDZDMqE=;
        fh=E2reeA5bPjh03a1uw+Axa6tAV9XnKQ+NCAaROAOn4HM=;
        b=WMX2r1zRjun0YKsGP+m4blMQy4bG3L2lSukaIO/F+o/M6Jqgycxyu+LM0701mkQuGx
         yF3SeBStSkr5rqyGvORzpg0UyzPp/a7bA7OEVZzRtsJfZXjjp4rFY0fMoMayd8e3BFnu
         AmFs8oFOB077B4egl0WgsNlf02ywnEJmzQhueLr6/7vCkmu6h5yjtz/V3ssIBs8iyTPs
         mgfAWZd/jOvqIO3eljiWVFJSjrLR1gt9N+/m+vo5dcBrQo+mr+C1CZyDmCZLu1Kxejuj
         DUVHPtpiNqg29TlQKu5P/ZCZsGhzXNvH6ncQsgmE49rZ4Z8mHjzpxVA0DbtEqL7+Dnic
         yDjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779205798; x=1779810598; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=svXaO9Car/cL1x6P0kXNjSbwoRo/ZLSYkrf9JDZDMqE=;
        b=PEl5jYxK11LleT+altIEZqhXSQyYFBgu6TOEMFsfaH3iZHf1L1++bIRfxhCxZ4B2ET
         Ms4lbALhgx0OGOXF/lDKtLk1QfnfaqkUE05LcUfoipnkn1kPLrFed7+6wORqXrjCGBW2
         UqEzozCaK6zjSwt1W/JUR3AlKbsQ3SANGIv7XnLivhrbMsuBeF7XiBo1gMo/RRHyWLwh
         WJWdx0ECFVUC8ktZINhY/s00K1HywUCiMfmtPWFgTx+IQUgnropGFFhlqZuk1O1if8qh
         6cP+MXCerh61IDLQ1ce5RRPqc0OS/ayFfJNI/C9k7IJz+RHl7JtgwX0W6YOus+yCWe83
         T7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779205798; x=1779810598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=svXaO9Car/cL1x6P0kXNjSbwoRo/ZLSYkrf9JDZDMqE=;
        b=PiNVyvruWo+9yynhh+fubuxdbW/5P2wSrY/U+RYumhZBt2P2zhxKqNKq+kuLUorl8i
         bD7rQvjUdgpWgEFkos+f2mVWgOCdZJSTIk39f5KINuOCVLiaotHF4qS+5dRjV9qjJwzK
         hPQBxivlgTfox3QyhzCoZ/TBxuLoop2EL5a4O0srOz/ci3QzeYq7Jjyzvvl8TmOozTpo
         7JIXFjcFou7ena/7bEzEotz9UjrUAOduumEF7G2K2M2HdK1Bxh/wlk5dDvXLPe6XGkyf
         nBh+Os2VWq1CbkJvt/hnbv8NrbE/5CTd9guzKZQVa0fcfZcGfazBXZqHgO1tnX89UdqZ
         TpFw==
X-Forwarded-Encrypted: i=1; AFNElJ9PyyGjIQdEq0uuG3Gx28SiE1DCrHieThUD4+3vQUs+/MdD3WYGa3/+38GhnsRspvb91I+V3k0a4doUHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg7lnXyME7t/NV72+WHBnUynP22BoIsiZDDOCvH+gnKCjWIJq4
	ptyXoZCK6vXWD5mEc6rR3lYzC1kUSSPx1Il72QffBWW+FhFE6u7b1hzydZjuN6/TDDwoHRe1DYj
	U9BZ7AQaaq1Tp/OgIa+JlaVny1fjitK4=
X-Gm-Gg: Acq92OFXDF0lIOr13PqI7/xRtBUd0gdFOFhJmJ7N9EAJqvt7dZFM7S5mTYUa/VqfJ0e
	L3Rjqw9i6m5umWv2FPdRPqEwT+WysXzP8lMZF5nKVAYgmnZsM+QoIrI4+w4YrwXiXvlFsbUfETF
	XDE5FaF8Z8MB907edGCd6RzzrXd7a79vZux0AwGxSos6SKi35EvZt6lhGll1tDXjgCRfldbME3c
	bUWUBWEkk+AWSmuhFDgtKseZFwwrtbj1O0QiXGXK3ASU+uWtq/6kBxU/0Q01EwpnefSDBcRKCzi
	3DERXwGt/GtNQw6Tk1Y6qs69dpH5TMFIbBwA7op4Y+8KSDaOufgnYlDHv1czEqKQUIoyTg==
X-Received: by 2002:a05:690e:12cd:b0:65e:41dc:e8de with SMTP id
 956f58d0204a3-65e41dcecd9mr12441208d50.61.1779205798318; Tue, 19 May 2026
 08:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514172340.1515042-1-luiz.dentz@gmail.com>
 <f5cf1c30-48a4-4102-ae00-b74cf02e639e@leemhuis.info> <4946f5f3-b7e2-4949-89f7-6427015027c6@leemhuis.info>
 <2026051954-revision-sierra-6bb4@gregkh> <eb5301f9-3133-4fe3-b358-61f14d1ffa5b@leemhuis.info>
 <2026051909-impurity-nemesis-2f65@gregkh> <CABBYNZKKbTXc-okp9P2OncMYXHX9C1XC+pRC7XWOhv-8nPNZ5A@mail.gmail.com>
 <2026051942-uproar-drainpipe-6370@gregkh>
In-Reply-To: <2026051942-uproar-drainpipe-6370@gregkh>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 19 May 2026 11:49:47 -0400
X-Gm-Features: AVHnY4L0X8LYGYt87xzFEQmSQ0jaH-sWR5xnvms9EdsiDiaiEGK8SYnDvpGiMU0
Message-ID: <CABBYNZKzWgL3nmeA=CtN9s80LRyDiJ97aQXgvfSm9vYUBw_SpA@mail.gmail.com>
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

On Tue, May 19, 2026 at 11:19=E2=80=AFAM Greg KH <gregkh@linuxfoundation.or=
g> wrote:
>
> On Tue, May 19, 2026 at 09:44:39AM -0400, Luiz Augusto von Dentz wrote:
> > Hi Greg,
> >
> > On Tue, May 19, 2026 at 8:07=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Tue, May 19, 2026 at 12:53:49PM +0200, Thorsten Leemhuis wrote:
> > > > On 5/19/26 12:30, Greg KH wrote:
> > > > > On Tue, May 19, 2026 at 09:04:38AM +0200, Thorsten Leemhuis wrote=
:
> > > > >> On 5/15/26 17:10, Thorsten Leemhuis wrote:
> > > > >>> On 5/14/26 19:23, Luiz Augusto von Dentz wrote:
> > > > >>>
> > > > >>>> The following changes since commit c78bdba7b9666020c0832150a4f=
c4c0aebc7c6ac:
> > > > >>>>   net: phy: DP83TC811: add reading of abilities (2026-05-14 15=
:17:12 +0200)
> > > > >>>>
> > > > >>>> are available in the Git repository at:
> > > > >>>>
> > > > >>>>   git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/blue=
tooth.git tags/for-net-2026-05-14
> > > > >>>>
> > > > >>>> for you to fetch changes up to 375ba7484132662a4a8c7547d088fb6=
275c00282:
> > > > >>>>
> > > > >>>>   Bluetooth: hci_qca: Convert timeout from jiffies to ms (2026=
-05-14 09:58:08 -0400)
> > > > >>>
> > > > >>> It seems this PR sadly came too late for this week's net PR to =
mainline
> > > > >>> that was merged yesterday.
> > > > >>>
> > > > >>> TWIMC, from my point of view, it would be great if we somehow c=
ould
> > > > >>> still get the changes from this PR or at least the btmtk fix it
> > > > >>> contains[1] to mainline this week before -rc4, as it is fixing =
a
> > > > >>> regression known since 2026-04-24 that at least five people enc=
ountered
> > > > >>> with mainline since -rc3 due to 634a4408c0615c ("Bluetooth: btm=
tk:
> > > > >>> validate WMT event SKB length before struct access") [006b9943b=
982 in
> > > > >>> -next].
> > > > >>
> > > > >> Greg, Sasha, that [1] fix I was talking about now reached -next =
as
> > > > >> 162b1adeb057d2 ("Bluetooth: btmtk: accept too short WMT FUNC_CTR=
L
> > > > >> events") and will likely hit mainline on Thursday or so with the=
 weekly
> > > > >> -net PR to -mainline. If that's good enough for you, I'd say it =
would be
> > > > >> good to pick this up for the next round of stable kernels.
> > > > >
> > > > > That "Fixes:" tag is referring to something that is also not in a=
ny
> > > > > tree, but that commit does have a cc: stable in it.  So do we nee=
d both
> > > > > of these:
> > > >
> > > > Valid question, as yes, there is a slight mixup here:
> > > >
> > > > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB length be=
fore struct access")
> > > >
> > > > That is already in v7.0.7, v6.18.30, v6.12.88, as 041e88fb0c08 is t=
he
> > > > -next commit-id for mainline commit-id 634a4408c0615c ("Bluetooth:
> > > > btmtk: validate WMT event SKB length before struct access") -- the =
one
> > > > that is causing the regression that I want to get fixed. So we now =
only
> > > > need:
> > > >
> > > > > 162b1adeb057 ("Bluetooth: btmtk: accept too short WMT FUNC_CTRL e=
vents")
> > >
> > > Ok, but that "Fixes:" tag pointing to an invalid commit is going to b=
e a
> > > nightmare to track over time, ugh.
> >
> > Hmm, did we get the wrong hash or something? Usually, that would show
> > up in the verify-fixes.sh, but perhaps it didn't capture it this time
> > for some reason, perhaps I'm running an outdated version or something
> > similar.
>
> Something went wrong if we ended up with a patch in the stable trees,
> yet this fix is referring to it as a different git sha.  Don't know
> where the disconnect happend :(

041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB length before
struct access")

I don't have that in any of our tree either, this is actually
634a4408c061 on all trees in the chain:

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth.git/com=
mit/?id=3D634a4408c061
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=
=3D634a4408c061
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D634a4408c061

Or actually that was the hash before it got rebased on bluetooth-next tree:

https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.gi=
t/commit/?id=3D041e88fb0c08

But I didn't send the PR from that three so perhaps somebody else sent
it to stable with the wrong fixes tag?

> thanks,
>
> greg k-h



--=20
Luiz Augusto von Dentz
