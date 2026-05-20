Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25012BE03B
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 13:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779285224; cv=pass; b=GgYSHV/yEUEU/5doikd0PWINNgyPl2mcpkZ3SyK1Y5OwLruaAIFfMfkz2+mNDsP4eoMnQ24ULwk7vQtD2hv+2wfOp1DIIdfwLvwEkOvX88yXGgqrkxQVVEpMln/UYubejZbKeWnOaK3Gk7ouH1BM+WsUPnjHnxOIs/Mm+eYPomM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779285224; c=relaxed/simple;
	bh=ghMB5I3ZznM6B+uIBYnjRUhxHcZcmdpqsz9B+Q/n7tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GU9qa7D6zyO2/hZNJUZuJLc1GLEDEgBiMZfS3Wtqfjy4NRMZUKWyysgMyr6RIccf6Ojz+liBNDj1nefbWYlA+vqTZEZNDtCDD+wjyFT1wTsgCWznSDsmcYA7i300eA1XlT9US83NTbZzkYUn33Gup0Nhdc/Mv1aHkNrvizCrCTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iHH+nLhL; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iHH+nLhL"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-65c2cd216c9so4144612d50.3
        for <regressions@lists.linux.dev>; Wed, 20 May 2026 06:53:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779285222; cv=none;
        d=google.com; s=arc-20240605;
        b=lHoy0pFy8gAnRTvfZHrooMxMURy9audQPNCYKBYBQkf65DGE1r/j5tnIxhZO7H+Vrj
         3n5K2JKrMHwF4xmCLAh3KZT5SQIFbfLtuAhNAI64EMf0uGdGB7e+xM9unf0n+XBrY9dT
         4QmRHlWozE4gwbMtAaa4k7lvx08qoYXDvYqgW3IRUIzhPPbszWpsHacTrUOrQvx3Mjmu
         vCZfDBNHfQdesDXLKkBuwmpmge4p7xBzG+2lgEsJ0lj6M67CGw5tB+0k3BvmR5EfYlan
         fSjguoGncTRxW33kgo+/4f4OyW1pRgmOzEN/78YA24X/5ldg7nfwAVBzetSigAfoltlv
         CO1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FdYtmXr5yw5qje/D1jtPFpQx5oQHNPSqQ+7yc0yfv8E=;
        fh=MtVBJH6c5XU/PJrrYnwfBrAw6/cxEwI81uC9c4k7+5M=;
        b=fTKr4F13c6LzdB1nNojWsxV36q89dJMvaGSEGjSEUtLgIkdfLgQ/Eqk1CfoIGumDY4
         8bEWVYIeCk3wjFdnJAAtBeYF222Gj7bnGc+j5N9gSP1+Vj1gB+yFhG1DpQHTUgYt06gF
         vUlKX/JHx9uVgDcQLUiK++rB70rK8rDtm9JCXccs92USH2VnXiK0UgP5Kknjbg0q210S
         lyjZ3egU1q5c5AdmVgd5bfM8vWrKTu6f9H3INYTn6u3mR7lc6mOgOE+F7Xza3MvRgOdi
         vdHJcAVR2iwYQ2UomwYM29NLtkfsumKHlZFUhPGKeV3A154+sWR7apSiy7WoAdeQMTgu
         22eg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779285222; x=1779890022; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdYtmXr5yw5qje/D1jtPFpQx5oQHNPSqQ+7yc0yfv8E=;
        b=iHH+nLhLh1dDDEgUPT9gBu5B4+ycz6b13sDwv+QG0kO8j4mJ+3+0AJ1YMQ865iwcuH
         3Ttwiv+2hKv5FV1JJAppHTWioRrXXUd7zzGwedpBsEe2AQgmMFRtA+tcKX2zZ4m9noPS
         T7DXi7yGjc2BtIfym5QPo7kHBDi0yg9Jvih5tgwSpYSF7EJVgxRYMojOW8VV4dwXMUm5
         BDkt8BiHVmPXV2GWSGbsJvGJ4AwUBhK2HGIRNd6AZFq4AVe2yhYAhH6QdtM+AuhHDK9Z
         DP+dgEw50kRMAfyU1UQIVjScNgxOrXU/w9Awpflt4obIQbPG9miIbGZqVdFpNmLXxkmG
         L7Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779285222; x=1779890022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FdYtmXr5yw5qje/D1jtPFpQx5oQHNPSqQ+7yc0yfv8E=;
        b=URfypIiANmt75/cC73rF3QRJjRxfvht5KHV1/4SGfdSFjdTeI0984DQ3q5q6hHV1jY
         YSZKaCW7+7NG9AAUJO1Ur6PTql+Loj8fP7Z3sRXCw2wWIaHGrvpjCIN+ywqepx/JMfop
         iaY+KWOtxwdatzDeiQ13HU1gfF9cDE+S2AZUHGNlL77etX2voalf9i/c9qK48YDk2s4+
         xmPONc07aoKGj2P6W/aiUL89YQMN6vaisrwr+DxCIhKlacMvQzO3sp/yn70ZQTSn5lFb
         +HKqpdma61nZXNAeHDmwXPrva5W9/D5mBlWaw67LbhEsHuy4mIoWojTwj+MBMgILnBoB
         YhEA==
