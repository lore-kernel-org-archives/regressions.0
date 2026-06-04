Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF73C1419
	for <regressions@lists.linux.dev>; Thu,  4 Jun 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579268; cv=pass; b=ixENb9CAsboof55gm6mGBDtwlKmvNmiMDh3PB6U2jrVRAy/HsYTWwQc06pQIA6z/UDILI+C7Fk4qQU99TGgR2r56cQgVUTT25D9km50R/8G5n2+QNyzTKb/rMqWV9ojg1XdZ+Z+E/NQbbzVsfNhEdDhZ35mrdH/fKfrlcAUfVbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579268; c=relaxed/simple;
	bh=3rdgR2Y6FcAHyIpn2ALYcOO9wTP8eCbVk8JvWb1onCo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P3Hzjvrc5ACCslOASCbD+5qmEggDqy3Eu+GbBfkgI9zlcq+tl8LBdK6ZgNf2WiDie5X299RBiU6SgUTT1QZM7POd99S1sRoiDUYXyiJfFeGJezyr0DZAMEmFw0t6t3tI9b8Y+ddUsmLEv3oFHUHrx7Lq4mGx7T3Fcq3Tl7r7Pgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKT10xNQ; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKT10xNQ"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-304d2c56402so45018eec.0
        for <regressions@lists.linux.dev>; Thu, 04 Jun 2026 06:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780579266; cv=none;
        d=google.com; s=arc-20240605;
        b=lZ3reqBluiBH5bB+3Gy5HZqyR32CiRPHLJ5bbdhLkBDWG7ZgsobkiwWGTuxGOXOdEh
         53pI9+SZaDXYn/s9PKq9Tti23td1JGXokyWBP28/a/qO7Ags6WaveKATBLGH+12ffS/4
         Ted0mVx+NqszZzHfPQAxHoQnuzlhaEZlSs0Ca4dH2Z9vUF4tIHtgEYM+eCgg2g0qYveA
         d26yCrocSq92cY1SeXminnHSYFb3uXqknZ/jHBJfKjn7fJtea27dDoozw2h9XWjCod6L
         0v+I+VtduVq8XdobuWjtMfAB436m2WgaDb/76udTZ/iENJhJGB8YOP0sbL9n/G2J21qq
         7Hyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GVpfbT32R/82qSV+18QDKxGtI3kc5zmvjXoLt5ITgqA=;
        fh=89hUWHdfEscDWECVPY/8QqGvg56g6fWT0dyOCUa9MtI=;
        b=gABVPLn1aSCpjHo4YBju2/PGUOUDhKsKmo63ImZt3B0qfT1FeDLHjQ/SrLCiFMzy7u
         OTgCIraNCzriGpJk6Ab5WhwI6I/+MtL/JuWhbxN2J3NfCL/6fPxBkpU5f7TB+1byWfg3
         aNbjcipVsMcj1vtdJys6yCPgoIttXSW6nsyORUa4KyWil4CAdPwo3apUYFpQbh0QptWZ
         Zqtv2aTLGpPpdo0qeyy113Do3AJkNJd4V9GODxGKkN1T/mn1P168qrOeZP9mL+6dUoeG
         BRChfp9bG18zO3jutos7uORqlz4Pw2t1Lvx1tfPzxytS0Y2QpJdLKUpNVaH2FTQYFLDB
         xmng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780579266; x=1781184066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVpfbT32R/82qSV+18QDKxGtI3kc5zmvjXoLt5ITgqA=;
        b=mKT10xNQbktzA/LW6UjqrvBrpKm1f7edRymAK4h0z8BAcJaGgCxbOQKkO1NQxt3z4w
         AFXA70DorjncF7Oe0naZ1mtKpcT56FJWd6VDM3/pS2iIN4CYUMAQ0NfjSwDdJ3CJnreG
         1MxJQq6oT1mV/Kf5tghXrCGYYuQaTeCrrRfHZFk7IR0Ern+YsoeftjNnCSg/i/1e8avd
         RgKcwe3qhGPi9XZLYcqMucyqkc09R/6BqnMxTSNOre55WmgH8ngJ3KdgiDbtIw6gvur4
         3voGF7pMgYntjb3BbIM1wWgqvu78dc3sGRBlWNMI5GsgZSJu3DVzHkv0CNQETh+sXITO
         1IXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780579266; x=1781184066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GVpfbT32R/82qSV+18QDKxGtI3kc5zmvjXoLt5ITgqA=;
        b=Vm62rzeGT7akhioU/uTQEa5BqziN8nvvI9ISAREJ0nCLDnZAh9CD5BD1R4C420mCnx
         V9jhP6GMlM7BoTT5MMIPJv9yNqFG2J2pVgggfIeH6x8r/c5eOQ3LlO31KebRTMxVMpjy
         Yr6Y+zjY7QdwS0Ole2+oJDzNPPcJJiGnwtiOCVzzM1AHAN+NhAR0UIGkTg2x6ZiyJzWr
         kSlly8gM9Y2yFqPb86OD6Lc39W5eUrAO2OgCBkubEbXcCVEzHsIY2y/J1NWtL2z5wqg1
         m6sGOKIK8WTLu64XJlcPC88D1zJRpG149EVlvu2lPfEmbvDWjqbXOEJ/yHHTW2gbgdQN
         o+8Q==
