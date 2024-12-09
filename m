Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04A1A2392
	for <regressions@lists.linux.dev>; Mon,  9 Dec 2024 13:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733752593; cv=none; b=KEfb/zmmDK+Dd7zxFmAzUO8lnS9YG6Rz+dc46j7/Waf5uGfP2tQoomKDizog6o+eVRqmmVCXyw3KFYY4ZnBNQgRo/fFuoVVMi0wT00Es3b2NbA3qw8AW5iYEWd40ZIhKQ1xC0jti9sO7zo5P3oAgeE7iFPSnruki+zQVtav13Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733752593; c=relaxed/simple;
	bh=20shHAH5rzhM5qlKS1vaW89uLmxf3J6zk8CxqaxVOi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOtMC3B7Zad8z6S4nElVLvodBzpRHEAxXw3hwY7sp/koeilq5YGKoJh/yZI1ywg39C1scNHLg0bS6FgCORjPOtYTiSwbHBooEBYxIomUPEw94vQ2ZNP976ZTIp6t8cMtbN3Hzhk8VLWHJOnrY8n9X37tvtJYzEdMlAQuq6GD01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VW6FFiJd; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VW6FFiJd"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3a9628d20f0so12818955ab.2
        for <regressions@lists.linux.dev>; Mon, 09 Dec 2024 05:56:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733752591; x=1734357391; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20shHAH5rzhM5qlKS1vaW89uLmxf3J6zk8CxqaxVOi4=;
        b=VW6FFiJdg+lJrJpECnvV9ciR4+xj+qaiNolJItx3oqh0NOVRQfMv5vqFGGU3AzMMfO
         vb+8MGcTtHSDXx0aVJlTarjw+yozJqCLyzTASdSFJwpcf2AFHNXTLiXrslbyt+BgrI0c
         ptqKNLO4XOxN2N6mDXdfeD0gZ6rBz3fPCb8Es/Z1RirE85fzgx7fEn6ynY/j/CNLTok+
         ENuuEb2xihonSmMIvzX+mudrBdbjpR2daT0CxcMSDRvbhpu+5wHOiIpQ1HwwegpmhOTd
         +jlyQWbGanCGdbKy2GZe9+4Dvx+e0XhpwZOKMa3ww3Vh7r6GKUWGkeE5jMrjXv9fDqvQ
         Kc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733752591; x=1734357391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20shHAH5rzhM5qlKS1vaW89uLmxf3J6zk8CxqaxVOi4=;
        b=sj9YdDE9tbpbZm3c8RXE7rx0RFhlUyjhL9HSnsUgoHcSTAPThxkuza/2F4xKOalR4C
         lRAVzscxXmSbqGWugv837WhiFvV2VVcbJRNDt+/9/b5orddWcusjXDSWz9akhxQ2ZpIk
         M9E+fo1yMNoGUPufKxDUlt0P20VA/RJE5r2G3YNId1nGnDYbxsXh5PW7AJWFP461A/jc
         vPp/P/ieCfXst8Wy0LXve0lZFsSwumle5CW3pdTlfo1+pz0dGJdtDvsciHbakcrbyRki
         akQ1iEfibz2cWKkJPpbl6ik3Zmk7tPDE7ZsCq04bUwSwwdEtJqESRkxzW8BUNgEHeVhF
         BtJg==
X-Forwarded-Encrypted: i=1; AJvYcCVWLyZagG82kWxZmbXlF1Vzx5asYcIXOfD6poTscDwyxPvaYzh+nSv8oVGS6vwXvGWIGNjy0crO0dMKdg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5RgM1LThueIvWdu0oPJATBlFvicx/mE5pdR9++ejs+DtuV7JL
	kgLeG6EvRXOd2zNh6SxHW1RGAczKDvwWxynWqG9AKOv8TeVGC+pqw/aTX6j1lHSJRBPnPnc5x/6
	y+TDAtgxFALEGr7gUBGoaGW7233w+U9xTPZg4Nw==
X-Gm-Gg: ASbGnctRE4xdj8q0uUqGJLO7ysGzhsl6HUt0aPIS549RwG2FHJWxxzYvShvZpnErtZU
	9iTOQjsk29k3U+LdoV9qV05i2w/Q=
X-Google-Smtp-Source: AGHT+IECMwsss2FoZy9xBlkgCdMD3K+aFiFas1JeSPI3N6gfmsMB28SKRbBS6Drtula3ua1ptWvs5YbSz0qOTacUlW8=
X-Received: by 2002:a05:6e02:1746:b0:3a0:8c5f:90c0 with SMTP id
 e9e14a558f8ab-3a9dbac0662mr3847895ab.10.1733752590855; Mon, 09 Dec 2024
 05:56:30 -0800 (PST)
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
 <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de>
In-Reply-To: <900b873f-6eba-4dba-b155-dc5f7594becf@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Mon, 9 Dec 2024 13:56:19 +0000
Message-ID: <CAEXMXLTT5m0Po_wz0ywRHFetV6e080AJwy8f99Zb9R_afzafRw@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 9, 2024 at 1:43=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
> Thanks you so much for testing. I'll prepare a real patch. Can I add
> your Reported-by and Tested-by tags?

Reported-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>
Tested-by: Nuno Gon=C3=A7alves <nunojpg@gmail.com>

Thanks,
Nuno