X-Forwarded-Encrypted: i=1; AFNElJ94XhaBI8404W3X7DgcxVayjAqlAQ5O63jQ+Ff7TGG9TJDdcWsoMUS8KA8PmLiUMHCBxG/NVx8VXVmb7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyfBMGjienAIarpSjXH3B3ulJi5O/yJ0pSdZHBFbtf9kTybxq5L
	BRtvrytUxxHLjQqBIRELtHlgneXmIkTAkaUi7SyQXZk1Hm71AAzpemhktDtiF2AJZ5mEXF33gIJ
	d3rzyqcDRdGxDZ+k90LnzYOyOGp3jF7I=
X-Gm-Gg: Acq92OEjn8kK8/+RNlN0EU3il6/LxMAAeEq+2uGCuAyCxAZ/CJfgjHTKrPW0fTUWmc3
	LTmb7euddBGzAqyfr5KMVDjmS/iBk7JJH5OhfwCrb9GYAuo60/dlak544iDTUaEGq40ShauG9a5
	vMxK+orNH6TUAqtJCh9h41YW94I1Ioj/PhlG5CbiBl39r/9itLCqs53X4PWRaq1F1OZvaxMsJXN
	vpssGvh6t5w550M4xp9jeyU1MlCMP6QKkrWtlj6OVVuoAvoifghtDACac6oxkaDjczzDSb9unJu
	lxAsxwQvhuLct5hhWmrVG9EIThbYefbpcFueulUdfu3bDAUnz/wbknXnjlqgxwshSDQnexudYTD
	ctzYZ
X-Received: by 2002:a05:690e:4290:10b0:65c:2208:8c6a with SMTP id
 956f58d0204a3-65e227dfa70mr19056657d50.42.1779285221725; Wed, 20 May 2026
 06:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <4946f5f3-b7e2-4949-89f7-6427015027c6@leemhuis.info>
 <2026051954-revision-sierra-6bb4@gregkh> <eb5301f9-3133-4fe3-b358-61f14d1ffa5b@leemhuis.info>
 <2026051909-impurity-nemesis-2f65@gregkh> <CABBYNZKKbTXc-okp9P2OncMYXHX9C1XC+pRC7XWOhv-8nPNZ5A@mail.gmail.com>
 <2026051942-uproar-drainpipe-6370@gregkh> <CABBYNZKzWgL3nmeA=CtN9s80LRyDiJ97aQXgvfSm9vYUBw_SpA@mail.gmail.com>
 <e666c332-e2aa-4525-a208-a4a08742d2e0@augustwikerfors.se> <2026052026-barber-espresso-1d9a@gregkh>
 <CABBYNZJ4woc+unpYN6_dzMLtxhFVUd5+ccv2+EQbDMkYuXQ12A@mail.gmail.com> <2026052047-silica-grub-0bb2@gregkh>
