Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D709D12FF9F
	for <regressions@lists.linux.dev>; Thu, 25 Jan 2024 17:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706203429; cv=none; b=b8nsVuEbUon5GUjspqpOx9wFi3xMixFvScFJy+z91hEkn1TyYaP/76imgy5Iu0Xnw3Bfq+5jaHlalunyfE0nOlScYMkKVani2yWMa/u9ESLS21charFjVpOuHv/Eds4e6nH04iGvuEVLS8aN/K1EjUZ7pAVmXp4BlurXkEFJmUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706203429; c=relaxed/simple;
	bh=YavNyiSBneQJgvsavGCIYXOgMH8ij3t7wLy/BZ9VGoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQXWW72JBkDEc1RZmB0x2FHSzJCWbIpTJ4EUfshB5qpX74CSSEk+x7CIUSLjDx4yKLPGuy88a6DdeRPmuiQEsLFXes5WY9ODPAOmLFeFWF8TP76l42+KDL1dPLlmgQYpr8HvJ6lsf4PcAl2EChE5bkfhvniLEvrko3oxPL73nEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFbuauTk; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFbuauTk"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6001449a2beso35247177b3.3
        for <regressions@lists.linux.dev>; Thu, 25 Jan 2024 09:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706203427; x=1706808227; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I2gaRixdg+nmjTFS1tauOhVekYOprOLzO/cqNLoAsX8=;
        b=kFbuauTk8VMTyYpiCNLPp9AEbEwmrQ3TjyEqqmFvSTky6bKZcmgG88b2Y1/Xg2TDqL
         +aYqrLZ5ZoTm/meRKPCMDQtNHEgC+YUFLGcWYBi3gjExOdAS2qWLQvcMdA4M0FV3guh+
         Gje+d3ly8PMaIIxfxWcQSyNigXv2C+njh8e5Ibnx2R7DpYwJYwTKMHX/fi5ohqL68pjo
         bzWplAdJ5r9fShibmTGq8c+7C55Q7U3bDBqJlscpcXMZFRlqwcc0FjpNmU7Q6OZVUkQK
         BZIhrENI/l/IIW4udT5fel9irD1IsXITDNs9H6pOZW0yZ6uBKwcZA1ErSAtTRNhhRiJp
         eHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706203427; x=1706808227;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I2gaRixdg+nmjTFS1tauOhVekYOprOLzO/cqNLoAsX8=;
        b=IgQ7X3Uun+caYm+2bNL53dzyRwuqhHW7ILBDl611stgU5EmuuIo96BVxCkuhIvIBVP
         btgLCBipy6FAHLiiErPOA7tg+hIbqP8BJgkBRjW2uWi9I9YiBiGc4Zp95/LXXeMFMte2
         CtfADSYXNGHIz+Vb8Jfv3ShOutpmOQ53U6Yy8oGklWC9YM7D86PdLvKtZyqaWiKtWAoJ
         0YNHrUpXe+zsBumrUrn2LisPkbbhKrQhd8VZQm0Rk56awd9MnTh/TgBb3jIuMcxXSpHe
         ir0cyqdzD4dFRjRfUoZmVdI7CLDjqBRQTKUrtyc8kaAL22ejAKU8DEdL8z3byGevq3Z4
         cOjQ==
X-Gm-Message-State: AOJu0YzWnzTwnwSMlEJyY8ykPrOA+9i6q3HhI51B8Cf703a/qLzPjnwR
	Yr6PDgJpoq0wSt8mjS78q6KAMWhoUo7qQfH4DdmBSK8kYGRx7KZtXoK1JVtGh7joOCLNKKAHnWC
	0LfvnpyZHafE0aXZkk6wiiS8Gzak=
X-Google-Smtp-Source: AGHT+IGGZqfQkJAtoo57UVIKirfdFkN8DoTuxdZehgVFVYr45ju9Q5mL5tp54GNZvYJTnZFvSYKNWAuAQlMc8FBPOvg=
X-Received: by 2002:a81:b54f:0:b0:5ff:5d7e:54af with SMTP id
 c15-20020a81b54f000000b005ff5d7e54afmr114682ywk.105.1706203426764; Thu, 25
 Jan 2024 09:23:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
 <2faccc1a-7fdd-499b-aa0a-bd54f4068f3e@suse.cz> <CAOVeLGRxXfs4wxSmB2ULZS72NvJkWQvZyPRz0rAmQyFtL39ekw@mail.gmail.com>
 <0a782904-bb19-4111-979a-31b52aa44ca9@suse.cz> <a51ddb8c-cf11-4394-a2fe-ca855749ff02@amd.com>
 <e7eb12a9-67ed-45b1-aaf6-e1df52a247bd@leemhuis.info> <05ddb2da-b182-4791-8ef7-82179fd159a8@amd.com>
 <54efe4c8-38d8-4a5f-ac7a-aeb7a4e3535f@amd.com>
In-Reply-To: <54efe4c8-38d8-4a5f-ac7a-aeb7a4e3535f@amd.com>
From: Donald Carr <sirspudd@gmail.com>
Date: Thu, 25 Jan 2024 09:23:34 -0800
Message-ID: <CAOVeLGRiCZ9KBmsFY5NfGABUcw1CQoEcSKE1k0zv_6Aicdusbg@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Dave Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 10:23=E2=80=AFAM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> The test patch [1] posted to [2] works for me.  I expect that Matthew
> will post it to dri-devel and this can catch RC2 or RC3.

> [1]
> https://gitlab.freedesktop.org/drm/amd/uploads/ca8dfaa22d6f5d247c28acf6cf=
3eafd2/0001-Drain-all-entities-in-DRM-run-jon-worker.patch
> [2] https://gitlab.freedesktop.org/drm/amd/-/issues/3124

I can also confirm the attached patch has resolved my woes; thank you
peeps for the quick turn around time.

Yours sincerely,
Donald
