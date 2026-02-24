Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032829E0E5
	for <regressions@lists.linux.dev>; Tue, 24 Feb 2026 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771915852; cv=pass; b=m2D9sfi4AaUVDRFVg0yBaknoaXQNsbI1vQ2jWVS2FoqX/fk0VCCF9Cx2ry6pwyXzwClAxUVzp1VObAG/CqgAyFtQEAJElh6sX9Lyh0WNQ9FXh2v4NxeoxazHxtdSKYrBnXc8BxJmExu9yeaszOSQkEGX3TIzvaCDcJ4G3jzOONA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771915852; c=relaxed/simple;
	bh=+MDovrANgBtaB7ZsyO+poXp4SNMxT/lZm/Bt1JKx/bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wny6PA2XMrmBHnDZcaFIWyiFMce+i5f0wKSWZAMbTo+beVXUWIHrvQ8OhK88ZimFjVcSU5qUHgLj40C059A1ovPs5hCzGUavUVl9NpPBcCi+ivC99fp+0YrYGshUR79nm+swOEw8nCQbOOuiv/in4FIlHMC8rAtYo0dz1fVE6Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S37rDW7Z; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S37rDW7Z"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-896f82e5961so77737936d6.0
        for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 22:50:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771915849; cv=none;
        d=google.com; s=arc-20240605;
        b=Xp18N6ybKV9zp3oTF3/ZeLB0d/LmUoMPBfvL26z30v3fG19YTpjQPHX5bc2PvlW4OL
         uomSj7QDrIkPP3w22fR09L0s1rvLYj93YgEchsWAJM2U8xieGZ6ymXp8qKnj+Xt8tJ6S
         PIXjOJvmO0DFaILeA0MhF84vwIDhMQbVQD9rY3ZNC4FpgYJzQs+XDYkQl07Q+534zhCb
         yXZvp4Tn0ASzC9CdtDGA4Qq2uYHA77oS0lrDmsv0/C4HbsRQy8BzYUZJkPQROOlvF2rG
         EcRIsKj8gj6+KkKHZYNtC0EUVrjw1A51sWaT937ENWZ0sY7LQOjbw5ynrBFB5SWXFKoQ
         FJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
        fh=/gxH2yaPu1PldOQCNJQ1Z9K2wumwKnJrSDcrbvAqd/A=;
        b=AJLmO2cRzHMu+ZHiZoYZf9gZHeDM0wlF36+C49hHONu6sK0Eiov3T0JbmMaBeLVVZx
         LL1pOdMONRLwlFc2uuuX0NK1lpw7h7m3iLVU4rAR/fcl0kiKwj9sJDqwYsFIRpnFiHRg
         2Zc4JlkrbXw/rdBKKecTQm1CVxlUv+n0RmGXeQwdJ2pl1bEm5LmEIwwxyE+BohEkrkVD
         9KPYjbEcVpN3cjfXy93Wg6tZuUs+ypU8gAD16UHojRFlHFeHTP+9SQ7egRkJI6weuClQ
         svMWzUzxHD9d3XNd6SH4WmyOoQ/k18OZmyiV9ek0YC0kGAI+618J76x1XSyqzAikij+b
         ZNsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771915849; x=1772520649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
        b=S37rDW7ZRvrrNHam2zvz7W7HOaJmZZ3CR1K3gM8A1+WR5kmlPPbRcoVg2NySdMzfsN
         ePfWS2D0HjIt/ABnhKnofKfJ4QvzJQDiGhvRYiMDc87TZpwNxvFq+jqrWX2tXYI8AHui
         287+OcWjYOPRSsxfCJmSmLvtxcVaBG3UZ9acEkkWMlXpK8sLnnrEz6K0UT/nrd/O1sId
         PfBUAHtnkKSZBXUR5iDCUM+Gi3bdCTAn4u3qIWdQUWcxb5p6FkD3HRpaQTjGtd53gXth
         38CBKL/kuH/cceMCPKp7Dn/C6meRKXuFw8mdQjb/blV2ELLI3X5MWjdS5svkb9mGATQD
         vUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771915849; x=1772520649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l48zkvQjzWejaQ5lJesqZp5/iKNkUkKZtjQkbUOoCVA=;
        b=FlZCi3Xfh2ReMYC1wkzYsNjSYXbbcZBD+1ykDWcUMhEDxNKyGGbGM6pitdpzIhH+Yy
         1K+KDAq6bfXVbUwoeV9oUWgsld2qbhdg9e2ys1llgccZ3Y4LCbnCr7c1CZUE9c8SJNLW
         tHFV54jSLsPjyAlz8kGdjSR0fHLnkPqfhBIxf5Rt77lN1Htpv3eTxgnQZAe/qmXZp0QK
         XAx9gUajaK1MJLAYAt9S4vXh/S2tExkThhjWPsMBGjp2KdsFVuLzP7uUP9xiM7RgZrDX
         34P6nrm4or2IBiiaS5cenDJWfKwGo9TSuNKXV/2sNBGpVLawT+OVGpq2wczc9ybFwJ/y
         CkIw==