In-Reply-To: <2026052047-silica-grub-0bb2@gregkh>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 20 May 2026 09:53:30 -0400
X-Gm-Features: AVHnY4Kvielev57YNURsHMJ5Vco21acsoY0xKleOB6jrUgrO8TFy7dJIbwvPLM0
Message-ID: <CABBYNZKnrqHyASMOah795i9eteY7S5AfN3tCWssSRgqBXZwRMw@mail.gmail.com>
Subject: Re: [GIT PULL] bluetooth 2026-05-14
To: Greg KH <gregkh@linuxfoundation.org>
Cc: August Wikerfors <git@augustwikerfors.se>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Sasha Levin <sashal@kernel.org>, 
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, Linux kernel regressions list <regressions@lists.linux.dev>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, May 20, 2026 at 9:14=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Wed, May 20, 2026 at 09:11:42AM -0400, Luiz Augusto von Dentz wrote:
> > Hi Greg,
> >
> > On Wed, May 20, 2026 at 8:47=E2=80=AFAM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Tue, May 19, 2026 at 07:37:35PM +0200, August Wikerfors wrote:
> > > > On 2026-05-19 17:49, Luiz Augusto von Dentz wrote:
> > > > > Hi Greg,
> > > > >
> > > > > On Tue, May 19, 2026 at 11:19=E2=80=AFAM Greg KH <gregkh@linuxfou=
ndation.org> wrote:
> > > > > >
> > > > > > On Tue, May 19, 2026 at 09:44:39AM -0400, Luiz Augusto von Dent=
z wrote:
> > > > > > > Hi Greg,
> > > > > > >
> > > > > > > On Tue, May 19, 2026 at 8:07=E2=80=AFAM Greg KH <gregkh@linux=
foundation.org> wrote:
> > > > > > > >
> > > > > > > > On Tue, May 19, 2026 at 12:53:49PM +0200, Thorsten Leemhuis=
 wrote:
