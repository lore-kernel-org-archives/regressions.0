Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CFA3F7AB4
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 19:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789328864; cv=none; b=HOfsUaPUDhQRPNU2ROhiQihXYdIFgXHw2OI+0bNVaCnYe62xNu5zogdYzP+f4PzuUtqnugHReP6q2ncqmLgjt2+wolzYW0sO5aFduaT7WKBuf6fb6grPyk91QdRLJ+KbPW1AS3CtduPb8gcoEhIFyXyWmZAqech02+mtybB0gzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789328864; c=relaxed/simple;
	bh=CNXSCdLg+ipJh1XUQHffzIhB4cs/HHYEfscgZQRXB8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hk7vof52kkYYan6rRmwnqhNqAsSn96S3nrm3Advxvdc7vQKccnObxlOyEuygF7FB8SCig7uJ8GIwsSrxOE0Pqq4O0dSYI6pqlH1PhVd9fYGT7rZMrwSeRop4NI5fSdSbmsHYS37zJnSWnJxs324RoifoJSb2du2/Z1RKIK0tx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dOnvvDPh; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dOnvvDPh"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a9bd4db6ccso2910897a12.0
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789328860; x=1789933660; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHsgs1UZakOrAxn1XlbgOq8ver2Qi0CyV+c+xKT3ApU=;
        b=dOnvvDPhlCAJ5iJxHQWADP89IgbmDKlH1OOOS3B7a06n8GHuCBBenVP5BvG6Vx/52c
         tWq1w/cZmwX7hOKXiV0/HIO475Hl4Bcs5fDvy8bnDPNOvQxHiAEaUPxz9WiTFMOaNQ8h
         vLP5dZZuhFlrP79QB7GvTn56CPCBERqsADAbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789328860; x=1789933660;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LHsgs1UZakOrAxn1XlbgOq8ver2Qi0CyV+c+xKT3ApU=;
        b=qCJ2oLL3Fbm/7I5iJONOJ1eJRwVrUcOKrVokxIoE0ZddX1akOyysZEw7KO1n1r5NeL
         rwTDwhJE7UI6nDVEwkrQVhhQWzABQBxr6NXoiDT79faZm1Ke7jI+9TAzRnT2EXR3HbzW
         NaIKcngE7N7DSG9ztZXXbgkrqIgYcR7eb6CVPYFPzBpwUczC2gVT+1iLHJpZW4/1GpVM
         Uifmbrot+CdAMblyV07WeakufeGXyYbaK30tNPMK5JtEBKoWfewWY6xw4fgkE+Jyno1f
         6UQWlajmkmhrEOw1n/iD7vq0ETa4maJj4Y43KCtPpsP+8HBfOHJ4xn+/z6LCRRgAxcLE
         2rIg==
X-Gm-Message-State: AFuF++nxpMiGyCtDp1gHDvPg6jCURw+2r19xeDrrf+1Hm3iMnpwuqYdQ
	CSTk686q1FMEDyu9ctYSZFbkG1YTPUesj/U0LSRLRJxR30vcjo6V+2GuBtKJ9BWQx9luLDleprS
	JwZmLL+M=
X-Gm-Gg: AYBFou1EYNvgUURYdIsyAee6fajPe7b378AuMPe2cXwSL52myZ/5Nzjcuzhjxs6Sa8J
	xAFsHmLNuRKtG4nnxDYp5TGRGNb7iQafdDRAEM3FeU0h4QEMR79HrT/6Y1oC4YP+sNiPLhhWXGV
	33LixRLE4P9vVTDtBxZyijgPGwHH2wbxrNo97lqecx5wILkhbc+TZWDXlsctrgin06ZW2pgpCPF
	e5oe4CBmx80XznKerTfp9ZvLxJLJfHKRZi8x68GqcaKTVfHsn/lQ3oe2SMGh/aj1HaByWjqXPDW
	K6LjUyFJ4/HHqBD2nphsn01LXwlEUl1ASb8/CMSap9cufi+vM1Um9fYqa7do6cex0RMY5FFfYP2
	U+ppLZS4F3jj4E1p7pNgHFWa556x5cGSAi6HN+OuJg3TInG3XhYIWteXKeXxnw2qHaLqi7sFXSr
	pMwxBXGsTYH4jGhhoFdhSOvPD8v36+8bCK7CHkWKSQToGh2qmRmBcaFReT+jZuRk/PqUT7Smqw3
	xZo6jXkasiXEu6OJQzlQ2xya9dW5Dekhx6ctQa6uCo+IX1A
X-Received: by 2002:a17:907:1c10:b0:c29:286e:2e3e with SMTP id a640c23a62f3a-c29666d5f9dmr687156866b.38.1789328859725;
        Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4e248sm342966166b.2.2026.09.13.12.47.39
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c29667ed561so315507466b.2
        for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:47:39 -0700 (PDT)
X-Received: by 2002:a17:907:3d0b:b0:c25:2fb9:b897 with SMTP id
 a640c23a62f3a-c29665d8885mr678602866b.18.1789328859154; Sun, 13 Sep 2026
 12:47:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
 <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com> <e67d4f5e-22fe-4100-a06a-91a3d1cf38cb@leemhuis.info>
In-Reply-To: <e67d4f5e-22fe-4100-a06a-91a3d1cf38cb@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 13 Sep 2026 12:47:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjTP0TQxbjpy5VmbG0k5hNDRoQ_Yw0Ahy37oNsPv8ekpA@mail.gmail.com>
X-Gm-Features: AcwNN1WvU3y_mcvP4eBqbFQYFeZDsQ6seApyYywhFp0eX1AfGUYqK3SCjE5dIaE
Message-ID: <CAHk-=wjTP0TQxbjpy5VmbG0k5hNDRoQ_Yw0Ahy37oNsPv8ekpA@mail.gmail.com>
Subject: Re: Quick regression status pre 7.3-rc3
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 12:32, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> Side note: Some people suggested I should submit regression fixes like
> the three you just applied directly to you as patches or through a git
> tree you can pull.

I would certainly not mind. It would make it easier than my "apply
patches by hand and then do that explanatory merge just to make the
reasoning obvious".

But hopefully this would also not be common enough to really be an
issue. So whatever works best for you,

                  Linus