X-Forwarded-Encrypted: i=1; AJvYcCUOGyWRT+jtWRxosbDqXpmoto4uu8o4bU8G87Ok+tsIBUEEwHcw2fi19F5DJWoW1Ja/bDbecdRRrRPxOA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3VTxPLK5y0dOZM6NXXQ1ojCAo5mkIbp8vFQQG90DlC0OheTW+
	OZXvcsKZ8sdJzWqu9dZ0gLQTu39eFBI1fJK7IodT9MNLlERYZ7NsqUAeMWlbY5h4gwVmkh3GzHd
	1A990lBLn+3ZAacWBTKe/5+o8rCCm7R4=
X-Gm-Gg: ATEYQzwRKeS0KD+nzf8++XecfN0G/kHA4jsDmZbmsN/ua3UuNYx4CGuRXP1rzFg2iNF
	GmM4VKukMOAXK/KNLZDkrpqv4M5ck6CmCgX9OGAqwPydAMJtaMGncJERYNbZQ7a4ZDSZ7S6ZQ/m
	sLjF9h9TznjcfYOS7N2tawXW5o92EuKWxC4amLpYFSePyIBkdLesjspxMk2nrKkd6glVo+7SGFl
	nQuJ/oIDEaqz3xFnBd/JMBRjg8b+CEXs17+tJ8Fxmx0tzpkv2Lo/z4/5Z1ZtwVGGEr07Ro2w8bB
	MaqjN3GLUTerjWinOut9JBEaciMiRAVSzLFirtrUT2yj2kCYZf3XpA9hccZajZwhJTM=
X-Received: by 2002:a05:6214:c4b:b0:87f:fecf:17b2 with SMTP id
 6a1803df08f44-89979db90eamr167613206d6.64.1771915849329; Mon, 23 Feb 2026
 22:50:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9txvCxvz_NH1zw9WpeCiYYGOxN36Lz1owmbbjfaB2tmjPA@mail.gmail.com>
 <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
In-Reply-To: <b4f8ca7a-02b1-4e72-896b-87a00db6338b@leemhuis.info>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 24 Feb 2026 16:50:37 +1000
X-Gm-Features: AaiRm52NKlBolnZJjiM5rJmEDD4FT4DQhk6y6nizcSKcUGYofwPklsp4ZTnfwYE
Message-ID: <CAPM=9tw4xWxwGSr=SMQKjWL2R_LfA-b9joYNMqZXM0atis=10Q@mail.gmail.com>
Subject: Re: Time from regression report to a merge of a fix (was Re: [git
 pull] drm fixes for 7.0-rc1)
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
	Alex Deucher <alexander.deucher@amd.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Feb 2026 at 22:52, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Lo!