X-Forwarded-Encrypted: i=1; AFNElJ82x4brEQsHhB+IK+OcrDnoVV5M0orKfreEpSgPudF3f2EAJyv2z9nQyc+qb/8ghlh1Q/soQYzUbjEOwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIX4sXut+ndsNBmAhl+T1raYKKlPHMb7E0RaVBYHCke4gUeA1Q
	egzHVAuY6J6rU2FhbP0cO/9Z8zH5aaH8IEvwz66kiUAKJ1E5X4r6btzV4h83DbUImKQEi4fOvmM
	9JmuHug5/sAJfDdJTWrh3WnAPYnJUXuk=
X-Gm-Gg: Acq92OEoaDvJ3LCEmL4KGJ2lqh5lRyInXOq8FBAtHHelz10SWwm5TutXgrVixL84keU
	V46ueqAPVkFQqFSSaDprRsZPAG3gnF45aAH8oaFCiKkP7Uc1D7tXz4eWunRhUO23FHpHJMX98//
	SBoreJAqS+/nDNMNEk9yxjpNvGWTvyMMvLnBKTMOkWWW8a0LAdb92zKsKR+U6McCcI5n9Cia4ht
	IcnWOGlLYb8fgeQfjfDJ8hEaZaAcrFsd4Xe4RJUzR56WR9G6ZYkOoiQho57c057pFMra6OVgSTQ
	IFicLfOAkaVOQWnz/egz3nsi9dJCJ7YFTMCSirHa3LB3wIjs7QjH2f4AmIplAIsBLEmLe9wva7I
	ksV4r
X-Received: by 2002:a05:7022:f9b:b0:135:1b3a:bffb with SMTP id
 a92af1059eb24-137ff5987ddmr544213c88.0.1780579266081; Thu, 04 Jun 2026
 06:21:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <44069eb146824aa195312f5b02c49287@valvesoftware.com>
 <7a9021cd-fd78-4b0d-846b-135d0d72224e@mailbox.org> <16231b1742004f848af243ce398281ec@valvesoftware.com>
 <ce51243c-3b98-4f99-911f-70dd0b860da0@mailbox.org> <1c522568-1d5e-4210-8f25-1aa96e0d3c3a@leemhuis.info>
 <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
 <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org>
In-Reply-To: <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 4 Jun 2026 09:20:54 -0400
X-Gm-Features: AVHnY4LjJNxJVvMBj9GVxXTCQGY3mGJk_7vTLN-2s2YrwHEyFdbbXxgb1Bauqxo
Message-ID: <CADnq5_O9xMagapKQSO-6waXtmmFkDV-47ExVaNuiZd2xVdhefw@mail.gmail.com>
Subject: Re: Test result / finding of "drm/amd/display: Consult MCCS FreeSync
 cap only if requested & supported"
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	Thorsten Leemhuis <regressions@leemhuis.info>, Pei-Hsin Yang <peihsiny@valvesoftware.com>, 
	"Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, 
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, 
	"Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 3:59=E2=80=AFAM Michel D=C3=A4nzer <michel.daenzer@m=
ailbox.org> wrote:
>
> On 5/29/26 00:02, Deucher, Alexander wrote:
> >> From: Thorsten Leemhuis <regressions@leemhuis.info>
> >> On 5/21/26 09:09, Michel D=C3=A4nzer wrote:
> >>>
> >>> Note that some kind of short-term solution is needed for the regressi=
on(s) in
> >> 7.1-rc.
> >>
> >> Yeah, that would be good. Makes me wonder how the rough plan to realiz=
e
> >> this looks like? Sounds like Michael's patch[1] that was discussed her=
e is not a
> >> good option? Reminder, Linus ideally wants known regression fixed by -=
rc6,
> >> which is why I'm asking.
> >
> > @Wentland, Harry can you sort this out for next week's -fixes PR?
>
> Looks like this regression will make it to 7.1 final?
>
> I filed https://gitlab.freedesktop.org/drm/amd/-/work_items/5286 3 weeks =
ago, and proposed a fix the following week. There's been no reaction by any=
 AMD display developer.
>
> This is pretty sad.

@Wentland, Harry , @Leo (Sunpeng) Li come on guys!  I've picked up
Michel's patch and I'll send an update -PR today.

Alex

>
>
> --
> Earthling Michel D=C3=A4nzer       \        GNOME / Xwayland / Mesa devel=
oper
> https://redhat.com             \               Libre software enthusiast
