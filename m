Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF3F4E1C3
	for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708818244; cv=none; b=nRFJPEphV6N8NeQ7K5Zj2OnqpaJciqSqFaQ7L7+fao/YEEeYhXwxgTCff658OwbHWtlZBEOEpgLvMU0Nu3LLMZqrVih7V4fKWf8I293HdG4m+7TZMkZmhwVK+BAMN5+Q/pyfDoQ5MdmAgFyd0s7JOcmyI8S0l2ald3jvT4KGA3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708818244; c=relaxed/simple;
	bh=0ndlmRNxvgqmudYDAQDRY+8XWH+i1OJkw4ZkBFWvYg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b30pN3p2Hov0baKPESs8B0peHQKYQFLA5h3BQ4HAS8jTuQkvQ8bqibvGsInb9AGkbnNqMJB7gb/Rhh7Mr1TduQN+6MoR8s9wpoFQIFMffwgO3AErcr+aE2YLI5tS6dR14rYTvCHpWlcJBWjVV+zpgkejVGr5uFVpJ1G9skJ/hbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JNP5kXpK; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JNP5kXpK"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-564fc495d83so2184356a12.0
        for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 15:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708818241; x=1709423041; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Kqv7MLKTQYTKAbyJaXLJ3NjnKr158GpyjOGnut0vOtM=;
        b=JNP5kXpKPOAYAkkQJdSp1fPOkINsAbDBVNlbwjDr6crRsZoXNC+lGaaqOD2U6DSb68
         niOh2rHkOkZV0G+Kf3LP0t0O9aPbvqWmAhyDn2n9U9MexHpbi1I1OP6DoU0T8jU3ODjC
         /IDFm3L7Onqbmqy76v/eid+CUB/zfR4X1G5rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708818241; x=1709423041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kqv7MLKTQYTKAbyJaXLJ3NjnKr158GpyjOGnut0vOtM=;
        b=Q6l0WtfdXbW6d72JfhGeyZEjOSBZ+3NmlzVYp9FqsEPb+nLm7LWv3JxgCl3ffWB938
         jcOM4JN9hilpsxZRI8P2tfXA0opWPoDNYF8up4McZgoPEacGDbe8NALZvK/osVZZo5G/
         H471RN5fbNm5da66fSeEBPPOuEfhPhpQYO6E2NMPETOpe1It1HRQhSTmxQ87Qmxn844a
         +7XXShxh7PafrshGCVZte6kJ4c8jBuSadBLAvK7psjf12XF2Un+pNsCe/QyGAA2tF4Co
         2d4gMCvq0PpY7zOanyMsyfMUqabPvAADsnly4Cc5HHuvgscMVaj2cr20ht0JPOlD7fsn
         3ESA==
X-Gm-Message-State: AOJu0YyXvrGk0gXXO8tEL1Uxh/IGSX5eI32+jzDhOH0m8H5B+SgRARKh
	NFOwsvQsO6AzdVUBf1rjDnT/ndy954kvR3UGjrm71ipyDLd5xtyemZgOPSGWgFB9UUQ+XUMi6lZ
	Ny5U=
X-Google-Smtp-Source: AGHT+IFPy1XwgYg1/kReqZC3qWZd4UyqtNO34pHdVPzw3gZNlnLJYGNPqxP/5KtbRbtwyWfW1h4H+A==
X-Received: by 2002:a17:906:288a:b0:a3f:cf7:c978 with SMTP id o10-20020a170906288a00b00a3f0cf7c978mr2302312ejd.18.1708818240974;
        Sat, 24 Feb 2024 15:44:00 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a21-20020a17090640d500b00a3d0dd84276sm986725ejk.184.2024.02.24.15.43.59
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Feb 2024 15:44:00 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a3f893ad5f4so286251666b.2
        for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 15:43:59 -0800 (PST)
X-Received: by 2002:a17:906:c7d4:b0:a43:20ae:9123 with SMTP id
 dc20-20020a170906c7d400b00a4320ae9123mr202316ejb.50.1708818239390; Sat, 24
 Feb 2024 15:43:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
 <652928aa-0fb8-425e-87b0-d65176dd2cfa@redhat.com> <9b92706b-14c2-4761-95fb-7dbbaede57f4@leemhuis.info>
 <e733c14e-0bdd-41b2-82aa-90c0449aff25@redhat.com> <f15ee051-2cfe-461f-991d-d09fd53bad4f@leemhuis.info>
 <c0cbf518-c6d4-4792-ad04-f8b535d41f4e@leemhuis.info>
In-Reply-To: <c0cbf518-c6d4-4792-ad04-f8b535d41f4e@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 24 Feb 2024 15:43:43 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg9nqLqxr7bPFt4CUzb+w4TqENb+0G1-yJfZbwvRhi29A@mail.gmail.com>
Message-ID: <CAHk-=wg9nqLqxr7bPFt4CUzb+w4TqENb+0G1-yJfZbwvRhi29A@mail.gmail.com>
Subject: Re: [REGRESSION] 6.8-rc process is unable to exit and consumes a lot
 of cpu
To: Linux regressions mailing list <regressions@lists.linux.dev>, Al Viro <viro@kernel.org>
Cc: "Christian Brauner (Microsoft)" <brauner@kernel.org>, Matt Heon <mheon@redhat.com>, 
	Ed Santiago <santiago@redhat.com>, Linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
	Paul Holzinger <pholzing@redhat.com>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 23:00, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> TWIMC, the quoted mail apparently did not get delivered to Al (I got a
> "48 hours on the queue" warning from my hoster's MTA ~10 hours ago).

Al's email has been broken for the last almost two weeks - the machine
went belly-up in a major way.

I bounced the email to his kernel.org email that seems to work, but I
also think Al ends up being busy trying to get through everything else
he missed, in addition to trying to get the machine working again...

             Linus
