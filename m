Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBBB76034
	for <regressions@lists.linux.dev>; Sat,  7 Dec 2024 22:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733610986; cv=none; b=jInpoEkQJP2TDMBnrigG4BxGFXn++VIkn+NwnbWMNtiKjWcX4FmJm14DFSzEfaarz0UumpYp+g7ARybn7Wr9Wf0lMuXtkurqmtdqHri1UFVNOXggbeifiDQvpx4SvYtLTyOUnMMTX/sIMOAMGDnt4ueElWPUh6l6vcnFa03Ekts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733610986; c=relaxed/simple;
	bh=urI7US1zAMf6eOuwKNpt419Njn9MCMtobiUqyPiJ5WQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N3s4hUNWSZBAvkSA+XCRiwFRPj/XEjpPqeKEjiNKtMGyEfibbVi0+XxkSTFFVuHwQEbwB4kdg4AwC5stSq0z9J4wmF8ZR+NFF9YVSNq5Dko+0EkdJbcF8h0spBnmLdQLx3RKHA9z6HPCk6BjqyHwqcEPwn5Z19AqYrQ++ke5f1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wbkgyeok; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wbkgyeok"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a8160382d4so6780205ab.0
        for <regressions@lists.linux.dev>; Sat, 07 Dec 2024 14:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733610984; x=1734215784; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urI7US1zAMf6eOuwKNpt419Njn9MCMtobiUqyPiJ5WQ=;
        b=Wbkgyeokr7CuEWObxU+FaJRgjdgra3O4adaQpbLY+ku8dG8qgxWEbUR+djP8wuA4Mn
         Exihep9JOXBZ6j+PRv/fArEfsaBU9Sbv++12ERNpU41+l/OqNmGkt2evp8mU3DXLFH4v
         JAdjpzBfEy1Xy0fN9ydf5D0TzIZ8yf222NrTikyPdghVnnhtXPWVHtXENf1UTYkGMvXB
         xU8xIFFBSMbVR70LHGS5H6b6rDTlWwlOFFuGrHDLgfPOX3Scp13kSDNSAPbiVglPpZ33
         fRCpiefe8LKpadExw+fVT2F2u6UFpud8kaQSZqbKR6SW2+F9L5bhTB2kXRsYX/v7ELeq
         Fo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733610984; x=1734215784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urI7US1zAMf6eOuwKNpt419Njn9MCMtobiUqyPiJ5WQ=;
        b=IBr1PJKt0LNKRzH+8EFnnmvQGWVC3Bj3OK8ooJdgHzSAX9XdKlxLRb+8cX2sMvk7TX
         FOfrZt+HQc7kYVwpH7SNpWLnTBxuxjxPV3yAwMIrkEnQwPegXVf3/P2bSXg1ZmgYBjkz
         u9u9Iww5ZIvHIneHtSEyGGavcIYLi8Ko/gRyzus8DxMxH9wQR6C/nUgrIr76bi/x0WAg
         UI8mRoZyGCkOLrjRioHW36gErNUg+wdBJxrJfz3BqOjCm0m48MtZxF0ol4Ce4iyA11k+
         TlvouHcclJ1JG+KC+vkxIoCo3RceGgWHG5vvG+vEnJfjC6n0wQj1HijVd+ErNkDSszhY
         6B/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWai+A8SGInMlCFvZ66Yn1daca51hOeDUqc3qDuRL2myO41xseo9cP/+u+syJEpOCghhh484XY8dizC8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywx7QEnWxKVP2d5KI5aZ01VgzIhp0097XjDA8na97+vFCSRhLPq
	dq+AyVWuQioz8hhgLmYrHk3ljOi+p3JX89Sw45lxUX6UBAewl5+b20oH19gDikweOu4h5L8c7F5
	HpcxrHoVXhnBu6v0OfZeqaBTjX6E=
X-Gm-Gg: ASbGncvoLxa/7n/yd/+j3kHudhApwe6+ac6t/dYDProL4Chf2qMN+s7Ngr9KKSwQ298
	F1+SnlJrCtKCtbWFyGnKp1NWm9M8=
X-Google-Smtp-Source: AGHT+IGxzU83LUpVfJxMuU8ObhncHI3dIWYNbBVPEPvjuESw/sHk10gB7/kPZJqaK7jk0SPcqqX5+a98M+3fxcKvZ44=
X-Received: by 2002:a92:c563:0:b0:3a7:6792:60f with SMTP id
 e9e14a558f8ab-3a811c799a7mr92656935ab.4.1733610983875; Sat, 07 Dec 2024
 14:36:23 -0800 (PST)
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
 <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
In-Reply-To: <9c902ac0-a94d-4465-98ff-840132e482b1@suse.de>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Sat, 7 Dec 2024 23:36:13 +0100
Message-ID: <CAEXMXLSLau0sEy8WSZ3=ofK97xP8aPcDQEnT=JFkkt7K=Rzivw@mail.gmail.com>
Subject: Re: drm/fbdev-dma: regression
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, dri-devel@lists.freedesktop.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Framebuffer <linux-fbdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 12:18=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
> Thanks for testing. Attached is another patch. It attempts to restore
> the fbdev handling as before the regression. Please give it a try.

This one fixes it for me. Thanks