> > > > > > > > > On 5/19/26 12:30, Greg KH wrote:
> > > > > > > > > > On Tue, May 19, 2026 at 09:04:38AM +0200, Thorsten Leem=
huis wrote:
> > > > > > > > > > > On 5/15/26 17:10, Thorsten Leemhuis wrote:
> > > > > > > > > > > > On 5/14/26 19:23, Luiz Augusto von Dentz wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > > The following changes since commit c78bdba7b96660=
20c0832150a4fc4c0aebc7c6ac:
> > > > > > > > > > > > >    net: phy: DP83TC811: add reading of abilities =
(2026-05-14 15:17:12 +0200)
> > > > > > > > > > > > >
> > > > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > > > >
> > > > > > > > > > > > >    git://git.kernel.org/pub/scm/linux/kernel/git/=
bluetooth/bluetooth.git tags/for-net-2026-05-14
> > > > > > > > > > > > >
> > > > > > > > > > > > > for you to fetch changes up to 375ba7484132662a4a=
8c7547d088fb6275c00282:
> > > > > > > > > > > > >
> > > > > > > > > > > > >    Bluetooth: hci_qca: Convert timeout from jiffi=
es to ms (2026-05-14 09:58:08 -0400)
> > > > > > > > > > > >
> > > > > > > > > > > > It seems this PR sadly came too late for this week'=
s net PR to mainline
> > > > > > > > > > > > that was merged yesterday.
> > > > > > > > > > > >
> > > > > > > > > > > > TWIMC, from my point of view, it would be great if =
we somehow could
> > > > > > > > > > > > still get the changes from this PR or at least the =
btmtk fix it
> > > > > > > > > > > > contains[1] to mainline this week before -rc4, as i=
t is fixing a
> > > > > > > > > > > > regression known since 2026-04-24 that at least fiv=
e people encountered
> > > > > > > > > > > > with mainline since -rc3 due to 634a4408c0615c ("Bl=
uetooth: btmtk:
> > > > > > > > > > > > validate WMT event SKB length before struct access"=
) [006b9943b982 in
> > > > > > > > > > > > -next].
> > > > > > > > > > >
> > > > > > > > > > > Greg, Sasha, that [1] fix I was talking about now rea=
ched -next as
> > > > > > > > > > > 162b1adeb057d2 ("Bluetooth: btmtk: accept too short W=
MT FUNC_CTRL
> > > > > > > > > > > events") and will likely hit mainline on Thursday or =
so with the weekly
> > > > > > > > > > > -net PR to -mainline. If that's good enough for you, =
I'd say it would be
> > > > > > > > > > > good to pick this up for the next round of stable ker=
nels.
> > > > > > > > > >
> > > > > > > > > > That "Fixes:" tag is referring to something that is als=
o not in any
> > > > > > > > > > tree, but that commit does have a cc: stable in it.  So=
 do we need both
> > > > > > > > > > of these:
> > > > > > > > >
> > > > > > > > > Valid question, as yes, there is a slight mixup here:
> > > > > > > > >
> > > > > > > > > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB=
 length before struct access")
> > > > > > > > >
> > > > > > > > > That is already in v7.0.7, v6.18.30, v6.12.88, as 041e88f=
b0c08 is the
> > > > > > > > > -next commit-id for mainline commit-id 634a4408c0615c ("B=
luetooth:
> > > > > > > > > btmtk: validate WMT event SKB length before struct access=
") -- the one
> > > > > > > > > that is causing the regression that I want to get fixed. =
So we now only
> > > > > > > > > need:
> > > > > > > > >
> > > > > > > > > > 162b1adeb057 ("Bluetooth: btmtk: accept too short WMT F=
UNC_CTRL events")
> > > > > > > >
> > > > > > > > Ok, but that "Fixes:" tag pointing to an invalid commit is =
going to be a
> > > > > > > > nightmare to track over time, ugh.
> > > > > > >
> > > > > > > Hmm, did we get the wrong hash or something? Usually, that wo=
uld show
> > > > > > > up in the verify-fixes.sh, but perhaps it didn't capture it t=
his time
> > > > > > > for some reason, perhaps I'm running an outdated version or s=
omething
> > > > > > > similar.
> > > > > >
> > > > > > Something went wrong if we ended up with a patch in the stable =
trees,
> > > > > > yet this fix is referring to it as a different git sha.  Don't =
know
> > > > > > where the disconnect happend :(
> > > > >
> > > > > 041e88fb0c08 ("Bluetooth: btmtk: validate WMT event SKB length be=
fore
> > > > > struct access")
> > > > >
> > > > > I don't have that in any of our tree either, this is actually
> > > > > 634a4408c061 on all trees in the chain:
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoo=
th.git/commit/?id=3D634a4408c061
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/co=
mmit/?id=3D634a4408c061
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D634a4408c061
> > > > >
> > > > > Or actually that was the hash before it got rebased on bluetooth-=
next tree:
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetoo=
th-next.git/commit/?id=3D041e88fb0c08
> > > > >
> > > > > But I didn't send the PR from that three so perhaps somebody else=
 sent
> > > > > it to stable with the wrong fixes tag?
> > > > I believe the confusion comes from "Bluetooth: btmtk: accept too sh=
ort WMT
> > > > FUNC_CTRL events" itself currently having different commit hashes i=
n
> > > > bluetooth (e3ac0d9f1a20) and bluetooth-next (162b1adeb057). The for=
mer
> > > > correctly refers to "Bluetooth: btmtk: validate WMT event SKB lengt=
h before
> > > > struct access" as 634a4408c061 in the Fixes tag and was merged into=
 net
> > > > yesterday heading for 7.1-rc5. The latter still refers to it as
> > > > 041e88fb0c08. Both are now in next-20260519 but only the latter was=
 in
> > > > next-20260518 which was the latest at the time of Thorsten's messag=
e.
> > > >
> > > > Greg, this means picking e3ac0d9f1a20 instead of 162b1adeb057 shoul=
d result
> > > > in a valid Fixes tag.
> > >
> > > Ok, now done.  Be careful of duplicate commits in different branches
> > > that are marked for backporting with different ids.  It can cause
> > > massive confusion (i.e. don't be like the drm tree...)
> >
> > Noted. I guess I need to dig into how other trees do to avoid that.
> > The problem seem related to using 2 trees: bluetooth->net (fixes only,
> > rebased on each RC) versus bluetooth-next->net-next (development,
> > rebased once per release).
>
> Just never rebase any public tree please.

I guess the alternative is to do merges, right? While I understand
this will not be changing the sha-ids I don't think it changes the
fact that fixes applied on the bluetooth-next cannot be merged into
bluetooth. Is there a way to retain the IDs across trees? The
alternative, I guess, would be to apply fixes to bluetooth tree and
then merge them back to bluetooth-next to preserve the IDs. This would
make the CI job slightly harder, as it would need to detect if a Fixes
tag exists; if so, it would probably need to go through the Bluetooth
tree first.

--=20
Luiz Augusto von Dentz