>
> On 2/20/26 21:53, Dave Airlie wrote:
> >
> > This is the fixes and cleanups for the end of the merge window, it's
> > nearly all amdgpu, with some amdkfd, then a pagemap core fix, i915/xe
> > display fixes, and some xe driver fixes. Nothing seems out of the
> > ordinary, except amdgpu is a little more volume than usual.
> >
> > Let me know if there are any issues,
>
> Well, there were two fixes in here that made me wonder if our processes
> need some optimization to get regressions fixed at least somewhat as
> fast as Linus wants them to be fixed[1]:
>
> * One fix in here was for a amdgpu regression introduced in v6.19-rc6
> (and also affecting many stable series due to backports). The fix was
> ready within ~2 days and could even have made v6.19 -- but it only
> reached mainline through this PR on Friday. IOW: After two weeks. Which
> got me wondering, "Should we do something to merge fixes like that
> faster"? And yes, it's the merge window =E2=80=93 but that's also when Ar=
ch
> Linux and openSUSE Tumbleweed usually jump to the latest mainline series
> and thus expose regressions like this to many users, so I guess it would
> be good to get them fixed at least as fast as outside of merge windows.
>
> * One fix in here was for a i915/xe regression introduced in v6.18-rc1.
> Once reported, it took about six weeks to get fixed =E2=80=93 and then ne=
arly 10
> days for the fix to reach mainline. Looking at this, I once more
> wondered if this could have been merged faster. But even more I wondered
> why the culprit wasn't reverted, as that's what Linus afaics wants when
> it takes this long.
>
> Note, these are examples of problems that happen in other subsystems as
> well; I chose to bring it up here just because they were good examples,
> as both regressions were also reported at least three times, so those
> are not really corner cases. See below for all the details.
>
> [1] "But if it's a regression with a known commit that caused it, I
> think the rule of thumb [to fix it] should generally be "within a week",
> preferably before the next rc."
> https://lore.kernel.org/all/CAHk-%3Dwi86AosXs66-yi54%2BmpQjPu0upxB8ZAfG%2=
BLsMyJmcuMSA@mail.gmail.com/
>
>
> > Mario Limonciello (2):
> >       [...]
> >       drm/amd: Fix hang on amdgpu unload by using pci_dev_is_disconnect=
ed()
>
> This is f7afda7fcd169a ("drm/amd: Fix hang on amdgpu unload by using
> pci_dev_is_disconnected()") [authored: 2026-02-05 17:42:54 GMT+1;
> committed: 2026-02-05 23:25:57 GMT+1 by Alex; next arrival:
> next-20260209; merged: 2026-02-21 00:36:38 GMT+1; v6.19-post].
>
> It fixes a regression that has been reported at least three times:
>
> * On Tue, 3 Feb 2026 17:27:00 -0500 (EST):
> https://lore.kernel.org/all/b0c22deb-c0fa-3343-33cf-fd9a77d7db99@absolute=
digital.net/
>
> * On February 5, 2026 at 1:30:12 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4944
>
> * February 18, 2026 at 9:30:39 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4984
>
> And likely a fourth time on February 7, 2026 at 7:25:40 PM GMT+1:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4953
>
> The culprit is 28695ca09d3264 ("drm/amd: Clean up kfd node on surprise
> disconnect") [also known as 6a23e7b4332c10; authored: 2026-01-07
> 22:37:28; committed: 2026-01-14 20:51:36; next arrival: next-20260119;
> merged: 2026-01-16 22:48:18; v6.19-rc6 (2026-01-19 00:42:45), v6.18.7
> (2026-01-23 11:21:37), v6.12.67 (2026-01-23 11:18:52), v6.6.122
> (2026-01-30 10:27:43)]
>
> Mario and Alex thus had a fix ready and committed within about two days
> after it was first reported. It thus is an "immediate fix" (yeah!), just
> how Linus wants it (see [1] above).
>
> But then it took two weeks to get it mainlined -- and will now take a
> few days more to reach all those stable trees where it is needed, too.
>
> Give the dates above it could have reached 6.19 (released 2026-02-08
> 22:03:27 GMT+1) if we really had wanted to.
>
> That fix could also have made the main drm PR this merge window (send
> Wed, 11 Feb 2026 17:26:03 +1000:), as Alex already asked for merging on
> Fri, 6 Feb 2026 14:27:06 -0500:
> https://lore.kernel.org/all/CAPM=3D9tzgmO1PWeuxjAxqOmS5PTsOe8jHP9Poy23q6t=
vY66B1KQ@mail.gmail.com/
> https://lore.kernel.org/all/20260206192706.59396-1-alexander.deucher@amd.=
com/
>
> If it made that pull, the fix could be in stable already by now. Maybe
> Alex PR just fell through the cracks. Happens, but overall this still
> made me wonder:
>
> (1) Should there maybe have been an additional PR this merge window to
> speed things up? Or some fast track for regressions?
>
> (2) Or should the fix (or a revert of the culprit) maybe even have been
> sent to Linus for 6.19? That would have saved at least one user from
> bisecting and reporting the regression (and likely a few others that
> never reported it).
>
> From Linus' mail I linked above, I'd assume he would have preferred the
> second option here, even if it would have been a last minute fix. If so:
> how could we make that happen more often in the future?
>
> Side note: yes, unbinding a module is likely something only a few users
> do -- but given those three or four reports, it seems it's not that
> unusual. And I don't care too much about this specific fix anyway, as
> it's just an example for the "time it takes fixes for recent regressions
> to reach mainline" aspect that I see all the time in many subsystems. To
> elaborate on that, let me give another example:
>
> > Imre Deak (2):
> >       drm/i915/dp: Fix pipe BPP clamping due to HDR
>
> This is now fe26ae6ac8b88f ("drm/i915/dp: Fix pipe BPP clamping due to
> HDR") [authored: 2026-02-09 14:38:16 GMT+1; committed: 2026-02-12
> 07:03:08 GMT+1; next arrival: next-20260212; merged: 2026-02-21 00:36:38
> GMT+1; v6.19-post].
>
> That commit fixes a regressions that has been reported at least three tim=
es:
>
> * On December 30, 2025 at 5:07:48 PM GMT+1
> https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15503
>
> * On January 13, 2026 at 11:51:11 PM GMT+1
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7052
>
> * On February 15, 2026 at 10:13:48 PM GMT+1
> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7269
>
> That regression is caused by ba49a4643cf53c ("drm/i915/dp: Set min_bpp
> limit to 30 in HDR mode") [authored: 2025-07-30 07:55:23 GMT+;
> committed: 2025-08-19 08:32:40 GMT+; next arrival: next-20250820;
> merged: 2025-10-02 21:47:25 GMT+; v6.18-rc1 (2025-10-12 22:42:36 GMT+)].
>
> The regression took way longer to get resolved than the first example,
> which makes me wonder:
>
> (1) Should the culprit have been reverted weeks ago to get closer to the
> "immediate fix" target that Linus wants?
>
> (2) This fix also took nine days from being committed to reaching
> mainline. It came a bit too late for the first drm PR this cycle. So
> again: Would more frequent PRs help here? Or some fast-track path for
> regression fixes?
>
> Ciao, Thorsten
