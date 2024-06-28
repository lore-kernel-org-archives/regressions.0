Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17AC1C9EB1
	for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 15:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587971; cv=none; b=hMOVbjC/2IFma4QODzqhNtYKfZBLXWwZ/H14to4rPa+ozo4i3LITDXvT37FYehfHhm3GqWp2vFfrpwQMjMTLlkGU5gh9V8PpgX7CRCyLjichLPxe5VHm0s1pLArrau42h1ccZYgXAc85DtpDumoll/QIBJzYFCMdxvxqBVPCUvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587971; c=relaxed/simple;
	bh=Pmjri7yaLe7QXW9juAdGl9QopQ/cO6H/4cwPORHxTGQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qhFl1tSsrRVx+z99oBtilSoxeBBHYQeFA6bxW3CNuNz7wz6TovmIk3+TrhubJnORb0Q4WQKBzosg7Nh/q/R8aHilfEY2Kfftotjuhg1K6Xfp800dYynQwDCvq9gMcS14uhNvlPgjNHtHGRlvdIOFAkf8yWrcZyhrQqrAFyq+9HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dyI0ins2; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyI0ins2"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c8e7553c9eso536804a91.3
        for <regressions@lists.linux.dev>; Fri, 28 Jun 2024 08:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587969; x=1720192769; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pmjri7yaLe7QXW9juAdGl9QopQ/cO6H/4cwPORHxTGQ=;
        b=dyI0ins2ScP5jiUVXw2P+Lmnu3cJWiOCS7Bg5SoJCa40BSY/Pc1edtqz5KfxI76X2S
         jrzvmhN3b7BeOyFfc8vskLC+Mero4KsoLGaVDeQBRtaRUlrpG+FNejC/SEPqZR5dXJLm
         quu6GQeXEGsWYeFE+IXsIQelsE6id7pwu+QKlHiqn+M9q422r7z//SUh4DezEclTgIdK
         N+5qppVLf2XX/7cdiiJkWSvVg/YWaDefJ7IhhI6V0K33MqgLAkf+dCzfP6s7KfZnGxLn
         UWSdK+TJixHV++Idet1esrvA0kkVRcWX1i67zdx+5Zur3ZyoodYO4Q54S68F2CJJU0mE
         /j0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587969; x=1720192769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pmjri7yaLe7QXW9juAdGl9QopQ/cO6H/4cwPORHxTGQ=;
        b=DmOG+pGj9ZM0xJ/CZhhrILYjn53hMcnt9TGVg+XSIkcT+wtFeGSef3vESWr2Bj0v72
         dWTDVcSANzT3CDkLJdCtnEzlJ8vuIS8X+kKamCpGjtUahTulfeLuxEa7q9EQZXB9jnc4
         8hPM2SLPB/Kwg2ofDSUSTHbJhPEvtEzxVC1zY68DMDQKtHr1Ct486jDfC6ScWKZJrck4
         74PCdY0UYuUF1HVfXpPclyZA/oQEd7W4A5ZV5n+WDZzRXQ/a1uT5viJlSVaow1o2Hf+Z
         wlZ8WPaU9iOQk2ChiLhjaudpYcK5Dkc6GZdHNWGSJIK+jqQABr2MgzQ9yjCpmNOCU/cG
         fEug==
X-Gm-Message-State: AOJu0YzuB7S2Kr+mF1mL22BlFjcr+9a7PsTMCHGyi4SiCbXesgJVHPSb
	kC1Opw2YFIGZJuniGwe1BfhkRCNfrFXk5rp9QjKJ2WPZD6m62BaLCc1GIVaCnO4GFQFvjpGrPq2
	whuUn8LG3VeG4tVVtNMQYH/PPgWo=
X-Google-Smtp-Source: AGHT+IFl/ePdhUfWsByY453UJoZtJx+hjy/QQ0/MmsxXqE51xtMz7GT1s16IgCAaFz1nVwJbQE6MR1Er5Iz8x1FG1QA=
X-Received: by 2002:a17:90a:6885:b0:2c7:e24d:f695 with SMTP id
 98e67ed59e1d1-2c861246b47mr15446562a91.12.1719587968869; Fri, 28 Jun 2024
 08:19:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info> <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
In-Reply-To: <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 28 Jun 2024 11:19:16 -0400
Message-ID: <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Rodrigo.Siqueira@amd.com, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 6:45=E2=80=AFAM Mikhail Gavrilov
<mikhail.v.gavrilov@gmail.com> wrote:
>
> On Fri, Jun 21, 2024 at 12:56=E2=80=AFPM Linux regression tracking (Thors=
ten
> Leemhuis) <regressions@leemhuis.info> wrote:
> > Hmmm, I might have missed something, but it looks like nothing happened
> > here since then. What's the status? Is the issue still happening?
>
> Yes. Tested on e5b3efbe1ab1.
>
> I spotted that the problem disappears after forcing the TV to sleep
> (activate screensaver <Super> + <L>) and then wake it up by pressing
> any button and entering a password.
> Hope this information can't help figure out how to fix it.

@Siqueira, Rodrigo @Mahfooz, Hamza any ideas?

Alex
