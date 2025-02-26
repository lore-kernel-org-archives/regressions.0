Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED525E82D
	for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740610673; cv=none; b=KkGiadaVgZzp8oT4KyK0/DU+/OctCm6f5ebshZ8JJ74ybmR3J2OfGrUzEBxQ4GHUNbtIH6wkMIIx+SbXYno7dhwWY2Zo6Xpr2V236omUDGYUNBzd49fRaLu5Q9OnJB2NFF03a5F5SO0NWiGvL3PrXu6jyTFb0efuRQmeXAornW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740610673; c=relaxed/simple;
	bh=uAoX5elrHn2Yn0oC9ZZpKM2JWaqoMJBoXRL/yNmjZwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eVVUE6H47JSyLt3PFylaHM4o6qpYBIwiECUCcg3QoCBbZ+rpmLz9dHYEPGzJ1kvCmX8ROoWyp74QH/1sWGfKDD8lL4TM9vwhGMdf6fvvofauOlpzg4R24u7eySbj0q6Zq5yDlOaA5PvlUlZohqHIYEIw5VkXQzfn5Lh24xhvgqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iDq3uyhC; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iDq3uyhC"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-855b77783e9so10335639f.3
        for <regressions@lists.linux.dev>; Wed, 26 Feb 2025 14:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740610671; x=1741215471; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAoX5elrHn2Yn0oC9ZZpKM2JWaqoMJBoXRL/yNmjZwc=;
        b=iDq3uyhCiII6AJSTmOxfqEF3DIn8GXZPSNuxXE35SPASyVT8Pr2IkyBtcPMh7HyVhd
         gfKqKXw5IsmLPEa1WYT7JJzeWth3RZRSbMEkfyO8BZ9AQ6DfDfOu9Jd7YQzNnmVXa4f4
         Lq5OKx5YlsOBafePs4AIDHhN9B+XUKjr6YGbeENp0nRtzp5SNk/LGjmozK7WA6f/Jvj6
         /Ku6gWFy62y7iP0cDcqFZDSEChv+V0w+oWQvJ2nkiRgup19MjWwg1g/3Ym+WZ5nxCgLb
         YHurnPrPp8OBYCEw3DjL4qv/8vdcXM038Q+gLlA1cmaRg8da5qee7l1hqtRIIEmjZtnF
         PCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740610671; x=1741215471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAoX5elrHn2Yn0oC9ZZpKM2JWaqoMJBoXRL/yNmjZwc=;
        b=aXd3BNqXQjPaJBcqK5a/y+buUNCDufrJdqASDFPNh144bvVVWYA2+16Zz350EgkrtP
         l9HR8uagmOrqbiTa+3EqOu8rhmK1+uZhVh0AYTqBwQ2o2vJ//Yw6JKuwtc3XM9kgGOwZ
         MryLX1xNtp0HQzRC9foAuE+yxxNA9bn3g5KggJ5sxhNBoWxEYnkG97uR8BrvgKXXvspv
         y6YUhILRK7EopQbk9zChhQO0gO8F8khHjmonIG9Sz4VC/4ozjYp1pTA2mDb7oFjCRC0p
         5Th2c8M1xCCPJ4RD5kulvS5P4CO5zr7vCWQ9QrLXPOPpSXJKY6SC2ttmSlBQpsbtb4aK
         0PxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmndbdwoqi/c/GDcsGeaYiTwxwt0gHDsgLEPt8n0iKJixfYqGamJyPV6Z/GR3eUHBcnFTcIcDZpHk3dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz04/rCzeELH1jbdTU+53OLxT+Lbk+HJjyElbwWf6wM/eqjYtUF
	go3MhXWeUrNxwW4rOgzEBlsPUqUwHnjkzOlZBrUIKdcmOfqgTVXgrcb5l6qyHjInY8G6VBm6bQG
	3RAG/7Cv9qEK0HrM5eU3Zg7UozMWeOZDM
X-Gm-Gg: ASbGncsZhgUDXYLYjtJsy4xyrsjMUvReYjZNHSDbEXQvEqV8q4mW1QntZ9gUcGGFQd6
	0J2hQdilL85rl9G+4urs1bC4pwZsLX0ULe7xOp7BJAz03olIWD0QoBCSQtPKmMAxZQbqTdxB3Z0
	L5/W8=
X-Google-Smtp-Source: AGHT+IHhI54PJwJM0GoUBX9sVGIWPBRJiNQNO3wmQx9px7UP2uJJd3uGpfx7FMUkqB+zLq674BG+POFOOqZVQZ+UqK4=
X-Received: by 2002:a05:6602:2cc9:b0:858:7057:2203 with SMTP id
 ca18e2360f4ac-858705722fcmr185814339f.4.1740610670754; Wed, 26 Feb 2025
 14:57:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220621104617.8817-1-tzimmermann@suse.de> <CAEXMXLR55DziAMbv_+2hmLeH-jP96pmit6nhs6siB22cpQFr9w@mail.gmail.com>
 <d2562174-eebe-4462-9a9a-03936b3bcf89@leemhuis.info> <b4d28b98-a85c-4095-9c1b-8ebdfa13861c@suse.de>
 <CAEXMXLQEJPVPyqLpH6C7R6iqhhKBpdNS9QeESbEdcmxB70goSA@mail.gmail.com>
 <da4288a6-96cc-4095-bd73-d66b68e9ed01@suse.de> <CAEXMXLQw1yqUGbWcrKZdOuGvA4eZMG0utiyQ2PVRvTeuFedGbA@mail.gmail.com>
 <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de> <CAEXMXLSLau0sEy8WSZ3=ofK97xP8aPcDQEnT=JFkkt7K=Rzivw@mail.gmail.com>
 <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de> <CAEXMXLTT5m0Po_wz0ywRHFetV6e080AJwy8f99Zb9R_afzafRw@mail.gmail.com>
 <844f1fa4-6f47-4386-878f-739d2819605e@suse.de>
In-Reply-To: <844f1fa4-6f47-4386-878f-739d2819605e@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Wed, 26 Feb 2025 22:57:38 +0000
X-Gm-Features: AQ5f1Jpobisr-w9TMwMuIrlUF7jBzuaRQR1sUN7eX0a5b9SfNPQBMIHwVGEKmfc
Message-ID: <CAEXMXLQyOY=dXcYoSc9=LVVWb1BjXLd3_Lo3LRNor_STT+H+WQ@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Thomas,

Could you check if the patch got lost in review?

I can confirm that mainline is still broken since this 2024/May regression.

Thanks,
Nuno

On Wed, Dec 11, 2024 at 9:07=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Hi
>
>
> Am 09.12.24 um 14:56 schrieb Nuno Gon=C3=A7alves:
> > On Mon, Dec 9, 2024 at 1:43=E2=80=AFPM Thomas Zimmermann <tzimmermann@s=
use.de> wrote:
> >> Thanks you so much for testing. I'll prepare a real patch. Can I add
> >> your Reported-by and Tested-by tags?
> > Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
> > Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
>
> Thanks a lot. I've sent out the patch for review. Apologies if this took
> a bit longer than expected.
>
> Best regards
> Thomas
>
> >
> > Thanks,
> > Nuno
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
